-- Kode Tebak v1.4: teman, status online, foto profil di leaderboard. ADITIF dan aman diulang.
-- Jalankan di Supabase SQL Editor SEBELUM men-deploy kode v1.4 (kode lama tetap berjalan).

-- 1) Kolom & tabel
alter table profiles add column if not exists last_seen timestamptz;

create table if not exists friendships (
  id bigint generated always as identity primary key,
  requester uuid not null references profiles(id) on delete cascade,
  addressee uuid not null references profiles(id) on delete cascade,
  status text not null default 'pending' check (status in ('pending', 'accepted')),
  created_at timestamptz not null default now(),
  responded_at timestamptz,
  check (requester <> addressee)
);
create unique index if not exists friendships_pair_idx on friendships (least(requester, addressee), greatest(requester, addressee));
create index if not exists friendships_addr_idx on friendships (addressee, status);
create index if not exists friendships_req_idx on friendships (requester, status);
alter table friendships enable row level security;   -- tanpa policy: hanya server

-- 2) Bucket foto profil (publik, dilayani CDN Supabase: tidak memakai invocation/transfer Vercel)
do $$ begin
  insert into storage.buckets (id, name, public) values ('avatars', 'avatars', true) on conflict (id) do nothing;
exception when others then null; end $$;

-- 3) Heartbeat: perbarui last_seen (maks 1x/30 dtk) dan kembalikan jumlah permintaan teman yang menunggu
create or replace function presence_touch(p_user uuid) returns int
language plpgsql security definer set search_path = public as $$
declare n int;
begin
  update profiles set last_seen = now() where id = p_user and (last_seen is null or last_seen < now() - interval '30 seconds');
  select count(*)::int into n from friendships where addressee = p_user and status = 'pending';
  return n;
end $$;

-- 4) Daftar teman + permintaan masuk/keluar dalam 1 panggilan
create or replace function friends_overview(p_user uuid) returns jsonb
language sql stable security definer set search_path = public as $$
  with f as (
    select case when requester = p_user then addressee else requester end as fid, coalesce(responded_at, created_at) as since
    from friendships where status = 'accepted' and (requester = p_user or addressee = p_user)
  )
  select jsonb_build_object(
    'friends', coalesce((select jsonb_agg(jsonb_build_object(
        'id', p.id, 'username', p.username, 'avatar', case when p.avatar_url like 'http%' then p.avatar_url end,
        'fav', p.favorite_language, 'starter', p.starter_title, 'demo', p.is_demo, 'pts', p.total_points, 'since', f.since,
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

-- 5) Aksi pertemanan atomik: request | respond | remove. Mengembalikan kode hasil.
create or replace function friend_action(p_user uuid, p_action text, p_username text default null, p_other uuid default null,
                                         p_request bigint default null, p_accept boolean default true) returns text
language plpgsql security definer set search_path = public as $$
declare v_target uuid; v_rel friendships%rowtype; v_cnt int;
begin
  if p_action = 'request' then
    if not rate_hit('friend_req:' || p_user::text, 25, 3600) then return 'rate_limited'; end if;
    select id into v_target from profiles where username_lc = lower(coalesce(p_username, ''));
    if v_target is null then return 'not_found'; end if;
    if v_target = p_user then return 'self'; end if;
    select * into v_rel from friendships
      where least(requester, addressee) = least(p_user, v_target) and greatest(requester, addressee) = greatest(p_user, v_target);
    if found then
      if v_rel.status = 'accepted' then return 'already_friends'; end if;
      if v_rel.requester = p_user then return 'already_sent'; end if;
      select count(*) into v_cnt from friendships where status = 'accepted' and (requester = p_user or addressee = p_user);
      if v_cnt >= 100 then return 'limit_me'; end if;
      select count(*) into v_cnt from friendships where status = 'accepted' and (requester = v_target or addressee = v_target);
      if v_cnt >= 100 then return 'limit_them'; end if;
      update friendships set status = 'accepted', responded_at = now() where id = v_rel.id;  -- mereka sudah meminta kita: langsung berteman
      return 'accepted';
    end if;
    select count(*) into v_cnt from friendships where requester = p_user and status = 'pending';
    if v_cnt >= 30 then return 'limit_pending'; end if;
    select count(*) into v_cnt from friendships where status = 'accepted' and (requester = p_user or addressee = p_user);
    if v_cnt >= 100 then return 'limit_me'; end if;
    insert into friendships (requester, addressee) values (p_user, v_target);
    return 'sent';

  elsif p_action = 'respond' then
    select * into v_rel from friendships where id = p_request and addressee = p_user and status = 'pending';
    if not found then return 'not_found'; end if;
    if not p_accept then delete from friendships where id = v_rel.id; return 'declined'; end if;
    select count(*) into v_cnt from friendships where status = 'accepted' and (requester = p_user or addressee = p_user);
    if v_cnt >= 100 then return 'limit_me'; end if;
    select count(*) into v_cnt from friendships where status = 'accepted' and (requester = v_rel.requester or addressee = v_rel.requester);
    if v_cnt >= 100 then return 'limit_them'; end if;
    update friendships set status = 'accepted', responded_at = now() where id = v_rel.id;
    return 'accepted';

  elsif p_action = 'remove' then
    delete from friendships
      where least(requester, addressee) = least(p_user, p_other) and greatest(requester, addressee) = greatest(p_user, p_other);
    return 'removed';
  end if;
  return 'invalid';
end $$;

-- 6) Profil pemain yang boleh dilihat pemain lain. SENGAJA tidak menyertakan role, framework favorit, tingkat pemahaman,
--    dan foto lama (data-URL). Status online hanya untuk teman.
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
    'fav', p.favorite_language, 'starter', p.starter_title, 'demo', p.is_demo, 'pts', p.total_points, 'joined', p.created_at,
    'rank', (select count(*) + 1 from profiles where total_points > p.total_points),
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

-- 7) Cari pemain berdasarkan awalan username (dibatasi 40 pencarian/menit/pemain)
create or replace function search_players(p_viewer uuid, p_q text) returns jsonb
language plpgsql security definer set search_path = public as $$
declare q text := regexp_replace(lower(trim(coalesce(p_q, ''))), '[^a-z0-9_]', '', 'g'); res jsonb;
begin
  if length(q) < 2 then return '[]'::jsonb; end if;
  if not rate_hit('search:' || p_viewer::text, 40, 60) then return jsonb_build_object('limited', true); end if;
  select coalesce(jsonb_agg(jsonb_build_object('id', t.id, 'username', t.username, 'avatar', t.avatar, 'pts', t.total_points, 'relation', t.relation)
                            order by t.exact desc, t.total_points desc), '[]'::jsonb) into res
  from (
    select p.id, p.username, case when p.avatar_url like 'http%' then p.avatar_url end as avatar, p.total_points, (p.username_lc = q) as exact,
           coalesce((select case when fr.status = 'accepted' then 'friends' when fr.requester = p_viewer then 'pending_out' else 'pending_in' end
                     from friendships fr where fr.requester in (p_viewer, p.id) and fr.addressee in (p_viewer, p.id) limit 1), 'none') as relation
    from profiles p
    where p.username_lc like replace(q, '_', '\_') || '%' escape '\' and p.id <> p_viewer
    order by (p.username_lc = q) desc, p.total_points desc limit 8
  ) t;
  return res;
end $$;

-- 8) Foto publik di me_bundle & leaderboard_rows (hanya URL https dari Storage; data-URL lama tidak ikut)
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
    'meta', (select to_jsonb(m) from user_meta m where m.user_id = p_user));
end $$;

create or replace function leaderboard_rows(p_tab text default 'all', p_limit int default 50) returns jsonb
language sql stable security definer set search_path = public as $$
  with ranked as (
    select p.id, p.username, p.starter_title, p.favorite_language, p.is_demo, p.created_at, p.avatar_url,
           case when p_tab = 'all' then p.total_points else coalesce(s.points, 0) end as pts
    from profiles p
    left join user_stats s on s.user_id = p.id and s.difficulty = p_tab and p_tab <> 'all'
    where (case when p_tab = 'all' then p.total_points else coalesce(s.points, 0) end) > 0
    order by pts desc, p.created_at
    limit least(greatest(p_limit, 1), 100)
  )
  select coalesce(jsonb_agg(jsonb_build_object(
      'id', r.id, 'username', r.username, 'starter', r.starter_title, 'fav', r.favorite_language, 'demo', r.is_demo, 'pts', r.pts,
      'avatar', case when r.avatar_url like 'http%' then r.avatar_url end,
      'stats', (select coalesce(jsonb_agg(jsonb_build_object('difficulty', x.difficulty, 'questions_answered', x.questions_answered, 'correct_answers', x.correct_answers)), '[]'::jsonb)
                from user_stats x where x.user_id = r.id)
    ) order by r.pts desc, r.created_at), '[]'::jsonb)
  from ranked r;
$$;

-- 9) Hak eksekusi
revoke execute on function presence_touch(uuid) from public, anon, authenticated;
revoke execute on function friends_overview(uuid) from public, anon, authenticated;
revoke execute on function friend_action(uuid, text, text, uuid, bigint, boolean) from public, anon, authenticated;
revoke execute on function player_profile(uuid, text) from public, anon, authenticated;
revoke execute on function search_players(uuid, text) from public, anon, authenticated;
grant execute on function presence_touch(uuid), friends_overview(uuid), friend_action(uuid, text, text, uuid, bigint, boolean),
  player_profile(uuid, text), search_players(uuid, text) to service_role;
