// Generator soal God Mode. Jalankan: node scripts/gen-god.mjs
// Sumber data: scripts/security-tools.mjs (kurasi manual, tools keamanan NYATA).
// Tiap tool menghasilkan 3 varian soal (tebak tools, lengkapi perintah, tebak fungsi) x bilingual.
// Ini SEED AWAL (±45 soal/tingkat) — perbesar dengan menambah entri di security-tools.mjs sampai
// maksimal 200 soal/tingkat (GOD_QUESTIONS_PER_TIER di src/lib/config.ts), lalu jalankan ulang skrip ini.
import { writeFileSync, mkdirSync } from "node:fs";
import { TOOLS } from "./security-tools.mjs";

const q = (s) => "'" + String(s).replace(/'/g, "''") + "'";
const seed = 20270101;
let s = seed;
const rnd = () => { s |= 0; s = (s + 0x6d2b79f5) | 0; let t = Math.imul(s ^ (s >>> 15), 1 | s); t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t; return ((t ^ (t >>> 14)) >>> 0) / 4294967296; };
const shuf = (a) => a.map((v) => [rnd(), v]).sort((x, y) => x[0] - y[0]).map((x) => x[1]);
const pk = (a, n) => shuf(a).slice(0, n);

const byTier = {};
for (const t of TOOLS) (byTier[t.tier] ||= []).push(t);

const HINT3 = {
  id: (t) => t.tip.id,
  en: (t) => t.tip.en,
};

function row(tier, type, prompt, promptEn, code, lang, options, optionsEn, correctIndex, expl, explEn, hint, hintEn, hint2, hint2En, hint3, hint3En) {
  return `(${q(tier)},${q(type)},${q(prompt)},${q(promptEn)},${q(code)},${q(lang)},${q(JSON.stringify(options))}::jsonb,${q(JSON.stringify(optionsEn))}::jsonb,${correctIndex},${q(expl)},${q(explEn)},${q(hint)},${q(hintEn)},${q(hint2)},${q(hint2En)},${q(hint3)},${q(hint3En)})`;
}

function questionsFor(tier) {
  const pool = byTier[tier];
  const rows = [];
  for (const t of pool) {
    const others = pool.filter((x) => x.name !== t.name);

    // ── Q1: tebak nama tools dari fungsi + contoh perintah (nama tool & nama binary-nya disamarkan) ──
    {
      const wrongNames = pk(others, 3).map((x) => x.name);
      const opts = shuf([t.name, ...wrongNames]);
      const binWord = t.cmd.trim().startsWith("//") || t.cmd.trim().startsWith("<") ? "" : t.cmd.trim().split(/\s/)[0];
      const tokens = [...new Set([t.name, ...t.name.split(/\s+/), binWord].filter((x) => x && x.length >= 2))].sort((a, b) => b.length - a.length);
      let codeMasked = t.cmd;
      for (const tok of tokens) codeMasked = codeMasked.replace(new RegExp(tok.replace(/[.*+?^${}()|[\]\\]/g, "\\$&"), "gi"), "[TOOL]");
      rows.push(row(tier, "guess",
        "Tools apa yang dipakai di sini?", "Which tool is being used here?",
        codeMasked, "bash", opts, opts, opts.indexOf(t.name),
        `${t.name} (${t.cat}): ${t.purpose.id}`, `${t.name} (${t.cat}): ${t.purpose.en}`,
        `Tools ini bernama ${t.name}, fungsinya: ${t.purpose.id}`, `This tool is called ${t.name}, and it: ${t.purpose.en}`,
        t.use.id, t.use.en, HINT3.id(t), HINT3.en(t)));
    }

    // ── Q2: lengkapi perintah ──
    {
      const wrongOpts = pk(t.wrongs, Math.min(3, t.wrongs.length));
      const opts = shuf([t.blank, ...wrongOpts]);
      const codeBlanked = t.cmd.replace(t.blank, "____");
      rows.push(row(tier, "fill",
        `Lengkapi perintah ${t.name} berikut:`, `Complete the following ${t.name} command:`,
        codeBlanked, "bash", opts, opts, opts.indexOf(t.blank),
        `Bagian yang hilang adalah "${t.blank}". ${t.use.id}`, `The missing part is "${t.blank}". ${t.use.en}`,
        `${t.name} dipakai untuk: ${t.purpose.id}`, `${t.name} is used to: ${t.purpose.en}`,
        t.use.id, t.use.en, HINT3.id(t), HINT3.en(t)));
    }

    // ── Q3: tebak fungsi tools dari namanya ──
    {
      const distractors = pk(others, 3);
      const pairIdx = shuf([0, 1, 2, 3]); // 0 = jawaban benar (t), 1..3 = distractors[0..2]
      const opts = pairIdx.map((i) => (i === 0 ? t.purpose.id : distractors[i - 1].purpose.id));
      const optsEn = pairIdx.map((i) => (i === 0 ? t.purpose.en : distractors[i - 1].purpose.en));
      const idx = pairIdx.indexOf(0);
      rows.push(row(tier, "guess",
        `Apa fungsi dari ${t.name}?`, `What is ${t.name} used for?`,
        `// ${t.name} — ${t.cat}`, "bash", opts, optsEn, idx,
        `${t.name}: ${t.purpose.id}`, `${t.name}: ${t.purpose.en}`,
        `${t.name} adalah kategori "${t.cat}".`, `${t.name} falls under the "${t.cat}" category.`,
        t.use.id, t.use.en, HINT3.id(t), HINT3.en(t)));
    }
  }
  return rows;
}

mkdirSync(new URL("../supabase/seed/", import.meta.url), { recursive: true });
const TIER_FILE = { demi_god: "god-1-demi_god", god: "god-2-god", true_god: "god-3-true_god", primordial_god: "god-4-primordial_god" };
const counts = {};
for (const tier of Object.keys(TIER_FILE)) {
  const rows = questionsFor(tier);
  counts[tier] = rows.length;
  const sql = `-- DIHASILKAN oleh scripts/gen-god.mjs (${tier}) — ${rows.length} soal\n` +
    `insert into questions (difficulty,type,prompt,prompt_en,code,language,options,options_en,correct_index,explanation,explanation_en,hint,hint_en,hint2,hint2_en,hint3,hint3_en) values\n` +
    rows.join(",\n") + ";\n";
  writeFileSync(new URL(`../supabase/seed/${TIER_FILE[tier]}.sql`, import.meta.url), sql);
}
console.log("Soal God Mode dihasilkan:", counts, "(maks per tingkat:", 200, ")");

// Data untuk halaman Info ("Tools Keamanan")
mkdirSync(new URL("../src/data/", import.meta.url), { recursive: true });
<<<<<<< HEAD
const info = TOOLS.map((t) => ({ name: t.name, tier: t.tier, cat: t.cat, purpose: t.purpose, use: t.use, cmd: t.cmd, tip: t.tip, site: t.site }));
=======
const info = TOOLS.map((t) => ({ name: t.name, tier: t.tier, cat: t.cat, purpose: t.purpose, use: t.use, tip: t.tip, site: t.site }));
>>>>>>> 139710653228b172a081280c0c37a037c1a953fb
writeFileSync(new URL("../src/data/security-tools.json", import.meta.url), JSON.stringify(info, null, 1));
console.log("src/data/security-tools.json:", info.length, "tools");
