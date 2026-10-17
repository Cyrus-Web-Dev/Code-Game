-- Kode Tebak v1.5: pilihan gelar, peringkat per tingkat, dan riwayat permainan. ADITIF dan aman diulang.
-- Jalankan di Supabase SQL Editor SEBELUM men-deploy kode v1.5.
alter table profiles add column if not exists selected_title text;
-- nilai: null (otomatis = gelar tertinggi), 'starter', atau '<tingkat>:std' / '<tingkat>:legend'

-- Peringkat, daftar teman, dan profil pemain ikut membawa gelar pilihan ('sel')
create or replace function leaderboard_rows(p_tab text default 'all', p_limit int default 50) returns jsonb
language sql stable security definer set search_path = public as $$
  with ranked as (
    select p.id, p.username, p.starter_title, p.selected_title, p.favorite_language, p.is_demo, p.created_at, p.avatar_url,
           case when p_tab = 'all' then p.total_points else coalesce(s.points, 0) end as pts
    from profiles p
    left join user_stats s on s.user_id = p.id and s.difficulty = p_tab and p_tab <> 'all'
    where (case when p_tab = 'all' then p.total_points else coalesce(s.points, 0) end) > 0
    order by pts desc, p.created_at
    limit least(greatest(p_limit, 1), 100)
  )
  select coalesce(jsonb_agg(jsonb_build_object(
      'id', r.id, 'username', r.username, 'starter', r.starter_title, 'sel', r.selected_title, 'fav', r.favorite_language, 'demo', r.is_demo, 'pts', r.pts,
      'avatar', case when r.avatar_url like 'http%' then r.avatar_url end,
      'stats', (select coalesce(jsonb_agg(jsonb_build_object('difficulty', x.difficulty, 'questions_answered', x.questions_answered, 'correct_answers', x.correct_answers)), '[]'::jsonb)
                from user_stats x where x.user_id = r.id)
    ) order by r.pts desc, r.created_at), '[]'::jsonb)
  from ranked r;
$$;

create or replace function friends_overview(p_user uuid) returns jsonb
language sql stable security definer set search_path = public as $$
  with f as (
    select case when requester = p_user then addressee else requester end as fid, coalesce(responded_at, created_at) as since
    from friendships where status = 'accepted' and (requester = p_user or addressee = p_user)
  )
  select jsonb_build_object(
    'friends', coalesce((select jsonb_agg(jsonb_build_object(
        'id', p.id, 'username', p.username, 'avatar', case when p.avatar_url like 'http%' then p.avatar_url end,
        'fav', p.favorite_language, 'starter', p.starter_title, 'sel', p.selected_title, 'demo', p.is_demo, 'pts', p.total_points, 'since', f.since,
        'online', (p.last_seen is not null and p.last_seen > now() - interval '4 minutes'),
        'seen_ago', case when p.last_seen is null then null else extract(epoch from (now() - p.last_seen))::int end,
        'playing', (select g.difficulty from game_sessions g where g.user_id = p.id and g.status = 'active' and g.started_at > now() - interval '45 minutes' order by g.started_at desc limit 1),
        'stats', (select coalesce(jsonb_agg(jsonb_build_object('difficulty', x.difficulty, 'questions_answered', x.questions_answered, 'correct_answers', x.correct_answers)), '[]'::jsonb) from user_stats x where x.user_id = p.id)
      ) order by (p.last_seen is not null and p.last_seen > now() - interval '4 minutes') desc, p.last_seen desc nulls last, p.username)
      from f join profiles p on p.id = f.fid), '[]'::jsonb),
    'incoming', coalesce((select jsonb_agg(jsonb_build_object('request_id', r.id, 'id', p.id, 'username', p.username,
        'avatar', case when p.avatar_url like 'http%' then p.avatar_url end, 'created_at', r.created_at) order by r.created_at desc)
      from friendships r join profiles p on p.id = r.requester where r.addressee = p_user and r.status = 'pending'), '[]'::jsonb),
    'outgoing', coalesce((select jsonb_agg(jsonb_build_object('request_id', r.id, 'id', p.id, 'username', p.username,
        'avatar', case when p.avatar_url like 'http%' then p.avatar_url end, 'created_at', r.created_at) order by r.created_at desc)
      from friendships r join profiles p on p.id = r.addressee where r.requester = p_user and r.status = 'pending'), '[]'::jsonb)
  );
$$;

create or replace function player_profile(p_viewer uuid, p_username text) returns jsonb
language plpgsql security definer set search_path = public as $$
declare p profiles%rowtype; v_rel friendships%rowtype; v_state text := 'none'; v_see boolean := false; v_meta user_meta%rowtype;
begin
  select * into p from profiles where username_lc = lower(coalesce(p_username, ''));
  if not found then return null; end if;
  if p.id = p_viewer then
    v_state := 'self'; v_see := true;
  else
    select * into v_rel from friendships
      where least(requester, addressee) = least(p_viewer, p.id) and greatest(requester, addressee) = greatest(p_viewer, p.id);
    if found then
      if v_rel.status = 'accepted' then v_state := 'friends'; v_see := true;
      elsif v_rel.requester = p_viewer then v_state := 'pending_out';
      else v_state := 'pending_in'; end if;
    end if;
  end if;
  select * into v_meta from user_meta where user_id = p.id;
  return jsonb_build_object(
    'id', p.id, 'username', p.username, 'avatar', case when p.avatar_url like 'http%' then p.avatar_url end,
    'fav', p.favorite_language, 'starter', p.starter_title, 'sel', p.selected_title, 'demo', p.is_demo, 'pts', p.total_points, 'joined', p.created_at,
    'rank', (select count(*) + 1 from profiles where total_points > p.total_points),
    'level_ranks', (select coalesce(jsonb_object_agg(x.difficulty, jsonb_build_object('rank', (select count(*) + 1 from user_stats y where y.difficulty = x.difficulty and y.points > x.points), 'points', x.points, 'players', (select count(*) from user_stats z where z.difficulty = x.difficulty and z.points > 0))), '{}'::jsonb) from user_stats x where x.user_id = p.id and x.points > 0),
    'relation', v_state, 'request_id', case when v_state = 'pending_in' then v_rel.id end,
    'online', case when v_see then (p.last_seen is not null and p.last_seen > now() - interval '4 minutes') end,
    'seen_ago', case when v_see and p.last_seen is not null then extract(epoch from (now() - p.last_seen))::int end,
    'playing', case when v_see then (select g.difficulty from game_sessions g where g.user_id = p.id and g.status = 'active' and g.started_at > now() - interval '45 minutes' order by g.started_at desc limit 1) end,
    'streak', coalesce(v_meta.streak, 0), 'best_streak', coalesce(v_meta.best_streak, 0),
    'achievements', coalesce(v_meta.achievements, '[]'::jsonb),
    'stats', (select coalesce(jsonb_agg(jsonb_build_object('difficulty', x.difficulty, 'games_played', x.games_played,
              'questions_answered', x.questions_answered, 'correct_answers', x.correct_answers, 'points', x.points)), '[]'::jsonb)
              from user_stats x where x.user_id = p.id));
end $$;

-- Peringkat per tingkat (me_bundle & player_profile) dan riwayat permainan
create or replace function me_bundle(p_user uuid) returns jsonb
language plpgsql security definer set search_path = public as $$
declare v_profile jsonb; v_points int;
begin
  insert into user_meta (user_id) values (p_user) on conflict (user_id) do nothing;
  select to_jsonb(p) - 'avatar_url' - 'username_lc' || jsonb_build_object('avatar_public', case when p.avatar_url like 'http%' then p.avatar_url end),
         p.total_points into v_profile, v_points from profiles p where p.id = p_user;
  if v_profile is null then return null; end if;
  return jsonb_build_object(
    'profile', v_profile,
    'stats', (select coalesce(jsonb_agg(to_jsonb(s)), '[]'::jsonb) from user_stats s where s.user_id = p_user),
    'rank', (select count(*) + 1 from profiles where total_points > v_points),
    'hints', (select coalesce(jsonb_agg(to_jsonb(h)), '[]'::jsonb) from hint_quota h where h.user_id = p_user),
    'meta', (select to_jsonb(m) from user_meta m where m.user_id = p_user),
    'level_ranks', (select coalesce(jsonb_object_agg(x.difficulty, jsonb_build_object('rank', (select count(*) + 1 from user_stats y where y.difficulty = x.difficulty and y.points > x.points), 'points', x.points, 'players', (select count(*) from user_stats z where z.difficulty = x.difficulty and z.points > 0))), '{}'::jsonb) from user_stats x where x.user_id = p_user and x.points > 0));
end $$;

-- Riwayat permainan: milik sendiri atau teman (status berteman diperiksa di sini). Dibatasi 60 panggilan/menit/pemain.
create index if not exists game_sessions_user_idx on game_sessions (user_id, started_at desc);
create or replace function player_history(p_viewer uuid, p_username text default null, p_before timestamptz default null, p_limit int default 20) returns jsonb
language plpgsql security definer set search_path = public as $$
declare v_target uuid; v_ok boolean := false; v_rows jsonb;
begin
  if not rate_hit('hist:' || p_viewer::text, 60, 60) then return jsonb_build_object('limited', true); end if;
  if p_username is null or p_username = '' then
    v_target := p_viewer; v_ok := true;
  else
    select id into v_target from profiles where username_lc = lower(p_username);
    if v_target is null then return jsonb_build_object('allowed', false, 'notfound', true, 'rows', '[]'::jsonb); end if;
    if v_target = p_viewer then
      v_ok := true;
    else
      select exists (select 1 from friendships where status = 'accepted'
        and least(requester, addressee) = least(p_viewer, v_target) and greatest(requester, addressee) = greatest(p_viewer, v_target)) into v_ok;
    end if;
  end if;
  if not v_ok then return jsonb_build_object('allowed', false, 'rows', '[]'::jsonb); end if;
  select coalesce(jsonb_agg(jsonb_build_object(
      'difficulty', g.difficulty, 'mode', coalesce(g.mode, 'normal'), 'score', g.score, 'correct', g.correct, 'total', g.total,
      'length', g.length, 'status', g.status, 'started_at', g.started_at,
      'secs', case when g.ended_at is null then null else extract(epoch from (g.ended_at - g.started_at))::int end
    ) order by g.started_at desc), '[]'::jsonb) into v_rows
  from (select * from game_sessions
        where user_id = v_target and status in ('finished', 'quit') and total > 0 and (p_before is null or started_at < p_before)
        order by started_at desc limit least(greatest(p_limit, 1), 50)) g;
  return jsonb_build_object('allowed', true, 'rows', v_rows);
end $$;
revoke execute on function player_history(uuid, text, timestamptz, int) from public, anon, authenticated;
grant execute on function player_history(uuid, text, timestamptz, int) to service_role;

-- Foto lampiran pada Saran & Kritik (bukti bug). Disimpan di bucket PRIVAT "feedback"; lihat lewat Supabase > Storage.
alter table feedback add column if not exists attachments text[] not null default '{}';
do $$ begin
  insert into storage.buckets (id, name, public) values ('feedback', 'feedback', false) on conflict (id) do nothing;
exception when others then null; end $$;
