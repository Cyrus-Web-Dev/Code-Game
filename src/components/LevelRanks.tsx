"use client";
import { LEVEL_IDS, LEVELS, THEMES } from "@/lib/config";
import { useT } from "@/lib/i18n";

export type LevelRank = { rank: number; points: number; players: number };
/** Peringkat pemain di tiap tingkat (Easy sampai Hell). Dibaca dari poin per tingkat; hanya pemain yang punya poin dihitung. */
export default function LevelRanks({ ranks }: { ranks?: Record<string, LevelRank> | null }) {
  const t = useT();
  return (
    <div className="grid grid-cols-2 gap-2 sm:grid-cols-3 lg:grid-cols-5">
      {LEVEL_IDS.map((l) => {
        const r = ranks?.[l], th = THEMES[l];
        return (
          <div key={l} className="level-card !p-3 text-center" style={{ ["--c" as string]: th.main, ["--g" as string]: th.glow }}>
            <p className="text-xs font-bold uppercase tracking-widest" style={{ color: th.main }}>{LEVELS[l].label}</p>
            {r ? (
              <>
                <p className="mt-1 font-mono text-3xl font-black" style={{ color: r.rank <= 3 ? "#f5c451" : "#ece6d8", textShadow: r.rank <= 3 ? "0 0 18px rgba(245,196,81,.5)" : "none" }}>#{r.rank}</p>
                <p className="text-[11px] text-paper/60">{t("lr_of", { n: r.players })}</p>
                <p className="mt-1 font-mono text-xs text-gold">{r.points} {t("points")}</p>
              </>
            ) : (
              <p className="mt-3 text-xs text-paper/40">{t("lr_none")}</p>
            )}
          </div>
        );
      })}
    </div>
  );
}
