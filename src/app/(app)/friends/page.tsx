"use client";
import { useCallback, useEffect, useState } from "react";
import Link from "next/link";
import { UserPlus, Check, X, Search, UserMinus, Clock } from "lucide-react";
import Avatar from "@/components/Avatar";
import TitleBadge from "@/components/TitleBadge";
import { currentTitle, LEVELS, anyTheme } from "@/lib/config";
import { useT } from "@/lib/i18n";
import { agoText } from "@/lib/time";
import { api } from "@/lib/supabase";
import { usePresence } from "@/lib/store";

type Friend = { id: string; username: string; avatar: string | null; fav: string | null; starter: string; sel?: string | null; demo: boolean; pts: number; online: boolean; seen_ago: number | null; playing: string | null; stats: any[] };
type Req = { request_id: number; id: string; username: string; avatar: string | null };
type Found = { id: string; username: string; avatar: string | null; pts: number; relation: "none" | "friends" | "pending_out" | "pending_in" };
type Tab = "list" | "req" | "add";

export default function Friends() {
  const t = useT();
  const [tab, setTab] = useState<Tab>("list");
  const [data, setData] = useState<{ friends: Friend[]; incoming: Req[]; outgoing: Req[] } | null>(null);
  const [q, setQ] = useState(""), [found, setFound] = useState<Found[] | null>(null), [msg, setMsg] = useState(""), [busy, setBusy] = useState(false);

  const load = useCallback(async () => {
    const d: any = await api("/api/friends");
    if (d?.friends) { setData(d); usePresence.getState().setPending(d.incoming.length); }
  }, []);
  useEffect(() => { // polling 30 dtk, berhenti saat tab disembunyikan (hemat kuota)
    let id: ReturnType<typeof setInterval> | undefined;
    const tick = () => { if (document.visibilityState === "visible") load(); };
    const start = () => { clearInterval(id); tick(); id = setInterval(tick, 30_000); };
    const onVis = () => { if (document.visibilityState === "visible") start(); else clearInterval(id); };
    start(); document.addEventListener("visibilitychange", onVis);
    return () => { clearInterval(id); document.removeEventListener("visibilitychange", onVis); };
  }, [load]);

  async function act(body: Record<string, unknown>) {
    setBusy(true);
    const d: any = await api("/api/friends", body);
    setBusy(false);
    setMsg(d?.error ? t("err_" + d.error) : t("fr_r_" + d.result));
    await load();
    if (found && body.action === "request") search(); // segarkan status tombol di hasil pencarian
  }
  async function search(e?: React.FormEvent) {
    e?.preventDefault();
    const d: any = await api(`/api/users/search?q=${encodeURIComponent(q.trim())}`);
    if (d?.error) { setMsg(t("err_" + d.error)); return; }
    setFound(d.results ?? []);
  }
  const status = (f: Friend) => f.playing ? { text: t("fr_playing", { lvl: LEVELS[f.playing as keyof typeof LEVELS]?.label ?? f.playing }), cls: "text-gold" }
    : f.online ? { text: t("fr_online"), cls: "text-mint" }
    : { text: f.seen_ago == null ? t("fr_offline_never") : t("fr_offline", { ago: agoText(f.seen_ago, t) }), cls: "text-paper/50" };
  const tabs: [Tab, string, number?][] = [["list", t("fr_tab_list"), data?.friends.length], ["req", t("fr_tab_req"), data?.incoming.length], ["add", t("fr_tab_add")]];

  return (
    <div className="grid gap-5">
      <div><h1 className="font-display text-3xl text-shine">{t("fr_title")}</h1><p className="mt-1 text-sm text-paper/60">{t("fr_live")}</p></div>
      <div className="flex flex-wrap gap-2">
        {tabs.map(([k, label, n]) => (
          <button key={k} onClick={() => { setTab(k); setMsg(""); }} className={`btn inline-flex items-center gap-2 ${tab === k ? "border-mint text-mint" : ""}`}>
            {label}{n ? <span className={`rounded-full px-1.5 text-[10px] font-bold ${k === "req" ? "bg-hot text-ink" : "bg-white/10"}`}>{n}</span> : null}
          </button>
        ))}
      </div>
      {msg && <p role="status" className="text-sm text-gold">{msg}</p>}

      {tab === "list" && (
        <section className="grid gap-3">
          {!data && <><div className="skeleton h-24 w-full" /><div className="skeleton h-24 w-full" /></>}
          {data && <p className="text-xs text-paper/50">{t("fr_count", { n: data.friends.length })}</p>}
          {data && data.friends.length === 0 && <p className="text-paper/70">{t("fr_empty")}</p>}
          {data?.friends.map((f) => {
            const ti = currentTitle(f.starter, f.stats, f.sel), th = anyTheme(ti.level), st = status(f);
            return (
              <div key={f.id} className="level-card" style={{ ["--c" as string]: th.main, ["--g" as string]: th.glow }}>
                <div className="flex items-center gap-3">
                  <Avatar src={f.avatar} name={f.username} size={56} online={f.online || !!f.playing} />
                  <div className="min-w-0 flex-1">
                    <div className="flex flex-wrap items-center gap-2"><Link href={`/u/${f.username}`} className="truncate text-lg font-bold hover:underline">{f.username}</Link>{f.demo && <span className="chip chip-demo">{t("demo_tag")}</span>}</div>
                    <div className="truncate text-xs font-semibold" style={{ color: th.main }}>{ti.name}</div>
                    <div className={`text-xs ${st.cls}`}>{st.text}</div>
                  </div>
                  <div className="hidden sm:block"><TitleBadge tier={ti.tier} level={ti.level} tech={f.fav} size={84} label={ti.name} still={ti.tier !== "legendary"} /></div>
                  <div className="flex flex-col gap-1.5">
                    <Link href={`/u/${f.username}`} className="btn px-2.5 py-1 text-center text-xs">{t("fr_view")}</Link>
                    <button disabled={busy} onClick={() => confirm(t("fr_remove_ask", { name: f.username })) && act({ action: "remove", userId: f.id })} className="btn inline-flex items-center justify-center gap-1 px-2.5 py-1 text-xs hover:border-hot"><UserMinus size={12} />{t("fr_remove")}</button>
                  </div>
                </div>
              </div>
            );
          })}
        </section>
      )}

      {tab === "req" && (
        <section className="grid gap-4">
          <h2 className="text-lg font-semibold text-mint">{t("fr_incoming")}</h2>
          {data?.incoming.length === 0 && <p className="text-sm text-paper/60">{t("fr_no_req")}</p>}
          {data?.incoming.map((r) => (
            <div key={r.request_id} className="flex items-center gap-3 rounded-xl border border-line bg-panel/80 p-3">
              <Avatar src={r.avatar} name={r.username} size={48} />
              <Link href={`/u/${r.username}`} className="min-w-0 flex-1 truncate font-bold hover:underline">{r.username}</Link>
              <button disabled={busy} onClick={() => act({ action: "respond", requestId: r.request_id, accept: true })} className="btn btn-primary inline-flex items-center gap-1 px-3 py-1.5 text-xs"><Check size={14} />{t("fr_accept")}</button>
              <button disabled={busy} onClick={() => act({ action: "respond", requestId: r.request_id, accept: false })} className="btn inline-flex items-center gap-1 px-3 py-1.5 text-xs hover:border-hot"><X size={14} />{t("fr_decline")}</button>
            </div>
          ))}
          <h2 className="mt-2 text-lg font-semibold text-mint">{t("fr_outgoing")}</h2>
          {data?.outgoing.length === 0 && <p className="text-sm text-paper/60">{t("fr_no_req")}</p>}
          {data?.outgoing.map((r) => (
            <div key={r.request_id} className="flex items-center gap-3 rounded-xl border border-line bg-panel/80 p-3">
              <Avatar src={r.avatar} name={r.username} size={48} />
              <Link href={`/u/${r.username}`} className="min-w-0 flex-1 truncate font-bold hover:underline">{r.username}</Link>
              <span className="chip"><Clock size={12} />{t("fr_pending")}</span>
              <button disabled={busy} onClick={() => act({ action: "remove", userId: r.id })} className="btn px-3 py-1.5 text-xs hover:border-hot">{t("fr_cancel")}</button>
            </div>
          ))}
        </section>
      )}

      {tab === "add" && (
        <section className="grid gap-4">
          <form onSubmit={search} className="flex gap-2">
            <input className="input" value={q} onChange={(e) => setQ(e.target.value)} placeholder={t("fr_search_ph")} maxLength={30} aria-label={t("fr_search")} />
            <button className="btn btn-primary inline-flex items-center gap-1" disabled={q.trim().length < 2}><Search size={16} />{t("fr_search")}</button>
          </form>
          {found && found.length === 0 && <p className="text-paper/70">{t("fr_no_results")}</p>}
          {found?.map((r) => (
            <div key={r.id} className="flex items-center gap-3 rounded-xl border border-line bg-panel/80 p-3">
              <Avatar src={r.avatar} name={r.username} size={48} />
              <div className="min-w-0 flex-1"><Link href={`/u/${r.username}`} className="truncate font-bold hover:underline">{r.username}</Link><p className="font-mono text-xs text-gold">{r.pts} {t("points")}</p></div>
              {r.relation === "none" && <button disabled={busy} onClick={() => act({ action: "request", username: r.username })} className="btn btn-primary inline-flex items-center gap-1 px-3 py-1.5 text-xs"><UserPlus size={14} />{t("fr_add")}</button>}
              {r.relation === "pending_out" && <span className="chip"><Clock size={12} />{t("fr_pending")}</span>}
              {r.relation === "pending_in" && <button disabled={busy} onClick={() => act({ action: "request", username: r.username })} className="btn btn-primary inline-flex items-center gap-1 px-3 py-1.5 text-xs"><Check size={14} />{t("fr_accept")}</button>}
              {r.relation === "friends" && <span className="chip border-mint/60 text-mint"><Check size={12} />{t("fr_is_friend")}</span>}
            </div>
          ))}
        </section>
      )}
    </div>
  );
}
