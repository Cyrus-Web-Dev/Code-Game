"use client";
import Link from "next/link";
import { useEffect, useState } from "react";
import { motion } from "framer-motion";
import { Card, CardContent } from "@/components/ui/card";
import Avatar from "@/components/Avatar";
import { DEV_IDS, DEV_ROLES, DEV_THEMES, DEV_TITLE_DEFS, DEV_BADGE_RULE, earnedDevBadges, devBadgeRingColors } from "@/lib/config";
import { useT, useLang } from "@/lib/i18n";
import { useMe } from "@/lib/store";

const ICON: Record<string, string> = { frontend: "🎨", backend: "⚙️", fullstack: "🌌" };

export default function DevMode() {
  const t = useT(), lang = useLang((s) => s.lang);
  const [loading, setLoading] = useState(true);
  const [stats, setStats] = useState<any[]>([]);
  const [username, setUsername] = useState("Kamu");
  const [avatar, setAvatar] = useState<string | null>(null);

  useEffect(() => {
    useMe.getState().fetchMe().then((d: any) => {
      if (!d || d.error) { setLoading(false); return; }
      setStats(d.stats ?? []); setUsername(d.profile?.username ?? "Kamu"); setAvatar(d.profile?.avatar_url ?? null);
      setLoading(false);
    });
  }, []);

  const badges = earnedDevBadges(stats);
  const ringColors = devBadgeRingColors(badges);

  if (loading) return (
    <div className="grid gap-3">
      <div className="skeleton h-10 w-48" />
      {[1, 2, 3].map((i) => <div key={i} className="skeleton h-28 w-full" />)}
    </div>
  );

  return (
    <div className="grid gap-6">
      <div>
        <h1 className="font-display text-3xl" style={{ color: DEV_THEMES.fullstack.main, textShadow: `0 0 20px ${DEV_THEMES.frontend.glow}` }}>{t("dev_title")}</h1>
        <p className="mt-1 max-w-2xl text-sm text-paper/60">{t("dev_subtitle")}</p>
      </div>

      {badges.length > 0 && (
        <Card className="border-line/60">
          <CardContent className="flex items-center gap-4 py-4">
            <Avatar name={username} src={avatar} size={56} rings={ringColors} />
            <div>
              <div className="text-sm text-paper/60">{t("dev_your_badges")}</div>
              <div className="mt-1 flex flex-wrap gap-2">
                {badges.map((b) => <span key={b.role} className="rounded-full px-2.5 py-1 text-xs font-semibold" style={{ background: b.theme.main + "22", color: b.theme.main, border: `1px solid ${b.theme.main}55` }}>{b.name}</span>)}
              </div>
            </div>
          </CardContent>
        </Card>
      )}

      <Card className="border-line/60">
        <CardContent className="py-4 text-sm text-paper/75 grid gap-1.5">
          <p>{t("dev_rule_scope")}</p>
          <p>{t("dev_rule_score", { n: DEV_BADGE_RULE.minQ, a: Math.round(DEV_BADGE_RULE.acc * 100) })}</p>
          <p>{t("dev_rule_stack")}</p>
        </CardContent>
      </Card>

      <div className="grid gap-4">
        {DEV_IDS.map((r, i) => {
          const th = DEV_THEMES[r], role = DEV_ROLES[r], def = DEV_TITLE_DEFS[r];
          const s = stats.find((x) => x.difficulty === r), n = s?.questions_answered ?? 0, c = s?.correct_answers ?? 0;
          const acc = n ? Math.round((c / n) * 100) : 0;
          const got = badges.some((b) => b.role === r);
          return (
            <motion.div key={r} initial={{ opacity: 0, y: 14 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: i * 0.06 }}>
              <div className="level-card" style={{ ["--c" as string]: th.main, ["--g" as string]: th.glow }}>
                <div className="grid grid-cols-[80px_1fr] items-center gap-4 sm:grid-cols-[96px_1fr_auto]">
                  <div className="flex h-20 w-20 items-center justify-center rounded-2xl text-4xl" style={{ background: th.main + "18", border: `2px solid ${th.main}`, boxShadow: `0 0 20px ${th.glow}` }}>{ICON[r]}</div>
                  <div className="min-w-0">
                    <div className="flex items-center gap-2">
                      <div className="text-2xl font-bold" style={{ color: th.main, textShadow: `0 0 18px ${th.glow}` }}>{role.label}</div>
                      {got && <span className="rounded-full px-2 py-0.5 text-[10px] font-bold" style={{ background: th.main, color: "#0b0e14" }}>MASTER ✓</span>}
                    </div>
                    <div className="mt-0.5 text-sm text-paper/60">{def.desc[lang]}</div>
                    <div className="mt-2 max-w-xs">
                      <div className="bar"><i style={{ width: `${Math.min(100, (n / DEV_BADGE_RULE.minQ) * 100)}%` }} /></div>
                      <p className="mt-1 text-[11px] text-paper/50">{def.name} · {n} {t("p_questions") ?? "soal"} · {acc}% {lang === "en" ? "accuracy" : "akurasi"}</p>
                    </div>
                    <div className="mt-3 flex flex-wrap gap-2">
                      <Link className="btn btn-primary text-xs sm:text-sm" href={`/play/${r}`}>{t("g_play")}</Link>
                      <Link className="btn text-xs sm:text-sm" href={`/play/${r}?mode=maraton`}>{t("g_marathon")}</Link>
                    </div>
                  </div>
                  <div className="col-span-2 flex items-baseline gap-4 font-mono text-sm sm:col-span-1 sm:block sm:text-right sm:space-y-1">
                    <div className="text-xl font-semibold" style={{ color: th.main }}>+{role.points} <span className="text-xs text-paper/50">{t("points")}</span></div>
                    <div className="text-xs" style={{ color: th.main }}>+{role.streak.bonus} {t("streak_bonus_short", { n: role.streak.min })}</div>
                    <div className="text-xs text-paper/60">{t("g_hint")} ∞</div>
                    <div className="text-xs text-paper/50">⏱ {Math.round(role.timeLimit / 60)} {t("minutes_short")}</div>
                  </div>
                </div>
              </div>
            </motion.div>
          );
        })}
      </div>
    </div>
  );
}
