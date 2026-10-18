"use client";
import { useState } from "react";
import { cn } from "@/lib/utils";

const PALETTE = ["#6ee7c8", "#f5c451", "#ff5c8a", "#3da5ff", "#a855f7", "#ff8a3d", "#22e58a"];
const hue = (s: string) => PALETTE[[...s].reduce((a, c) => a + c.charCodeAt(0), 0) % PALETTE.length];

<<<<<<< HEAD
/** Foto profil bulat. Bila tidak ada foto (atau gagal dimuat): huruf awal berwarna. `online` menampilkan titik status.
 *  `rings`: warna bingkai Developer Mode (lihat DEV_THEMES di config.ts), satu warna per gelar Master yang diraih —
 *  ditumpuk sebagai cincin bercahaya di luar foto, tidak mengganggu gelar Easy–God Mode yang mana pun. */
export default function Avatar({ src, name, size = 44, online, className, rings }: { src?: string | null; name: string; size?: number; online?: boolean | null; className?: string; rings?: string[] }) {
  const [bad, setBad] = useState(false);
  const c = hue(name || "?");
  const ringGap = Math.max(3, size * 0.07);
  const ringShadow = rings && rings.length
    ? rings.map((col, i) => `0 0 0 ${ringGap * (i + 1)}px ${col}, 0 0 ${6 + i * 3}px ${ringGap * (i + 1) + 2}px ${col}99`).join(", ")
    : undefined;
  return (
    <span className={cn("relative inline-block shrink-0", className)} style={rings?.length ? { margin: ringGap * rings.length } : undefined}>
      <span className="relative inline-block shrink-0" style={{ width: size, height: size, boxShadow: ringShadow, borderRadius: "9999px" }}>
        {src && !bad ? (
          // eslint-disable-next-line @next/next/no-img-element
          <img src={src} alt="" loading="lazy" decoding="async" referrerPolicy="no-referrer" onError={() => setBad(true)} className="h-full w-full rounded-full border-2 object-cover" style={{ borderColor: c }} />
        ) : (
          <span aria-hidden className="flex h-full w-full items-center justify-center rounded-full border-2 font-bold uppercase" style={{ borderColor: c, color: c, background: `${c}22`, fontSize: size * 0.42 }}>{(name || "?")[0]}</span>
        )}
        {online != null && <span aria-hidden className="absolute -bottom-0.5 -right-0.5 rounded-full border-2 border-[#1f1c2e]" style={{ width: Math.max(10, size * 0.28), height: Math.max(10, size * 0.28), background: online ? "#22e58a" : "#6b7280", boxShadow: online ? "0 0 8px #22e58a" : "none" }} />}
      </span>
=======
/** Foto profil bulat. Bila tidak ada foto (atau gagal dimuat): huruf awal berwarna. `online` menampilkan titik status. */
export default function Avatar({ src, name, size = 44, online, className }: { src?: string | null; name: string; size?: number; online?: boolean | null; className?: string }) {
  const [bad, setBad] = useState(false);
  const c = hue(name || "?");
  return (
    <span className={cn("relative inline-block shrink-0", className)} style={{ width: size, height: size }}>
      {src && !bad ? (
        // eslint-disable-next-line @next/next/no-img-element
        <img src={src} alt="" loading="lazy" decoding="async" referrerPolicy="no-referrer" onError={() => setBad(true)} className="h-full w-full rounded-full border-2 object-cover" style={{ borderColor: c }} />
      ) : (
        <span aria-hidden className="flex h-full w-full items-center justify-center rounded-full border-2 font-bold uppercase" style={{ borderColor: c, color: c, background: `${c}22`, fontSize: size * 0.42 }}>{(name || "?")[0]}</span>
      )}
      {online != null && <span aria-hidden className="absolute -bottom-0.5 -right-0.5 rounded-full border-2 border-[#1f1c2e]" style={{ width: Math.max(10, size * 0.28), height: Math.max(10, size * 0.28), background: online ? "#22e58a" : "#6b7280", boxShadow: online ? "0 0 8px #22e58a" : "none" }} />}
>>>>>>> 139710653228b172a081280c0c37a037c1a953fb
    </span>
  );
}
