"use client";
import { useLang } from "@/lib/i18n";
export default function LangSwitch() {
  const { lang, set } = useLang();
  return (
    <div className="flex overflow-hidden rounded-md border border-line text-xs font-mono" role="group" aria-label="Language">
      {(["id", "en"] as const).map((l) => <button key={l} onClick={() => set(l)} aria-pressed={lang === l} className={`px-2 py-1 ${lang === l ? "bg-mint text-ink" : "hover:bg-panel"}`}>{l.toUpperCase()}</button>)}
    </div>
  );
}
