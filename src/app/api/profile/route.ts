import { NextRequest, NextResponse } from "next/server";
import { admin, userId, fail } from "@/lib/server";
import { saveAvatar } from "@/lib/avatar";
export async function POST(req: NextRequest) {
  const uid = await userId(req); if (!uid) return fail("UNAUTHORIZED", 401);
  const b = await req.json().catch(() => ({}));
  const u: Record<string, string> = {};
  if (typeof b.favorite_language === "string") u.favorite_language = b.favorite_language.trim().slice(0, 40);
  if (typeof b.favorite_framework === "string") u.favorite_framework = b.favorite_framework.trim().slice(0, 40);
  if (["frontend", "backend", "fullstack"].includes(b.role)) u.role = b.role;
  if (["newbie", "intermediate", "advanced"].includes(b.skill_level)) u.skill_level = b.skill_level;
  if (typeof b.avatar_url === "string" && b.avatar_url.startsWith("data:") && b.avatar_url.length < 290_000) {
    // foto baru: simpan di Storage (URL publik ber-hash). Foto yang tidak berubah dikirim klien sebagai URL biasa dan diabaikan.
    const { data: cur } = await admin.from("profiles").select("avatar_url").eq("id", uid).maybeSingle();
    const saved = await saveAvatar(uid, b.avatar_url, cur?.avatar_url);
    if (!saved) return fail("INVALID_FIELDS");
    u.avatar_url = saved;
  }
  if (!Object.keys(u).length) return fail("INVALID_FIELDS");
  const { error } = await admin.from("profiles").update(u).eq("id", uid);
  return error ? fail("SERVER", 500) : NextResponse.json({ ok: true });
}
