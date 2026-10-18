import { NextRequest, NextResponse } from "next/server";
import { admin, fail } from "@/lib/server";
import { checkPassword, hashPassword } from "@/lib/auth";
import { rateLimit, rateLimitDb, clientIp } from "@/lib/rate-limit";

export const runtime = "nodejs";

const ROLES = ["frontend", "backend", "fullstack"] as const;
const norm = (s: string) => s.trim().toLowerCase().replace(/\s+/g, " ");

/*
 * CATATAN KEAMANAN
 * Metode "security" (bahasa favorit + framework favorit + role) berbasis data berentropi rendah:
 * role hanya 3 pilihan, framework dipilih dari daftar pendek, dan bahasa favorit tampil di lencana leaderboard.
 * Karena itu:
 *  - data profil tidak lagi bisa dibaca publik (lihat migration-v1.3b-lockdown.sql),
 *  - percobaan dibatasi di DATABASE (berlaku lintas instance serverless): 5 percobaan/hari/akun untuk metode ini,
 *  - akun DEMO tidak bisa di-reset sama sekali (kredensialnya tercantum di README publik),
 *  - set env DISABLE_SECURITY_RESET=1 untuk mematikan metode ini sepenuhnya (disarankan untuk produksi).
 * Metode "old_password" aman (butuh kata sandi lama).
 */
export async function POST(req: NextRequest) {
  const ip = clientIp(req);
  if (!rateLimit(`reset:${ip}`, 8, 15 * 60 * 1000).ok) return fail("RATE_LIMITED", 429);
  if (!(await rateLimitDb(`reset:ip:${ip}`, 20, 3600, false))) return fail("RATE_LIMITED", 429);

  const b = await req.json().catch(() => null);
  if (!b || typeof b !== "object") return fail("INVALID_FIELDS");

  const username = String(b.username ?? "").trim().toLowerCase();
  const newPassword = String(b.newPassword ?? "");
  const method = String(b.method ?? ""); // "old_password" | "security"

  if (!username || !/^[a-z0-9_]{3,20}$/.test(username)) return fail("USERNAME_INVALID");
  if (newPassword.length < 8 || newPassword.length > 128) return fail("PASSWORD_SHORT");
  if (method !== "old_password" && method !== "security") return fail("INVALID_FIELDS");

  // batas per akun, dihitung di database; gagal-tertutup (jika DB bermasalah, tolak)
  const perUser = method === "security" ? 5 : 10;
  if (!(await rateLimitDb(`reset:u:${method}:${username}`, perUser, 86400, false))) return fail("RATE_LIMITED", 429);

  if (method === "security" && process.env.DISABLE_SECURITY_RESET === "1") return fail("SECURITY_MISMATCH", 401);

  const { data: profile } = await admin
    .from("profiles")
    .select("id, role, favorite_language, favorite_framework, is_demo")
    .eq("username_lc", username)
    .maybeSingle();
  if (!profile) return fail("USER_NOT_FOUND", 404);
  // akun demo dikunci: kredensialnya publik, jangan sampai orang lain mengambil alih atau mengganti kata sandinya
  if (profile.is_demo) return fail(method === "old_password" ? "OLD_PASSWORD_WRONG" : "SECURITY_MISMATCH", 401);

  const { data: cred } = await admin.from("credentials").select("password_hash").eq("user_id", profile.id).maybeSingle();
  if (!cred) return fail("USER_NOT_FOUND", 404);

  if (method === "old_password") {
    const oldPassword = String(b.oldPassword ?? "");
    if (!oldPassword || oldPassword.length > 128) return fail("OLD_PASSWORD_WRONG", 401);
    if (!(await checkPassword(cred.password_hash, oldPassword))) return fail("OLD_PASSWORD_WRONG", 401);
  } else {
    const favLang = String(b.favoriteLanguage ?? "");
    const favFw = String(b.favoriteFramework ?? "");
    const role = String(b.role ?? "").trim().toLowerCase();
    if (!favLang || !favFw || !ROLES.includes(role as (typeof ROLES)[number])) return fail("INVALID_FIELDS");
    const ok = norm(favLang) === norm(String(profile.favorite_language ?? "")) && norm(favFw) === norm(String(profile.favorite_framework ?? "")) && role === String(profile.role ?? "").toLowerCase();
    if (!ok) return fail("SECURITY_MISMATCH", 401);
  }

  const { error } = await admin.from("credentials").update({ password_hash: await hashPassword(newPassword) }).eq("user_id", profile.id);
  if (error) return fail("SERVER", 500);
  return NextResponse.json({ ok: true });
}
