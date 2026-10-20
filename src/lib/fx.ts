"use client";
import { useEffect, useState } from "react";

/**
 * Anggaran efek visual (v2.5). Semua efek berjalan di BROWSER pemain (tidak ada beban server/serverless di Vercel),
 * tetapi ukuran unduhan & baterai tetap dijaga:
 *   off  — prefers-reduced-motion: tanpa animasi apa pun.
 *   lite — Data Saver / koneksi 2G / RAM ≤2GB / CPU ≤2 inti: hanya efek CSS (aura, foil, kilap) + confetti kecil; TANPA three.js & tilt.
 *   full — efek penuh: tilt 3D, partikel three.js (dimuat malas saat hover), confetti penuh.
 * Nilai awal "lite" agar HTML server & klien identik (tanpa hydration mismatch); dikoreksi setelah mount.
 */
export type FxTier = "off" | "lite" | "full";
export function detectFx(): FxTier {
  if (typeof window === "undefined" || typeof matchMedia === "undefined") return "lite";
  if (matchMedia("(prefers-reduced-motion: reduce)").matches) return "off";
  const n = navigator as Navigator & { connection?: { saveData?: boolean; effectiveType?: string }; deviceMemory?: number };
  const c = n.connection;
  if (c?.saveData || /(^|-)2g$/.test(c?.effectiveType || "")) return "lite";
  if ((n.deviceMemory && n.deviceMemory <= 2) || (n.hardwareConcurrency && n.hardwareConcurrency <= 2)) return "lite";
  return "full";
}
export function useFx(): FxTier {
  const [t, setT] = useState<FxTier>("lite");
  useEffect(() => {
    setT(detectFx());
    const mq = matchMedia("(prefers-reduced-motion: reduce)"), h = () => setT(detectFx());
    mq.addEventListener?.("change", h);
    return () => mq.removeEventListener?.("change", h);
  }, []);
  return t;
}
export const canHover = () => typeof matchMedia !== "undefined" && matchMedia("(hover: hover) and (pointer: fine)").matches;
