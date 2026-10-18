"use client";
import { useState } from "react";
import type { CSSProperties } from "react";
import { cn } from "@/lib/utils";
import type { DevRole } from "@/lib/config";
import { MasterSparks } from "./Master";

const PALETTE = ["#6ee7c8", "#f5c451", "#ff5c8a", "#3da5ff", "#a855f7", "#ff8a3d", "#22e58a"];
const hue = (s: string) => PALETTE[[...s].reduce((a, c) => a + c.charCodeAt(0), 0) % PALETTE.length];

/** Foto profil bulat. Bila tidak ada foto (atau gagal dimuat): huruf awal berwarna. `online` menampilkan titik status.
 *  `master`: bingkai gelar Master yang AKTIF (lihat activeMaster di config.ts) — cincin conic beranimasi, aura, dan partikel.
 *  Frontend = merah membara menyala, Backend = hitam pekat beraura gelap, Full Stack = ungu tajam + merah + hitam. */
export default function Avatar({ src, name, size = 44, online, className, master }: { src?: string | null; name: string; size?: number; online?: boolean | null; className?: string; master?: DevRole | null }) {
  const [bad, setBad] = useState(false);
  const c = hue(name || "?");
  const rw = Math.max(3.5, Math.round(size * 0.1 * 10) / 10), pad = Math.ceil(rw + 4);
  const frame: CSSProperties | undefined = master ? { ["--s" as string]: `${size}px`, ["--rw" as string]: `${rw}px` } as CSSProperties : undefined;
  return (
    <span className={cn("relative inline-block shrink-0", className)} style={master ? { margin: pad } : undefined}>
      <span className={cn("relative inline-block shrink-0", master && `mf mf-${master}`)} style={{ width: size, height: size, ...frame }}>
        {master && <><i className="mf-aura" aria-hidden /><i className="mf-ring" aria-hidden /><i className="mf-ring2" aria-hidden /><i className="mf-edge" aria-hidden /></>}
        <span className={cn("block h-full w-full rounded-full", master && "mf-core")}>
          {src && !bad ? (
            // eslint-disable-next-line @next/next/no-img-element
            <img src={src} alt="" loading="lazy" decoding="async" referrerPolicy="no-referrer" onError={() => setBad(true)} className="h-full w-full rounded-full border-2 object-cover" style={{ borderColor: c }} />
          ) : (
            <span aria-hidden className="flex h-full w-full items-center justify-center rounded-full border-2 font-bold uppercase" style={{ borderColor: c, color: c, background: `${c}22`, fontSize: size * 0.42 }}>{(name || "?")[0]}</span>
          )}
        </span>
        {master && size >= 44 && <MasterSparks role={master} />}
        {online != null && <span aria-hidden className="absolute -bottom-0.5 -right-0.5 z-[5] rounded-full border-2 border-[#1f1c2e]" style={{ width: Math.max(10, size * 0.28), height: Math.max(10, size * 0.28), background: online ? "#22e58a" : "#6b7280", boxShadow: online ? "0 0 8px #22e58a" : "none" }} />}
      </span>
    </span>
  );
}
