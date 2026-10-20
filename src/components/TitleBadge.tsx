"use client";
import { useEffect, useId, useMemo, useRef, useState } from "react";
import dynamic from "next/dynamic";
import { anyTheme, isGodLevel, type AnyLevel } from "@/lib/config";
import { badgeSvg, abbr, type Tier } from "@/lib/badge-svg";
import { badgeBurst } from "@/lib/badge-fx";
import { canHover, useFx } from "@/lib/fx";
export { abbr };
const Particles = dynamic(() => import("./BadgeParticles"), { ssr: false });

type P = { tier: Tier; level: AnyLevel; tech?: string | null; size?: number; label?: string; still?: boolean; particles?: boolean };
export default function TitleBadge({ tier, level, tech, size = 240, label, still = false, particles = false }: P) {
  const uid = useId().replace(/[^a-zA-Z0-9]/g, "");
  const html = useMemo(() => badgeSvg({ uid, tier, level, tech, size, still }), [uid, tier, level, tech, size, still]);
  const fx = useFx(), th = anyTheme(level), legend = tier === "legendary", god = isGodLevel(level);
  const box = useRef<HTMLDivElement>(null), last = useRef(0), rect = useRef<DOMRect | null>(null);
  const [hot, setHot] = useState(false), [hoverOk, setHoverOk] = useState(false);
  useEffect(() => setHoverOk(canHover()), []);
  // Tilt 3D + kilap mengikuti kursor: CSS variables + rAF (tanpa library → 0 KB tambahan; hanya transform, dikomposit GPU).
  const tilt = fx === "full" && hoverOk && !still && tier !== "starter";
  const inner = useRef<HTMLDivElement>(null), raf = useRef(0);
  const setTilt = (x: number, y: number) => { cancelAnimationFrame(raf.current); raf.current = requestAnimationFrame(() => { const el = inner.current; if (!el) return; el.style.setProperty("--rx", `${(-y * 26).toFixed(1)}deg`); el.style.setProperty("--ry", `${(x * 26).toFixed(1)}deg`); el.style.setProperty("--gx", `${((x + 0.5) * 100).toFixed(0)}%`); el.style.setProperty("--gy", `${((y + 0.5) * 100).toFixed(0)}%`); }); };

  useEffect(() => { box.current?.querySelector("svg")?.classList.toggle("hot", hot); }, [hot, html]);
  // Animasi dijeda saat lencana di luar layar (hemat CPU/baterai; penting untuk daftar panjang seperti peringkat)
  useEffect(() => {
    const el = box.current;
    if (!el || still || typeof IntersectionObserver === "undefined") return;
    const io = new IntersectionObserver(([e]) => { el.querySelector("svg")?.classList.toggle("paused", !e.isIntersecting); el.classList.toggle("tb-paused", !e.isIntersecting); }, { rootMargin: "120px" });
    io.observe(el);
    return () => io.disconnect();
  }, [still, html]);
  function enter() {
    if (still) return;
    setHot(true);
    if (tilt && box.current) rect.current = box.current.getBoundingClientRect();
    const now = Date.now();
    if (legend && box.current && now - last.current > 2500) { last.current = now; badgeBurst(level, box.current.getBoundingClientRect(), fx); }
  }
  function move(e: React.PointerEvent) {
    if (!tilt || !rect.current) return;
    const r = rect.current; setTilt((e.clientX - r.left) / r.width - 0.5, (e.clientY - r.top) / r.height - 0.5);
  }
  function leave() { setHot(false); setTilt(0, 0); rect.current = null; }
  return (
    <div ref={box} role="img" aria-label={label} onPointerEnter={enter} onPointerMove={move} onPointerLeave={leave}
      className={`tb relative mx-auto ${legend ? "tb-legend" : ""} ${god ? "tb-god" : ""}`}
      style={{ width: size, maxWidth: "100%", ["--c" as string]: th.main, ["--g" as string]: th.glow, ["--a" as string]: th.accent }}>
      {legend && fx !== "off" && !still && <><i className="tb-aura" aria-hidden /><i className="tb-aura2" aria-hidden /></>}
      {particles && legend && hot && fx === "full" && <div className="pointer-events-none absolute inset-0 z-[2]"><Particles level={level} hot /></div>}
      <div ref={inner} className={`relative z-[1] ${tilt ? "tb-tilt" : ""}`}>
        <div dangerouslySetInnerHTML={{ __html: html }} />
        {tilt && legend && <i aria-hidden className="tb-glare" />}
      </div>
    </div>
  );
}
