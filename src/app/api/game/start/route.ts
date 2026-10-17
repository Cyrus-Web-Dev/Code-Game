import { NextRequest, NextResponse } from "next/server";
import { admin, userId, fail, todayWIB, ensureMeta } from "@/lib/server";
import { isLevel, isGodLevel, SESSION_LEN, MARATHON_LEN, SPEEDRUN_LEN, DAILY_LEN } from "@/lib/config";
import { getNextQuestionState } from "@/lib/game-session";

export async function POST(req: NextRequest) {
  const uid = await userId(req);
  if (!uid) return fail("UNAUTHORIZED", 401);
  const body = await req.json();
  const level = body.level;
  const modeRaw = String(body.mode || "normal");
  const mode = (
    ["normal", "maraton", "speedrun", "daily"].includes(modeRaw) ? modeRaw : "normal"
  ) as "normal" | "maraton" | "speedrun" | "daily";

  let length = SESSION_LEN;
  if (mode === "maraton") length = MARATHON_LEN;
  else if (mode === "speedrun") length = SPEEDRUN_LEN;
  else if (mode === "daily") length = DAILY_LEN;

  let diff = level;
  if (mode === "daily") {
    const today = todayWIB();
    const meta = await ensureMeta(uid);
    if (meta?.daily_done_date === today) return fail("DAILY_DONE");
    const levels = ["easy", "normal", "hard", "extreme", "hell"];
    const dayNum = Math.floor(new Date(today + "T12:00:00+07:00").getTime() / 86400000);
    diff = levels[dayNum % 5];
  }

  if (!isLevel(diff) && !isGodLevel(diff)) return fail("INVALID_LEVEL");
  // God Mode hanya punya 2 cara main: Biasa (10 soal) dan Maraton (100 soal) — tanpa speedrun/daily.
  if (isGodLevel(diff) && mode !== "normal" && mode !== "maraton") return fail("INVALID_LEVEL");

  await admin
    .from("game_sessions")
    .update({ status: "quit", ended_at: new Date().toISOString() })
    .eq("user_id", uid)
    .eq("status", "active");
  const { data, error } = await admin
    .from("game_sessions")
    .insert({ user_id: uid, difficulty: diff, length, mode })
    .select("id,difficulty,mode,length")
    .single();
  if (error) return fail(error.message, 500);

  // soal pertama ikut di response (jam dimulai langsung; pemain melihatnya segera)
  const first = await getNextQuestionState(uid, data.id, req, {
    session: { id: data.id, difficulty: data.difficulty, mode: data.mode, length: data.length, score: 0, correct: 0, total: 0, status: "active", streak: 0, hints_used: 0 },
  });

  return NextResponse.json({
    session: data.id,
    level: data.difficulty,
    mode: data.mode,
    length: data.length,
    first: first.error ? null : first,
  });
}
