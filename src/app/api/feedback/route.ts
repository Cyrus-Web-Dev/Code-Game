import { NextRequest, NextResponse } from "next/server";
import { admin, userId, fail } from "@/lib/server";
import { parseDataUrl } from "@/lib/avatar";
import { rateLimitDb } from "@/lib/rate-limit";
export const runtime = "nodejs";
const MAX_PHOTOS = 3, MAX_PHOTO_BYTES = 700_000, MAX_TOTAL_BYTES = 2_000_000;

export async function POST(req: NextRequest) {
  const uid = await userId(req); if (!uid) return fail("UNAUTHORIZED", 401);
  const b = await req.json().catch(() => ({}));
  const kind = ["saran", "kritik", "bug"].includes(b.kind) ? b.kind : "saran", message = String(b.message ?? "").trim();
  if (message.length < 5 || message.length > 2000) return fail("INVALID_FIELDS");

  // foto: maksimal 3, tiap foto divalidasi isinya (bukan hanya tipe yang diklaim) dan dibatasi ukurannya
  const raw: unknown[] = Array.isArray(b.images) ? b.images.slice(0, MAX_PHOTOS) : [];
  const photos = raw.map((x) => (typeof x === "string" ? parseDataUrl(x, MAX_PHOTO_BYTES) : null));
  if (photos.some((p) => !p) || photos.reduce((n, p) => n + (p?.buf.length ?? 0), 0) > MAX_TOTAL_BYTES) return fail("INVALID_IMAGE");
  if (!(await rateLimitDb(`feedback:${uid}`, 6, 3600))) return fail("RATE_LIMITED", 429); // cegah spam penyimpanan

  const { data: p } = await admin.from("profiles").select("username").eq("id", uid).single();
  const username = p?.username ?? "user";
  const stamp = Date.now();
  // unggah ke bucket privat "feedback"; yang gagal dilewati (pesan tetap tersimpan)
  const saved: { path: string; name: string; mime: string; buf: Buffer }[] = [];
  await Promise.all(photos.map(async (ph, i) => {
    if (!ph) return;
    const path = `${username}/${stamp}-${i + 1}.${ph.ext}`;
    const { error } = await admin.storage.from("feedback").upload(path, ph.buf, { contentType: ph.mime, upsert: false });
    if (!error) saved.push({ path, name: `${kind}-${username}-${i + 1}.${ph.ext}`, mime: ph.mime, buf: ph.buf });
  }));
  saved.sort((a, c) => a.path.localeCompare(c.path));

  let { error } = await admin.from("feedback").insert({ user_id: uid, username, kind, message, ...(saved.length ? { attachments: saved.map((s) => s.path) } : {}) });
  if (error && saved.length) { ({ error } = await admin.from("feedback").insert({ user_id: uid, username, kind, message })); saved.length = 0; } // kolom attachments belum dimigrasi
  if (error) return fail("SERVER", 500);

  const key = process.env.RESEND_API_KEY, to = process.env.FEEDBACK_TO_EMAIL; // opsional: teruskan ke email developer (foto ikut terlampir)
  if (key && to) {
    await fetch("https://api.resend.com/emails", {
      method: "POST", headers: { Authorization: `Bearer ${key}`, "Content-Type": "application/json" },
      body: JSON.stringify({
        from: process.env.FEEDBACK_FROM || "Kode Tebak <onboarding@resend.dev>", to: [to], subject: `[Kode Tebak] ${kind} dari ${username}${saved.length ? ` (+${saved.length} foto)` : ""}`,
        text: message + (saved.length ? `\n\nFoto: ${saved.length} (juga tersimpan di Supabase > Storage > feedback)` : ""),
        ...(saved.length ? { attachments: saved.map((s) => ({ filename: s.name, content: s.buf.toString("base64") })) } : {}),
      }),
    }).catch(() => {});
  }
  return NextResponse.json({ ok: true, requested: photos.length, attached: saved.length });
}
