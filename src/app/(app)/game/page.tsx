"use client";
import Link from "next/link";
import { useEffect, useState } from "react";
import { motion } from "framer-motion";
import { Zap, Calendar, BookOpen, Flame } from "lucide-react";
import { Card, CardContent } from "@/components/ui/card";
import TitleBadge from "@/components/TitleBadge";
import { TITLE_DEFS } from "@/lib/config";
import { LEVELS, LEVEL_IDS, THEMES } from "@/lib/config";
import { useT } from "@/lib/i18n";
import { useMe } from "@/lib/store";

export default function Game() {
  const t = useT();
  const [hints, setHints] = useState<Record<string, number>>({});
  const [streak, setStreak] = useState(0);
  const [dailyDone, setDailyDone] = useState(false);
  const [loading, setLoading] = useState(true);
  const [stats, setStats] = useState<any[]>([]);
  const [fav, setFav] = useState<string | null>(null);
  const [titles, setTitles] = useState<any[]>([]);

  useEffect(() => {
    useMe.getState().fetchMe().then((d: any) => {
      if (!d || d.error) { setLoading(false); return; }
      if (d.hints) setHints(d.hints);
      setStats(d.stats ?? []); setTitles(d.titles ?? []); setFav(d.profile?.favorite_language ?? null);
      if (d.meta) {
        setStreak(d.meta.streak ?? 0);
        setDailyDone(!!d.meta.dailyDone);
      }
      setLoading(false);
    });
  }, []);

  if (loading) return (
    <div className="grid gap-3">
      <div className="skeleton h-10 w-48" />
      {[1,2,3].map(i => <div key={i} className="skeleton h-28 w-full" />)}
    </div>
  );

  return (
    <div className="grid gap-6">
      <div className="flex flex-wrap items-end justify-between gap-3">
        <div>
          <h1 className="font-display text-3xl text-gold">{t("g_title")}</h1>
          <p className="text-sm text-paper/60 mt-1">{t("g_subtitle")}</p>
        </div>
        {streak > 0 && (
          <div className="streak-badge">
            <Flame size={14} /> {streak} {t("streak_days")}
          </div>
        )}
      </div>

      {/* Daily Challenge */}
      <motion.div initial={{ opacity: 0, y: 12 }} animate={{ opacity: 1, y: 0 }}>
        <Card className={`border-gold/30 bg-gradient-to-br from-panel to-[#2a1f3d] overflow-hidden relative ${dailyDone ? "opacity-70" : ""}`}>
          <CardContent className="grid sm:grid-cols-[1fr_auto] items-center gap-4 py-5">
            <div>
              <div className="flex items-center gap-2 text-gold mb-1">
                <Calendar size={18} />
                <span className="text-xs uppercase tracking-[0.15em] font-semibold">{t("daily_title")}</span>
              </div>
              <p className="text-sm text-paper/70">{t("daily_desc")}</p>
            </div>
            {dailyDone ? (
              <span className="rounded-full bg-mint/15 text-mint px-4 py-2 text-sm font-semibold">{t("daily_done")}</span>
            ) : (
              <Link href="/play/daily?mode=daily" className="btn btn-gold whitespace-nowrap">{t("daily_play")}</Link>
            )}
          </CardContent>
        </Card>
      </motion.div>

      {/* Levels */}
      <div className="grid gap-4">
        {LEVEL_IDS.map((l, i) => {
          const th = THEMES[l], st = stats.find((x) => x.difficulty === l), n = st?.questions_answered ?? 0;
          const leg = titles.find((x) => x.level === l)?.tier === "legendary", need = l === "hell" ? 150 : 150;
          return (
            <motion.div key={l} initial={{ opacity: 0, y: 14 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: i * 0.06 }}>
              <div className="level-card" style={{ ["--c" as string]: th.main, ["--g" as string]: th.glow }}>
                <div className="grid grid-cols-[130px_1fr] items-center gap-3 sm:grid-cols-[190px_1fr_auto] sm:gap-5">
                  <div className="-ml-2"><TitleBadge tier="legendary" level={l} tech={fav} size={190} label={TITLE_DEFS[l].legend} /></div>
                  <div className="min-w-0">
                    <div className="flex items-center gap-2">
                      <span className="h-2.5 w-2.5 rounded-full" style={{ background: th.main, boxShadow: `0 0 10px ${th.glow}` }} />
                      <div className="text-2xl font-bold" style={{ color: th.main, textShadow: `0 0 18px ${th.glow}` }}>{LEVELS[l].label}</div>
                    </div>
                    <div className="mt-0.5 text-sm text-paper/60">{t("b_" + l)}</div>
                    <div className="mt-2 max-w-xs"><div className="bar"><i style={{ width: `${Math.min(100, (n / need) * 100)}%` }} /></div>
                      <p className="mt-1 text-[11px] text-paper/50">{t("g_legend")}: {TITLE_DEFS[l].legend.split(" (")[0]} {leg ? "✓" : `· ${Math.min(n, need)}/${need}`}</p></div>
                    <div className="mt-3 flex flex-wrap gap-2">
                      <Link className="btn btn-primary text-xs sm:text-sm" href={`/play/${l}`}>{t("g_play")}</Link>
                      <Link className="btn text-xs sm:text-sm" href={`/play/${l}?mode=maraton`}>{t("g_marathon")}</Link>
                      <Link className="btn inline-flex items-center gap-1 text-xs sm:text-sm" href={`/play/${l}?mode=speedrun`}><Zap size={14} className="text-gold" />{t("g_speedrun")}</Link>
                    </div>
                  </div>
                  <div className="col-span-2 flex items-baseline gap-4 font-mono text-sm sm:col-span-1 sm:block sm:text-right sm:space-y-1">
                    <div className="text-xl font-semibold text-gold">+{LEVELS[l].points} <span className="text-xs text-paper/50">{t("points")}</span></div>
                    <div className="text-xs text-paper/60">{t("g_hint")} {hints[l] ?? LEVELS[l].hints}/{LEVELS[l].hints}</div>
                  </div>
                </div>
              </div>
            </motion.div>
          );
        })}
      </div>

      {/* God Mode CTA */}
      <Link href="/god" className="card flex items-center gap-3 border-fuchsia-500/30 hover:border-fuchsia-400/60 no-underline text-paper">
        <span className="text-2xl">🛡️</span>
        <div>
          <div className="font-semibold">{t("god_title")}</div>
          <div className="text-sm text-paper/60">{t("god_subtitle")}</div>
        </div>
      </Link>

      {/* Developer Mode CTA */}
      <Link href="/dev" className="card flex items-center gap-3 border-red-500/30 hover:border-red-400/60 no-underline text-paper">
        <span className="text-2xl">🧑‍💻</span>
        <div>
          <div className="font-semibold">{t("dev_title")}</div>
          <div className="text-sm text-paper/60">{t("dev_subtitle")}</div>
        </div>
      </Link>

      {/* Review wrong answers */}
      <Link href="/review" className="card flex items-center gap-3 hover:border-mint/50 no-underline text-paper">
        <BookOpen size={20} className="text-mint" />
        <div>
          <div className="font-semibold">{t("review_title")}</div>
          <div className="text-sm text-paper/60">{t("review_desc")}</div>
        </div>
      </Link>
    </div>
  );
}
