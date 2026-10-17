import { NextRequest } from "next/server";
import { admin, closeSession, todayWIB, getLang, grantAchievements, ensureMeta } from "@/lib/server";
import { LEVELS, TIME_LIMIT, SPEEDRUN_TIME, Level, AnyLevel, isGodLevel, anyLevelConfig } from "@/lib/config";

type SessionRow = { id: string; user_id?: string; difficulty: string; length: number; score: number; correct: number; total: number; status: string; mode?: string; streak?: number; hints_used?: number };
type Opts = {
  /** Baris sesi yang sudah dibaca pemanggil (dengan skor/total terbaru). Menghemat 1 query. */
  session?: SessionRow | null;
  /** Jeda (ms) sebelum jam soal ini mulai berjalan di server. Dipakai saat soal diprefetch ke response jawaban,
   *  supaya waktu membaca penjelasan tidak memotong waktu soal berikutnya. */
  graceMs?: number;
  /** Soal yang sedang dijawab pada request ini (penulisan jawabannya berjalan paralel) agar tidak disajikan ulang. */
  skip?: string | null;
};
const GRACE_NORMAL_MS = 45_000, GRACE_SPEEDRUN_MS = 8_000;
export const graceFor = (mode?: string) => (mode === "speedrun" ? GRACE_SPEEDRUN_MS : GRACE_NORMAL_MS);

/** Ambil soal berikutnya (atau finished) untuk sesi aktif. Dipakai next, answer, dan start. */
export async function getNextQuestionState(uid: string, sid: string, req: NextRequest, opts: Opts = {}): Promise<Record<string, unknown>> {
  let s = opts.session ?? null;
  if (!s) { const { data } = await admin.from("game_sessions").select("*").eq("id", sid).eq("user_id", uid).single(); s = data; }
  if (!s || s.status !== "active") return { error: "SESSION_INACTIVE" };

  const lv = s.difficulty as AnyLevel;
  const mode = s.mode || "normal";
  const cfg = anyLevelConfig(lv);
  const timeLimit = mode === "speedrun" ? SPEEDRUN_TIME : cfg.timeLimit;
  const answered = s.total; // bertambah 1 setiap soal dijawab
  const base = (hq: { remaining: number; last_hint_reset: string } | null | undefined) => ({
    hints: cfg.hintsUnlimited ? -1 : mode === "speedrun" ? 0 : !hq || hq.last_hint_reset < todayWIB() ? (cfg.hints || LEVELS[lv as Level].hints) : hq.remaining,
    hintsUnlimited: cfg.hintsUnlimited,
    answered, total: s!.length, score: s!.score, timeLimit, mode, level: lv, correct: s!.correct,
    streak: s!.streak ?? 0, streakMin: cfg.streak?.min ?? 0, streakBonus: cfg.streak?.bonus ?? 0,
    pureClear: (s!.hints_used ?? 0) === 0,
  });

  const finish = async () => {
    await closeSession(sid, uid, "finished", s);
    const newAch: string[] = [];
    if (s!.length === 10 && s!.correct === 10) newAch.push("perfect_10");
    if (mode === "maraton") newAch.push("marathon_finisher");
    if (mode === "speedrun") newAch.push("speed_demon");
    if (mode === "daily") {
      const meta = await ensureMeta(uid);
      await admin.from("user_meta").update({ daily_done_date: todayWIB(), daily_score: s!.score }).eq("user_id", uid);
      const achs: string[] = Array.isArray(meta?.achievements) ? meta.achievements : [];
      if (!achs.includes("daily_warrior")) newAch.push("daily_warrior");
    }
    const unlocked = newAch.length ? await grantAchievements(uid, newAch) : [];
    return { ...base(null), finished: true, newAchievements: unlocked };
  };

  if (answered >= s.length) return finish();

  const served = new Date(Date.now() + (opts.graceMs ?? 0)).toISOString();
  let q: any = null, hq: any = null, servedAt = served;
  const { data: srv, error } = await admin.rpc("serve_question", { p_session: sid, p_level: lv, p_user: uid, p_served: served, p_skip: opts.skip ?? null });
  if (!error) {
    if (!srv) return finish(); // bank soal habis
    q = srv; hq = srv.hq; servedAt = srv.served_at;
  } else {
    // --- fallback skema lama (sebelum migrasi v1.3) ---
    const [{ data: seen }, { data: hqRow }] = await Promise.all([
      admin.from("session_answers").select("question_id,answered_at").eq("session_id", sid),
      admin.from("hint_quota").select("*").eq("user_id", uid).eq("difficulty", lv).maybeSingle(),
    ]);
    hq = hqRow;
    let qid = (seen ?? []).find((x) => !x.answered_at && x.question_id !== opts.skip)?.question_id as string | undefined;
    if (!qid) {
      const { data: pick } = await admin.rpc("pick_question", { lv, exclude_ids: (seen ?? []).map((x) => x.question_id) });
      if (!pick) return finish();
      qid = pick as string;
      await admin.from("session_answers").insert({ session_id: sid, question_id: qid, served_at: served });
    }
    const [{ data: qq }, { data: row }] = await Promise.all([
      admin.from("questions").select("id,type,prompt,prompt_en,code,language,options,options_en").eq("id", qid).single(),
      admin.from("session_answers").select("served_at").eq("session_id", sid).eq("question_id", qid).single(),
    ]);
    q = qq; servedAt = row!.served_at;
  }

  // waktu tersisa dihitung dari jam server; dibatasi sebesar batas waktu (jam bisa dimulai di masa depan karena jeda baca)
  const left = Math.min(timeLimit, Math.max(0, timeLimit - (Date.now() - new Date(servedAt).getTime()) / 1000));
  const en = getLang(req) === "en";
  const question = q && { id: q.id, type: q.type, code: q.code, language: q.language, prompt: en ? q.prompt_en ?? q.prompt : q.prompt, options: en ? q.options_en ?? q.options : q.options };
  return { ...base(hq), question, secondsLeft: Math.ceil(left) };
}
