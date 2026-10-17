import { NextRequest, NextResponse } from "next/server";
import { admin, userId, fail } from "@/lib/server";
import { currentTitle, earnedTitles } from "@/lib/config";
export async function GET(req: NextRequest, { params }: { params: { username: string } }) {
  const uid = await userId(req); if (!uid) return fail("UNAUTHORIZED", 401);
  const name = params.username.slice(0, 20);
  if (!/^[A-Za-z0-9_]{3,20}$/.test(name)) return fail("USER_NOT_FOUND", 404);
  const { data, error } = await admin.rpc("player_profile", { p_viewer: uid, p_username: name });
  if (error) return fail("SERVER", 500);
  if (!data) return fail("USER_NOT_FOUND", 404);
  const p = data as { starter: string; sel?: string | null; stats: any[] };
  return NextResponse.json({ ...p, title: currentTitle(p.starter, p.stats, p.sel), titles: earnedTitles(p.stats) }, { headers: { "Cache-Control": "private, no-store" } });
}
