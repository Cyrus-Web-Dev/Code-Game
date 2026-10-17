import { NextRequest, NextResponse } from "next/server";
import { admin, userId, fail } from "@/lib/server";
// Riwayat permainan: milik sendiri (tanpa ?u) atau milik teman (?u=username). Pemeriksaan "berteman" dilakukan di database.
export async function GET(req: NextRequest) {
  const uid = await userId(req); if (!uid) return fail("UNAUTHORIZED", 401);
  const sp = req.nextUrl.searchParams;
  const u = (sp.get("u") ?? "").trim();
  if (u && !/^[A-Za-z0-9_]{3,20}$/.test(u)) return fail("USER_NOT_FOUND", 404);
  const beforeRaw = sp.get("before");
  const before = beforeRaw && !Number.isNaN(Date.parse(beforeRaw)) ? new Date(beforeRaw).toISOString() : null;
  const limit = Math.min(Math.max(parseInt(sp.get("limit") ?? "20", 10) || 20, 1), 50);
  const { data, error } = await admin.rpc("player_history", { p_viewer: uid, p_username: u || null, p_before: before, p_limit: limit });
  if (error) return fail("SERVER", 500);
  const r = data as { limited?: boolean; notfound?: boolean; allowed?: boolean; rows?: unknown[] };
  if (r.limited) return fail("RATE_LIMITED", 429);
  if (r.notfound) return fail("USER_NOT_FOUND", 404);
  return NextResponse.json({ allowed: !!r.allowed, rows: r.rows ?? [] }, { headers: { "Cache-Control": "private, no-store" } });
}
