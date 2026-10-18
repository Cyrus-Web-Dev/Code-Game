import { NextRequest, NextResponse } from "next/server";
import { admin, userId } from "@/lib/server";
import { parseDataUrl, saveAvatar } from "@/lib/avatar";
export const runtime = "nodejs";
// Jalur lama: foto sendiri yang masih berupa data-URL di database. Saat diakses, foto dipindahkan otomatis ke Storage
// (lalu tampil juga di leaderboard dan daftar teman). Untuk foto yang sudah di Storage, klien memakai URL publik langsung.
export async function GET(req: NextRequest) {
  const uid = await userId(req);
  if (!uid) return new NextResponse(null, { status: 401 });
  const { data } = await admin.from("profiles").select("avatar_url").eq("id", uid).maybeSingle();
  const img = data?.avatar_url?.startsWith("data:") ? parseDataUrl(data.avatar_url) : null;
  if (!img) return new NextResponse(null, { status: 404 });
  const moved = await saveAvatar(uid, data!.avatar_url!, null);
  if (moved && moved.startsWith("http")) await admin.from("profiles").update({ avatar_url: moved }).eq("id", uid);
  return new NextResponse(img.buf, { headers: { "Content-Type": img.mime, "Cache-Control": "private, max-age=3600", "X-Content-Type-Options": "nosniff" } });
}
