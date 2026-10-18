import { NextRequest, NextResponse } from "next/server";
import { admin, userId } from "@/lib/server";
export async function POST(req: NextRequest) {
  const { lang } = await req.json().catch(() => ({}));
  if (lang !== "id" && lang !== "en") return NextResponse.json({ error: "INVALID_FIELDS" }, { status: 400 });
  const uid = await userId(req);
  if (uid) await admin.from("profiles").update({ lang }).eq("id", uid);
  const res = NextResponse.json({ ok: true });
  res.cookies.set("kt_lang", lang, { path: "/", maxAge: 31536000, sameSite: "lax" });
  return res;
}
