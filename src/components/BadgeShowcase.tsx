"use client";
import { useEffect, useState } from "react";
import { AnimatePresence, motion } from "framer-motion";
import TitleBadge from "./TitleBadge";
import { LEVEL_IDS, THEMES, TITLE_DEFS } from "@/lib/config";
import { useT } from "@/lib/i18n";
const TECH = ["Py", "JS", "Rs", "COB", "0x"];
export default function BadgeShowcase() {
  const t = useT(), [i, setI] = useState(4);
  useEffect(() => { const id = setInterval(() => setI((x) => (x + 1) % LEVEL_IDS.length), 3800); return () => clearInterval(id); }, []);
  const l = LEVEL_IDS[i];
  return (
    <div className="mb-2 flex flex-col items-center">
      <p className="text-[10px] font-semibold uppercase tracking-[0.3em] text-paper/50">{t("land_showcase")}</p>
      <div className="relative h-[230px] w-[260px]">
        <AnimatePresence mode="wait">
          <motion.div key={l} initial={{ opacity: 0, scale: .85, rotate: -2 }} animate={{ opacity: 1, scale: 1, rotate: 0 }} exit={{ opacity: 0, scale: 1.08 }} transition={{ duration: .5 }} className="absolute inset-0">
            <TitleBadge tier="legendary" level={l} tech={TECH[i]} size={260} label={TITLE_DEFS[l].legend} />
          </motion.div>
        </AnimatePresence>
      </div>
      <AnimatePresence mode="wait">
        <motion.p key={l} initial={{ opacity: 0, y: 6 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0 }} className="text-sm font-semibold" style={{ color: THEMES[l].main, textShadow: `0 0 18px ${THEMES[l].glow}` }}>{TITLE_DEFS[l].legend}</motion.p>
      </AnimatePresence>
    </div>
  );
}
