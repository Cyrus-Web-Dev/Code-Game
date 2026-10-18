"use client";
import { useEffect, useMemo, useState } from "react";
import { Check, ChevronDown, Copy, ExternalLink } from "lucide-react";
import PublicShell from "@/components/PublicShell";
import CodeBlock from "@/components/CodeBlock";
import data from "@/data/languages.json";
import secData from "@/data/security-tools.json";
import { LEVELS, LEVEL_IDS, GOD_IDS, GOD_LEVELS, GOD_THEMES, type GodLevel } from "@/lib/config";
import { KINDS, type Kind } from "@/lib/learn";
import { useLang, useT } from "@/lib/i18n";

type Item = { name: string; year: number; level: string | null; note: string; noteEn?: string };
type Detail = { kind: Kind; run?: string; site?: string; ex?: string; hl?: string };
const ERAS: [number, number][] = [[0, 1969], [1970, 1979], [1980, 1989], [1990, 1999], [2000, 2009], [2010, 9999]];
type L2 = { id: string; en: string };
<<<<<<< HEAD
type Tool = { name: string; tier: GodLevel; cat: string; purpose: L2; use: L2; cmd: string; tip: L2; site: string };
=======
type Tool = { name: string; tier: GodLevel; cat: string; purpose: L2; use: L2; tip: L2; site: string };
>>>>>>> 139710653228b172a081280c0c37a037c1a953fb

export default function Info() {
  const t = useT(), lang = useLang((s) => s.lang), items = data as Item[];
  const [q, setQ] = useState(""), [f, setF] = useState("all"), [open, setOpen] = useState<Set<string>>(new Set());
  const [detail, setDetail] = useState<Record<string, Detail> | null>(null), [copied, setCopied] = useState("");
  const note = (i: Item) => (lang === "en" ? i.noteEn ?? i.note : i.note);
  const list = useMemo(() => items.filter((i) =>
    (f === "all" || (f === "extra" ? i.level === null : i.level === f)) && (i.name + " " + note(i)).toLowerCase().includes(q.toLowerCase())),
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [items, q, f, lang]);
  // Detail dimuat hanya saat ada kartu yang dibuka (berkas terpisah, tidak membebani halaman lain)
  useEffect(() => { if (open.size && !detail) import("@/data/languages-detail.json").then((m) => setDetail(m.default as unknown as Record<string, Detail>)); }, [open, detail]);
  const toggle = (n: string) => setOpen((s) => { const x = new Set(s); x.has(n) ? x.delete(n) : x.add(n); return x; });
  const copy = (name: string, text: string) => { navigator.clipboard?.writeText(text).then(() => { setCopied(name); setTimeout(() => setCopied(""), 1500); }).catch(() => {}); };

  // ── Tools Keamanan (God Mode): ensiklopedia tools pentest/security nyata — fungsi, cara pakai, tips. ──
  const tools = secData as Tool[];
  const [sq, setSq] = useState(""), [sf, setSf] = useState<"all" | GodLevel>("all"), [sopen, setSopen] = useState<Set<string>>(new Set());
  const stoggle = (n: string) => setSopen((s) => { const x = new Set(s); x.has(n) ? x.delete(n) : x.add(n); return x; });
  const sList = useMemo(() => tools.filter((i) =>
    (sf === "all" || i.tier === sf) && (i.name + " " + i.cat + " " + i.purpose[lang]).toLowerCase().includes(sq.toLowerCase())),
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [tools, sq, sf, lang]);

  return (
    <PublicShell wide>
      <div className="grid gap-6">
        <div><h1 className="font-display text-3xl text-gold">{t("i_title")}</h1><p className="mt-2 max-w-2xl text-paper/70">{t("i_sub", { n: items.length, g: items.filter((i) => i.level).length })}</p><p className="mt-1 text-sm text-mint/80">{t("i_click_hint")}</p></div>
        <div className="flex flex-wrap gap-2">
          <input className="input max-w-xs" placeholder={t("i_search")} value={q} onChange={(e) => setQ(e.target.value)} />
          {["all", ...LEVEL_IDS, "extra"].map((k) => <button key={k} onClick={() => setF(k)} className={`btn ${f === k ? "border-mint text-mint" : ""}`}>{k === "all" ? t("i_all") : k === "extra" ? t("i_extra") : LEVELS[k as keyof typeof LEVELS].label}</button>)}
        </div>
        {list.length === 0 && <p className="text-paper/70">{t("i_none")}</p>}
        {ERAS.map(([a, b], idx) => {
          const rows = list.filter((i) => i.year >= a && i.year <= b);
          if (!rows.length) return null;
          return (
            <section key={a}>
              <h2 className="mb-3 border-b border-line pb-1 text-xl font-semibold text-mint">{t("era" + idx)}</h2>
              <dl className="grid gap-2 sm:grid-cols-2">
                {rows.map((i) => {
                  const isOpen = open.has(i.name), d = detail?.[i.name], K = d ? KINDS[d.kind] : null;
                  return (
                    <div key={i.name} className={`rounded-md border bg-panel/80 transition ${isOpen ? "border-mint/60 sm:col-span-2" : "border-line hover:border-gold/50"}`}>
                      <button type="button" aria-expanded={isOpen} onClick={() => toggle(i.name)} className="w-full p-3 text-left focus-visible:outline focus-visible:outline-2 focus-visible:outline-mint">
                        <dt className="flex items-baseline gap-2 font-mono font-semibold text-gold">{i.name}<span className="text-xs font-normal text-paper/60">{i.year}</span>{i.level && <span className="ml-auto text-xs font-normal text-mint">{LEVELS[i.level as keyof typeof LEVELS].label}</span>}<ChevronDown size={14} className={`${i.level ? "" : "ml-auto"} shrink-0 self-center text-paper/50 transition ${isOpen ? "rotate-180" : ""}`} /></dt>
                        <dd className="text-sm text-paper/80">{note(i)}</dd>
                      </button>
                      {isOpen && (
                        <div className="grid gap-4 border-t border-line/70 p-3 animate-in fade-in duration-300">
                          {!d && <p className="text-sm text-paper/60">{t("i_loading")}</p>}
                          {d && K && (<>
                            <p className="text-sm"><span className="text-paper/50">{t("i_kind")}: </span><b className="text-mint">{K.label[lang]}</b></p>
                            {d.ex && <div><h3 className="mb-1 text-sm font-semibold text-gold">{t("i_example")}</h3><CodeBlock code={d.ex} lang={d.hl} /></div>}
                            <div>
                              <h3 className="mb-1 text-sm font-semibold text-gold">{t("i_run")}</h3>
                              {d.run ? (
                                <div className="flex items-start gap-2 rounded-md bg-black/40 p-2 font-mono text-xs">
                                  <code className="min-w-0 flex-1 whitespace-pre-wrap break-words">{d.run}</code>
                                  <button type="button" onClick={() => copy(i.name, d.run!)} className="btn inline-flex shrink-0 items-center gap-1 px-2 py-1 text-[11px]" aria-label={t("i_copy")}>{copied === i.name ? <><Check size={12} />{t("i_copied")}</> : <><Copy size={12} />{t("i_copy")}</>}</button>
                                </div>
                              ) : <p className="text-sm text-paper/70">{t("i_run_none")}</p>}
                            </div>
                            <div>
                              <h3 className="mb-1 text-sm font-semibold text-gold">{t("i_learn")}</h3>
                              <ol className="grid list-decimal gap-1 pl-5 text-sm text-paper/85">{K.steps[lang].map((st, k) => <li key={k}>{st}</li>)}</ol>
                              <div className="mt-3 flex flex-wrap items-center gap-x-5 gap-y-1 text-sm">
                                {d.site && <a href={`https://${d.site}`} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1 text-mint underline">{t("i_site")}: {d.site.split("/")[0]}<ExternalLink size={12} /></a>}
                                <span className="text-paper/60">{t("i_tip")}: <i className="text-paper/80">&quot;{i.name} {lang === "id" ? "tutorial pemula" : "beginner tutorial"}&quot;</i></span>
                              </div>
                            </div>
                          </>)}
                        </div>
                      )}
                    </div>
                  );
                })}
              </dl>
            </section>
          );
        })}

        {/* ════ Tools Keamanan (God Mode) ════ */}
        <div className="mt-4 border-t border-line pt-6">
          <h1 className="font-display text-3xl" style={{ color: GOD_THEMES.primordial_god.main, textShadow: `0 0 20px ${GOD_THEMES.god.glow}` }}>{t("i_sec_title")}</h1>
          <p className="mt-2 max-w-2xl text-paper/70">{t("i_sec_sub", { n: tools.length })}</p>
        </div>
        <div className="flex flex-wrap gap-2">
          <input className="input max-w-xs" placeholder={t("i_search")} value={sq} onChange={(e) => setSq(e.target.value)} />
          <button onClick={() => setSf("all")} className={`btn ${sf === "all" ? "border-mint text-mint" : ""}`}>{t("i_all")}</button>
          {GOD_IDS.map((k) => (
            <button key={k} onClick={() => setSf(k)} className={`btn ${sf === k ? "" : ""}`} style={sf === k ? { borderColor: GOD_THEMES[k].main, color: GOD_THEMES[k].main } : undefined}>{GOD_LEVELS[k].label}</button>
          ))}
        </div>
        {sList.length === 0 && <p className="text-paper/70">{t("i_none")}</p>}
        {GOD_IDS.map((tier) => {
          const rows = sList.filter((x) => x.tier === tier);
          if (!rows.length) return null;
          const th = GOD_THEMES[tier];
          return (
            <section key={tier}>
              <h2 className="mb-3 border-b border-line pb-1 text-xl font-semibold" style={{ color: th.main }}>{GOD_LEVELS[tier].label}</h2>
              <dl className="grid gap-2 sm:grid-cols-2">
                {rows.map((i) => {
                  const isOpen = sopen.has(i.name);
                  return (
                    <div key={i.name} className={`rounded-md border bg-panel/80 transition ${isOpen ? "sm:col-span-2" : "border-line hover:border-gold/50"}`} style={isOpen ? { borderColor: th.main } : undefined}>
                      <button type="button" aria-expanded={isOpen} onClick={() => stoggle(i.name)} className="w-full p-3 text-left focus-visible:outline focus-visible:outline-2 focus-visible:outline-mint">
                        <dt className="flex items-baseline gap-2 font-mono font-semibold" style={{ color: th.main }}>{i.name}<span className="text-xs font-normal text-paper/60">{i.cat}</span><ChevronDown size={14} className={`ml-auto shrink-0 self-center text-paper/50 transition ${isOpen ? "rotate-180" : ""}`} /></dt>
                        <dd className="text-sm text-paper/80">{i.purpose[lang]}</dd>
                      </button>
                      {isOpen && (
                        <div className="grid gap-3 border-t border-line/70 p-3 animate-in fade-in duration-300">
                          <div><h3 className="mb-1 text-sm font-semibold" style={{ color: th.main }}>{t("i_sec_use")}</h3><p className="text-sm text-paper/85">{i.use[lang]}</p></div>
<<<<<<< HEAD
                          <div><h3 className="mb-1 text-sm font-semibold text-gold">{t("i_sec_example")}</h3><CodeBlock code={i.cmd} lang="bash" /></div>
=======
>>>>>>> 139710653228b172a081280c0c37a037c1a953fb
                          <div><h3 className="mb-1 text-sm font-semibold text-gold">{t("i_sec_tip")}</h3><p className="text-sm text-paper/85">{i.tip[lang]}</p></div>
                          <a href={`https://${i.site.replace(/^https?:\/\//, "")}`} target="_blank" rel="noopener noreferrer" className="inline-flex w-fit items-center gap-1 text-sm text-mint underline">{t("i_site")}: {i.site.replace(/^https?:\/\//, "")}<ExternalLink size={12} /></a>
                        </div>
                      )}
                    </div>
                  );
                })}
              </dl>
            </section>
          );
        })}
      </div>
    </PublicShell>
  );
}
