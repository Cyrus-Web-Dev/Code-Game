"use client";
import Link from "next/link";
import { usePathname, useRouter } from "next/navigation";
import { useEffect } from "react";
<<<<<<< HEAD
import { Gamepad2, Trophy, UserRound, Award, Home, LogOut, BookOpen, Users, Skull, Code2 } from "lucide-react";
=======
import { Gamepad2, Trophy, UserRound, Award, Home, LogOut, BookOpen, Users, Skull } from "lucide-react";
>>>>>>> 139710653228b172a081280c0c37a037c1a953fb
import { useUser, usePresence } from "@/lib/store";
import { useT } from "@/lib/i18n";
import { api } from "@/lib/supabase";
import LangSwitch from "./LangSwitch";
import { sfx } from "@/lib/sounds";

export default function AppShell({ children }: { children: React.ReactNode }) {
  const { user, status, clear } = useUser();
  const t = useT(), router = useRouter(), path = usePathname();
  useEffect(() => { if (status === "out") router.replace("/login"); }, [status, router]);
  const pending = usePresence((x) => x.pending);
  // Heartbeat status online: tiap 2 menit, hanya saat tab terlihat (hemat invocation Vercel)
  useEffect(() => {
    if (status !== "in") return;
    const beat = () => { if (document.visibilityState === "visible") api("/api/presence", {}).then((d: any) => usePresence.getState().setPending(d?.pending ?? 0)).catch(() => {}); };
    beat();
    const id = setInterval(beat, 120_000);
    document.addEventListener("visibilitychange", beat);
    return () => { clearInterval(id); document.removeEventListener("visibilitychange", beat); };
  }, [status]);
  if (status !== "in") return (
    <div className="flex min-h-screen items-center justify-center">
      <div className="skeleton h-8 w-32" />
    </div>
  );
  const items = [
    ["/game", Gamepad2, t("nav_game")],
    ["/god", Skull, t("nav_god")],
<<<<<<< HEAD
    ["/dev", Code2, t("nav_dev")],
=======
>>>>>>> 139710653228b172a081280c0c37a037c1a953fb
    ["/leaderboard", Trophy, t("nav_rank")],
    ["/profile", UserRound, t("nav_profile")],
    ["/titles", Award, t("nav_titles")],
    ["/review", BookOpen, t("nav_review")],
    ["/friends", Users, t("nav_friends")],
  ] as const;
  async function logout() {
    sfx.click();
    await api("/api/auth/logout", {});
    clear();
    router.push("/");
  }
  return (
    <div className="min-h-screen bg-grid">
      <nav className="sticky top-0 z-20 flex flex-wrap items-center gap-1 border-b border-line bg-ink/85 px-3 py-2 backdrop-blur-md">
        <Link href="/" className="mr-1 inline-flex items-center gap-1 rounded-md px-2 py-1.5 text-sm text-paper/70 hover:text-gold transition">
          <Home size={16} />{t("nav_home")}
        </Link>
        {items.map(([href, Icon, label]) => (
          <Link key={href} href={href}
            className={`inline-flex items-center gap-1.5 rounded-md px-2.5 py-1.5 text-sm transition ${
              path.startsWith(href) ? "bg-mint/15 text-mint" : "hover:bg-panel text-paper/80"
            }`}>
            <Icon size={15} />{label}
            {href === "/friends" && pending > 0 && <span aria-label={`${pending}`} className="ml-0.5 rounded-full bg-hot px-1.5 text-[10px] font-bold leading-4 text-ink">{pending}</span>}
          </Link>
        ))}
        <span className="ml-auto flex items-center gap-2">
          <span className="hidden font-mono text-xs text-paper/50 sm:inline">{user?.username}</span>
          <LangSwitch />
          <button onClick={logout} className="inline-flex items-center gap-1 rounded-md border border-line px-2 py-1 text-sm hover:border-hot transition" aria-label={t("m_logout")}>
            <LogOut size={15} />
          </button>
        </span>
      </nav>
      <main className="mx-auto max-w-5xl px-4 sm:px-5 py-6 sm:py-8 animate-in fade-in duration-500">{children}</main>
    </div>
  );
}
