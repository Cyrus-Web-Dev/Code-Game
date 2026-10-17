-- DIHASILKAN oleh scripts/make-demo-sql.py. Jalankan SETELAH schema.sql dan semua seed/*.sql.
-- Akun DEMO: seluruh soal tiap tingkat sudah "dijawab" (akurasi 90%), semua gelar terbuka, SEPUH CODING aktif.
-- Data dibuat otomatis sebagai contoh, bukan hasil bermain sungguhan; akun ditandai DEMO di profil dan leaderboard.
alter table profiles add column if not exists is_demo boolean not null default false;

do $demo$
declare
  uid uuid; lv text; pts int; li int := 0; g int; sid uuid;
begin
  delete from profiles where username_lc = lower('sepuh_demo');
  insert into profiles (username, role, favorite_language, favorite_framework, skill_level, lang, is_demo)
    values ('sepuh_demo', 'fullstack', 'Rust', 'Next.js', 'advanced', 'id', true) returning id into uid;
  insert into credentials (user_id, password_hash) values (uid, '$argon2id$v=19$m=19456,t=2,p=1$qCHeV2TrvDdSZASdDzVyJA$DsOQTYfz6G5gN4WhA02b5B2vBphZNvHGMnwcNkWmqu0');
  insert into user_meta (user_id, streak, best_streak, last_play_date, onboarding_done, achievements)
    values (uid, 30, 30, (now() at time zone 'Asia/Jakarta')::date, true,
      '["first_blood","streak_3","streak_7","streak_30","perfect_10","marathon_finisher","speed_demon","daily_warrior","polyglot","hell_survivor"]'::jsonb);

  for lv, pts in select * from (values ('easy', 10), ('normal', 20), ('hard', 50), ('extreme', 100), ('hell', 150)) as v(l, p) loop
    li := li + 1;
    for g in 0..29 loop
      insert into game_sessions (user_id, difficulty, length, score, correct, total, status, started_at, ended_at, mode)
        values (uid, lv, 10, 0, 0, 0, 'finished', now() - make_interval(hours => li * 30 + g),
                now() - make_interval(hours => li * 30 + g) + interval '5 minutes', 'normal')
        returning id into sid;
      insert into session_answers (session_id, question_id, chosen_index, is_correct, served_at, answered_at)
        select sid, q.id,
               case when q.rn % 10 <> 0 then q.correct_index else (q.correct_index + 1) % 3 end,
               (q.rn % 10 <> 0),
               now() - make_interval(hours => li * 30 + g),
               now() - make_interval(hours => li * 30 + g) + interval '8 seconds'
        from (select id, correct_index, row_number() over (order by md5(id::text)) as rn
              from questions where difficulty = lv and active) q
        where q.rn > g * 10 and q.rn <= g * 10 + 10;
      update game_sessions gs set total = a.n, correct = a.c, score = a.c * pts
        from (select count(*) as n, count(*) filter (where is_correct) as c from session_answers where session_id = sid) a
        where gs.id = sid;
    end loop;
    insert into wrong_answers (user_id, question_id, difficulty, chosen_index)
      select uid, sa.question_id, lv, sa.chosen_index
      from session_answers sa join game_sessions gs on gs.id = sa.session_id
      where gs.user_id = uid and gs.difficulty = lv and sa.is_correct = false
      on conflict do nothing;
    insert into user_stats (user_id, difficulty, games_played, questions_answered, correct_answers, points)
      select uid, lv, count(*), sum(total), sum(correct), sum(score)
      from game_sessions where user_id = uid and difficulty = lv;
  end loop;
  update profiles set total_points = (select coalesce(sum(points), 0) from user_stats where user_id = uid) where id = uid;
end
$demo$;

-- Cek hasil (harus 5 baris, masing-masing 300 soal bila seed lengkap):
select difficulty, games_played, questions_answered, correct_answers, points from user_stats
  where user_id = (select id from profiles where username_lc = lower('sepuh_demo')) order by points;
