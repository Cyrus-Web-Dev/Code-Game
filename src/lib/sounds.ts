/** Lightweight Web Audio SFX — no external files needed. */
let ctx: AudioContext | null = null;
function ac() {
  if (typeof window === "undefined") return null;
  if (!ctx) ctx = new (window.AudioContext || (window as any).webkitAudioContext)();
  if (ctx.state === "suspended") ctx.resume();
  return ctx;
}
function tone(freq: number, dur: number, type: OscillatorType = "sine", gain = 0.08, when = 0) {
  const c = ac(); if (!c) return;
  const t0 = c.currentTime + when;
  const o = c.createOscillator();
  const g = c.createGain();
  o.type = type; o.frequency.value = freq;
  g.gain.setValueAtTime(gain, t0);
  g.gain.exponentialRampToValueAtTime(0.001, t0 + dur);
  o.connect(g); g.connect(c.destination);
  o.start(t0); o.stop(t0 + dur + 0.02);
}
export const sfx = {
  correct() { tone(523, 0.12, "triangle", 0.1); tone(784, 0.18, "triangle", 0.08, 0.1); },
  wrong() { tone(220, 0.15, "sawtooth", 0.07); tone(165, 0.22, "sawtooth", 0.05, 0.08); },
  tick() { tone(880, 0.04, "square", 0.03); },
  timeout() { tone(180, 0.3, "sawtooth", 0.06); tone(120, 0.4, "sawtooth", 0.04, 0.15); },
  levelUp() { [523, 659, 784, 1047].forEach((f, i) => tone(f, 0.2, "triangle", 0.09, i * 0.08)); },
  click() { tone(600, 0.03, "square", 0.025); },
  hint() { tone(440, 0.1, "sine", 0.05); tone(660, 0.12, "sine", 0.04, 0.08); },
  confetti() { [400, 500, 600, 750, 900].forEach((f, i) => tone(f, 0.15, "triangle", 0.04, i * 0.04)); },
};
