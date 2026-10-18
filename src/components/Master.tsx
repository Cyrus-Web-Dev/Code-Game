"use client";
import type { CSSProperties, ReactNode } from "react";
import { DEV_TITLE_DEFS, MASTER_TEXT, type DevRole } from "@/lib/config";

/** Partikel avatar: posisi/jeda dibuat tetap (deterministik) supaya tidak beda antara server & klien (hydration aman). */
const SP = [
  { k: -0.32, d: 0, t: 2.6 }, { k: 0.18, d: -0.9, t: 3.1 }, { k: -0.08, d: -1.7, t: 2.3 },
  { k: 0.36, d: -0.4, t: 3.4 }, { k: -0.22, d: -2.1, t: 2.9 }, { k: 0.06, d: -1.3, t: 2.5 },
];
export function MasterSparks({ role, count = 6 }: { role: DevRole; count?: number }) {
  const n = role === "backend" ? Math.min(count, 4) : count;
  return <>{SP.slice(0, n).map((p, i) => <b key={i} className="mf-sp" style={{ ["--k" as string]: p.k, ["--d" as string]: `${p.d}s`, ["--t" as string]: `${role === "backend" ? p.t + 0.8 : p.t}s` } as CSSProperties} />)}</>;
}

const CARD_FX = [
  { x: "8%", dx: "18px", d: 0, t: 5.2 }, { x: "21%", dx: "-14px", d: -1.4, t: 6.1 }, { x: "34%", dx: "22px", d: -2.6, t: 5.6 },
  { x: "47%", dx: "-20px", d: -0.7, t: 6.4 }, { x: "60%", dx: "16px", d: -3.3, t: 5.4 }, { x: "73%", dx: "-18px", d: -1.9, t: 6.0 },
  { x: "86%", dx: "14px", d: -4.1, t: 5.8 }, { x: "94%", dx: "-10px", d: -2.2, t: 6.6 },
];
/** Kartu dengan border Master tebal & beranimasi (+ partikel). Tanpa `role` ia hanya div biasa — aman dipakai di mana saja. */
export function MasterCard({ role, className = "", style, radius = "1rem", children }: { role: DevRole | null; className?: string; style?: CSSProperties; radius?: string; children: ReactNode }) {
  if (!role) return <div className={className} style={style}>{children}</div>;
  return (
    <div className={`mcard mcard-${role} ${className}`} style={{ ["--mr" as string]: radius, ...style } as CSSProperties}>
      <div className="mcard-fx" aria-hidden>{CARD_FX.slice(0, role === "backend" ? 5 : 8).map((p, i) => <b key={i} style={{ ["--x" as string]: p.x, ["--dx" as string]: p.dx, ["--d" as string]: `${p.d}s`, ["--t" as string]: `${p.t}s` } as CSSProperties} />)}</div>
      {children}
    </div>
  );
}

/** Pil gelar Master yang selalu terbaca di latar gelap (Backend memakai abu terang, bukan hitam). */
export function MasterPill({ role, active = false, className = "text-[10px] px-2 py-0.5" }: { role: DevRole; active?: boolean; className?: string }) {
  return <span className={`mpill mpill-${role} ${className}`} style={{ ["--mt" as string]: MASTER_TEXT[role], outline: active ? `1px solid ${MASTER_TEXT[role]}` : undefined, outlineOffset: 2 } as CSSProperties}>{DEV_TITLE_DEFS[role].name}</span>;
}
