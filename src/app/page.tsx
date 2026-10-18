"use client";
import { useEffect, useState } from "react";
import { Play, BookOpen, Languages, AtSign, LogOut, LogIn } from "lucide-react";
import { motion } from "framer-motion";
import MenuButton from "@/components/MenuButton";
import LangSwitch from "@/components/LangSwitch";
import Onboarding from "@/components/Onboarding";
import BadgeShowcase from "@/components/BadgeShowcase";
import { useT } from "@/lib/i18n";
import { useUser, useMe } from "@/lib/store";
import { api } from "@/lib/supabase";
import { sfx } from "@/lib/sounds";

export default function Menu() {
  const t = useT(), { status, clear } = useUser();
  const [showOb, setShowOb] = useState(false);

  useEffect(() => {
    if (status !== "in") return;
    useMe.getState().fetchMe().then((d: any) => {
      if (d?.meta && !d.meta.onboardingDone) setShowOb(true);
    }).catch(() => {});
  }, [status]);

  async function logout() { sfx.click(); await api("/api/auth/logout", {}); clear(); }

  return (
    <main className="relative mx-auto flex min-h-screen max-w-md flex-col items-center justify-center px-5 py-10 text-center">
      <div className="absolute right-5 top-4"><LangSwitch /></div>

      <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ duration: 0.6 }}
        className="w-full">
        <BadgeShowcase />
        <p className="mt-2 text-[11px] font-semibold tracking-[0.3em] text-gold/80">CODE QUIZ · GRIND SIMULATION</p>
        <h1 className="mt-3 font-display text-5xl font-semibold text-shine sm:text-6xl" style={{ filter: "drop-shadow(0 0 24px rgba(245,196,81,.25))" }}>
          {t("app")}
        </h1>
        <p className="mt-3 text-sm italic text-paper/70">{t("tagline")}</p>

        <div className="mt-8 grid w-full gap-3">
          <MenuButton primary icon={Play} href={status === "in" ? "/game" : "/login"}>{t("m_start")}</MenuButton>
          <MenuButton icon={BookOpen} href="/info">{t("m_info")}</MenuButton>
          <MenuButton icon={Languages} href="/settings">{t("m_settings")}</MenuButton>
          <MenuButton icon={AtSign} href="/contact">{t("m_contact")}</MenuButton>
          {status === "in"
            ? <MenuButton icon={LogOut} onClick={logout}>{t("m_logout")}</MenuButton>
            : <MenuButton icon={LogIn} href="/login">{t("login")}</MenuButton>}
        </div>

        <p className="mt-8 text-[10px] tracking-widest text-paper/30 uppercase">v1.2 · Built for coders</p>
      </motion.div>

      {showOb && <Onboarding onDone={() => setShowOb(false)} />}
    </main>
  );
}
