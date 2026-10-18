import { NextRequest, NextResponse } from "next/server";
import { admin, userId, fail, bumpStats, getLang, recordWrong, clearWrong, grantAchievements } from "@/lib/server";
import { TIME_TOLERANCE, SPEEDRUN_TIME, PlayableLevel, anyLevelConfig } from "@/lib/config";
import { getNextQuestionState, graceFor } from "@/lib/game-session";

export async function POST(req: NextRequest) {
  const uid = await userId(req);
  if (!uid) return fail("UNAUTHORIZED", 401);
  const { session, question, choice } = await req.json();

  // Tahap 1: semua pembacaan independen berjalan paralel (1 round-trip, bukan 4)
  const [{ data: s }, { data: row }, { data: q }, { data: meta }] = await Promise.all([
    admin.from("game_sessions").select("*").eq("id", session).eq("user_id", uid).single(),
    admin.from("session_answers").select("*").eq("session_id", session).eq("question_id", question).single(),
    admin.from("questions").select("correct_index,explanation,explanation_en").eq("id", question).single(),
    admin.from("user_meta").select("achievements").eq("user_id", uid).maybeSingle(),
  ]);
  if (!s || s.status !== "active") return fail("SESSION_INACTIVE");
  if (!row || row.answered_at) return fail("ALREADY_ANSWERED");

  const mode = (s as { mode?: string }).mode;
  const lv = s.difficulty as PlayableLevel;
  const cfg = anyLevelConfig(lv);
  const elapsed = (Date.now() - new Date(row.served_at).getTime()) / 1000; // negatif = masih dalam jeda baca
  const limit = mode === "speedrun" ? SPEEDRUN_TIME : cfg.timeLimit;
  const inTime = elapsed <= limit + TIME_TOLERANCE;
  const ok = inTime && typeof choice === "number" && choice === q!.correct_index;
  const late = !inTime;                                   // jawaban tiba setelah batas waktu + toleransi
  const lateButCorrect = late && typeof choice === "number" && choice === q!.correct_index;
  // Jawaban benar beruntun: bonus didapat SETIAP jawaban benar selama streak >= ambang (bukan cuma sekali saat tercapai).
  const prevStreak = (s as { streak?: number }).streak ?? 0;
  const newStreak = ok ? prevStreak + 1 : 0;
  const streakActive = !!cfg.streak && newStreak >= cfg.streak.min;
  const basePts = ok ? cfg.points : 0;
  const bonusPts = ok && streakActive ? cfg.streak!.bonus : 0;
  const pts = basePts + bonusPts;
  const updated = { ...s, score: s.score + pts, correct: s.correct + (ok ? 1 : 0), total: s.total + 1, streak: newStreak };

  // Tahap 2: semua penulisan + persiapan soal berikutnya paralel (1 round-trip efektif)
  const [stats, , , , next] = await Promise.all([
    bumpStats(uid, s.difficulty, { answered: 1, correct: ok ? 1 : 0, points: pts }),
    admin.from("session_answers").update({ chosen_index: choice ?? null, is_correct: ok, answered_at: new Date().toISOString() }).eq("id", row.id),
    admin.from("game_sessions").update({ score: updated.score, correct: updated.correct, total: updated.total, streak: updated.streak }).eq("id", session),
    ok || lateButCorrect ? clearWrong(uid, question) : recordWrong(uid, question, s.difficulty, choice ?? null), // terlambat tapi benar: jangan masuk daftar salah
    // soal berikutnya ikut di response ini (hemat 1 invocation per soal); jam server dimulai setelah jeda baca
    getNextQuestionState(uid, session, req, { session: updated, graceMs: graceFor(mode), skip: question }),
  ]);

  // Pencapaian dihitung dari hasil bump_stats (tanpa query tambahan); hanya yang belum dimiliki yang ditulis
  const have: string[] = Array.isArray(meta?.achievements) ? meta.achievements : [];
  const cand: string[] = [];
  if (ok && stats) {
    if (stats.correct <= 1) cand.push("first_blood");
    if (s.difficulty === "hell" && stats.answered >= 10) cand.push("hell_survivor");
    if (stats.levels >= 5) cand.push("polyglot");
  }
  const fresh = cand.filter((id) => !have.includes(id));
  const unlocked = fresh.length ? await grantAchievements(uid, fresh) : [];

  return NextResponse.json({
    correct: ok,
    late,
    correctIndex: q!.correct_index,
    explanation: getLang(req) === "en" ? q!.explanation_en ?? q!.explanation : q!.explanation,
    gained: pts,
    gainedBase: basePts,
    gainedBonus: bonusPts,
    streak: newStreak,
    streakActive,
    streakMin: cfg.streak?.min ?? 0,
    score: updated.score,
    newAchievements: [...unlocked, ...(((next as { newAchievements?: string[] }).newAchievements) ?? [])].filter((v, i, a) => a.indexOf(v) === i),
    next: (next as { error?: string }).error ? null : next,
  });
}
