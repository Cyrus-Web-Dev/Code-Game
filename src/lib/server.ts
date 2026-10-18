import { createClient } from "@supabase/supabase-js";
import { NextRequest, NextResponse } from "next/server";
import { COOKIE, readToken } from "@/lib/auth";
export const admin = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_ROLE_KEY!,
  { auth: { persistSession: false } }
);
export const userId = (req: NextRequest) => readToken(req.cookies.get(COOKIE)?.value);
export const getLang = (req: NextRequest) => (req.cookies.get("kt_lang")?.value === "en" ? "en" : "id");
export const fail = (msg: string, status = 400) => NextResponse.json({ error: msg }, { status });
// Tanggal hari ini di WIB (Asia/Jakarta) untuk reset hint harian
export const todayWIB = () => new Intl.DateTimeFormat("en-CA", { timeZone: "Asia/Jakarta" }).format(new Date());

export type StatsAfter = { correct: number; answered: number; levels: number } | null;

/** Statistik atomik lewat RPC bump_stats (1 panggilan, tanpa race condition). Fallback ke cara lama bila RPC belum dimigrasi. */
export async function bumpStats(uid: string, level: string, d: { answered?: number; correct?: number; points?: number; games?: number }): Promise<StatsAfter> {
  const { data, error } = await admin.rpc("bump_stats", { p_user: uid, p_level: level, p_games: d.games ?? 0, p_answered: d.answered ?? 0, p_correct: d.correct ?? 0, p_points: d.points ?? 0 });
  if (!error) { const r = Array.isArray(data) ? data[0] : data; return r ? { correct: r.out_correct, answered: r.out_answered, levels: r.out_levels } : null; }
  // --- fallback (skema lama) ---
  const { data: s } = await admin.from("user_stats").select("*").eq("user_id", uid).eq("difficulty", level).maybeSingle();
  const next = {
    games_played: (s?.games_played ?? 0) + (d.games ?? 0), questions_answered: (s?.questions_answered ?? 0) + (d.answered ?? 0),
    correct_answers: (s?.correct_answers ?? 0) + (d.correct ?? 0), points: (s?.points ?? 0) + (d.points ?? 0),
  };
  await admin.from("user_stats").upsert({ user_id: uid, difficulty: level, ...next });
  if (d.points) {
    const { data: p } = await admin.from("profiles").select("total_points").eq("id", uid).single();
    await admin.from("profiles").update({ total_points: (p?.total_points ?? 0) + d.points }).eq("id", uid);
  }
  const { data: all } = await admin.from("user_stats").select("correct_answers").eq("user_id", uid);
  return { correct: next.correct_answers, answered: next.questions_answered, levels: (all ?? []).filter((x) => (x.correct_answers ?? 0) > 0).length };
}

type SessionRow = { id: string; user_id?: string; difficulty: string; length: number; score: number; correct: number; total: number; status: string; mode?: string };

/** Menutup sesi. `known` = baris sesi yang sudah dibaca pemanggil (hemat 1 query). Penutupan diklaim secara atomik agar tidak terhitung dua kali. */
export async function closeSession(sessionId: string, uid: string, status: "finished" | "quit", known?: SessionRow | null) {
  let s: SessionRow | null | undefined = known;
  if (!s) { const { data } = await admin.from("game_sessions").select("*").eq("id", sessionId).eq("user_id", uid).single(); s = data; }
  if (!s || s.status !== "active") return s;
  const { data: claimed } = await admin.from("game_sessions").update({ status, ended_at: new Date().toISOString() }).eq("id", sessionId).eq("status", "active").select("id");
  if (!claimed?.length) return s; // sudah ditutup oleh request lain
  await Promise.all([bumpStats(uid, s.difficulty, { games: 1 }), status === "finished" ? updateStreak(uid) : Promise.resolve(null)]);
  return { ...s, status };
}

export async function ensureMeta(uid: string) {
  const { data } = await admin.from("user_meta").select("*").eq("user_id", uid).maybeSingle();
  if (data) return data;
  const { data: created } = await admin.from("user_meta").insert({ user_id: uid }).select("*").single();
  return created;
}

export async function updateStreak(uid: string) {
  const today = todayWIB();
  const meta = await ensureMeta(uid);
  if (!meta) return { streak: 0, newAchievements: [] as string[] };
  let streak = meta.streak ?? 0;
  const last = meta.last_play_date;
  if (last === today) {
    // already counted
  } else if (last) {
    const prev = new Date(last + "T12:00:00+07:00");
    const cur = new Date(today + "T12:00:00+07:00");
    const diff = Math.round((cur.getTime() - prev.getTime()) / 86400000);
    streak = diff === 1 ? streak + 1 : 1;
  } else {
    streak = 1;
  }
  const best = Math.max(meta.best_streak ?? 0, streak);
  await admin.from("user_meta").update({ streak, best_streak: best, last_play_date: today }).eq("user_id", uid);
  const unlocked: string[] = [];
  if (streak >= 3) unlocked.push("streak_3");
  if (streak >= 7) unlocked.push("streak_7");
  if (streak >= 30) unlocked.push("streak_30");
  if (unlocked.length) await grantAchievements(uid, unlocked);
  return { streak, best, newAchievements: unlocked };
}

export async function grantAchievements(uid: string, ids: string[]) {
  const { data, error } = await admin.rpc("grant_achievements", { p_user: uid, p_ids: ids });
  if (!error) return (data ?? []) as string[];
  const meta = await ensureMeta(uid); // fallback skema lama
  if (!meta) return [] as string[];
  const current: string[] = Array.isArray(meta.achievements) ? meta.achievements : [];
  const fresh = ids.filter((id) => !current.includes(id));
  if (!fresh.length) return [];
  await admin.from("user_meta").update({ achievements: [...current, ...fresh] }).eq("user_id", uid);
  return fresh;
}

export async function recordWrong(uid: string, questionId: string, difficulty: string, chosen: number | null) {
  await admin.from("wrong_answers").upsert(
    { user_id: uid, question_id: questionId, difficulty, chosen_index: chosen },
    { onConflict: "user_id,question_id" }
  );
}

export async function clearWrong(uid: string, questionId: string) {
  await admin.from("wrong_answers").delete().eq("user_id", uid).eq("question_id", questionId);
}
