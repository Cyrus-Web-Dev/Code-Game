-- Kode Tebak: skema lengkap (idempotent — aman dijalankan ulang).
-- Auth memakai tabel sendiri (password argon2id), bukan Supabase Auth.
create extension if not exists pgcrypto;

-- ── Tables ──────────────────────────────────────────────────────────
create table if not exists profiles (
  id uuid primary key default gen_random_uuid(),
  username text not null check (username ~ '^[A-Za-z0-9_]{3,20}$'),
  username_lc text generated always as (lower(username)) stored unique,
  role text not null default 'fullstack' check (role in ('frontend','backend','fullstack')),
  favorite_language text,
  favorite_framework text,
  skill_level text not null default 'newbie' check (skill_level in ('newbie','intermediate','advanced')),
  starter_title text not null default 'hello_world_graduate',
  avatar_url text,
  lang text not null default 'id' check (lang in ('id','en')),
  total_points int not null default 0,
  is_demo boolean not null default false,
  selected_title text,
  created_at timestamptz not null default now()
);

-- Pastikan kolom is_demo ada (kalau tabel sudah ada dari versi lama)
alter table profiles add column if not exists is_demo boolean not null default false;

create table if not exists credentials (
  user_id uuid primary key references profiles on delete cascade,
  password_hash text not null            -- argon2id
);

create table if not exists questions (
  id uuid primary key default gen_random_uuid(),
  difficulty text not null check (difficulty in ('easy','normal','hard','extreme','hell')),
  type text not null check (type in ('guess','fill','next','valid','output')),
  prompt text not null, prompt_en text,
  code text not null,
  language text default 'text',
  options jsonb not null, options_en jsonb,
  correct_index int not null,
  explanation text, explanation_en text,
  hint text, hint_en text,
  active boolean not null default true
);
create index if not exists questions_difficulty_idx on questions(difficulty) where active;

create table if not exists game_sessions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles on delete cascade,
  difficulty text not null,
  length int not null default 10,
  score int default 0, correct int default 0, total int default 0,
  status text default 'active',
  started_at timestamptz default now(), ended_at timestamptz
);

create table if not exists session_answers (
  id bigint generated always as identity primary key,
  session_id uuid references game_sessions on delete cascade,
  question_id uuid references questions,
  chosen_index int, is_correct boolean,
  served_at timestamptz default now(), answered_at timestamptz,
  unique (session_id, question_id)
);

create table if not exists user_stats (
  user_id uuid references profiles on delete cascade,
  difficulty text,
  games_played int default 0, questions_answered int default 0,
  correct_answers int default 0, points int default 0,
  primary key (user_id, difficulty)
);

create table if not exists hint_quota (
  user_id uuid references profiles on delete cascade,
  difficulty text,
  remaining int not null, last_hint_reset date not null,
  primary key (user_id, difficulty)
);

-- (v2.2: tabel feedback dihapus — lihat migration-v2.2-remove-feedback.sql. Saran/kritik/bug kini
--  diarahkan ke halaman /contact yang menautkan langsung ke Instagram/Email/WA developer, tanpa upload foto.)

-- ── Function + trigger (gelar awal otomatis) ─────────────────────────
create or replace function set_starter_title() returns trigger language plpgsql as $$
begin
  new.starter_title := case when new.skill_level = 'newbie' then 'hello_world_graduate' else 'junior_copas' end;
  return new;
end $$;

drop trigger if exists profiles_starter on profiles;
create trigger profiles_starter before insert on profiles for each row execute function set_starter_title();

-- ── Pick random question ────────────────────────────────────────────
create or replace function pick_question(lv text, exclude_ids uuid[]) returns uuid
language sql stable security definer as $$
  select id from questions
  where difficulty = lv and active and not (id = any(exclude_ids))
  order by random() limit 1;
$$;
revoke execute on function pick_question from public, anon, authenticated;

-- ── RLS ─────────────────────────────────────────────────────────────
alter table profiles enable row level security;
alter table credentials enable row level security;
alter table questions enable row level security;
alter table game_sessions enable row level security;
alter table session_answers enable row level security;
alter table user_stats enable row level security;
alter table hint_quota enable row level security;


-- Data publik DITUTUP: leaderboard dibaca lewat RPC leaderboard_rows (kolom aman saja).
drop policy if exists "profil publik (leaderboard)" on profiles;
drop policy if exists "statistik publik (leaderboard)" on user_stats;
-- credentials, questions, sesi, hint, rate_limits: TANPA policy = tertutup untuk anon key.

-- Realtime tidak dipakai (leaderboard polling lewat RPC).
do $$ begin alter publication supabase_realtime drop table profiles; exception when others then null; end $$;
do $$ begin alter publication supabase_realtime drop table user_stats; exception when others then null; end $$;

-- ── v1.1 additions: streak, daily, achievements, wrong answers ──────
create table if not exists user_meta (
  user_id uuid primary key references profiles on delete cascade,
  streak int not null default 0,
  best_streak int not null default 0,
  last_play_date date,
  daily_done_date date,
  daily_score int default 0,
  onboarding_done boolean not null default false,
  achievements jsonb not null default '[]'::jsonb
);

create table if not exists wrong_answers (
  id bigint generated always as identity primary key,
  user_id uuid not null references profiles on delete cascade,
  question_id uuid not null references questions on delete cascade,
  difficulty text not null,
  chosen_index int,
  created_at timestamptz not null default now(),
  unique (user_id, question_id)
);
create index if not exists wrong_answers_user_idx on wrong_answers(user_id, created_at desc);

alter table user_meta enable row level security;
alter table wrong_answers enable row level security;
-- no public policies — server only via service role

-- mode column for game sessions (safe to re-run)
do $$ begin
  alter table game_sessions add column if not exists mode text not null default 'normal'
    check (mode in ('normal','maraton','speedrun','daily'));
exception when others then null;
end $$;

-- ════════ v1.3: performa & keamanan (sama dengan migration-v1.3a-additive.sql) ════════
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
    if p_level in ('frontend','backend','fullstack') then
      -- v2.4 Developer Mode: utamakan soal yang BELUM pernah dijawab pemain ini (di sesi mana pun); baru ulangi bila bank habis.
      -- Dengan bank 800 soal/peran, 500 jawaban untuk gelar Master hampir seluruhnya soal berbeda.
      select q.id into v_qid from questions q
        where q.difficulty = p_level and q.active
          and not exists (select 1 from session_answers a where a.session_id = p_session and a.question_id = q.id)
        order by (q.id in (select a2.question_id from session_answers a2 join game_sessions g on g.id = a2.session_id
                           where g.user_id = p_user and g.difficulty = p_level and a2.answered_at is not null)), random()
        limit 1;
    else
      select q.id into v_qid from questions q
        where q.difficulty = p_level and q.active
          and not exists (select 1 from session_answers a where a.session_id = p_session and a.question_id = q.id)
        order by random() limit 1;
    end if;
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
create index if not exists game_sessions_user_diff_idx on game_sessions(user_id, difficulty);
create index if not exists session_answers_session_idx on session_answers(session_id);

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

-- ════════ v1.4: teman, status online, foto di Storage (sama dengan migration-v1.4-friends.sql) ════════

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

-- ════════ v1.5: pilihan gelar, peringkat per tingkat, riwayat (sama dengan migration-v1.5-title-ranks-history.sql) ════════
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

-- ════════ v2: GOD MODE, bonus jawaban beruntun, hint berjenjang ════════
-- Aditif & aman diulang. Pastikan migrasi v1.3a, v1.4, dan v1.5 sudah pernah dijalankan.
-- Urutan: jalankan file ini di SQL Editor, lalu deploy kode, lalu (opsional) jalankan
-- supabase/seed/god-*.sql untuk mengisi bank soal God Mode.

-- 1) Izinkan 4 tingkat God Mode di kolom questions.difficulty (sebelumnya hanya easy..hell)
do $$
declare cname text;
begin
  select conname into cname from pg_constraint
    where conrelid = 'questions'::regclass and pg_get_constraintdef(oid) ilike '%difficulty%';
  if cname is not null then execute format('alter table questions drop constraint %I', cname); end if;
exception when others then null;
end $$;
alter table questions add constraint questions_difficulty_check
  check (difficulty in ('easy','normal','hard','extreme','hell','demi_god','god','true_god','primordial_god'));

-- 2) Hint berjenjang (3 tahap): tahap 1 = definisi/konsep (kolom hint lama), tahap 2 = teknis, tahap 3 = edukasi dunia nyata.
alter table questions add column if not exists hint2 text, add column if not exists hint2_en text;
alter table questions add column if not exists hint3 text, add column if not exists hint3_en text;

-- 3) Jawaban benar beruntun (streak) per sesi, dan penanda "selesai tanpa hint" (pure clear) untuk gelar yang lebih menyala.
alter table game_sessions add column if not exists streak int not null default 0;
alter table game_sessions add column if not exists hints_used int not null default 0;

-- 4) Hint berjenjang perlu tahu sudah sampai tahap berapa pemain menekan hint untuk soal yang sedang berjalan.
alter table session_answers add column if not exists hint_count int not null default 0;

create index if not exists questions_god_difficulty_idx on questions(difficulty) where active and difficulty in ('demi_god','god','true_god','primordial_god');
-- ════════ v2.1: DEVELOPER MODE (Frontend / Backend / Full Stack) ════════
-- Aditif & aman diulang. Jalankan SETELAH migration-v2-godmode.sql.
-- Gelar Master Frontend/Backend/Fullstack dan bingkai avatarnya dihitung 100% di klien dari user_stats
-- yang sudah ada (lihat earnedDevBadges di src/lib/config.ts) — tidak perlu kolom atau fungsi SQL baru
-- untuk itu. Satu-satunya perubahan skema adalah mengizinkan 3 nilai difficulty baru untuk bank soal.

do $$
declare cname text;
begin
  select conname into cname from pg_constraint
    where conrelid = 'questions'::regclass and pg_get_constraintdef(oid) ilike '%difficulty%';
  if cname is not null then execute format('alter table questions drop constraint %I', cname); end if;
exception when others then null;
end $$;
alter table questions add constraint questions_difficulty_check
  check (difficulty in ('easy','normal','hard','extreme','hell','demi_god','god','true_god','primordial_god','frontend','backend','fullstack'));

create index if not exists questions_dev_difficulty_idx on questions(difficulty) where active and difficulty in ('frontend','backend','fullstack');
