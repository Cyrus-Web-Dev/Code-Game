// Generator soal Developer Mode v2.4 (HARD MODE). Jalankan: node scripts/gen-dev.mjs
// Berbeda dari v2.1–v2.3 (yang menebak bahasa dari katalog Easy–Hell), bank soal sekarang berisi skenario kerja nyata
// yang jawabannya DIHITUNG: menjalankan kode di Node/Python/SQLite/git sungguhan atau memakai simulator aturan spesifikasi.
import { writeFileSync, readFileSync, mkdirSync, readdirSync, unlinkSync } from "node:fs";
import { setSeed, shuf } from "./dev-bank/engine.mjs";
import { FE_JS } from "./dev-bank/fe-js.mjs";
import { FE_CSS } from "./dev-bank/fe-css.mjs";
import { feCurated } from "./dev-bank/fe-curated.mjs";
import { BE_SQL } from "./dev-bank/be-sql.mjs";
import { BE_PY } from "./dev-bank/be-py.mjs";
import { BE_SYS } from "./dev-bank/be-sys.mjs";
import { FS_ONLY } from "./dev-bank/fs.mjs";
import { extraFamilies } from "./dev-bank/extra.mjs";

const TARGET = Number(process.env.DEV_TARGET || 800); // soal per peran (syarat Master: 500 soal dijawab, akurasi ≥90%)
const PER_FILE = 250;
const by = (arr, ids) => arr.filter((f) => ids.includes(f.id));
const SHARED_FE = by([...FE_JS, ...FE_CSS], ["fe-promise", "fe-async", "fe-json", "fe-events", "fe-react-state", "fe-eventloop", "fe-this"]);
const SHARED_BE = by([...BE_SQL, ...BE_SYS], ["be-sql-join", "be-sql-window", "be-http", "be-nplus1", "be-percentile", "be-race", "be-isolation", "be-backoff", "be-deadlock", "be-index"]);
const ROLES = {
  frontend: { file: "dev-1-frontend", fam: [...FE_JS, ...FE_CSS, feCurated, ...extraFamilies("f")] },
  backend: { file: "dev-2-backend", fam: [...BE_SQL, ...BE_PY, ...BE_SYS, ...extraFamilies("b")] },
  fullstack: { file: "dev-3-fullstack", fam: [...FS_ONLY, ...SHARED_FE, ...SHARED_BE, ...extraFamilies("s")] },
};

// ── Pastikan TIDAK ada soal yang sama dengan Easy–Hell ──
const norm = (s) => s.replace(/\s+/g, " ").replace(/''/g, "'").trim();
const classic = ["1-easy", "2-normal", "3-hard", "4-extreme", "5-hell"].map((f) => norm(readFileSync(new URL(`../supabase/seed/${f}.sql`, import.meta.url), "utf8")));
const clash = (code) => { const k = norm(code); return k.length > 25 && classic.some((t) => t.includes(k)); };

const q = (s) => "'" + String(s).replace(/'/g, "''") + "'";
const stats = {}; const seenAll = new Set();
const old = readdirSync(new URL("../supabase/seed/", import.meta.url)).filter((f) => /^dev-\d-/.test(f)); old.forEach((f) => unlinkSync(new URL(`../supabase/seed/${f}`, import.meta.url)));

for (const [role, { file, fam }] of Object.entries(ROLES)) {
  setSeed(20261019 + role.length * 7919);
  const rows = [], perFam = {}, dead = new Set(), cap = {}; let lengthBias = 0;
  const base = Math.ceil(TARGET / fam.length);
  fam.forEach((f) => (cap[f.id + rows.length] = 0));
  let factor = 1.5;
  while (rows.length < TARGET && dead.size < fam.length) {
    let progressed = false;
    for (const f of shuf(fam)) {
      if (rows.length >= TARGET) break;
      if (dead.has(f)) continue;
      if ((perFam[f.id] || 0) >= Math.ceil(base * factor)) continue;
      let got = false;
      for (let tries = 0; tries < 30 && !got; tries++) {
        let r = null; try { r = await f.gen(); } catch { r = null; }
        if (!r || r.options.length !== 3 || r.correct < 0) continue;
        const key = r.prompt + "\u0001" + r.code; if (seenAll.has(key) || clash(r.code)) continue;
        seenAll.add(key); perFam[f.id] = (perFam[f.id] || 0) + 1; got = progressed = true;
        if (r.options[r.correct].length === Math.max(...r.options.map((o) => o.length))) lengthBias++;
        rows.push(r);
      }
      if (!got) dead.add(f);
    }
    if (!progressed) factor *= 1.5; // semua famili sudah mencapai batas rata-rata → longgarkan agar famili yang masih luas mengisi sisa
  }
  const fin = rows.slice(0, TARGET).map((r) => `(${q(role)},${q(r.type)},${q(r.prompt)},null,${q(r.code)},${q(r.lang)},${q(JSON.stringify(r.options))}::jsonb,null,${r.correct},${q(r.expl)},null,${q(r.hint)},null)`);
  const parts = Math.ceil(fin.length / PER_FILE);
  for (let p = 0; p < parts; p++) {
    const chunk = fin.slice(p * PER_FILE, (p + 1) * PER_FILE);
    const head = `-- DIHASILKAN oleh scripts/gen-dev.mjs (${role}, bagian ${p + 1}/${parts}) — ${chunk.length} soal HARD MODE (v2.4)\n` + (p === 0 ? `-- Bagian 1 menonaktifkan soal Developer Mode lama (v2.1–v2.3) untuk peran ini; jalankan SEMUA bagian.\nupdate questions set active = false where difficulty = '${role}';\n` : "");
    writeFileSync(new URL(`../supabase/seed/${file}-${p + 1}.sql`, import.meta.url), head + `insert into questions (difficulty,type,prompt,prompt_en,code,language,options,options_en,correct_index,explanation,explanation_en,hint,hint_en) values\n` + chunk.join(",\n") + ";\n");
  }
  stats[role] = { total: fin.length, files: parts, families: Object.keys(perFam).length, maxShare: Math.round((Math.max(...Object.values(perFam)) / fin.length) * 100) + "%", correctIsLongest: Math.round((lengthBias / rows.length) * 100) + "%", perFam };
}
for (const [r, s] of Object.entries(stats)) { const { perFam, ...rest } = s; console.log(r, JSON.stringify(rest)); }
writeFileSync(new URL("./dev-bank/REPORT.json", import.meta.url), JSON.stringify(stats, null, 1));
console.log("selesai.");
