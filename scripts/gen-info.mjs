#!/usr/bin/env node
// Membuat data halaman Informasi: src/data/languages.json (ringan) dan src/data/languages-detail.json (dimuat saat kartu dibuka).
import { writeFileSync, mkdirSync } from "node:fs";
import { CATALOG, EXTRA } from "./catalog.mjs";
import { NOTES_EN } from "./notes-en.mjs";
import { INFO } from "./info-data.mjs";

let s = 12345; const rnd = () => ((s = (s * 1664525 + 1013904223) >>> 0) / 4294967296);
const H = { ri: (a, b) => a + Math.floor(rnd() * (b - a + 1)), pk: (a) => a[Math.floor(rnd() * a.length)], rep: (x, n) => x.repeat(n), cap: (x) => x[0].toUpperCase() + x.slice(1) };
const info = [...CATALOG.map((e) => ({ name: e[0], year: e[1], level: e[2], note: e[4], noteEn: NOTES_EN[e[0]], hl: e[3], fn: e[6] })), ...EXTRA.map((e) => ({ name: e[0], year: e[1], level: null, note: e[2], noteEn: NOTES_EN[e[0]] }))]
  .sort((a, b) => a.year - b.year || a.name.localeCompare(b.name));
const light = info.map(({ name, year, level, note, noteEn }) => ({ name, year, level, note, noteEn }));
const detail = {}; const missing = [];
for (const e of info) {
  const d = INFO[e.name]; if (!d) { missing.push(e.name); continue; }
  const row = { kind: d[0] }; if (d[1]) row.run = d[1]; if (d[2]) row.site = d[2];
  if (e.fn) { try { row.ex = e.fn("Halo", "jumlah", "produk", 42, H); row.hl = e.hl; } catch {} }
  detail[e.name] = row;
}
mkdirSync(new URL("../src/data/", import.meta.url), { recursive: true });
writeFileSync(new URL("../src/data/languages.json", import.meta.url), JSON.stringify(light, null, 1));
writeFileSync(new URL("../src/data/languages-detail.json", import.meta.url), JSON.stringify(detail));
console.log({ entri: light.length, denganDetail: Object.keys(detail).length, denganContoh: Object.values(detail).filter((x) => x.ex).length, tanpaDetail: missing });
