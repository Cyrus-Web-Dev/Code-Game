"use client";
import { useEffect, useState } from "react";
import { Check, Lock, Star } from "lucide-react";
import TitleBadge from "@/components/TitleBadge";
import Avatar from "@/components/Avatar";
import { LEVEL_IDS, LEVELS, STARTERS, THEMES, DEV_THEMES, TITLE_DEFS, LEGEND_RULE, STD_RULE, answersNeeded, anyTheme, GOD_IDS, GOD_LEVELS, GOD_TITLE_DEFS, DEV_IDS, DEV_TITLE_DEFS, DEV_BADGE_RULE, MASTER_TEXT, earnedDevBadges, activeMaster, type Level, type AnyLevel, type DevRole } from "@/lib/config";
import { useLang, useT } from "@/lib/i18n";
import { useMe } from "@/lib/store";
import { api } from "@/lib/supabase";

type Card = { key: string; name: string; tier: "starter" | "standard" | "legendary"; level: AnyLevel; desc: string; state: "earned" | "locked" | "current" | "other"; need?: number; have?: number; req?: string; pick?: string; gap?: number };

export default function Titles() {
  const t = useT(), lang = useLang((s) => s.lang), [d, setD] = useState<any>(null);
  const [busy, setBusy] = useState(false), [msg, setMsg] = useState("");
  useEffect(() => { useMe.getState().fetchMe().then(setD); }, []);
  async function pick(key: string | null) {
    setBusy(true);
    const r: any = await api("/api/title", { key });
    if (r?.error) { setBusy(false); setMsg(t("err_" + r.error)); return; }
    useMe.getState().invalidate();
    setD(await useMe.getState().fetchMe({ force: true }));
    setBusy(false); setMsg(t("t_picked"));
  }
  async function pickMaster(key: string | null) {
    setBusy(true);
    const r: any = await api("/api/master", { key });
    if (r?.error) { setBusy(false); setMsg(t("err_" + r.error)); return; }
    useMe.getState().invalidate();
    setD(await useMe.getState().fetchMe({ force: true }));
    setBusy(false); setMsg(t("mf_picked"));
  }
  if (!d) return <div className="grid gap-4"><div className="skeleton h-24 w-full" /><div className="skeleton h-80 w-full" /></div>;
  if (d.error) return <p>{t("err_" + d.error)}</p>;
  const tech = d.profile.favorite_language as string | null;
  const stat = (l: string) => { const s = d.stats.find((x: any) => x.difficulty === l), n = s?.questions_answered ?? 0; return { n, c: s?.correct_answers ?? 0, a: n ? Math.round((s.correct_answers / n) * 100) : 0 }; };
  const got = (l: AnyLevel) => d.titles.find((x: any) => x.level === l);
  const owned = new Set<string>((d.owned ?? []).map((o: any) => o.key));
  const earnedBadges = earnedDevBadges(d.stats ?? []), activeFrame = activeMaster(earnedBadges, d.profile.selected_master);
  const cur = d.title, legCount = LEVEL_IDS.filter((l) => got(l)?.tier === "legendary").length;
  const starters: Card[] = (Object.entries(STARTERS) as [string, (typeof STARTERS)[string]][]).map(([k, v]) => ({ key: k, name: v.name, tier: "starter", level: "easy", desc: v.desc[lang], state: cur.key === "starter" && cur.name === v.name ? "current" : d.profile.starter_title === k ? "earned" : "other", pick: "starter" }));
  const byLevel = LEVEL_IDS.map((l): Card[] => {
    const g = got(l), { n, c, a } = stat(l), D = TITLE_DEFS[l];
    return [
      { key: l + "s", name: D.std, tier: "standard", level: l, desc: D.desc[lang], state: owned.has(l + ":std") ? (cur.key === l + ":std" ? "current" : "earned") : "locked", pick: l + ":std", need: 50, have: n, req: t("t_req_std", { n, a }), gap: answersNeeded(n, c, STD_RULE.minQ, STD_RULE.acc) },
      { key: l + "l", name: D.legend, tier: "legendary", level: l, desc: D.desc[lang], state: owned.has(l + ":legend") ? (cur.key === l + ":legend" ? "current" : "earned") : "locked", pick: l + ":legend", need: l === "hell" ? 5 : 150, have: l === "hell" ? legCount : n, req: l === "hell" ? t("t_req_sepuh", { k: legCount }) : t("t_req_leg", { n, a }), gap: answersNeeded(n, c, LEGEND_RULE.minQ, LEGEND_RULE.acc) },
    ];
  });
  // God Mode: gelar standar + legendaris per tingkat (sama rumus 50/150 soal), pakai nama mewah BUG_HUNTER dkk.
  const byGod = GOD_IDS.map((l): Card[] => {
    const { n, c, a } = stat(l), D = GOD_TITLE_DEFS[l];
    return [
      { key: l + "s", name: D.std, tier: "standard", level: l, desc: D.desc[lang], state: owned.has(l + ":std") ? (cur.key === l + ":std" ? "current" : "earned") : "locked", pick: l + ":std", need: 50, have: n, req: t("t_req_std", { n, a }), gap: answersNeeded(n, c, STD_RULE.minQ, STD_RULE.acc) },
      { key: l + "l", name: D.legend, tier: "legendary", level: l, desc: D.desc[lang], state: owned.has(l + ":legend") ? (cur.key === l + ":legend" ? "current" : "earned") : "locked", pick: l + ":legend", need: 150, have: n, req: t("t_req_leg", { n, a }), gap: answersNeeded(n, c, LEGEND_RULE.minQ, LEGEND_RULE.acc) },
    ];
  });
  const render = (c: Card) => {
    const th = anyTheme(c.level), pct = c.need ? Math.min(100, Math.round(((c.have ?? 0) / c.need) * 100)) : 0;
    return (
      <div key={c.key} className={`title-card ${c.state === "current" ? "is-current" : ""}`} style={{ ["--c" as string]: th.main, ["--g" as string]: th.glow }}>
        <TitleBadge tier={c.tier} level={c.level} tech={tech} size={230} label={c.name} />
        <p className="mt-1 text-[11px] uppercase tracking-[0.25em]" style={{ color: th.main }}>{t("tier_" + c.tier)}</p>
        <h3 className="mt-1 text-lg font-bold" style={{ textShadow: `0 0 20px ${th.glow}` }}>{c.name}</h3>
        <p className="mx-auto mt-1 max-w-xs text-sm text-paper/70">{c.desc}</p>
        <div className="mt-3 flex justify-center">
          {c.state === "locked" ? <span className="chip"><Lock size={12} />{t("t_locked")}</span>
            : c.state === "other" ? <span className="chip text-paper/60">{t("t_other")}</span>
            : c.state === "current" ? <span className="chip border-gold text-gold"><Star size={12} />{t("t_current")}</span>
            : <span className="chip border-mint/60 text-mint"><Check size={12} />{t("t_earned")}</span>}
        </div>
        {c.state === "earned" && c.pick && <div className="mt-3 flex justify-center"><button disabled={busy} onClick={() => pick(c.pick!)} className="btn btn-primary px-4 py-1.5 text-sm">{t("t_use")}</button></div>}
        {c.state === "locked" && c.req && (
          <div className="mx-auto mt-3 max-w-xs text-left">
            <div className="bar"><i style={{ width: `${pct}%` }} /></div>
            <p className="mt-1 text-xs text-paper/60">{c.req}</p>
            {c.key !== "hell:legend" && c.gap !== undefined && <p className="mt-1 text-xs text-gold/90">{c.gap > 0 ? t("t_gap", { n: c.gap }) : t("t_gap_ok")}</p>}
          </div>
        )}
        {c.state === "locked" && c.key === "hell:legend" && (
          <div className="mx-auto mt-3 max-w-sm rounded-lg bg-black/25 p-3 text-left">
            <p className="text-xs font-semibold text-gold">{t("t_chk_title")}</p>
            <ul className="mt-2 grid gap-1.5 text-xs">
              {LEVEL_IDS.map((lv) => {
                const { n, c: cc, a } = stat(lv), done = owned.has(lv + ":legend"), ok = n >= LEGEND_RULE.minQ && cc / Math.max(n, 1) >= LEGEND_RULE.acc;
                const gap = answersNeeded(n, cc, LEGEND_RULE.minQ, LEGEND_RULE.acc);
                const legendDone = lv === "hell" ? ok : done;
                return (
                  <li key={lv} className="flex items-start gap-2">
                    <span className="mt-0.5" style={{ color: legendDone ? "#6ee7c8" : THEMES[lv].main }}>{legendDone ? "✓" : "○"}</span>
                    <span><b style={{ color: THEMES[lv].main }}>{LEVELS[lv].label}</b> <span className="text-paper/70">{legendDone ? t("t_chk_done") : t("t_chk_row", { n: Math.min(n, 999), a })}</span>
                      {!legendDone && <span className="block text-gold/90">{gap > 0 ? t("t_gap", { n: gap }) : t("t_gap_ok")}</span>}</span>
                  </li>
                );
              })}
            </ul>
            <p className="mt-2 text-[11px] text-paper/50">{t("t_chk_hell")}</p>
          </div>
        )}
      </div>
    );
  };
  return (
    <div className="grid gap-10">
      <div className="rounded-2xl border border-gold/30 bg-gradient-to-br from-[#2a1d3d] to-panel p-5" style={{ ["--c" as string]: "#f5c451" }}>
        <h1 className="font-display text-3xl text-shine">{t("t_title")}</h1>
        <p className="mt-1 text-sm text-paper/70">{t("t_desc")}</p>
        <div className="mt-4 max-w-md"><div className="bar"><i style={{ width: `${(legCount / 5) * 100}%` }} /></div><p className="mt-1 text-xs text-gold">{t("t_sepuh_banner", { k: legCount })}</p></div>
        <p className="mt-2 text-xs text-paper/50">{t("t_hover")}</p>
        <p className="mt-2 text-xs text-paper/60">{t("t_pick_hint")}</p>
        <p className="mt-2 text-xs text-gold/90">{t("t_sepuh_how")}</p>
        <p className="mt-1 text-xs text-paper/60">{t("t_rule_leg")}</p>
        {d.profile.selected_title && <button disabled={busy} onClick={() => pick(null)} className="btn mt-3 px-3 py-1.5 text-xs">{t("t_auto")}</button>}
        {msg && <p role="status" className="mt-2 text-sm text-gold">{msg}</p>}
      </div>
      <section>
        <h2 className="mb-1 text-xl font-semibold text-paper">{t("mf_title")}</h2>
        <p className="mb-4 text-sm text-paper/60">{t("mf_desc")}</p>
        <div className="grid gap-4 sm:grid-cols-3">
          {DEV_IDS.map((r: DevRole) => {
            const st = stat(r), have = earnedBadges.some((b) => b.role === r), active = activeFrame === r, tc = MASTER_TEXT[r];
            const pct = Math.min(100, Math.round((st.n / DEV_BADGE_RULE.minQ) * 100));
            return (
              <div key={r} className={`level-card text-center ${active ? "ring-2 ring-gold" : ""} ${have ? "" : "opacity-80"}`} style={{ ["--c" as string]: tc, ["--g" as string]: DEV_THEMES[r].glow === "#000000" ? "#2a2338" : DEV_THEMES[r].glow }}>
                <div className="flex justify-center py-3"><Avatar src={d.profile.avatar_url} name={d.profile.username} size={76} master={r} /></div>
                <h3 className="text-base font-bold" style={{ color: tc }}>{DEV_TITLE_DEFS[r].name}</h3>
                <p className="mt-0.5 text-xs text-paper/70">{t("mf_" + r)}</p>
                <div className="mt-3 flex justify-center">
                  {!have ? <span className="chip"><Lock size={12} />{t("mf_locked")}</span>
                    : active ? <span className="chip border-gold text-gold"><Star size={12} />{t("mf_current")}</span>
                    : <button disabled={busy} onClick={() => pickMaster(r)} className="btn btn-primary px-4 py-1.5 text-sm">{t("mf_use")}</button>}
                </div>
                {!have && (
                  <div className="mx-auto mt-3 max-w-xs text-left">
                    <div className="bar"><i style={{ width: `${pct}%` }} /></div>
                    <p className="mt-1 text-xs text-paper/60">{t("mf_req", { n: Math.min(st.n, DEV_BADGE_RULE.minQ), a: st.a })}</p>
                  </div>
                )}
              </div>
            );
          })}
        </div>
        {earnedBadges.length > 0 && (
          <div className="mt-3 flex flex-wrap gap-2">
            {d.profile.selected_master !== null && d.profile.selected_master !== undefined && <button disabled={busy} onClick={() => pickMaster(null)} className="btn px-3 py-1.5 text-xs">{t("mf_auto")}</button>}
            {d.profile.selected_master !== "none" && <button disabled={busy} onClick={() => pickMaster("none")} className="btn px-3 py-1.5 text-xs">{t("mf_none")}</button>}
          </div>
        )}
      </section>
      <section><h2 className="mb-4 text-xl font-semibold text-mint">{t("t_starter")}</h2><div className="grid gap-4 sm:grid-cols-2">{starters.map(render)}</div></section>
      {LEVEL_IDS.map((l, i) => (
        <section key={l}>
          <h2 className="mb-4 flex items-center gap-3 text-xl font-semibold" style={{ color: THEMES[l].main }}>{LEVELS[l].label}<span className="h-px flex-1" style={{ background: `linear-gradient(90deg, ${THEMES[l].main}88, transparent)` }} /></h2>
          <div className="grid gap-4 sm:grid-cols-2">{byLevel[i].map(render)}</div>
        </section>
      ))}
      <section>
        <h2 className="mb-1 flex items-center gap-3 text-xl font-semibold" style={{ color: "#f5c451" }}>
          {t("god_title")}<span className="h-px flex-1" style={{ background: "linear-gradient(90deg, #8b2fd188, transparent)" }} />
        </h2>
        <p className="mb-4 text-sm text-paper/60">{t("god_subtitle")}</p>
        {GOD_IDS.map((l, i) => (
          <div key={l} className="mb-8">
            <h3 className="mb-3 flex items-center gap-3 text-lg font-semibold" style={{ color: anyTheme(l).main }}>{GOD_LEVELS[l].label}<span className="h-px flex-1" style={{ background: `linear-gradient(90deg, ${anyTheme(l).main}88, transparent)` }} /></h3>
            <div className="grid gap-4 sm:grid-cols-2">{byGod[i].map(render)}</div>
          </div>
        ))}
      </section>
    </div>
  );
}
