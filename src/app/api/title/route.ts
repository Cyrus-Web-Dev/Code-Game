import { NextRequest, NextResponse } from "next/server";
import { admin, userId, fail } from "@/lib/server";
import { ownedTitles } from "@/lib/config";

// Pemain memilih gelar yang dipakai. key: "starter" | "<tingkat>:std" | "<tingkat>:legend" | null (otomatis: gelar tertinggi).
export async function POST(req: NextRequest) {
  const uid = await userId(req); if (!uid) return fail("UNAUTHORIZED", 401);
  const b = await req.json().catch(() => null);
  const raw = b?.key;
  const key = raw === null || raw === undefined ? null : String(raw);
  if (key !== null && !/^(starter|(easy|normal|hard|extreme|hell|demi_god|god|true_god|primordial_god):(std|legend))$/.test(key)) return fail("INVALID_FIELDS");
  if (key && key !== "starter") {
    // hanya gelar yang benar-benar sudah dibuka (dihitung ulang dari statistik di server, bukan dari klien)
    const { data: stats } = await admin.from("user_stats").select("difficulty,questions_answered,correct_answers").eq("user_id", uid);
    if (!ownedTitles(stats ?? []).some((o) => o.key === key)) return fail("TITLE_LOCKED", 403);
  }
  const { error } = await admin.from("profiles").update({ selected_title: key }).eq("id", uid);
  if (error) return fail("SERVER", 500);
  return NextResponse.json({ ok: true, key }, { headers: { "Cache-Control": "no-store" } });
}
