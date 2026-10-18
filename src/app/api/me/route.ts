import { NextRequest, NextResponse } from "next/server";
import { admin, userId, fail, todayWIB, ensureMeta } from "@/lib/server";
import { earnedTitles, ownedTitles, currentTitle, LEVELS, Level } from "@/lib/config";

// Foto profil tidak dikirim di sini (bisa ratusan KB). Cukup URL ber-versi yang di-cache browser: /api/avatar?v=<hash>
async function loadBundle(uid: string) {
  const { data, error } = await admin.rpc("me_bundle", { p_user: uid });
  if (!error && data) return data as { profile: any; stats: any[]; rank: number; hints: any[]; meta: any };
  if (!error && !data) return null;
  // --- fallback skema lama (sebelum migrasi v1.3) ---
  const [{ data: profile }, { data: stats }, { data: hints }, meta] = await Promise.all([
    admin.from("profiles").select("*").eq("id", uid).single(),
    admin.from("user_stats").select("*").eq("user_id", uid),
    admin.from("hint_quota").select("*").eq("user_id", uid),
    ensureMeta(uid),
  ]);
  if (!profile) return null;
  const { count } = await admin.from("profiles").select("id", { count: "exact", head: true }).gt("total_points", profile.total_points);
  const { avatar_url, username_lc, ...rest } = profile;
  return { profile: { ...rest, avatar_ver: avatar_url ? "legacy" : null, __avatar: avatar_url }, stats: stats ?? [], rank: (count ?? 0) + 1, hints: hints ?? [], meta };
}

export async function GET(req: NextRequest) {
  const uid = await userId(req); if (!uid) return fail("UNAUTHORIZED", 401);
  const b = await loadBundle(uid);
  if (!b) return fail("UNAUTHORIZED", 401);
  const today = todayWIB();
  const hints = Object.fromEntries((Object.keys(LEVELS) as Level[]).map((l) => {
    const q = b.hints.find((x: any) => x.difficulty === l);
    return [l, !q || q.last_hint_reset < today ? LEVELS[l].hints : q.remaining];
  }));
  const { avatar_ver, __avatar, avatar_public, ...profile } = b.profile;
  const meta = b.meta;
  const res = NextResponse.json({
    profile: { ...profile, avatar_url: avatar_public ?? __avatar ?? (avatar_ver ? `/api/avatar?v=${avatar_ver}` : null) },
    stats: b.stats ?? [],
    rank: b.rank,
    levelRanks: (b as { level_ranks?: unknown }).level_ranks ?? {},
    titles: earnedTitles(b.stats ?? []),
    title: currentTitle(profile.starter_title, b.stats ?? [], profile.selected_title),
    owned: ownedTitles(b.stats ?? []),
    hints,
    meta: meta ? {
      streak: meta.streak ?? 0,
      bestStreak: meta.best_streak ?? 0,
      dailyDone: meta.daily_done_date === today,
      onboardingDone: !!meta.onboarding_done,
      achievements: Array.isArray(meta.achievements) ? meta.achievements : [],
    } : { streak: 0, bestStreak: 0, dailyDone: false, onboardingDone: false, achievements: [] },
  });
  res.headers.set("Cache-Control", "private, no-store"); // cache dikelola store klien (useMe), bukan cache HTTP yang bisa basi
  return res;
}
