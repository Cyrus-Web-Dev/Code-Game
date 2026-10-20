"use client";
import type { AnyLevel } from "@/lib/config";
import { anyTheme, isGodLevel } from "@/lib/config";
import type { FxTier } from "@/lib/fx";

/** Confetti khas tiap tingkat. canvas-confetti dimuat malas (±6KB) hanya saat pertama kali lencana dihover. */
export async function badgeBurst(level: AnyLevel, rect: DOMRect, fx: FxTier) {
  if (fx === "off") return;
  const { default: confetti } = await import("canvas-confetti");
  const th = anyTheme(level), k = fx === "lite" ? 0.4 : 1;
  const origin = { x: (rect.left + rect.width / 2) / innerWidth, y: (rect.top + rect.height / 2) / innerHeight };
  const glyph = (text: string, scalar = 2) => { try { return confetti.shapeFromText({ text, scalar }); } catch { return "star" as const; } };
  const base = { origin, disableForReducedMotion: true, zIndex: 80 } as const;
  const n = (x: number) => Math.max(8, Math.round(x * k));
  const fire = (o: Parameters<typeof confetti>[0], d = 0) => (d ? setTimeout(() => confetti({ ...base, ...o }), d) : confetti({ ...base, ...o }));

  if (!isGodLevel(level)) {
    const hell = level === "hell";
    fire({ particleCount: n(hell ? 80 : 40), spread: hell ? 95 : 62, startVelocity: 28, colors: hell ? ["#ff3b3b", "#f5c451", "#ff8a3d"] : [th.main, th.accent, "#ffffff"] });
    return;
  }
  const gold = ["#f5c451", "#ffe9a8", "#fff6d6", th.main];
  if (level === "demi_god") { // hujan emas
    const s = glyph("✦", 2.2);
    fire({ particleCount: n(46), spread: 70, startVelocity: 32, gravity: 0.7, ticks: 160, colors: gold, shapes: ["star", s], scalar: 1.1 });
    fire({ particleCount: n(24), angle: 90, spread: 120, startVelocity: 18, gravity: 0.5, colors: gold, shapes: [s], scalar: 1.3 }, 140);
  } else if (level === "god") { // cincin cahaya + kilatan
    const bolt = glyph("⚡", 2.4);
    fire({ particleCount: n(70), spread: 360, startVelocity: 24, ticks: 110, gravity: 0.4, colors: gold, shapes: ["circle", "star"], scalar: 0.9 });
    fire({ particleCount: n(16), spread: 90, startVelocity: 34, colors: ["#fff6c9", "#f5c451"], shapes: [bolt], scalar: 1.5 }, 160);
  } else if (level === "true_god") { // pecahan platina
    const sp = glyph("◆", 2), st = glyph("✦", 2.4);
    const pl = ["#ffffff", "#e8eefc", "#cfd8ea", "#9fb4d8", th.main];
    fire({ particleCount: n(60), spread: 100, startVelocity: 30, ticks: 140, drift: 0.4, colors: pl, shapes: ["square", sp, st], scalar: 1 });
    fire({ particleCount: n(28), spread: 160, startVelocity: 16, ticks: 170, gravity: 0.35, colors: pl, shapes: [st], scalar: 1.5 }, 170);
  } else { // primordial: ledakan kosmik tiga gelombang
    const c = ["#a855f7", "#d8b4fe", "#f5c451", "#ffffff", "#2a0f4a"], st = glyph("★", 2.2), vd = glyph("☄", 2.4);
    fire({ particleCount: n(70), spread: 360, startVelocity: 30, ticks: 150, colors: c, shapes: ["circle", st] });
    fire({ particleCount: n(36), spread: 120, startVelocity: 42, ticks: 160, colors: c, shapes: [vd], scalar: 1.6 }, 130);
    fire({ particleCount: n(50), spread: 360, startVelocity: 20, gravity: 0.3, ticks: 190, colors: c, shapes: [st, "star"], scalar: 1.2 }, 300);
  }
}
