import { NextRequest, NextResponse } from "next/server";
import { admin, userId, fail } from "@/lib/server";
// Heartbeat ringan (1 query): menandai pemain online dan mengembalikan jumlah permintaan teman yang menunggu.
export async function POST(req: NextRequest) {
  const uid = await userId(req); if (!uid) return fail("UNAUTHORIZED", 401);
  const { data, error } = await admin.rpc("presence_touch", { p_user: uid });
  return NextResponse.json({ pending: error ? 0 : (data as number) ?? 0 }, { headers: { "Cache-Control": "no-store" } });
}
