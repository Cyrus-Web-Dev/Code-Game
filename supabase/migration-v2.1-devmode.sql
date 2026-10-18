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
