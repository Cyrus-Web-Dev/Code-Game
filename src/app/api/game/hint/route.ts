import { NextRequest, NextResponse } from "next/server";
import { admin, userId, fail, todayWIB, getLang } from "@/lib/server";
<<<<<<< HEAD
import { LEVELS, Level, PlayableLevel, isGodLevel, isDevRole } from "@/lib/config";
=======
import { LEVELS, Level, AnyLevel, isGodLevel } from "@/lib/config";
>>>>>>> 139710653228b172a081280c0c37a037c1a953fb

export async function POST(req: NextRequest) {
  const uid = await userId(req); if (!uid) return fail("UNAUTHORIZED", 401);
  const { session, question } = await req.json();
  const [{ data: s }, { data: row }, { data: h }] = await Promise.all([
    admin.from("game_sessions").select("difficulty,status,hints_used").eq("id", session).eq("user_id", uid).single(),
    admin.from("session_answers").select("answered_at,hint_count").eq("session_id", session).eq("question_id", question).single(),
    admin.from("questions").select("hint,hint_en,hint2,hint2_en,hint3,hint3_en").eq("id", question).single(),
  ]);
  if (!s || s.status !== "active") return fail("SESSION_INACTIVE");
  if (!row || row.answered_at) return fail("QUESTION_INACTIVE");
<<<<<<< HEAD
  const lv = s.difficulty as PlayableLevel, en = getLang(req) === "en";

  // ── Developer Mode: hint tanpa batas, SATU tahap langsung (bukan berjenjang seperti God Mode). ──
  if (isDevRole(lv)) {
    return NextResponse.json({ hint: (en ? h?.hint_en ?? h?.hint : h?.hint) ?? "-", hints: -1, hintsUnlimited: true });
  }
=======
  const lv = s.difficulty as AnyLevel, en = getLang(req) === "en";
>>>>>>> 139710653228b172a081280c0c37a037c1a953fb

  // ── God Mode: hint tanpa batas, berjenjang (3 tahap) per soal — tujuan utamanya edukasi tools keamanan. ──
  if (isGodLevel(lv)) {
    const stage = Math.min((row.hint_count ?? 0) + 1, 3);
    const text = stage === 1 ? (en ? h?.hint_en ?? h?.hint : h?.hint)
      : stage === 2 ? (en ? h?.hint2_en ?? h?.hint2 : h?.hint2) ?? (en ? h?.hint_en ?? h?.hint : h?.hint)
      : (en ? h?.hint3_en ?? h?.hint3 : h?.hint3) ?? (en ? h?.hint_en ?? h?.hint : h?.hint);
    await Promise.all([
      admin.from("session_answers").update({ hint_count: stage }).eq("session_id", session).eq("question_id", question),
      stage > (row.hint_count ?? 0) ? admin.from("game_sessions").update({ hints_used: (s.hints_used ?? 0) + 1 }).eq("id", session) : Promise.resolve(null),
    ]);
    return NextResponse.json({ hint: text ?? "-", stage, hints: -1, hintsUnlimited: true, hintsUsedTotal: (s.hints_used ?? 0) + (stage > (row.hint_count ?? 0) ? 1 : 0) });
  }

  // ── Tingkat biasa (Easy–Hell): kuota hint harian seperti sebelumnya, satu tahap. ──
  const today = todayWIB();
  const { data: q } = await admin.from("hint_quota").select("*").eq("user_id", uid).eq("difficulty", lv).maybeSingle();
  const remaining = !q || q.last_hint_reset < today ? LEVELS[lv as Level].hints : q.remaining;
  if (remaining <= 0) return fail("NO_HINTS");
  await admin.from("hint_quota").upsert({ user_id: uid, difficulty: lv, remaining: remaining - 1, last_hint_reset: today });
  return NextResponse.json({ hint: (en ? h?.hint_en ?? h?.hint : h?.hint) ?? "-", hints: remaining - 1 });
}
