import { NextRequest, NextResponse } from "next/server";
import { admin } from "@/lib/server";
import { COOKIE, readSession } from "@/lib/auth";
export const runtime = "nodejs";
// Tanpa cache HTTP: status login harus selalu segar (cache membuat login/logout "tersangkut"). Respons ini murah:
// untuk token baru, username dibaca dari token (tanpa query database).
export async function GET(req: NextRequest) {
  const headers = { "Cache-Control": "no-store" };
  const sess = await readSession(req.cookies.get(COOKIE)?.value);
  if (!sess) return NextResponse.json({ user: null }, { headers });
  if (sess.username) return NextResponse.json({ user: { id: sess.id, username: sess.username } }, { headers });
  const { data } = await admin.from("profiles").select("id,username").eq("id", sess.id).maybeSingle(); // token lama (tanpa username)
  return NextResponse.json({ user: data ?? null }, { headers });
}
