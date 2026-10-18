import { createClient } from "@supabase/supabase-js";
// Klien anon: HANYA untuk membaca leaderboard (realtime). Semua tulis lewat API server.
export const supabase = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL!, process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!, {
  auth: { persistSession: false, autoRefreshToken: false },
});
export async function api<T = any>(path: string, body?: unknown): Promise<T & { error?: string }> {
  try {
    const res = await fetch(path, {
      method: body === undefined ? "GET" : "POST",
      headers: { "Content-Type": "application/json" },
      body: body === undefined ? undefined : JSON.stringify(body),
      credentials: "same-origin",
    });
    return await res.json();
  } catch { return { error: "SERVER" } as any; }
}
