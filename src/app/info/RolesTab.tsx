"use client";
import { useState } from "react";
import { AlertTriangle, ChevronDown, ListOrdered, ShieldCheck, Sparkles, Wrench } from "lucide-react";
import rolesData from "@/data/roles.json";
import { MasterPill } from "@/components/Master";
import { DEV_BADGE_RULE, DEV_QUESTIONS_PER_ROLE, type DevRole } from "@/lib/config";
import { useLang } from "@/lib/i18n";

type L2 = { id: string; en: string };
type Role = { id: DevRole; icon: string; color: string; name: L2; tagline: L2; what: L2; does: L2[]; skills: string[]; tools: string[]; day: L2[]; path: L2[]; pitfalls: L2[]; security: L2[]; secTools: string[]; master: L2 };
type Data = { roles: Role[]; compare: { row: L2; frontend: L2; backend: L2; fullstack: L2 }[]; faq: { q: L2; a: L2 }[] };
const D = rolesData as unknown as Data;
const TX = {
  title: { id: "Peran Developer", en: "Developer Roles" },
  sub: { id: "Apa itu Frontend, Backend, dan Full Stack: tugas, keahlian, alat, keseharian, jalur belajar, jebakan umum, dan sisi keamanannya.", en: "What Frontend, Backend, and Full Stack are: duties, skills, tools, daily work, learning path, common pitfalls, and the security side." },
  what: { id: "Apa itu?", en: "What is it?" }, does: { id: "Tanggung jawab", en: "Responsibilities" }, skills: { id: "Keahlian & teknologi", en: "Skills & technologies" }, tools: { id: "Alat sehari-hari", en: "Everyday tools" },
  day: { id: "Keseharian", en: "A typical day" }, path: { id: "Jalur belajar", en: "Learning path" }, pit: { id: "Jebakan umum", en: "Common pitfalls" }, sec: { id: "Sisi keamanan", en: "Security side" },
  secTools: { id: "Tools keamanan yang relevan (klik untuk membuka)", en: "Relevant security tools (click to open)" }, master: { id: "Di Developer Mode", en: "In Developer Mode" },
  cmp: { id: "Perbandingan ketiga peran", en: "The three roles compared" }, faq: { id: "Pertanyaan umum", en: "Common questions" },
  rule: { id: "Gelar Master: {n} soal dijawab dengan akurasi ≥{a}% · bank {m} soal/peran", en: "Master title: {n} questions answered at ≥{a}% accuracy · {m}-question bank per role" },
};
const Chip = ({ children, onClick, c }: { children: React.ReactNode; onClick?: () => void; c?: string }) => {
  const cls = "rounded-full border px-2.5 py-1 text-xs";
  return onClick ? <button type="button" onClick={onClick} className={`${cls} hover:bg-white/10`} style={{ borderColor: (c ?? "#fff") + "88", color: c }}>{children}</button> : <span className={`${cls} border-line text-paper/80`}>{children}</span>;
};

export default function RolesTab({ onOpenTool }: { onOpenTool: (name: string) => void }) {
  const lang = useLang((s) => s.lang), tx = (k: keyof typeof TX) => TX[k][lang];
  const [sel, setSel] = useState<DevRole>("fullstack");
  const r = D.roles.find((x) => x.id === sel)!;
  const H = ({ icon, children }: { icon: React.ReactNode; children: React.ReactNode }) => <h4 className="mb-2 flex items-center gap-2 text-sm font-semibold uppercase tracking-wider" style={{ color: r.color }}>{icon}{children}</h4>;
  const List = ({ items }: { items: L2[] }) => <ul className="grid gap-1.5 text-sm text-paper/85">{items.map((x, i) => <li key={i} className="flex gap-2"><span style={{ color: r.color }}>▸</span><span>{x[lang]}</span></li>)}</ul>;
  return (
    <div className="grid gap-6">
      <div><h2 className="font-display text-2xl text-gold">{tx("title")}</h2><p className="mt-2 max-w-3xl text-paper/70">{tx("sub")}</p></div>
      <div className="grid gap-3 sm:grid-cols-3" role="tablist">
        {D.roles.map((x) => (
          <button key={x.id} role="tab" aria-selected={sel === x.id} onClick={() => setSel(x.id)} className="rounded-xl border p-4 text-left transition hover:-translate-y-0.5"
            style={{ borderColor: sel === x.id ? x.color : "rgba(255,255,255,.14)", background: sel === x.id ? `linear-gradient(135deg, ${x.color}26, rgba(24,21,38,.9))` : "rgba(24,21,38,.7)", boxShadow: sel === x.id ? `0 0 28px -8px ${x.color}` : undefined }}>
            <p className="text-2xl">{x.icon}</p><p className="mt-1 font-display text-lg" style={{ color: x.color }}>{x.name[lang]}</p><p className="mt-1 text-xs text-paper/70">{x.tagline[lang]}</p>
          </button>
        ))}
      </div>
      <article className="grid gap-6 rounded-2xl border bg-panel/70 p-5" style={{ borderColor: r.color + "66" }}>
        <div><H icon={<Sparkles size={16} />}>{tx("what")}</H><p className="text-sm leading-relaxed text-paper/85">{r.what[lang]}</p></div>
        <div className="grid gap-6 md:grid-cols-2">
          <div><H icon={<ListOrdered size={16} />}>{tx("does")}</H><List items={r.does} /></div>
          <div><H icon={<Wrench size={16} />}>{tx("day")}</H><List items={r.day} /></div>
        </div>
        <div className="grid gap-6 md:grid-cols-2">
          <div><H icon={null}>{tx("skills")}</H><div className="flex flex-wrap gap-1.5">{r.skills.map((s) => <Chip key={s}>{s}</Chip>)}</div></div>
          <div><H icon={null}>{tx("tools")}</H><div className="flex flex-wrap gap-1.5">{r.tools.map((s) => <Chip key={s}>{s}</Chip>)}</div></div>
        </div>
        <div className="grid gap-6 md:grid-cols-2">
          <div><H icon={<ListOrdered size={16} />}>{tx("path")}</H><ol className="grid gap-2 text-sm text-paper/85">{r.path.map((x, i) => <li key={i} className="flex gap-2"><b className="grid h-5 w-5 shrink-0 place-items-center rounded-full text-[11px] text-black" style={{ background: r.color }}>{i + 1}</b><span>{x[lang]}</span></li>)}</ol></div>
          <div><H icon={<AlertTriangle size={16} />}>{tx("pit")}</H><List items={r.pitfalls} /></div>
        </div>
        <div>
          <H icon={<ShieldCheck size={16} />}>{tx("sec")}</H><List items={r.security} />
          <p className="mb-1.5 mt-3 text-xs text-paper/50">{tx("secTools")}</p>
          <div className="flex flex-wrap gap-1.5">{r.secTools.map((n) => <Chip key={n} c={r.color} onClick={() => onOpenTool(n)}>{n}</Chip>)}</div>
        </div>
        <div className="rounded-xl border bg-black/25 p-4" style={{ borderColor: r.color + "55" }}>
          <div className="flex flex-wrap items-center gap-2"><p className="text-xs uppercase tracking-wider text-paper/50">{tx("master")}</p><MasterPill role={r.id} className="px-2.5 py-1 text-xs" /></div>
          <p className="mt-2 text-sm text-paper/85">{r.master[lang]}</p>
          <p className="mt-2 text-xs text-gold/90">{tx("rule").replace("{n}", String(DEV_BADGE_RULE.minQ)).replace("{a}", String(Math.round(DEV_BADGE_RULE.acc * 100))).replace("{m}", String(DEV_QUESTIONS_PER_ROLE))}</p>
        </div>
      </article>
      <section>
        <h3 className="mb-3 border-b border-line pb-1 text-xl font-semibold text-mint">{tx("cmp")}</h3>
        <div className="overflow-x-auto rounded-xl border border-line">
          <table className="w-full min-w-[640px] text-left text-sm">
            <thead><tr className="bg-black/30"><th className="p-3" />{D.roles.map((x) => <th key={x.id} className="p-3 font-display" style={{ color: x.color }}>{x.icon} {x.name[lang]}</th>)}</tr></thead>
            <tbody>{D.compare.map((c, i) => (
              <tr key={i} className="border-t border-line/60 align-top"><th scope="row" className="p-3 font-semibold text-gold">{c.row[lang]}</th><td className="p-3 text-paper/85">{c.frontend[lang]}</td><td className="p-3 text-paper/85">{c.backend[lang]}</td><td className="p-3 text-paper/85">{c.fullstack[lang]}</td></tr>
            ))}</tbody>
          </table>
        </div>
      </section>
      <section>
        <h3 className="mb-3 border-b border-line pb-1 text-xl font-semibold text-mint">{tx("faq")}</h3>
        <div className="grid gap-2">{D.faq.map((f, i) => (
          <details key={i} className="group rounded-md border border-line bg-panel/80 p-3">
            <summary className="flex cursor-pointer list-none items-center gap-2 font-semibold text-gold">{f.q[lang]}<ChevronDown size={14} className="ml-auto shrink-0 transition group-open:rotate-180" /></summary>
            <p className="mt-2 text-sm text-paper/85">{f.a[lang]}</p>
          </details>
        ))}</div>
      </section>
    </div>
  );
}
