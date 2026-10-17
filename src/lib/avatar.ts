import { createHash } from "node:crypto";
import { admin } from "@/lib/server";

const MAX_BYTES = 210_000;
const SIG: Record<string, (b: Buffer) => boolean> = {
  "image/png": (b) => b.length > 8 && b[0] === 0x89 && b[1] === 0x50 && b[2] === 0x4e && b[3] === 0x47,
  "image/jpeg": (b) => b.length > 4 && b[0] === 0xff && b[1] === 0xd8 && b[2] === 0xff,
  "image/webp": (b) => b.length > 12 && b.toString("ascii", 0, 4) === "RIFF" && b.toString("ascii", 8, 12) === "WEBP",
};

/** Mengurai & memvalidasi data-URL gambar. Mengembalikan null bila tidak sah (mime palsu, terlalu besar, dll). */
export function parseDataUrl(dataUrl: string, maxBytes = MAX_BYTES) {
  const m = /^data:(image\/(?:png|jpeg|jpg|webp));base64,([A-Za-z0-9+/=]+)$/.exec(dataUrl);
  if (!m) return null;
  const mime = m[1] === "image/jpg" ? "image/jpeg" : m[1];
  const buf = Buffer.from(m[2], "base64");
  if (!buf.length || buf.length > maxBytes || !SIG[mime](buf)) return null;
  return { mime, buf, ext: mime === "image/jpeg" ? "jpg" : mime.slice(6) };
}

/**
 * Simpan foto ke Supabase Storage (bucket publik "avatars") dan kembalikan URL publik ber-hash konten
 * (aman di-cache selamanya). Foto lama ikut dihapus. Bila bucket belum dibuat, kembalikan data-URL apa adanya
 * (mode lama) sehingga fitur tetap jalan.
 */
export async function saveAvatar(uid: string, dataUrl: string, oldUrl?: string | null): Promise<string | null> {
  const img = parseDataUrl(dataUrl);
  if (!img) return null;
  const path = `${uid}/${createHash("md5").update(img.buf).digest("hex").slice(0, 16)}.${img.ext}`;
  const { error } = await admin.storage.from("avatars").upload(path, img.buf, { contentType: img.mime, upsert: true, cacheControl: "31536000" });
  if (error) return dataUrl; // fallback: simpan di database
  const url = admin.storage.from("avatars").getPublicUrl(path).data.publicUrl;
  const old = oldUrl && oldUrl.includes("/avatars/") ? decodeURIComponent(oldUrl.split("/avatars/")[1] ?? "") : "";
  if (old && old !== path && old.startsWith(uid + "/")) await admin.storage.from("avatars").remove([old]).catch(() => {});
  return url;
}
