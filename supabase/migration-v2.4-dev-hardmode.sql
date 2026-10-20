-- Kode Tebak v2.4: Developer Mode HARD MODE. ADITIF dan aman diulang.
-- URUTAN: (1) jalankan file ini, (2) jalankan SEMUA file supabase/seed/dev-*-*.sql (bagian 1 tiap peran menonaktifkan soal lama).
-- Jangan menjalankan file ini SESUDAH seed pun tak apa — file ini tidak menyentuh isi bank soal.
--
-- Yang berubah:
--   * Syarat gelar Master dinaikkan di sisi aplikasi (src/lib/config.ts DEV_BADGE_RULE): 500 soal dengan akurasi >= 90% (sebelumnya 50 soal / 85%).
--     Gelar dihitung dari user_stats yang sudah ada, jadi TIDAK ada perubahan skema untuk itu. Pemain lama yang sebelumnya sudah Master
--     bisa kehilangan gelar sampai memenuhi syarat baru (dihitung ulang otomatis dari statistik mereka).
--   * serve_question(): untuk peran frontend/backend/fullstack, soal yang belum pernah dijawab pemain diprioritaskan.
--
create index if not exists game_sessions_user_diff_idx on game_sessions(user_id, difficulty);
create index if not exists session_answers_session_idx on session_answers(session_id);

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

revoke execute on function serve_question(uuid, text, uuid, timestamptz, uuid) from public, anon, authenticated;
grant execute on function serve_question(uuid, text, uuid, timestamptz, uuid) to service_role;
