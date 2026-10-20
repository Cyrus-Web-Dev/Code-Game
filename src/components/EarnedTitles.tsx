"use client";
import { Check, Star } from "lucide-react";
import TitleBadge from "@/components/TitleBadge";
import { MasterPill } from "@/components/Master";
import { anyTheme, earnedDevBadges, ownedTitles, type AnyLevel, type Stat } from "@/lib/config";
import { useLang, useT } from "@/lib/i18n";

type Props = {
  stats: Stat[];
  /** Gelar yang sedang dipakai (dari API: title.level & title.tier) — diberi tanda ★. */
  current?: { level: AnyLevel; tier: string; name: string } | null;
  /** Bahasa/framework favorit; dipakai sebagai singkatan pada lencana. */
  tech?: string | null;
  className?: string;
};

/**
 * Semua gelar yang SUDAH diraih pemain (standar + legendaris di setiap tingkat, termasuk God Mode, plus gelar Master).
 * Dipakai di profil sendiri dan di profil pemain lain, sehingga pemain lain dapat melihat koleksi gelarnya.
 * Dihitung dari statistik (sumber yang sama dengan halaman Gelar), jadi tidak ada data tambahan yang bocor.
 */
export default function EarnedTitles({ stats, current, tech, className = "" }: Props) {
  const t = useT(), lang = useLang((s) => s.lang);
  const owned = ownedTitles(stats).sort((a, b) => (a.tier === b.tier ? 0 : a.tier === "legendary" ? -1 : 1));
  const masters = earnedDevBadges(stats);
  const total = owned.length + masters.length;
  return (
    <section className={`grid gap-3 ${className}`}>
      <div className="flex flex-wrap items-center gap-3">
        <h2 className="font-display text-xl text-gold">{t("ot_title")}</h2>
        <span className="chip border-gold/50 text-gold">{t("ot_count", { n: total })}</span>
      </div>
      {total === 0 && (
        <p className="text-sm text-paper/60">{current && current.tier === "starter" ? t("ot_none_starter", { name: current.name }) : t("ot_none")}</p>
      )}
      {masters.length > 0 && (
        <div>
          <p className="mb-2 text-xs uppercase tracking-[0.2em] text-paper/50">{t("ot_master")}</p>
          <div className="grid gap-2 sm:grid-cols-3">
            {masters.map((b) => (
              <div key={b.role} className="rounded-xl border p-3" style={{ borderColor: b.theme.main + "99", background: `radial-gradient(120% 120% at 0% 0%, ${b.theme.glow}88, rgba(24,21,38,.9) 70%)` }}>
                <MasterPill role={b.role} className="px-2.5 py-1 text-xs" />
                <p className="mt-2 text-xs text-paper/70">{b.desc[lang]}</p>
              </div>
            ))}
          </div>
        </div>
      )}
      {owned.length > 0 && (
        <div className="grid grid-cols-2 gap-3 sm:grid-cols-3 lg:grid-cols-4">
          {owned.map((o) => {
            const th = anyTheme(o.level), isCur = !!current && current.level === o.level && current.tier === o.tier;
            return (
              <div key={o.key} title={o.desc[lang]} className={`print-card rounded-xl border p-3 text-center ${o.tier === "legendary" ? "foil" : ""} ${isCur ? "ring-2 ring-gold" : ""}`}
                style={{ ["--fr" as string]: ".75rem", ["--c" as string]: th.main, ["--g" as string]: th.glow, borderColor: th.main + "77", background: `radial-gradient(120% 110% at 50% 0%, ${th.glow}44, rgba(24,21,38,.9) 70%)` }}>
                <TitleBadge tier={o.tier} level={o.level} tech={tech} size={120} label={o.name} still />
                <p className="mt-1 text-[10px] uppercase tracking-[0.2em]" style={{ color: th.main }}>{t("tier_" + o.tier)}</p>
                <p className={`mt-0.5 text-sm font-bold leading-snug ${o.tier === "legendary" ? "name-shine" : ""}`} style={{ color: th.main }}>{o.name}</p>
                <div className="mt-2 flex justify-center">
                  {isCur ? <span className="chip border-gold text-gold"><Star size={11} />{t("ot_using")}</span> : <span className="chip border-mint/50 text-mint"><Check size={11} />{t("t_earned")}</span>}
                </div>
              </div>
            );
          })}
        </div>
      )}
    </section>
  );
}
