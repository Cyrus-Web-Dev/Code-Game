import { NextRequest, NextResponse } from "next/server";
import { admin, userId, fail } from "@/lib/server";
import { earnedDevBadges, isDevRole } from "@/lib/config";

// Pemain memilih bingkai Master yang dipakai. key: "frontend" | "backend" | "fullstack" | "none" (tanpa bingkai) | null (otomatis).
// Hanya gelar Master yang benar-benar sudah diraih (dihitung ulang dari user_stats di server) yang boleh dipilih.
export async function POST(req: NextRequest) {
  const uid = await userId(req); if (!uid) return fail("UNAUTHORIZED", 401);
  const b = await req.json().catch(() => null);
  const raw = b?.key;
  const key = raw === null || raw === undefined ? null : String(raw);
  if (key !== null && key !== "none" && !isDevRole(key)) return fail("INVALID_FIELDS");
  if (key && key !== "none") {
    const { data: stats } = await admin.from("user_stats").select("difficulty,questions_answered,correct_answers").eq("user_id", uid);
    if (!earnedDevBadges(stats ?? []).some((x) => x.role === key)) return fail("TITLE_LOCKED", 403);
  }
  const { error } = await admin.from("profiles").update({ selected_master: key }).eq("id", uid);
  if (error) return fail("SERVER", 500);
  return NextResponse.json({ ok: true, key }, { headers: { "Cache-Control": "no-store" } });
}
