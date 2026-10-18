import { NextRequest, NextResponse } from "next/server";
import { admin, userId, fail } from "@/lib/server";
export async function GET(req: NextRequest) {
  const uid = await userId(req); if (!uid) return fail("UNAUTHORIZED", 401);
  const q = (req.nextUrl.searchParams.get("q") ?? "").slice(0, 30);
  const { data, error } = await admin.rpc("search_players", { p_viewer: uid, p_q: q });
  if (error) return fail("SERVER", 500);
  if (data && !Array.isArray(data) && (data as { limited?: boolean }).limited) return fail("RATE_LIMITED", 429);
  return NextResponse.json({ results: data ?? [] }, { headers: { "Cache-Control": "private, no-store" } });
}
