-- Kode Tebak v1.3 (A): perubahan ADITIF. Aman dijalankan kapan saja & berkali-kali.
-- Jalankan SEBELUM men-deploy kode v1.3. Kode lama tetap berjalan normal setelah ini.

-- 1) Kolom versi avatar: foto tidak lagi dikirim di setiap /api/me, cukup URL ber-versi yang di-cache browser
alter table profiles add column if not exists avatar_ver text
  generated always as (case when avatar_url is null or avatar_url = '' then null else md5(avatar_url) end) stored;

-- 2) Indeks untuk leaderboard & sesi aktif
create index if not exists profiles_points_idx on profiles (total_points desc) where total_points > 0;
create index if not exists user_stats_lb_idx on user_stats (difficulty, points desc) where points > 0;
create index if not exists game_sessions_active_idx on game_sessions (user_id) where status = 'active';

-- 3) Rate limit yang berlaku lintas instance serverless (versi in-memory tidak efektif di Vercel)
create table if not exists rate_limits (
  key text primary key,
  hits int not null default 0,
  window_start timestamptz not null default now()
);
alter table rate_limits enable row level security;  -- tanpa policy: hanya server

create or replace function rate_hit(p_key text, p_limit int, p_window_seconds int) returns boolean
language plpgsql security definer set search_path = public as $$
declare v_hits int;
begin
  insert into rate_limits as r (key, hits, window_start) values (p_key, 1, now())
  on conflict (key) do update set
    hits = case when r.window_start < now() - make_interval(secs => p_window_seconds) then 1 else r.hits + 1 end,
    window_start = case when r.window_start < now() - make_interval(secs => p_window_seconds) then now() else r.window_start end
  returning hits into v_hits;
  if random() < 0.02 then delete from rate_limits where window_start < now() - interval '1 day'; end if;
  return v_hits <= p_limit;
end $$;

-- 4) Statistik atomik: 1 panggilan menggantikan 4 query dan menghilangkan race condition poin
create or replace function bump_stats(p_user uuid, p_level text, p_games int, p_answered int, p_correct int, p_points int)
returns table (out_correct int, out_answered int, out_levels int)
language plpgsql security definer set search_path = public as $$
begin
  insert into user_stats as u (user_id, difficulty, games_played, questions_answered, correct_answers, points)
  values (p_user, p_level, p_games, p_answered, p_correct, p_points)
  on conflict (user_id, difficulty) do update set
    games_played = u.games_played + excluded.games_played,
    questions_answered = u.questions_answered + excluded.questions_answered,
    correct_answers = u.correct_answers + excluded.correct_answers,
    points = u.points + excluded.points;
  if p_points <> 0 then
    update profiles set total_points = total_points + p_points where id = p_user;
  end if;
  return query
    select s.correct_answers, s.questions_answered,
           (select count(*)::int from user_stats x where x.user_id = p_user and x.correct_answers > 0)
    from user_stats s where s.user_id = p_user and s.difficulty = p_level;
end $$;

-- 5) Sajikan soal: pilih acak + catat + kembalikan soal, semuanya 1 panggilan (menggantikan 4 query)
create or replace function serve_question(p_session uuid, p_level text, p_user uuid, p_served timestamptz default now(), p_skip uuid default null)
returns jsonb language plpgsql security definer set search_path = public as $$
declare v_qid uuid; v_served timestamptz; r jsonb;
begin
  perform pg_advisory_xact_lock(hashtext(p_session::text));
  select a.question_id, a.served_at into v_qid, v_served from session_answers a
    where a.session_id = p_session and a.answered_at is null and a.question_id is distinct from p_skip limit 1;
  if v_qid is null then
    select q.id into v_qid from questions q
      where q.difficulty = p_level and q.active
        and not exists (select 1 from session_answers a where a.session_id = p_session and a.question_id = q.id)
      order by random() limit 1;
    if v_qid is null then return null; end if;
    v_served := p_served;
    insert into session_answers (session_id, question_id, served_at) values (p_session, v_qid, v_served);
  end if;
  select jsonb_build_object('id', q.id, 'type', q.type, 'code', q.code, 'language', q.language,
    'prompt', q.prompt, 'prompt_en', q.prompt_en, 'options', q.options, 'options_en', q.options_en, 'served_at', v_served,
    'hq', (select to_jsonb(h) from hint_quota h where h.user_id = p_user and h.difficulty = p_level))
    into r from questions q where q.id = v_qid;
  return r;
end $$;

-- 6b) Pemberian pencapaian dalam 1 panggilan (menggantikan baca-lalu-tulis)
create or replace function grant_achievements(p_user uuid, p_ids text[]) returns text[]
language plpgsql security definer set search_path = public as $$
declare cur jsonb; fresh text[];
begin
  insert into user_meta (user_id) values (p_user) on conflict (user_id) do nothing;
  select achievements into cur from user_meta where user_id = p_user for update;
  select coalesce(array_agg(x), '{}') into fresh from unnest(p_ids) as x where not (cur ? x);
  if coalesce(array_length(fresh, 1), 0) > 0 then
    update user_meta set achievements = achievements || to_jsonb(fresh) where user_id = p_user;
  end if;
  return fresh;
end $$;

-- 6) Data /api/me dalam 1 panggilan (tanpa foto; foto lewat /api/avatar yang di-cache)
create or replace function me_bundle(p_user uuid) returns jsonb
language plpgsql security definer set search_path = public as $$
declare v_profile jsonb; v_points int;
begin
  insert into user_meta (user_id) values (p_user) on conflict (user_id) do nothing;
  select to_jsonb(p) - 'avatar_url' - 'username_lc', p.total_points into v_profile, v_points from profiles p where p.id = p_user;
  if v_profile is null then return null; end if;
  return jsonb_build_object(
    'profile', v_profile,
    'stats', (select coalesce(jsonb_agg(to_jsonb(s)), '[]'::jsonb) from user_stats s where s.user_id = p_user),
    'rank', (select count(*) + 1 from profiles where total_points > v_points),
    'hints', (select coalesce(jsonb_agg(to_jsonb(h)), '[]'::jsonb) from hint_quota h where h.user_id = p_user),
    'meta', (select to_jsonb(m) from user_meta m where m.user_id = p_user));
end $$;

-- 7) Leaderboard 1 panggilan; hanya mengembalikan kolom aman (tanpa framework, role, foto, dll)
create or replace function leaderboard_rows(p_tab text default 'all', p_limit int default 50) returns jsonb
language sql stable security definer set search_path = public as $$
  with ranked as (
    select p.id, p.username, p.starter_title, p.favorite_language, p.is_demo, p.created_at,
           case when p_tab = 'all' then p.total_points else coalesce(s.points, 0) end as pts
    from profiles p
    left join user_stats s on s.user_id = p.id and s.difficulty = p_tab and p_tab <> 'all'
    where (case when p_tab = 'all' then p.total_points else coalesce(s.points, 0) end) > 0
    order by pts desc, p.created_at
    limit least(greatest(p_limit, 1), 100)
  )
  select coalesce(jsonb_agg(jsonb_build_object(
      'id', r.id, 'username', r.username, 'starter', r.starter_title, 'fav', r.favorite_language, 'demo', r.is_demo, 'pts', r.pts,
      'stats', (select coalesce(jsonb_agg(jsonb_build_object('difficulty', x.difficulty, 'questions_answered', x.questions_answered, 'correct_answers', x.correct_answers)), '[]'::jsonb)
                from user_stats x where x.user_id = r.id)
    ) order by r.pts desc, r.created_at), '[]'::jsonb)
  from ranked r;
$$;

-- 8) Hak eksekusi
revoke execute on function rate_hit(text, int, int) from public, anon, authenticated;
revoke execute on function bump_stats(uuid, text, int, int, int, int) from public, anon, authenticated;
revoke execute on function serve_question(uuid, text, uuid, timestamptz, uuid) from public, anon, authenticated;
revoke execute on function grant_achievements(uuid, text[]) from public, anon, authenticated;
revoke execute on function me_bundle(uuid) from public, anon, authenticated;
revoke execute on function leaderboard_rows(text, int) from public;
grant execute on function rate_hit(text, int, int), bump_stats(uuid, text, int, int, int, int), serve_question(uuid, text, uuid, timestamptz, uuid), grant_achievements(uuid, text[]), me_bundle(uuid) to service_role;
grant execute on function leaderboard_rows(text, int) to anon, authenticated, service_role;
