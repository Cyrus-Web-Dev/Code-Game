"use client";
import Link from "next/link";
import { ArrowLeft } from "lucide-react";
import { useT } from "@/lib/i18n";
import LangSwitch from "./LangSwitch";
export default function PublicShell({ children, wide }: { children: React.ReactNode; wide?: boolean }) {
  const t = useT();
  return (
    <div className="min-h-screen">
      <header className="mx-auto flex max-w-5xl items-center justify-between px-5 py-4">
        <Link href="/" className="inline-flex items-center gap-2 text-sm hover:text-gold"><ArrowLeft size={16} />{t("back")}</Link>
        <LangSwitch />
      </header>
      <main className={`mx-auto px-5 pb-16 animate-in fade-in duration-500 ${wide ? "max-w-5xl" : "max-w-md"}`}>{children}</main>
    </div>
  );
}
