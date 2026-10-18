import { NextRequest, NextResponse } from "next/server";
import { admin, fail } from "@/lib/server";
import { hashPassword, makeToken, setSession } from "@/lib/auth";
import { rateLimitDb, clientIp } from "@/lib/rate-limit";
export const runtime = "nodejs";
const SKILLS = ["newbie", "intermediate", "advanced"], ROLES = ["frontend", "backend", "fullstack"];
export async function POST(req: NextRequest) {
  if (!(await rateLimitDb(`register:${clientIp(req)}`, 8, 3600))) return fail("RATE_LIMITED", 429); // cegah pendaftaran massal yang memenuhi database
  const b = await req.json().catch(() => null);
  if (!b) return fail("INVALID_FIELDS");
  const username = String(b.username ?? "").trim(), password = String(b.password ?? "");
  const favLang = String(b.favoriteLanguage ?? "").trim().slice(0, 40), favFw = String(b.favoriteFramework ?? "").trim().slice(0, 40);
  if (!/^[A-Za-z0-9_]{3,20}$/.test(username)) return fail("USERNAME_INVALID");
  if (password.length < 8 || password.length > 128) return fail("PASSWORD_SHORT");
  if (!SKILLS.includes(b.skillLevel) || !ROLES.includes(b.role) || !favLang || !favFw) return fail("INVALID_FIELDS");
  const lang = req.cookies.get("kt_lang")?.value === "en" ? "en" : "id";
  const { data: p, error } = await admin.from("profiles").insert({
    username, role: b.role, skill_level: b.skillLevel, favorite_language: favLang, favorite_framework: favFw, lang,
  }).select("id,starter_title").single(); // gelar awal diisi otomatis oleh trigger database
  if (error) return fail(error.code === "23505" ? "USERNAME_TAKEN" : "SERVER", error.code === "23505" ? 409 : 500);
  const { error: e2 } = await admin.from("credentials").insert({ user_id: p.id, password_hash: await hashPassword(password) });
  if (e2) { await admin.from("profiles").delete().eq("id", p.id); return fail("SERVER", 500); }
  const res = NextResponse.json({ ok: true, starter: p.starter_title });
  setSession(res, await makeToken(p.id, username));
  return res;
}
