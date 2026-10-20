// Mesin bersama bank soal Developer Mode v2.4.
// Prinsip: jawaban DIHITUNG (menjalankan kode sungguhan di Node/Python/SQLite, atau simulator aturan spesifikasi),
// bukan diketik tangan, sehingga soal level "hard–hell" tidak salah kunci.
import vm from "node:vm";
import util from "node:util";
import { spawnSync } from "node:child_process";
import { LONGER } from "./longer.mjs";

let seed = 20261019;
export const setSeed = (s) => { seed = s; };
export const rnd = () => { seed |= 0; seed = (seed + 0x6d2b79f5) | 0; let t = Math.imul(seed ^ (seed >>> 15), 1 | seed); t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t; return ((t ^ (t >>> 14)) >>> 0) / 4294967296; };
export const ri = (a, b) => a + Math.floor(rnd() * (b - a + 1));
export const pk = (a) => a[Math.floor(rnd() * a.length)];
export const shuf = (a) => a.map((v) => [rnd(), v]).sort((x, y) => x[0] - y[0]).map((x) => x[1]);
export const sample = (a, n) => shuf(a).slice(0, n);
export const chance = (p) => rnd() < p;

/** Jalankan JS di sandbox vm; mengembalikan array baris console.log. Mendukung microtask & setTimeout singkat. */
export async function runJS(code, wait = 40) {
  const out = [];
  const fmt = (a) => (typeof a === "string" ? a : util.inspect(a, { breakLength: Infinity, depth: 4 }));
  const ctx = vm.createContext({ console: { log: (...a) => out.push(a.map(fmt).join(" ")) }, setTimeout, queueMicrotask, structuredClone, URL, URLSearchParams, btoa, atob });
  try { vm.runInContext(code, ctx, { timeout: 500 }); } catch (e) { out.push("!" + (e && e.name)); }
  await new Promise((r) => setTimeout(r, wait));
  return out;
}

export function runPy(code) {
  const r = spawnSync("python3", ["-c", code], { encoding: "utf8", timeout: 5000 });
  if (r.status !== 0) return null;
  return r.stdout.replace(/\n$/, "").split("\n");
}

/** Jalankan SQL (SQLite) dan kembalikan baris hasil query terakhir sebagai array of arrays. */
export function runSQL(setup, query) {
  const py = `import sqlite3,json,sys
c=sqlite3.connect(":memory:");c.executescript(${JSON.stringify(setup)})
print(json.dumps(c.execute(${JSON.stringify(query)}).fetchall()))`;
  const r = spawnSync("python3", ["-c", py], { encoding: "utf8", timeout: 5000 });
  if (r.status !== 0) return null;
  return JSON.parse(r.stdout);
}

/** Pangkas klausa penjelas pada jawaban benar yang jauh lebih panjang daripada pengecoh (celah "pilih yang terpanjang"). */
const CUTS = ["; ", " — ", ": ", ", sehingga ", ", karena ", ", bukan ", ", lalu ", ", tetapi ", ", yaitu ", " (", ", dengan ", ", agar "];
export function balance(c, ws) {
  const lim = Math.max(...ws.map((x) => x.length)) * 1.12; let t = c;
  for (let g = 0; g < 4 && t.length > lim; g++) {
    let best = -1;
    for (const d of CUTS) { const i = t.indexOf(d, 16); if (i > 0 && (best < 0 || i < best) && i >= 16) best = i; }
    if (best < 0) break;
    const nt = t.slice(0, best).replace(/[\s,;:—(]+$/, ""); if (nt.length < 16 || nt === t) break; t = nt;
  }
  return t;
}
/** Susun soal 3 pilihan: jawaban + 2 pengecoh unik. Kembalikan null bila pengecoh kurang. */
export function mk(type, prompt, code, lang, correct, wrongs, expl, hint) {
  let c = String(correct);
  const w = [...new Set(wrongs.map(String).map((x) => (type === "guess" && LONGER[x]) || x))].filter((x) => x !== c && x.length > 0).slice(0, 2);
  if (w.length < 2) return null;
  if (/[a-z]{4}/i.test(c) && c.length > 30) c = balance(c, w);
  const o = shuf([c, ...w]);
  return { type, prompt, code, lang, options: o, correct: o.indexOf(c), expl, hint };
}
export const fmtNum = (x) => String(Math.round(x * 100) / 100);
export const L = (s) => s.replace(/^\n/, "").replace(/\n$/, "");

/** Variasi pengecoh untuk keluaran teks: ubah satu angka, balik urutan, atau tukar token. */
export function perturb(line) {
  const out = new Set();
  const nums = [...line.matchAll(/\d+/g)];
  for (let k = 0; k < 10; k++) {
    let v = line;
    const r = rnd();
    if (nums.length && r < 0.55) { const m = pk(nums); v = line.slice(0, m.index) + String(+m[0] + pk([-2, -1, 1, 2, 10])) + line.slice(m.index + m[0].length); }
    else if (r < 0.8) { const t = line.split(/(\s*[|,]\s*)/); const items = t.filter((_, i) => i % 2 === 0); if (items.length > 1) { const i = ri(0, items.length - 2); [items[i], items[i + 1]] = [items[i + 1], items[i]]; let j = 0; v = t.map((x, idx) => (idx % 2 === 0 ? items[j++] : x)).join(""); } }
    else v = line.replace(/true|false/, (b) => (b === "true" ? "false" : "true"));
    const dupIn = (t) => [...t.matchAll(/\[([^\[\]]*)\]/g)].some((m) => { const a = m[1].split(/\s*,\s*/).filter((x) => /^\d+$/.test(x)); return a.length > 1 && new Set(a).size < a.length; });
    if (v !== line && v.length && !(dupIn(v) && !dupIn(line))) out.add(v);
  }
  return [...out];
}
export const fmtRows = (rows) => (rows.length === 1 && rows[0].length === 1 ? String(rows[0][0]) : rows.map((r) => r.map((x) => (x === null ? "NULL" : x)).join(",")).join(" | ") || "(kosong)");
