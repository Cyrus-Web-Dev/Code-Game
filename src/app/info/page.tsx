"use client";
import { useEffect, useState } from "react";
import dynamic from "next/dynamic";
import { BookOpen, ShieldHalf, Users } from "lucide-react";
import PublicShell from "@/components/PublicShell";
import LangTab from "./LangTab";
import { useLang } from "@/lib/i18n";

// Tab berat dimuat malas: pengunjung yang hanya membaca bahasa & framework tidak mengunduh data tools keamanan maupun peran.
const Skeleton = () => <div className="grid gap-3"><div className="skeleton h-24 w-full" /><div className="skeleton h-64 w-full" /></div>;
const SecurityTab = dynamic(() => import("./SecurityTab"), { loading: Skeleton });
const RolesTab = dynamic(() => import("./RolesTab"), { loading: Skeleton });

type Tab = "lang" | "sec" | "roles";
const HASH: Record<string, Tab> = { "#bahasa": "lang", "#keamanan": "sec", "#peran": "roles" };
const TABS: { k: Tab; hash: string; icon: typeof BookOpen; id: string; en: string }[] = [
  { k: "lang", hash: "#bahasa", icon: BookOpen, id: "Bahasa & Framework", en: "Languages & Frameworks" },
  { k: "sec", hash: "#keamanan", icon: ShieldHalf, id: "Tools Keamanan", en: "Security Tools" },
  { k: "roles", hash: "#peran", icon: Users, id: "Peran Developer", en: "Developer Roles" },
];
const TX = {
  title: { id: "Pusat Informasi", en: "Information Hub" },
  sub: { id: "Bahasa pemrograman & framework, tools keamanan, serta peran Frontend, Backend, dan Full Stack — semuanya dalam satu tempat.", en: "Programming languages & frameworks, security tools, and the Frontend, Backend, and Full Stack roles — all in one place." },
};

export default function Info() {
  const lang = useLang((s) => s.lang);
  const [tab, setTab] = useState<Tab>("lang"), [toolQ, setToolQ] = useState("");
  useEffect(() => { const h = HASH[location.hash]; if (h) setTab(h); }, []);
  const go = (t: (typeof TABS)[number]) => { setTab(t.k); history.replaceState(null, "", t.hash); };
  const openTool = (name: string) => { setToolQ(name); setTab("sec"); history.replaceState(null, "", "#keamanan"); window.scrollTo({ top: 0, behavior: "smooth" }); };
  return (
    <PublicShell wide>
      <div className="grid gap-6">
        <div><h1 className="font-display text-3xl text-gold">{TX.title[lang]}</h1><p className="mt-2 max-w-3xl text-paper/70">{TX.sub[lang]}</p></div>
        <div role="tablist" className="flex flex-wrap gap-2 border-b border-line pb-3">
          {TABS.map((t) => {
            const Icon = t.icon, on = tab === t.k;
            return <button key={t.k} role="tab" aria-selected={on} onClick={() => go(t)} className={`btn inline-flex items-center gap-2 ${on ? "border-mint text-mint" : ""}`}><Icon size={16} />{lang === "en" ? t.en : t.id}</button>;
          })}
        </div>
        {tab === "lang" && <LangTab />}
        {tab === "sec" && <SecurityTab initialQuery={toolQ} />}
        {tab === "roles" && <RolesTab onOpenTool={openTool} />}
      </div>
    </PublicShell>
  );
}
