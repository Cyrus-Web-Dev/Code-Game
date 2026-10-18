"use client";
import dynamic from "next/dynamic";
import { useEffect, useState } from "react";
import { useLang } from "@/lib/i18n";
import { useUser } from "@/lib/store";
const Backdrop = dynamic(() => import("./Backdrop"), { ssr: false });
// Latar bintang 3D (three.js, ratusan KB) dimuat SETELAH halaman interaktif, bukan menghalangi render awal.
// Dilewati pada mode hemat data / pengguna meminta gerak dikurangi; gradien latar tetap tampil.
export default function Providers({ children }: { children: React.ReactNode }) {
  const [bg, setBg] = useState(false);
  useEffect(() => {
    const m = document.cookie.match(/(?:^|; )kt_lang=(id|en)/);
    let l = m?.[1];
    try { l = l ?? localStorage.getItem("kt_lang") ?? undefined; } catch {}
    if (l === "en" || l === "id") useLang.getState().set(l, false);
    useUser.getState().refresh();

    const conn = (navigator as any).connection;
    const skip = conn?.saveData || window.matchMedia("(prefers-reduced-motion: reduce)").matches;
    if (skip) return;
    const ric = (window as any).requestIdleCallback as undefined | ((cb: () => void, o?: { timeout: number }) => number);
    const id = ric ? ric(() => setBg(true), { timeout: 2500 }) : window.setTimeout(() => setBg(true), 1200);
    return () => { if (ric) (window as any).cancelIdleCallback?.(id); else clearTimeout(id); };
  }, []);
  return <>{bg && <Backdrop />}{children}</>;
}
