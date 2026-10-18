"use client";
import { useCallback, useEffect, useState } from "react";
import { supabase } from "@/lib/supabase";
import { currentTitle, RANK_GROUPS, rankLabel, rankTheme, anyTheme, earnedDevBadges, activeMaster, type Current, type DevBadge, type DevRole } from "@/lib/config";
import { useT } from "@/lib/i18n";
import { useUser } from "@/lib/store";
import Link from "next/link";
import TitleBadge from "@/components/TitleBadge";
import Avatar from "@/components/Avatar";
import { MasterCard, MasterPill } from "@/components/Master";
type Row = { id: string; username: string; pts: number; demo: boolean; fav: string | null; avatar: string | null; title: Current; devBadges: DevBadge[]; master: DevRole | null };

export default function Leaderboard() {
  const t = useT(), me = useUser((s) => s.user);
  const [tab, setTab] = useState("all"), [rows, setRows] = useState<Row[]>([]), [ready, setReady] = useState(false);
  const load = useCallback(async () => {
    // 1 panggilan RPC (leaderboard_rows) menggantikan 3 query; hanya kolom aman yang dikembalikan
    const { data, error } = await supabase.rpc("leaderboard_rows", { p_tab: tab, p_limit: 50 });
    if (error) { setReady(true); return; }
    setRows(((data ?? []) as any[]).map((r) => {
      const devBadges = earnedDevBadges(r.stats ?? []);
      return {
        id: r.id, pts: r.pts, username: r.username ?? "?", demo: !!r.demo, fav: r.fav ?? null, avatar: r.avatar ?? null,
        title: currentTitle(r.starter ?? "hello_world_graduate", r.stats ?? [], r.sel),
        devBadges, master: activeMaster(devBadges, r.msel),
      };
    }));
    setReady(true);
  }, [tab]);
  useEffect(() => {
    // Poll 45s (bukan realtime websocket) — ranking tetap dari poin global / per tingkat.
    // Pause otomatis saat tab browser disembunyikan → lebih hemat kuota.
    let cancelled = false;
    let id: ReturnType<typeof setInterval> | undefined;

    const tick = () => {
      if (!cancelled && typeof document !== "undefined" && document.visibilityState === "visible") {
        load();
      }
    };

    const start = () => {
      clearInterval(id);
      tick(); // langsung refresh saat buka tab / ganti filter tingkat
      id = setInterval(tick, 45_000);
    };

    const onVis = () => {
      if (document.visibilityState === "visible") start();
      else clearInterval(id);
    };

    start();
    document.addEventListener("visibilitychange", onVis);
    return () => {
      cancelled = true;
      clearInterval(id);
      document.removeEventListener("visibilitychange", onVis);
    };
  }, [load, tab]);

  const top = rows.slice(0, 3), rest = rows.slice(3);
  const order = [0, 1, 2].filter((i) => top[i]);
  const Name = ({ r }: { r: Row }) => <span className="inline-flex flex-wrap items-center gap-1.5"><Link href={`/u/${r.username}`} className="font-bold hover:underline">{r.username}</Link>{r.demo && <span className="chip chip-demo">{t("demo_tag")}</span>}{r.id === me?.id && <span className="chip border-mint text-mint">{t("lb_you")}</span>}</span>;
  return (
    <div className="grid gap-6">
      <div><h1 className="font-display text-3xl text-shine">{t("lb_title")}</h1><p className="mt-1 text-sm text-paper/60">{t("lb_live")}</p></div>
      <div className="grid gap-3">
        {RANK_GROUPS.map((g) => (
          <div key={g.key} className="flex flex-wrap items-center gap-2">
            {g.key !== "classic" && <span className="w-full text-[11px] font-semibold tracking-wide text-paper/50 sm:w-auto sm:min-w-[7.5rem]">{t("lb_grp_" + g.key)}</span>}
            {(g.key === "classic" ? ["all", ...g.ids] : g.ids).map((k) => {
              const th = k === "all" ? null : rankTheme(k), on = tab === k;
              return <button key={k} onClick={() => setTab(k)} aria-pressed={on} className={`btn ${on && !th ? "border-mint text-mint" : ""}`} style={on && th ? { borderColor: th.main, color: th.main, boxShadow: `0 0 18px -6px ${th.main}` } : undefined}>{k === "all" ? t("lb_global") : rankLabel(k)}</button>;
            })}
          </div>
        ))}
        <p className="text-[11px] text-paper/45">{t("lb_master_hint")}</p>
      </div>
      {ready && rows.length === 0 && <p className="text-paper/70">{t("lb_empty")}</p>}
      {top.length > 0 && (
        <div className="grid items-end gap-3 sm:grid-cols-3">
          {order.map((i) => {
            const r = top[i], th = anyTheme(r.title.level), first = i === 0;
            return (
              <MasterCard key={r.id} role={r.master} className={`title-card ${first && !r.master ? "podium-1" : ""} ${["sm:order-2", "sm:order-1", "sm:order-3"][i]}`} style={{ ["--c" as string]: first ? "#f5c451" : th.main, ["--g" as string]: first ? "#f5c451" : th.glow }}>
                <div className="relative text-3xl font-black" style={{ color: first ? "#f5c451" : i === 1 ? "#d1d5db" : "#d08a4b" }}>#{i + 1}</div>
                <TitleBadge tier={r.title.tier} level={r.title.level} tech={r.fav} size={first ? 220 : 170} label={r.title.name} />
                <div className="relative mt-1 flex items-center justify-center gap-2.5 text-lg"><Avatar src={r.avatar} name={r.username} size={first ? 52 : 44} master={r.master} /><Name r={r} /></div>
                {r.devBadges.length > 0 && <div className="relative mt-1 flex flex-wrap justify-center gap-1">{r.devBadges.map((b) => <MasterPill key={b.role} role={b.role} active={b.role === r.master} />)}</div>}
                <p className="relative text-xs" style={{ color: th.main }}>{r.title.name}</p>
                <p className="relative mt-1 font-mono text-xl text-gold">{r.pts} <span className="text-xs text-paper/50">{t("points")}</span></p>
              </MasterCard>
            );
          })}
        </div>
      )}
      <ol className="grid gap-2">
        {rest.map((r, i) => {
          const th = anyTheme(r.title.level);
          return (
            <li key={r.id} className={`grid grid-cols-[2rem_64px_1fr_auto] items-center gap-3 rounded-xl border px-3 py-1.5 ${r.master ? "mrow" : r.id === me?.id ? "border-gold bg-gold/10" : "border-line bg-panel/80"}`} style={r.master ? { ["--mc" as string]: r.master === "frontend" ? "#ff3b1f" : r.master === "backend" ? "#8c8ca3" : "#a62bff" } : undefined}>
              <span className="font-mono text-paper/60">{i + 4}</span>
              <TitleBadge tier={r.title.tier} level={r.title.level} tech={r.fav} size={64} label={r.title.name} still={r.title.tier !== "legendary"} />
              <div className="flex min-w-0 items-center gap-2.5"><Avatar src={r.avatar} name={r.username} size={38} master={r.master} /><div className="min-w-0"><div className="truncate"><Name r={r} /></div><div className="truncate text-xs" style={{ color: th.main }}>{r.title.name}</div>{r.devBadges.length > 0 && <div className="mt-0.5 flex flex-wrap gap-1">{r.devBadges.map((b) => <MasterPill key={b.role} role={b.role} active={b.role === r.master} className="text-[9px] px-1.5 py-0.5" />)}</div>}</div></div>
              <span className="font-mono text-gold">{r.pts}</span>
            </li>
          );
        })}
      </ol>
    </div>
  );
}
