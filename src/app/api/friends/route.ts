import { NextRequest, NextResponse } from "next/server";
import { admin, userId, fail } from "@/lib/server";
export const runtime = "nodejs";
const NO_STORE = { "Cache-Control": "private, no-store" };

export async function GET(req: NextRequest) {
  const uid = await userId(req); if (!uid) return fail("UNAUTHORIZED", 401);
  // sekalian tandai pemain ini online (hemat 1 invocation heartbeat saat halaman Teman terbuka)
  const [{ data, error }] = await Promise.all([admin.rpc("friends_overview", { p_user: uid }), admin.rpc("presence_touch", { p_user: uid })]);
  if (error) return fail("SERVER", 500);
  return NextResponse.json(data, { headers: NO_STORE });
}

// POST { action: "request" | "respond" | "remove", username?, requestId?, accept?, userId? }
export async function POST(req: NextRequest) {
  const uid = await userId(req); if (!uid) return fail("UNAUTHORIZED", 401);
  const b = await req.json().catch(() => null);
  if (!b || typeof b !== "object") return fail("INVALID_FIELDS");
  const action = String(b.action ?? "");
  const args: Record<string, unknown> = { p_user: uid, p_action: action };
  if (action === "request") {
    const u = String(b.username ?? "").trim();
    if (!/^[A-Za-z0-9_]{3,20}$/.test(u)) return fail("USERNAME_INVALID");
    args.p_username = u;
  } else if (action === "respond") {
    const id = Number(b.requestId);
    if (!Number.isInteger(id) || id <= 0) return fail("INVALID_FIELDS");
    args.p_request = id; args.p_accept = b.accept !== false;
  } else if (action === "remove") {
    const o = String(b.userId ?? "");
    if (!/^[0-9a-f-]{36}$/i.test(o)) return fail("INVALID_FIELDS");
    args.p_other = o;
  } else return fail("INVALID_FIELDS");
  const { data, error } = await admin.rpc("friend_action", args);
  if (error) return fail("SERVER", 500);
  if (data === "rate_limited") return fail("RATE_LIMITED", 429);
  return NextResponse.json({ result: data }, { headers: NO_STORE });
}
