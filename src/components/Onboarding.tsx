"use client";
import { useState } from "react";
import { motion, AnimatePresence } from "framer-motion";
import { Code2, Trophy, Flame, Sparkles } from "lucide-react";
import { useT } from "@/lib/i18n";
import { api } from "@/lib/supabase";
import { sfx } from "@/lib/sounds";
import { useMe } from "@/lib/store";

const STEPS = [
  { icon: Code2, key: "ob_1" },
  { icon: Trophy, key: "ob_2" },
  { icon: Flame, key: "ob_3" },
  { icon: Sparkles, key: "ob_4" },
] as const;

export default function Onboarding({ onDone }: { onDone: () => void }) {
  const t = useT();
  const [step, setStep] = useState(0);
  const S = STEPS[step];
  const Icon = S.icon;

  async function finish() {
    sfx.levelUp();
    await api("/api/onboarding", { done: true }).catch(() => {});
    useMe.getState().invalidate(); // jangan tampilkan onboarding lagi dari cache lama
    onDone();
  }

  function next() {
    sfx.click();
    if (step < STEPS.length - 1) setStep(step + 1);
    else finish();
  }

  return (
    <div className="ob-backdrop">
      <motion.div initial={{ opacity: 0, scale: 0.9 }} animate={{ opacity: 1, scale: 1 }}
        className="w-full max-w-md rounded-2xl border border-gold/30 bg-panel p-6 sm:p-8 shadow-2xl">
        <div className="flex justify-center gap-1.5 mb-6">
          {STEPS.map((_, i) => (
            <div key={i} className={`h-1.5 flex-1 rounded-full transition-colors ${i <= step ? "bg-gold" : "bg-line"}`} />
          ))}
        </div>
        <AnimatePresence mode="wait">
          <motion.div key={step} initial={{ opacity: 0, x: 20 }} animate={{ opacity: 1, x: 0 }} exit={{ opacity: 0, x: -20 }}
            className="text-center">
            <div className="mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-2xl bg-gold/10 text-gold">
              <Icon size={32} />
            </div>
            <h2 className="font-display text-2xl text-gold mb-2">{t(S.key + "_title" as any)}</h2>
            <p className="text-paper/70 text-sm leading-relaxed mb-8">{t(S.key + "_desc" as any)}</p>
          </motion.div>
        </AnimatePresence>
        <div className="flex gap-3">
          {step > 0 && (
            <button className="btn flex-1" onClick={() => { sfx.click(); setStep(step - 1); }}>{t("back")}</button>
          )}
          <button className="btn btn-gold flex-1" onClick={next}>
            {step === STEPS.length - 1 ? t("ob_start") : t("next")}
          </button>
        </div>
        <button className="mt-3 w-full text-xs text-paper/40 hover:text-paper/70" onClick={finish}>{t("ob_skip")}</button>
      </motion.div>
    </div>
  );
}
