import { SignJWT, jwtVerify } from "jose";
import { hash, verify } from "@node-rs/argon2";
import type { NextResponse } from "next/server";

export const COOKIE = "kt_session";
const key = () => {
  const s = process.env.SESSION_SECRET;
  if (!s || s.length < 32) throw new Error("SESSION_SECRET belum diatur (minimal 32 karakter)");
  return new TextEncoder().encode(s);
};
// @node-rs/argon2 memakai Argon2id secara bawaan. Parameter mengikuti rekomendasi OWASP.
export const hashPassword = (p: string) => hash(p, { memoryCost: 19456, timeCost: 2, parallelism: 1 });
export const checkPassword = (h: string, p: string) => verify(h, p).catch(() => false);
export const makeToken = (uid: string, username?: string) =>
  new SignJWT(username ? { un: username } : {}).setProtectedHeader({ alg: "HS256" }).setSubject(uid).setIssuedAt().setExpirationTime("30d").sign(key());
export async function readToken(token?: string) {
  if (!token) return null;
  try { return (await jwtVerify(token, key())).payload.sub ?? null; } catch { return null; }
}
/** Baca sesi dari token saja (tanpa query database). `username` null untuk token lama. */
export async function readSession(token?: string): Promise<{ id: string; username: string | null } | null> {
  if (!token) return null;
  try { const { payload } = await jwtVerify(token, key()); return payload.sub ? { id: payload.sub, username: typeof payload.un === "string" ? payload.un : null } : null; } catch { return null; }
}
export const setSession = (res: NextResponse, token: string) =>
  res.cookies.set(COOKIE, token, { httpOnly: true, secure: process.env.NODE_ENV === "production", sameSite: "lax", path: "/", maxAge: 60 * 60 * 24 * 30 });
export const clearSession = (res: NextResponse) => res.cookies.set(COOKIE, "", { path: "/", maxAge: 0 });
