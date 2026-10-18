/** Simple in-memory rate limiter (per-instance). Good enough for Vercel serverless cold starts + small scale. */
type Bucket = { count: number; reset: number };
const buckets = new Map<string, Bucket>();

export function rateLimit(key: string, limit = 8, windowMs = 15 * 60 * 1000): { ok: boolean; retryAfter?: number } {
  const now = Date.now();
  let b = buckets.get(key);
  if (!b || now > b.reset) {
    b = { count: 0, reset: now + windowMs };
    buckets.set(key, b);
  }
  b.count += 1;
  if (b.count > limit) return { ok: false, retryAfter: Math.ceil((b.reset - now) / 1000) };
  // opportunistic cleanup
  if (buckets.size > 5000) {
    for (const [k, v] of buckets) if (now > v.reset) buckets.delete(k);
  }
  return { ok: true };
}

import { admin } from "@/lib/server";
import type { NextRequest } from "next/server";
export const clientIp = (req: NextRequest) => req.headers.get("x-forwarded-for")?.split(",")[0]?.trim() || req.headers.get("x-real-ip") || "unknown";

/**
 * Rate limit yang disimpan di database sehingga berlaku untuk SEMUA instance serverless
 * (versi in-memory di atas hanya berlaku per instance dan hilang saat cold start).
 * Fungsi SQL `rate_hit` ada di migration-v1.3a-additive.sql.
 * failOpen=true: bila fungsi belum dimigrasi / database error, izinkan (jangan mengunci pemain sah).
 * failOpen=false: untuk endpoint sensitif (reset password); gagal = ditolak.
 */
export async function rateLimitDb(key: string, limit: number, windowSeconds: number, failOpen = true): Promise<boolean> {
  try {
    const { data, error } = await admin.rpc("rate_hit", { p_key: key, p_limit: limit, p_window_seconds: windowSeconds });
    if (error) return failOpen;
    return data === true;
  } catch { return failOpen; }
}
