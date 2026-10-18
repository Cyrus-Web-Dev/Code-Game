import { NextRequest, NextResponse } from "next/server";
import { userId, fail, closeSession } from "@/lib/server";
export async function POST(req: NextRequest) {
  const uid = await userId(req); if (!uid) return fail("UNAUTHORIZED", 401);
  const { session } = await req.json();
  const s = await closeSession(session, uid, "quit");
  return NextResponse.json({ score: s?.score ?? 0 });
}
