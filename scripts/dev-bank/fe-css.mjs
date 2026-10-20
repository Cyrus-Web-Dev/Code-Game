// Frontend — famili CSS & platform web. Jawaban dihitung oleh simulator aturan spesifikasi (bukan ditulis tangan).
import { rnd, ri, pk, shuf, sample, chance, mk, fmtNum, L } from "./engine.mjs";

// ───────── 1. Cascade: specificity + !important + inline + @layer + urutan ─────────
const COMP = [ // [teks, spec(a,b,c)] — semua cocok dengan <p id="kartu" class="a b" data-x> anak pertama dari <main class="wrap">
  ["p", [0, 0, 1]], [".a", [0, 1, 0]], [".b", [0, 1, 0]], ["#kartu", [1, 0, 0]], ["[data-x]", [0, 1, 0]],
  [":first-child", [0, 1, 0]], [":not(.zzz)", [0, 1, 0]], [":not(#zzz)", [1, 0, 0]], [":is(.a, #kartu)", [1, 0, 0]],
  [":is(.a, .b)", [0, 1, 0]], [":where(#kartu, .a)", [0, 0, 0]],
];
const add = (x, y) => [x[0] + y[0], x[1] + y[1], x[2] + y[2]];
const cmp = (x, y) => { for (let i = 0; i < x.length; i++) if (x[i] !== y[i]) return x[i] - y[i]; return 0; };
export const specificity = {
  id: "fe-specificity",
  gen: async () => {
    const colors = sample(["merah", "biru", "hijau", "ungu", "oranye", "kuning"], 4);
    const rules = []; const n = ri(3, 4);
    for (let i = 0; i < n; i++) {
      let picks = sample(COMP, ri(1, 3)); picks.sort((a, b) => (a[0] === "p" ? -1 : b[0] === "p" ? 1 : 0));
      let sel = picks.map((x) => x[0]).join(""); let sp = picks.reduce((s, x) => add(s, x[1]), [0, 0, 0]);
      if (chance(0.25)) { sel = ".wrap " + sel; sp = add(sp, [0, 1, 0]); } else if (chance(0.2)) { sel = "main " + sel; sp = add(sp, [0, 0, 1]); }
      rules.push({ color: colors[i], sel, sp, imp: chance(0.18), layered: chance(0.28), inline: false, order: i });
    }
    const hasInline = chance(0.25);
    if (hasInline) rules.push({ color: colors[3], sel: null, sp: [0, 0, 0], imp: chance(0.2), layered: false, inline: true, order: 99 });
    const key = (r, imp) => [r.inline ? 1 : 0, imp ? (r.layered ? 1 : 0) : (r.layered ? 0 : 1), ...r.sp, r.order];
    const pool = rules.some((r) => r.imp) ? rules.filter((r) => r.imp) : rules;
    const imp = rules.some((r) => r.imp);
    const win = [...pool].sort((a, b) => cmp(key(a, imp), key(b, imp)))[pool.length - 1];
    const dup = new Set(rules.map((r) => r.color)); if (dup.size < 3) return null;
    const css = rules.filter((r) => !r.inline).map((r) => `${r.layered ? "  " : ""}${r.sel} { color: ${r.color}${r.imp ? " !important" : ""}; }`);
    const lay = rules.filter((r) => !r.inline && r.layered).length;
    const layered = rules.filter((r) => !r.inline && r.layered).map((r) => `  ${r.sel} { color: ${r.color}${r.imp ? " !important" : ""}; }`);
    const unl = rules.filter((r) => !r.inline && !r.layered).map((r) => `${r.sel} { color: ${r.color}${r.imp ? " !important" : ""}; }`);
    const ordered = rules.filter((r) => !r.inline); // pertahankan urutan sumber: tulis ulang menurut order, bungkus @layer secara per-rule
    const body = ordered.map((r) => (r.layered ? `@layer base {\n  ${r.sel} { color: ${r.color}${r.imp ? " !important" : ""}; }\n}` : `${r.sel} { color: ${r.color}${r.imp ? " !important" : ""}; }`)).join("\n");
    const inl = rules.find((r) => r.inline);
    const html = `<main class="wrap">\n  <p id="kartu" class="a b" data-x${inl ? ` style="color: ${inl.color}${inl.imp ? " !important" : ""}"` : ""}>Halo</p>\n</main>`;
    const code = `${html}\n\n/* urutan sumber dari atas ke bawah */\n${body}`;
    const others = [...dup].filter((c) => c !== win.color);
    return mk("guess", "Warna teks akhir elemen <p> ini?", code, "html", win.color, others,
      rules.map((r) => `${r.inline ? "style inline" : r.sel}: (${r.sp.join(",")})${r.imp ? " !important" : ""}${r.layered ? " [@layer]" : ""} → ${r.color}`).join("; ") + `. Pemenang: ${win.color}. Urutan cascade: !important dulu (di dalam @layer, important berbalik: layer menang atas non-layer), lalu inline, lalu @layer (non-layer menang atas layer untuk deklarasi biasa), lalu specificity, terakhir urutan sumber. :is()/:not() memakai specificity argumen terkuatnya, :where() = 0.`,
      "Cascade bukan cuma specificity: cek !important, inline, @layer, baru specificity dan urutan.");
  },
};

// ───────── 2. Box model ─────────
export const boxModel = {
  id: "fe-boxmodel",
  gen: async () => {
    const bs = pk(["content-box", "border-box"]), W = pk([200, 240, 300, 360, 400]), P = ri(4, 24), B = ri(1, 8), M = ri(4, 30), t = ri(0, 2);
    if (t === 0) {
      const total = bs === "content-box" ? W + 2 * P + 2 * B + 2 * M : W + 2 * M;
      return mk("guess", "Berapa lebar horizontal total (px) yang ditempati kotak ini, termasuk margin?", `.kotak {\n  box-sizing: ${bs};\n  width: ${W}px;\n  padding: 0 ${P}px;\n  border: ${B}px solid;\n  margin: 0 ${M}px;\n}`, "css", total, [W + 2 * P + 2 * B, W + 2 * M + 2 * P, bs === "content-box" ? W + 2 * M : W + 2 * P + 2 * B + 2 * M, W + P + B + M].filter((x) => x !== total).map(String),
        `${bs}: ${bs === "content-box" ? `width hanya konten → ${W} + 2×${P} + 2×${B} + 2×${M} = ${total}` : `width sudah mencakup padding & border → ${W} + 2×${M} margin = ${total}`}.`, "Apa yang dicakup width pada tiap box-sizing? Margin selalu di luar.");
    }
    if (t === 1) {
      const pct = pk([25, 40, 50, 60, 75]), Wp = pk([400, 500, 600, 800]), Pp = ri(10, 40);
      const parentContent = bs === "content-box" ? Wp : Wp - 2 * Pp;
      const child = (parentContent * pct) / 100;
      return mk("guess", "Berapa lebar konten (px) anak ini?", `.induk {\n  box-sizing: ${bs};\n  width: ${Wp}px;\n  padding: 0 ${Pp}px;\n}\n.anak { width: ${pct}%; }   /* box-sizing: content-box, tanpa padding */`, "css", fmtNum(child),
        [fmtNum((Wp * pct) / 100), fmtNum(((Wp + 2 * Pp) * pct) / 100), fmtNum(((Wp - 2 * Pp) * pct) / 100)].filter((x) => x !== fmtNum(child)), `Persentase mengacu ke lebar KONTEN induk (${parentContent}px) → ${fmtNum(child)}px.`, "Persen mengacu ke content box induk, bukan border box.");
    }
    const inner = bs === "border-box" ? W - 2 * P - 2 * B : W;
    return mk("guess", "Berapa lebar area konten (px) elemen ini?", `.kotak {\n  box-sizing: ${bs};\n  width: ${W}px;\n  padding: ${ri(0, 9)}px ${P}px;\n  border: ${B}px solid;\n}`, "css", inner, [W - P - B, W + 2 * P + 2 * B, W - 2 * P].filter((x) => x !== inner).map(String), `${bs}: konten = ${bs === "border-box" ? `${W} − 2×${P} − 2×${B} = ${inner}` : `${W} (width = konten)`}.`, "Pada border-box, padding dan border memakan jatah width.");
  },
};

// ───────── 3. Flexbox ─────────
export const flexDist = {
  id: "fe-flex",
  gen: async () => {
    const n = 3, C = pk([600, 720, 800, 900, 1000]), gap = pk([0, 10, 20]);
    const it = Array.from({ length: n }, () => ({ b: pk([100, 150, 200, 250, 300]), g: ri(0, 3), s: ri(0, 3) }));
    const free = C - gap * (n - 1) - it.reduce((s, x) => s + x.b, 0);
    if (free === 0) return null;
    const w = it.map((x) => x.b);
    if (free > 0) { const sg = it.reduce((s, x) => s + x.g, 0); if (!sg) return null; it.forEach((x, i) => (w[i] = x.b + (free * x.g) / sg)); }
    else { const sc = it.reduce((s, x) => s + x.s * x.b, 0); if (!sc) return null; it.forEach((x, i) => (w[i] = x.b + (free * x.s * x.b) / sc)); }
    if (w.some((x) => (x * 4) % 1 !== 0 || x < 1)) return null;
    const k = ri(0, n - 1);
    const eq = free > 0 ? it[k].b + free / n : it[k].b + free / n; // model salah: bagi rata
    const noGap = (() => { const f = C - it.reduce((s, x) => s + x.b, 0); if (f >= 0) { const sg = it.reduce((s, x) => s + x.g, 0); return it[k].b + (f * it[k].g) / sg; } const sc = it.reduce((s, x) => s + x.s * x.b, 0); return it[k].b + (f * it[k].s * it[k].b) / sc; })();
    const noBasis = (() => { if (free > 0) { return it[k].b + (free * it[k].b) / it.reduce((s, x) => s + x.b, 0); } const ss = it.reduce((s, x) => s + x.s, 0); return it[k].b + (free * it[k].s) / ss; })();
    const code = `.baris { display: flex; width: ${C}px; gap: ${gap}px; }\n` + it.map((x, i) => `.i${i + 1} { flex: ${x.g} ${x.s} ${x.b}px; min-width: 0; }`).join("\n");
    return mk("guess", `Berapa lebar akhir (px) item .i${k + 1}?`, code, "css", fmtNum(w[k]), [fmtNum(eq), fmtNum(noGap), fmtNum(noBasis)].filter((x) => x !== fmtNum(w[k])),
      free > 0 ? `Ruang sisa = ${C} − gap ${gap * (n - 1)} − Σbasis = ${free}px dibagi menurut flex-grow (Σ=${it.reduce((s, x) => s + x.g, 0)}) → ${fmtNum(w[k])}px.` : `Kekurangan ${-free}px dibagi menurut flex-shrink × basis (bukan rata): ${fmtNum(w[k])}px.`,
      "Hitung ruang sisa (atau kekurangan) setelah gap. Grow dibagi menurut faktor grow; shrink dibobot dengan flex-basis.");
  },
};

// ───────── 4. Grid ─────────
export const gridTracks = {
  id: "fe-grid",
  gen: async () => {
    const C = pk([600, 800, 960, 1000, 1200]), gap = pk([0, 8, 16, 20, 24]), cols = [];
    const nc = ri(3, 4); for (let i = 0; i < nc; i++) cols.push(chance(0.4) ? { t: "px", v: pk([80, 100, 120, 160, 200]) } : { t: "fr", v: ri(1, 3) });
    const sf = cols.filter((c) => c.t === "fr").reduce((s, c) => s + c.v, 0), sp = cols.filter((c) => c.t === "px").reduce((s, c) => s + c.v, 0);
    if (!sf || cols.every((c) => c.t === "fr")) return null;
    const unit = (C - gap * (nc - 1) - sp) / sf; if (unit <= 0) return null;
    const j = ri(0, nc - 1); const wd = (c) => (c.t === "px" ? c.v : c.v * unit);
    if ((wd(cols[j]) * 4) % 1 !== 0) return null;
    const noGap = (() => { const u = (C - sp) / sf; return cols[j].t === "px" ? cols[j].v : cols[j].v * u; })();
    const ofC = cols[j].t === "px" ? cols[j].v : (cols[j].v / sf) * C;
    const eq = cols[j].t === "px" ? cols[j].v : (C - gap * (nc - 1)) / nc;
    const tpl = cols.map((c) => c.t === "px" ? `${c.v}px` : `${c.v}fr`).join(" ");
    return mk("guess", `Berapa lebar kolom ke-${j + 1} (px)?`, `.grid {\n  display: grid;\n  width: ${C}px;\n  gap: 0 ${gap}px;\n  grid-template-columns: ${tpl};\n}`, "css", fmtNum(wd(cols[j])), [fmtNum(noGap), fmtNum(ofC), fmtNum(eq)].filter((x) => x !== fmtNum(wd(cols[j]))),
      `Ruang untuk fr = ${C} − gap ${gap * (nc - 1)} − track px ${sp} = ${C - gap * (nc - 1) - sp}px dibagi ${sf} fr → 1fr = ${fmtNum(unit)}px.`, "Kurangi gap dan track berukuran tetap DULU, baru bagi sisanya per fr.");
  },
};

// ───────── 5. Margin collapse ─────────
const collapse = (a, b) => (a >= 0 && b >= 0 ? Math.max(a, b) : a < 0 && b < 0 ? Math.min(a, b) : a + b);
export const marginCollapse = {
  id: "fe-margin",
  gen: async () => {
    const a = pk([10, 16, 20, 24, 30, 40]), b = pk([-20, -10, 8, 12, 20, 30]), t = ri(0, 2), pad = ri(4, 16);
    if (t === 0) { const r = collapse(a, b); return mk("guess", "Berapa jarak vertikal (px) antara tepi bawah .x dan tepi atas .y?", `<div class="x" style="margin-bottom: ${a}px">X</div>\n<div class="y" style="margin-top: ${b}px">Y</div>\n<!-- keduanya block biasa, normal flow -->`, "html", r, [a + b, Math.max(a, b), Math.abs(b)].filter((x) => x !== r).map(String), `Margin vertikal antar saudara block menyatu: (${a}, ${b}) → ${r}px (positif: ambil terbesar; campuran: dijumlahkan).`, "Aturan: dua positif → max; dua negatif → min; campuran → jumlah."); }
    if (t === 1) { const r = a + b; return mk("guess", "Berapa jarak vertikal (px) antara tepi bawah .x dan tepi atas .y?", `.kolom { display: flex; flex-direction: column; }\n.x { margin-bottom: ${a}px; }\n.y { margin-top: ${b}px; }`, "css", r, [collapse(a, b), Math.max(a, b), a].filter((x) => x !== r).map(String), `Item flex membentuk konteks baru; margin TIDAK menyatu. Jaraknya ${a} + (${b}) = ${r}px.`, "Apakah margin item flex bisa collapse?"); }
    const c = pk([20, 30, 40]), r = a < 0 ? null : (chance(0.5) ? collapse(a, c) : a + pad + c);
    const withPad = chance(0.5); const res = withPad ? a + pad + c : collapse(a, c);
    return mk("guess", "Berapa jarak (px) dari tepi bawah elemen di atas induk (tanpa margin) hingga tepi atas .anak?", `.induk { margin-top: ${a}px; ${withPad ? `padding-top: ${pad}px; ` : ""}}\n.anak  { margin-top: ${c}px; }`, "css", res, [a + c + (withPad ? 0 : pad), withPad ? collapse(a, c) : a + c, a + pad + c].filter((x) => x !== res).map(String), withPad ? `Padding memisahkan margin induk dan anak, jadi tidak collapse: ${a} + ${pad} + ${c} = ${res}.` : `Tanpa padding/border, margin atas induk dan anak pertama menyatu menjadi max(${a}, ${c}) = ${res}px.`, "Apa yang mencegah margin induk dan anak pertama menyatu?");
  },
};

// ───────── 6. em/rem/% ─────────
export const unitMath = {
  id: "fe-units",
  gen: async () => {
    const root = pk([16, 10, 20]), m1 = pk([1.5, 1.25, 0.5, 2, 0.8, 0.75]), m2 = pk([0.8, 1.5, 0.5, 2, 1.25]), k = pk([1, 1.5, 2, 3]);
    const f1 = root * m1, f2 = f1 * m2, val = k * f2;
    if ((val * 4) % 1 !== 0) return null;
    const setRoot = root === 16 ? "" : `html { font-size: ${(root / 16) * 100}%; }\n`;
    const pctUse = chance(0.4);
    return mk("guess", "Berapa nilai padding-left (px) yang dipakai .b?", `${setRoot}.a { font-size: ${pctUse ? m1 * 100 + "%" : m1 + "em"}; }\n.b { font-size: ${m2}em; padding-left: ${k}em; }\n/* <div class="a"><div class="b">…</div></div> */`, "css", fmtNum(val),
      [fmtNum(k * f1), fmtNum(k * root), fmtNum(k * root * m2)].filter((x) => x !== fmtNum(val)), `font-size .a = ${root}×${m1} = ${f1}px; .b = ${f1}×${m2} = ${fmtNum(f2)}px; em pada padding memakai font-size elemen itu sendiri → ${k}×${fmtNum(f2)} = ${fmtNum(val)}px.`, "em pada font-size mengacu ke induk; em pada properti lain mengacu ke font-size elemen itu sendiri.");
  },
};

// ───────── 7. Stacking context ─────────
export const stacking = {
  id: "fe-stacking",
  gen: async () => {
    const mkSide = () => { const kind = pk(["z", "z", "opacity", "transform", "plain", "isolate"]); const z = ri(1, 9); const child = pk([ri(1, 999), ri(1, 999), "auto"]);
      return { kind, z, child, ctx: kind !== "plain", eff: kind === "z" ? z : kind === "plain" ? (child === "auto" ? 0 : child) : 0 }; };
    const A = mkSide(), B = mkSide();
    const css = (s, n) => `.p${n} { position: relative; ${s.kind === "z" ? `z-index: ${s.z}; ` : s.kind === "opacity" ? "opacity: .9; " : s.kind === "transform" ? "transform: translateZ(0); " : s.kind === "isolate" ? "isolation: isolate; " : ""}}\n.c${n} { position: absolute; z-index: ${s.child}; }`;
    const A2 = { ...A, eff: A.eff }, B2 = { ...B };
    const winner = A.eff > B.eff ? "A" : B.eff > A.eff ? "B" : "B"; // seri: belakangan di DOM menang
    const code = `<div class="p1"><span class="c1">A</span></div>\n<div class="p2"><span class="c2">B</span></div>\n\n${css(A, 1)}\n${css(B, 2)}\n/* A dan B bertumpang tindih secara visual */`;
    return mk("guess", "Elemen mana yang tampil paling atas?", code, "html", winner === "A" ? "A (di atas B)" : "B (di atas A)", [winner === "A" ? "B (di atas A)" : "A (di atas B)", "Tidak bisa ditentukan tanpa ukuran elemen"],
      `Container yang membentuk stacking context (z-index≠auto, opacity<1, transform, isolation) membungkus anaknya: z-index anak hanya bersaing di dalam. Nilai efektif A=${A.eff}, B=${B.eff}${A.eff === B.eff ? " (seri → yang belakangan di DOM menang)" : ""}.`, "Apakah .p1/.p2 membentuk stacking context? Jika tidak, z-index anak naik ke konteks akar.");
  },
};

// ───────── 8. clamp/min/max/calc ─────────
export const cssMath = {
  id: "fe-clamp",
  gen: async () => {
    const vw = pk([320, 375, 414, 768, 1024, 1280, 1440]), t = ri(0, 2), parent = pk([500, 600, 800, 1000]);
    if (t === 0) { const lo = pk([200, 280, 320]), hi = pk([600, 720, 800]), x = pk([40, 50, 60, 80]); const r = Math.min(Math.max((x * vw) / 100, lo), hi); const wrong = Math.max(Math.min((x * vw) / 100, lo), hi);
      return mk("guess", `Lebar (px) elemen pada viewport ${vw}px?`, `.hero { width: clamp(${lo}px, ${x}vw, ${hi}px); }`, "css", fmtNum(r), [fmtNum(wrong), fmtNum((x * vw) / 100), String(lo === r ? hi : lo)].filter((v) => v !== fmtNum(r)), `${x}vw = ${(x * vw) / 100}px, lalu dibatasi [${lo}, ${hi}] → ${fmtNum(r)}px.`, "clamp(min, ideal, max)."); }
    if (t === 1) { const a = pk([40, 50, 60, 75]), b = pk([300, 400, 500]); const r = Math.min((a * parent) / 100, b), r2 = Math.max((a * parent) / 100, b);
      return mk("guess", "Lebar (px) .kotak?", `.induk { width: ${parent}px; }\n.kotak { width: min(${a}%, ${b}px); }`, "css", fmtNum(r), [fmtNum(r2), fmtNum(b), fmtNum((a * vw) / 100)].filter((v) => v !== fmtNum(r)), `${a}% × ${parent} = ${(a * parent) / 100}px; min() mengambil yang terkecil → ${fmtNum(r)}px.`, "min() mengambil nilai terkecil."); }
    const g = pk([16, 24, 32, 48]), c = pk([2, 3, 4]); const r = (parent - g * (c - 1)) / c;
    if ((r * 4) % 1 !== 0) return null;
    return mk("guess", "Lebar (px) satu kartu?", `.baris { width: ${parent}px; display: flex; gap: ${g}px; }\n.kartu { flex: 0 0 calc((100% - ${g * (c - 1)}px) / ${c}); }`, "css", fmtNum(r), [fmtNum(parent / c), fmtNum((parent - g) / c), fmtNum((parent - g * c) / c)].filter((v) => v !== fmtNum(r)), `(${parent} − ${g * (c - 1)}) / ${c} = ${fmtNum(r)}px.`, "100% mengacu ke lebar kontainer .baris.");
  },
};

// ───────── 9. Media query cascade ─────────
export const mediaCascade = {
  id: "fe-media",
  gen: async () => {
    const a = pk([480, 600, 640, 768]), b = pk([700, 768, 900, 1024]), W = pk([a, a - 1, b, b + 1, 320, 700, 800, 1000, 1200]);
    const vals = sample([4, 8, 12, 16, 24, 32], 4); const [v0, v1, v2, v3] = vals;
    const rules = [{ q: null, v: v0 }, { q: { min: a }, v: v1 }, { q: { max: b }, v: v2 }, { q: { min: a, max: b }, v: v3 }]; const ord = shuf(rules.slice(1)); ord.unshift(rules[0]);
    const match = (r) => !r.q || ((r.q.min == null || W >= r.q.min) && (r.q.max == null || W <= r.q.max));
    const win = [...ord].filter(match).pop();
    const qs = (q) => q ? `@media (${[q.min != null ? `min-width: ${q.min}px` : "", q.max != null ? `max-width: ${q.max}px` : ""].filter(Boolean).join(") and (")})` : "";
    const code = ord.map((r) => (r.q ? `${qs(r.q)} { .grid { gap: ${r.v}px; } }` : `.grid { gap: ${r.v}px; }`)).join("\n");
    return mk("guess", `Nilai gap (px) .grid pada lebar viewport tepat ${W}px?`, code, "css", win.v, vals.filter((x) => x !== win.v).map(String), `Semua aturan yang cocok punya specificity sama, jadi yang TERAKHIR di sumber menang. min/max-width bersifat inklusif. Pemenang: ${win.v}px.`, "Cek aturan mana saja yang cocok di lebar itu (batas inklusif); yang terakhir di file menang.");
  },
};

// ───────── 10. Event DOM: capture / target / bubble / stopPropagation ─────────
export const domEvents = {
  id: "fe-events",
  gen: async () => {
    const nodes = ["luar", "tengah", "tombol"], ls = []; const n = ri(4, 6);
    for (let i = 0; i < n; i++) ls.push({ node: pk(nodes), cap: chance(0.45), lab: "ABCDEFG"[i], stop: null });
    const s = pk(ls); if (chance(0.7) && !(s.node === "tombol" && s.cap)) s.stop = chance(0.75) ? "stopPropagation" : "stopImmediatePropagation";
    const order = []; let stopped = false, halt = false;
    const fire = (node, cap) => { if (stopped || halt) return; for (const l of ls.filter((x) => x.node === node && x.cap === cap)) { if (halt) return; order.push(l.lab); if (l.stop === "stopImmediatePropagation") { halt = true; stopped = true; return; } if (l.stop) stopped = true; } };
    fire("luar", true); fire("tengah", true); fire("tombol", true); fire("tombol", false); fire("tengah", false); fire("luar", false);
    if (order.length < 3) return null;
    const bubbleOnly = []; { let st = false, h = false; for (const node of ["tombol", "tengah", "luar"]) { if (st) break; for (const l of ls.filter((x) => x.node === node)) { if (h) break; bubbleOnly.push(l.lab); if (l.stop === "stopImmediatePropagation") { h = true; st = true; } else if (l.stop) st = true; } } }
    const regOrd = ls.map((l) => l.lab).filter((x) => order.includes(x));
    const noStop = []; ["luar", "tengah", "tombol"].forEach((nd) => ls.filter((x) => x.node === nd && x.cap).forEach((l) => noStop.push(l.lab))); ["tombol", "tengah", "luar"].forEach((nd) => ls.filter((x) => x.node === nd && !x.cap).forEach((l) => noStop.push(l.lab)));
    const code = `// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)\n` + ls.map((l) => `${l.node}.addEventListener("click", ${l.stop ? `(e) => { log("${l.lab}"); e.${l.stop}(); }` : `() => log("${l.lab}")`}${l.cap ? ", true" : ""});`).join("\n");
    return mk("output", "Urutan log setelah tombol diklik?", code, "javascript", order.join(" "), [bubbleOnly.join(" "), regOrd.join(" "), noStop.join(" ")],
      `Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: ${order.join(" ")}.`, "Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.");
  },
};

// ───────── 11. Hook React: state snapshot vs updater ─────────
export const reactState = {
  id: "fe-react-state",
  gen: async () => {
    const S = ri(1, 9), ops = []; const n = ri(3, 4);
    for (let i = 0; i < n; i++) ops.push(pk([{ t: "snap", k: ri(1, 5) }, { t: "snap", k: ri(1, 5) }, { t: "add", k: ri(1, 5) }, { t: "mul", k: ri(2, 4) }, { t: "set", k: ri(10, 30) }]));
    if (!ops.some((o) => o.t === "add" || o.t === "mul")) ops[ri(0, n - 1)] = { t: "mul", k: 2 };
    if (!ops.some((o) => o.t === "snap")) ops[ri(0, n - 1)] = { t: "snap", k: 1 };
    let cur = S; for (const o of ops) cur = o.t === "snap" ? S + o.k : o.t === "add" ? cur + o.k : o.t === "mul" ? cur * o.k : o.k;
    let live = S; for (const o of ops) live = o.t === "snap" ? live + o.k : o.t === "add" ? live + o.k : o.t === "mul" ? live * o.k : o.k;
    const lastSnap = ops.some((o) => o.t === "snap") ? S + ops.filter((o) => o.t === "snap").pop().k : S;
    const line = (o) => (o.t === "snap" ? `setN(n + ${o.k});` : o.t === "add" ? `setN((p) => p + ${o.k});` : o.t === "mul" ? `setN((p) => p * ${o.k});` : `setN(${o.k});`);
    const code = `function Penghitung() {\n  const [n, setN] = useState(${S});\n  function klik() {\n${ops.map((o) => "    " + line(o)).join("\n")}\n  }\n  return <button onClick={klik}>{n}</button>;\n}`;
    return mk("output", `Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?`, code, "javascript", cur, [live, lastSnap, S + ops.reduce((s, o) => s + (o.t === "snap" || o.t === "add" ? o.k : 0), 0)].map(String),
      `Antrean update diproses berurutan mulai dari n=${S} (snapshot render ini): setN(n + k) selalu menghitung dari snapshot ${S} (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir ${cur}.`, "Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.");
  },
};

// ───────── 12. Urutan useEffect: cleanup & setup ─────────
export const effectOrder = {
  id: "fe-effect",
  gen: async () => {
    const dp = pk(["[]", "[id]", "none"]), dc = pk(["[]", "[id]", "none"]), steps = ri(1, 2);
    const seqIds = [1, 2, steps === 2 ? 2 : null].filter(Boolean); // render: mount id=1, update id=2, (opsional) update tanpa perubahan id
    const log = []; const eff = { P: { deps: dp, prev: null, id: null }, C: { deps: dc, prev: null, id: null } };
    const changed = (e, id, first) => first || e.deps === "none" || (e.deps === "[id]" && e.id !== id);
    seqIds.forEach((id, idx) => {
      const first = idx === 0, run = [];
      for (const k of ["C", "P"]) if (changed(eff[k], id, first)) { if (!first) log.push(`${k}-${eff[k].id}`); run.push(k); }
      for (const k of run) { log.push(`${k}+${id}`); eff[k].id = id; }
      for (const k of ["C", "P"]) if (!run.includes(k)) eff[k].id = eff[k].id; // closure lama tetap
    });
    const nonDep = (d) => (d === "none" ? "" : `, ${d}`);
    const code = `function Anak({ id }) {\n  useEffect(() => {\n    log("C+" + id);\n    return () => log("C-" + id);\n  }${nonDep(dc)});\n  return null;\n}\nfunction Induk() {\n  const [id, setId] = useState(1);\n  const [, tick] = useState(0);\n  useEffect(() => {\n    log("P+" + id);\n    return () => log("P-" + id);\n  }${nonDep(dp)});\n  return <Anak id={id} />;\n}\n// 1) mount  2) setId(2)${steps === 2 ? "  3) tick(1) (id tetap 2)" : ""}`;
    const correct = log.join(" ");
    const parentFirst = (() => { const l = []; const e = { P: { deps: dp, id: null }, C: { deps: dc, id: null } }; seqIds.forEach((id, idx) => { const first = idx === 0, run = []; for (const k of ["P", "C"]) if (changed(e[k], id, first)) { if (!first) l.push(`${k}-${e[k].id}`); run.push(k); } for (const k of run) { l.push(`${k}+${id}`); e[k].id = id; } }); return l.join(" "); })();
    const interleaved = (() => { const l = []; const e = { P: { deps: dp, id: null }, C: { deps: dc, id: null } }; seqIds.forEach((id, idx) => { const first = idx === 0; for (const k of ["C", "P"]) if (changed(e[k], id, first)) { if (!first) l.push(`${k}-${e[k].id}`); l.push(`${k}+${id}`); e[k].id = id; } }); return l.join(" "); })();
    const skipNone = log.filter((x) => !(x.endsWith("+" + 2) && false)).slice().reverse().join(" ");
    return mk("output", "Urutan log lengkap setelah semua langkah di komentar?", code, "javascript", correct, [parentFirst, interleaved, skipNone],
      `Hasil: ${correct}. Saat mount, efek anak berjalan sebelum efek induk. Saat update, SEMUA cleanup (anak dulu, lalu induk) dijalankan sebelum efek baru mana pun; hanya efek yang dependensinya berubah (atau tanpa array dependensi) yang diulang, dan cleanup memakai nilai id dari render lamanya.`,
      "Cleanup memakai closure render lama. Semua cleanup lebih dulu, lalu semua setup. Anak sebelum induk.");
  },
};

// ───────── 13. Urutan eksekusi <script> ─────────
export const scriptOrder = {
  id: "fe-script",
  gen: async () => {
    const n = ri(4, 5), kinds = Array.from({ length: n }, () => pk(["", "", "defer", "defer", 'type="module"']));
    if (!kinds.includes("") ) kinds[ri(0, n - 1)] = "";
    if (kinds.every((k) => k === "")) return null;
    const names = sample(["app", "util", "chart", "ui", "api", "auth", "map"], n).map((x) => x + ".js");
    const sync = names.filter((_, i) => kinds[i] === ""), rest = names.filter((_, i) => kinds[i] !== "");
    const order = [...sync, ...rest].join(" → "), docOrder = names.join(" → "), deferFirst = [...rest, ...sync].join(" → ");
    const code = `<body>\n${names.map((nm, i) => `  <script ${kinds[i] ? kinds[i] + " " : ""}src="${nm}"></script>`).join("\n")}\n</body>\n<!-- tiap file hanya menjalankan console.log(namanya); semua di-cache -->`;
    return mk("output", "Urutan eksekusi skrip (tanpa async)?", code, "html", order, [docOrder, deferFirst, [...rest, ...sync].reverse().join(" → ")],
      `Skrip biasa memblokir parser dan dijalankan sesuai urutan dokumen saat ditemui; defer dan type="module" ditunda sampai dokumen selesai di-parse (sebelum DOMContentLoaded) dan dijalankan menurut urutan dokumen. Hasil: ${order}.`, "Skrip biasa langsung jalan saat ditemui; defer dan module menunggu parsing selesai.");
  },
};

// ───────── 14. Biaya animasi: layout / paint / composite ─────────
const COST = { layout: ["width", "height", "margin-left", "padding", "font-size", "top", "border-width", "display"], paint: ["color", "background-color", "box-shadow", "border-radius", "outline-color", "visibility"], composite: ["transform", "opacity"] };
export const renderCost = {
  id: "fe-cost",
  gen: async () => {
    const lay = pk(COST.layout), pnt = pk(COST.paint), cmp = pk(COST.composite), props = shuf([lay, pnt, cmp]);
    const asc = [cmp, pnt, lay].join(" < "), wrong1 = [pnt, cmp, lay].join(" < "), wrong2 = [lay, pnt, cmp].join(" < ");
    const wrong3 = [cmp, lay, pnt].join(" < ");
    return mk("guess", "Urutkan dari paling murah ke paling mahal saat dianimasikan terus-menerus (di browser modern):", `/* animasi memakai salah satu properti: */\n${props.map((p) => `@keyframes k_${p.replace(/-/g, "_")} { to { ${p}: … } }`).join("\n")}`, "css", asc, [wrong1, wrong2, wrong3],
      `${cmp} hanya perlu compositing (di GPU, tanpa layout/paint), ${pnt} memicu paint ulang, ${lay} memicu layout lalu paint lalu composite — paling mahal.`, "Pipeline render: layout → paint → composite. Properti mana yang melewati lebih sedikit tahap?");
  },
};

export const FE_CSS = [specificity, boxModel, flexDist, gridTracks, marginCollapse, unitMath, stacking, cssMath, mediaCascade, domEvents, reactState, effectOrder, scriptOrder, renderCost];
