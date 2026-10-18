"use client";
import { useEffect, useId, useMemo, useRef, useState } from "react";
import dynamic from "next/dynamic";
import confetti from "canvas-confetti";
import { anyTheme, type AnyLevel } from "@/lib/config";
import { badgeSvg, abbr, type Tier } from "@/lib/badge-svg";
export { abbr };
const Particles = dynamic(() => import("./BadgeParticles"), { ssr: false });

type P = { tier: Tier; level: AnyLevel; tech?: string | null; size?: number; label?: string; still?: boolean; particles?: boolean };
export default function TitleBadge({ tier, level, tech, size = 240, label, still = false, particles = false }: P) {
  const uid = useId().replace(/[^a-zA-Z0-9]/g, "");
  const html = useMemo(() => badgeSvg({ uid, tier, level, tech, size, still }), [uid, tier, level, tech, size, still]);
  const box = useRef<HTMLDivElement>(null), last = useRef(0);
  const [hot, setHot] = useState(false);
  useEffect(() => { box.current?.querySelector("svg")?.classList.toggle("hot", hot); }, [hot, html]);
  // Animasi dijeda saat lencana di luar layar (hemat CPU/baterai; penting untuk daftar panjang seperti peringkat)
  useEffect(() => {
    const el = box.current;
    if (!el || still || typeof IntersectionObserver === "undefined") return;
    const io = new IntersectionObserver(([e]) => el.querySelector("svg")?.classList.toggle("paused", !e.isIntersecting), { rootMargin: "120px" });
    io.observe(el);
    return () => io.disconnect();
  }, [still, html]);
  function enter() {
    if (still) return;
    setHot(true);
    const now = Date.now();
    if (tier === "legendary" && box.current && now - last.current > 2500) {
      last.current = now;
      const r = box.current.getBoundingClientRect(), th = anyTheme(level);
      confetti({ particleCount: level === "hell" ? 70 : 36, spread: level === "hell" ? 90 : 60, startVelocity: 28, origin: { x: (r.left + r.width / 2) / innerWidth, y: (r.top + r.height / 2) / innerHeight }, colors: level === "hell" ? ["#ff3b3b", "#f5c451", "#ff8a3d"] : [th.main, th.accent, "#ffffff"], disableForReducedMotion: true });
    }
  }
  return (
    <div ref={box} role="img" aria-label={label} onPointerEnter={enter} onPointerLeave={() => setHot(false)} className="relative mx-auto" style={{ width: size, maxWidth: "100%" }}>
      {particles && tier === "legendary" && hot && <div className="pointer-events-none absolute inset-0"><Particles level={level} hot /></div>}
      <div dangerouslySetInnerHTML={{ __html: html }} />
    </div>
  );
}
