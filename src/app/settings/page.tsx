"use client";
import { Check } from "lucide-react";
import PublicShell from "@/components/PublicShell";
import { useLang, useT } from "@/lib/i18n";
export default function Settings() {
  const t = useT(), { lang, set } = useLang();
  return (
    <PublicShell>
      <div className="grid gap-4">
        <h1 className="font-display text-3xl text-gold">{t("s_title")}</h1>
        <p className="text-sm text-paper/70">{t("s_desc")}</p>
        {(["id", "en"] as const).map((l) => (
          <button key={l} onClick={() => set(l)} aria-pressed={lang === l} className={`flex items-center justify-between rounded-lg border p-4 text-left transition ${lang === l ? "border-gold bg-gold/10" : "border-line bg-panel/80 hover:border-gold/60"}`}>
            <span className="text-lg">{t(l === "id" ? "s_id" : "s_en")}</span>
            {lang === l && <span className="inline-flex items-center gap-1 text-sm text-gold"><Check size={16} />{t("s_active")}</span>}
          </button>
        ))}
      </div>
    </PublicShell>
  );
}
