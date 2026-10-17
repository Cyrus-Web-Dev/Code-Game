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
