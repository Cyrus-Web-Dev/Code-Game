import { NextRequest, NextResponse } from "next/server";
import { userId, fail } from "@/lib/server";
import { getNextQuestionState } from "@/lib/game-session";

export async function GET(req: NextRequest) {
  const uid = await userId(req);
  if (!uid) return fail("UNAUTHORIZED", 401);
  const sid = req.nextUrl.searchParams.get("session");
  if (!sid) return fail("INVALID_FIELDS");
  const state = await getNextQuestionState(uid, sid, req);
  if (state.error) return fail(String(state.error), 400);
  return NextResponse.json(state);
}
