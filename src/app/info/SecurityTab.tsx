"use client";
import { useEffect, useMemo, useState } from "react";
import { ChevronDown, ExternalLink, ShieldAlert } from "lucide-react";
import CodeBlock from "@/components/CodeBlock";
import legacyData from "@/data/security-tools.json";
import { GOD_LEVELS, GOD_THEMES, type GodLevel } from "@/lib/config";
import { useLang, useT } from "@/lib/i18n";

type L2 = { id: string; en: string };
type Tool = { name: string; group: string; cat: string; purpose: L2; goal?: L2; use: L2; cmd: string; tip: L2; site: string; tier?: GodLevel };
type Extra = { legacy: Record<string, string>; groups: Record<string, L2>; tools: Tool[] };

const COLOR: Record<string, string> = { defense: "#22e58a", appsec: "#3da5ff", crypto: "#f5c451", network: "#38d6d6", forensic: "#c084fc", cloud: "#8ab4ff", offense: "#ff5a3d", concept: "#9ca3af", debug: "#ff9ec4" };
const ORDER = ["defense", "appsec", "crypto", "network", "forensic", "cloud", "concept", "debug", "offense"];
// Tahap siklus hidup perangkat lunak → kelompok tools yang relevan (peta cepat "kapan dipakai")
const STAGES: { k: string; id: string; en: string; g: string[] }[] = [
  { k: "code", id: "Menulis kode", en: "Write code", g: ["appsec", "debug"] },
  { k: "build", id: "Build & rilis", en: "Build & release", g: ["appsec", "crypto"] },
  { k: "deploy", id: "Deploy", en: "Deploy", g: ["network", "cloud", "crypto"] },
  { k: "run", id: "Berjalan di produksi", en: "Run in production", g: ["defense", "network"] },
  { k: "respond", id: "Respons insiden", en: "Incident response", g: ["forensic", "defense"] },
];
const TX = {
  title: { id: "Tools Keamanan", en: "Security Tools" },
  sub: { id: "Ensiklopedia {n} tools, standar, dan konsep keamanan: apa fungsinya, kapan dipakai, cara pemakaian, contoh perintah, dan tips. Dari pertahanan sampai pentest.", en: "An encyclopedia of {n} security tools, standards, and concepts: what each does, when to use it, how to use it, sample commands, and tips. From defense to pentesting." },
  warnT: { id: "Gunakan secara etis & legal", en: "Use ethically & legally" },
  warn: { id: "Pindai atau uji HANYA sistem milik sendiri atau yang Anda punya izin tertulis untuk menguji. Mengakses sistem tanpa izin dapat melanggar hukum (di Indonesia, mis. UU ITE). Contoh perintah memakai alamat fiktif (contoh.id / staging.contoh.id).", en: "Scan or test ONLY systems you own or have written permission to test. Accessing systems without permission can be illegal. Example commands use fictional addresses (contoh.id / staging.contoh.id)." },
  stage: { id: "Tools apa dipakai di tahap mana?", en: "Which tools fit which stage?" },
  fn: { id: "Fungsi", en: "What it does" }, goal: { id: "Tujuan penggunaan", en: "Why / when to use it" }, how: { id: "Cara pemakaian", en: "How to use it" },
  ex: { id: "Contoh perintah", en: "Example command" }, tip: { id: "Tips & catatan", en: "Tips & notes" }, site: { id: "Situs resmi", en: "Official site" },
  all: { id: "Semua", en: "All" }, search: { id: "Cari tool, kategori, atau fungsi…", en: "Search tool, category, or purpose…" }, none: { id: "Tidak ada yang cocok.", en: "Nothing matches." }, load: { id: "Memuat data…", en: "Loading data…" },
};

export default function SecurityTab({ initialQuery = "" }: { initialQuery?: string }) {
  const t = useT(), lang = useLang((s) => s.lang), tx = (k: keyof typeof TX) => TX[k][lang];
  const [extra, setExtra] = useState<Extra | null>(null);
  const [q, setQ] = useState(initialQuery), [g, setG] = useState("all"), [open, setOpen] = useState<Set<string>>(new Set());
  useEffect(() => { import("@/data/security-extra.json").then((m) => setExtra(m.default as unknown as Extra)); }, []);
  useEffect(() => { if (initialQuery) { setQ(initialQuery); setG("all"); setOpen(new Set([initialQuery])); } }, [initialQuery]);
  const tools = useMemo<Tool[]>(() => {
    const old = (legacyData as any[]).map((x) => ({ ...x, group: extra?.legacy[x.name] ?? "offense" } as Tool));
    return [...old, ...(extra?.tools ?? [])];
  }, [extra]);
  const groups = extra?.groups ?? ({} as Record<string, L2>);
  const list = useMemo(() => tools.filter((x) => (g === "all" || x.group === g) && (x.name + " " + x.cat + " " + x.purpose[lang]).toLowerCase().includes(q.toLowerCase())), [tools, g, q, lang]);
  const toggle = (n: string) => setOpen((s) => { const x = new Set(s); x.has(n) ? x.delete(n) : x.add(n); return x; });
  const count = (k: string) => tools.filter((x) => x.group === k).length;
  return (
    <div className="grid gap-5">
      <div><h2 className="font-display text-2xl text-gold">{tx("title")}</h2><p className="mt-2 max-w-3xl text-paper/70">{tx("sub").replace("{n}", String(tools.length || 90))}</p></div>
      <div className="flex gap-3 rounded-xl border border-gold/40 bg-gold/10 p-3 text-sm" role="note">
        <ShieldAlert className="mt-0.5 shrink-0 text-gold" size={18} /><p><b className="text-gold">{tx("warnT")}.</b> <span className="text-paper/80">{tx("warn")}</span></p>
      </div>
      <div>
        <p className="mb-2 text-xs uppercase tracking-[0.2em] text-paper/50">{tx("stage")}</p>
        <div className="grid gap-2 sm:grid-cols-5">
          {STAGES.map((s, i) => (
            <div key={s.k} className="rounded-lg border border-line bg-panel/70 p-2.5">
              <p className="text-xs font-semibold text-mint">{i + 1}. {lang === "en" ? s.en : s.id}</p>
              <div className="mt-1.5 flex flex-wrap gap-1">{s.g.map((k) => <button key={k} onClick={() => setG(k)} className="rounded-full border px-2 py-0.5 text-[10px]" style={{ borderColor: COLOR[k] + "88", color: COLOR[k] }}>{groups[k]?.[lang] ?? k}</button>)}</div>
            </div>
          ))}
        </div>
      </div>
      <div className="flex flex-wrap gap-2">
        <input className="input max-w-xs" placeholder={tx("search")} value={q} onChange={(e) => setQ(e.target.value)} />
        <button onClick={() => setG("all")} className={`btn ${g === "all" ? "border-mint text-mint" : ""}`}>{tx("all")} ({tools.length})</button>
        {ORDER.filter((k) => groups[k]).map((k) => <button key={k} onClick={() => setG(k)} className="btn" style={g === k ? { borderColor: COLOR[k], color: COLOR[k] } : undefined}>{groups[k][lang]} ({count(k)})</button>)}
      </div>
      {!extra && <p className="text-paper/60">{tx("load")}</p>}
      {extra && list.length === 0 && <p className="text-paper/70">{tx("none")}</p>}
      {ORDER.map((k) => {
        const rows = list.filter((x) => x.group === k); if (!rows.length) return null; const c = COLOR[k];
        return (
          <section key={k}>
            <h3 className="mb-3 border-b border-line pb-1 text-xl font-semibold" style={{ color: c }}>{groups[k]?.[lang]} <span className="text-sm font-normal text-paper/50">({rows.length})</span></h3>
            <dl className="grid gap-2 sm:grid-cols-2">
              {rows.map((i) => {
                const isOpen = open.has(i.name), yml = i.cmd.includes("\n");
                return (
                  <div key={i.name} className={`rounded-md border bg-panel/80 transition ${isOpen ? "sm:col-span-2" : "border-line hover:border-gold/50"}`} style={isOpen ? { borderColor: c } : undefined}>
                    <button type="button" aria-expanded={isOpen} onClick={() => toggle(i.name)} className="w-full p-3 text-left focus-visible:outline focus-visible:outline-2 focus-visible:outline-mint">
                      <dt className="flex flex-wrap items-baseline gap-x-2 font-mono font-semibold" style={{ color: c }}>{i.name}<span className="text-xs font-normal text-paper/60">{i.cat}</span>
                        {i.tier && <span className="rounded-full border px-1.5 text-[10px] font-normal" style={{ borderColor: GOD_THEMES[i.tier].main + "99", color: GOD_THEMES[i.tier].main }}>{GOD_LEVELS[i.tier].label}</span>}
                        <ChevronDown size={14} className={`ml-auto shrink-0 self-center text-paper/50 transition ${isOpen ? "rotate-180" : ""}`} /></dt>
                      <dd className="text-sm text-paper/80">{i.purpose[lang]}</dd>
                    </button>
                    {isOpen && (
                      <div className="grid gap-3 border-t border-line/70 p-3 animate-in fade-in duration-300">
                        {i.goal && <div><h4 className="mb-1 text-sm font-semibold" style={{ color: c }}>{tx("goal")}</h4><p className="text-sm text-paper/85">{i.goal[lang]}</p></div>}
                        <div><h4 className="mb-1 text-sm font-semibold" style={{ color: c }}>{i.goal ? tx("how") : t("i_sec_use")}</h4><p className="text-sm text-paper/85">{i.use[lang]}</p></div>
                        <div><h4 className="mb-1 text-sm font-semibold text-gold">{tx("ex")}</h4><CodeBlock code={i.cmd} lang={yml ? "yaml" : i.cmd.startsWith("(") ? "text" : "bash"} /></div>
                        <div><h4 className="mb-1 text-sm font-semibold text-gold">{tx("tip")}</h4><p className="text-sm text-paper/85">{i.tip[lang]}</p></div>
                        <a href={`https://${i.site.replace(/^https?:\/\//, "")}`} target="_blank" rel="noopener noreferrer" className="inline-flex w-fit items-center gap-1 text-sm text-mint underline">{tx("site")}: {i.site.replace(/^https?:\/\//, "")}<ExternalLink size={12} /></a>
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
  );
}
