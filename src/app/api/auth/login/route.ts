import { NextRequest, NextResponse } from "next/server";
import { admin, fail } from "@/lib/server";
import { checkPassword, makeToken, setSession } from "@/lib/auth";
import { rateLimit, rateLimitDb, clientIp } from "@/lib/rate-limit";
export const runtime = "nodejs";
export async function POST(req: NextRequest) {
  const ip = clientIp(req);
  const rl = rateLimit(`login:${ip}`, 10, 15 * 60 * 1000); // lapis cepat (per instance)
  if (!rl.ok) return fail("RATE_LIMITED", 429);

  const b = await req.json().catch(() => null);
  const username = String(b?.username ?? "").trim().toLowerCase(), password = String(b?.password ?? "");
  if (!username || !password || password.length > 128) return fail("BAD_CREDENTIALS", 401);
  // lapis database (berlaku lintas instance): per IP+akun dan per akun (menahan tebakan terdistribusi)
  const [okA, okB] = await Promise.all([rateLimitDb(`login:${ip}:${username}`, 10, 900), rateLimitDb(`login:u:${username}`, 60, 900)]);
  if (!okA || !okB) return fail("RATE_LIMITED", 429);
  const { data: p } = await admin.from("profiles").select("id,lang,username").eq("username_lc", username).maybeSingle();
  const { data: c } = p ? await admin.from("credentials").select("password_hash").eq("user_id", p.id).maybeSingle() : { data: null };
  if (!p || !c || !(await checkPassword(c.password_hash, password))) return fail("BAD_CREDENTIALS", 401);
  const res = NextResponse.json({ ok: true });
  setSession(res, await makeToken(p.id, p.username));
  res.cookies.set("kt_lang", p.lang, { path: "/", maxAge: 31536000, sameSite: "lax" });
  return res;
}
