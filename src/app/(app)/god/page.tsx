"use client";
import Link from "next/link";
import { useEffect, useState } from "react";
import { motion } from "framer-motion";
import { Card, CardContent } from "@/components/ui/card";
import TitleBadge from "@/components/TitleBadge";
import { GOD_IDS, GOD_LEVELS, GOD_THEMES, GOD_TITLE_DEFS } from "@/lib/config";
import { useT, useLang } from "@/lib/i18n";
import { useMe } from "@/lib/store";

export default function GodMode() {
  const t = useT(), lang = useLang((s) => s.lang);
  const [loading, setLoading] = useState(true);
  const [stats, setStats] = useState<any[]>([]);
  const [fav, setFav] = useState<string | null>(null);
  const [titles, setTitles] = useState<any[]>([]);

  useEffect(() => {
    useMe.getState().fetchMe().then((d: any) => {
      if (!d || d.error) { setLoading(false); return; }
      setStats(d.stats ?? []); setTitles(d.titles ?? []); setFav(d.profile?.favorite_language ?? null);
      setLoading(false);
    });
  }, []);

  if (loading) return (
    <div className="grid gap-3">
      <div className="skeleton h-10 w-48" />
      {[1, 2, 3, 4].map((i) => <div key={i} className="skeleton h-28 w-full" />)}
    </div>
  );

  return (
    <div className="grid gap-6">
      <div>
        <h1 className="font-display text-3xl" style={{ color: GOD_THEMES.primordial_god.main, textShadow: `0 0 20px ${GOD_THEMES.god.glow}` }}>{t("god_title")}</h1>
        <p className="mt-1 max-w-2xl text-sm text-paper/60">{t("god_subtitle")}</p>
      </div>

      <Card className="border-gold/30 bg-gradient-to-br from-panel to-[#1a0b2e]">
        <CardContent className="py-4 text-sm text-paper/75 grid gap-1.5">
          <p>{t("god_rule_time")}</p>
          <p>{t("god_rule_hint")}</p>
          <p>{t("god_rule_modes")}</p>
        </CardContent>
      </Card>

      <div className="grid gap-4">
        {GOD_IDS.map((l, i) => {
          const th = GOD_THEMES[l], g = GOD_LEVELS[l];
          const st = stats.find((x) => x.difficulty === l), n = st?.questions_answered ?? 0;
          const leg = titles.find((x) => x.level === l)?.tier === "legendary", need = 150;
          return (
            <motion.div key={l} initial={{ opacity: 0, y: 14 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: i * 0.06 }}>
              <div className="level-card" style={{ ["--c" as string]: th.main, ["--g" as string]: th.glow }}>
                <div className="grid grid-cols-[130px_1fr] items-center gap-3 sm:grid-cols-[190px_1fr_auto] sm:gap-5">
                  <div className="-ml-2"><TitleBadge tier="legendary" level={l} tech={fav} size={190} label={GOD_TITLE_DEFS[l].legend} /></div>
                  <div className="min-w-0">
                    <div className="flex items-center gap-2">
                      <span className="h-2.5 w-2.5 rounded-full" style={{ background: th.main, boxShadow: `0 0 10px ${th.glow}` }} />
                      <div className="text-2xl font-bold" style={{ color: th.main, textShadow: `0 0 18px ${th.glow}` }}>{g.label}</div>
                    </div>
                    <div className="mt-0.5 text-sm text-paper/60">{GOD_TITLE_DEFS[l].desc[lang]}</div>
                    <div className="mt-2 max-w-xs"><div className="bar"><i style={{ width: `${Math.min(100, (n / need) * 100)}%` }} /></div>
                      <p className="mt-1 text-[11px] text-paper/50">{t("g_legend")}: {GOD_TITLE_DEFS[l].legend} {leg ? "✓" : `· ${Math.min(n, need)}/${need}`}</p></div>
                    <div className="mt-3 flex flex-wrap gap-2">
                      <Link className="btn btn-primary text-xs sm:text-sm" href={`/play/${l}`}>{t("g_play")}</Link>
                      <Link className="btn text-xs sm:text-sm" href={`/play/${l}?mode=maraton`}>{t("g_marathon")}</Link>
                    </div>
                  </div>
                  <div className="col-span-2 flex items-baseline gap-4 font-mono text-sm sm:col-span-1 sm:block sm:text-right sm:space-y-1">
                    <div className="text-xl font-semibold" style={{ color: th.main }}>+{g.points} <span className="text-xs text-paper/50">{t("points")}</span></div>
                    <div className="text-xs text-gold/90">+{g.streak.bonus} {t("streak_bonus_short", { n: g.streak.min })}</div>
                    <div className="text-xs text-paper/60">{t("g_hint")} ∞</div>
                    <div className="text-xs text-paper/50">⏱ {Math.round(g.timeLimit / 60) >= 1 ? `${Math.round(g.timeLimit / 60)} ${t("minutes_short")}` : `${g.timeLimit}s`}</div>
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
