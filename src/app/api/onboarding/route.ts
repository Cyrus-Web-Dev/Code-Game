import { NextRequest, NextResponse } from "next/server";
import { userId, fail, ensureMeta, admin } from "@/lib/server";
export async function POST(req: NextRequest) {
  const uid = await userId(req); if (!uid) return fail("UNAUTHORIZED", 401);
  await ensureMeta(uid);
  await admin.from("user_meta").update({ onboarding_done: true }).eq("user_id", uid);
  return NextResponse.json({ ok: true });
}
