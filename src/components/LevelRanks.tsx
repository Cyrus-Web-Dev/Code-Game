"use client";
import { RANK_GROUPS, rankLabel, rankTheme } from "@/lib/config";
import { useT } from "@/lib/i18n";

export type LevelRank = { rank: number; points: number; players: number };
/** Peringkat pemain per tingkat: Easy–Hell, God Mode (Demi God–Primordial God), dan Developer Mode (Frontend/Backend/Full Stack).
 *  Datanya dari `level_ranks` (RPC me_bundle / player_profile) yang sudah mencakup semua nilai `difficulty` di user_stats.
 *  Hanya pemain yang punya poin di tingkat itu yang dihitung. */
export default function LevelRanks({ ranks }: { ranks?: Record<string, LevelRank> | null }) {
  const t = useT();
  const labels = { classic: t("lr_group_classic"), god: t("lr_group_god"), dev: t("lr_group_dev") };
  return (
    <div className="grid gap-5">
      {RANK_GROUPS.map((g) => (
        <div key={g.key} className="grid gap-2">
          <h3 className="text-xs font-semibold tracking-wide text-paper/60">{labels[g.key]}</h3>
          <div className={`grid grid-cols-2 gap-2 sm:grid-cols-3 ${g.ids.length === 3 ? "" : g.ids.length === 4 ? "lg:grid-cols-4" : "lg:grid-cols-5"}`}>
            {g.ids.map((l) => {
              const r = ranks?.[l], th = rankTheme(l), top = !!r && r.rank <= 3;
              return (
                <div key={l} className="level-card !p-3 text-center" style={{ ["--c" as string]: th.main, ["--g" as string]: th.glow }}>
                  <p className="text-xs font-bold uppercase tracking-widest" style={{ color: th.main }}>{rankLabel(l)}</p>
                  {r ? (
                    <>
                      <p className="mt-1 font-mono text-3xl font-black" style={{ color: top ? "#f5c451" : "#ece6d8", textShadow: top ? "0 0 18px rgba(245,196,81,.5)" : "none" }}>#{r.rank}</p>
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
        </div>
      ))}
    </div>
  );
}
