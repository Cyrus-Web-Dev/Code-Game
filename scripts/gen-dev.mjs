// Generator soal Developer Mode. Jalankan: node scripts/gen-dev.mjs
// Memakai ulang CATALOG yang sama dengan gen-bulk.mjs, tapi disaring per peran (frontend/backend/fullstack)
// lewat scripts/dev-roles.mjs, lalu dibuatkan soal tebak/lengkapi/valid seperti tingkat Easy–Hell.
import { writeFileSync, mkdirSync } from "node:fs";
import { CATALOG } from "./catalog.mjs";
import { NOTES_EN } from "./notes-en.mjs";
import { FRONTEND_NAMES, BACKEND_NAMES, FULLSTACK_ONLY_NAMES } from "./dev-roles.mjs";

let seed = 20270601;
const rnd = () => { seed |= 0; seed = (seed + 0x6d2b79f5) | 0; let t = Math.imul(seed ^ (seed >>> 15), 1 | seed); t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t; return ((t ^ (t >>> 14)) >>> 0) / 4294967296; };
const ri = (a, b) => a + Math.floor(rnd() * (b - a + 1));
const pk = (a) => a[Math.floor(rnd() * a.length)];
const shuf = (a) => a.map((v) => [rnd(), v]).sort((x, y) => x[0] - y[0]).map((x) => x[1]);
const cap = (s) => s[0].toUpperCase() + s.slice(1);
const rep = (s, n) => s.repeat(n);
const W = ["halo", "dunia", "kopi", "senja", "nasi", "bakso", "padang", "laut", "gunung", "angin", "hujan", "bunga", "batik", "wayang", "garuda", "merdeka", "sate", "rendang", "tempe", "gado", "sambal", "durian", "pantai", "sawah", "candi", "angkot", "becak", "kerupuk"];
const N = ["total", "hasil", "jumlah", "skor", "nilai", "umur", "harga", "stok", "level", "waktu", "bobot", "tinggi", "lebar", "ukuran", "porsi", "antrian", "tiket", "saldo", "poin", "kuota", "batas", "indeks", "urut", "laju", "suhu"];
const P = ["users", "produk", "artikel", "blog", "kontak", "tentang", "login", "profil", "pesan", "galeri", "harga", "menu", "kota", "toko", "kelas", "jadwal", "berita", "video", "tiket", "admin"];
const H = { ri, pk, rep, cap };

const POOL = {
  frontend: CATALOG.filter((e) => FRONTEND_NAMES.includes(e[0]) || FULLSTACK_ONLY_NAMES.includes(e[0])),
  backend: CATALOG.filter((e) => BACKEND_NAMES.includes(e[0]) || FULLSTACK_ONLY_NAMES.includes(e[0])),
  fullstack: CATALOG.filter((e) => FRONTEND_NAMES.includes(e[0]) || BACKEND_NAMES.includes(e[0]) || FULLSTACK_ONLY_NAMES.includes(e[0])),
};

const guess = (role, name, code, hl, expl, hint, prompt) => {
  const o = shuf([name, ...shuf(POOL[role].map((x) => x[0]).filter((x) => x !== name)).slice(0, 2)]);
  return ["guess", prompt, code, hl, o, o.indexOf(name), expl, hint];
};
const ERR = { str: "Error: string tidak ditutup", par: "Error: tanda kurung tidak seimbang", name: "Error: nama fungsi atau kata kunci tidak dikenal" };
const NOVALID = new Set(["HTML", "CSS", "Bootstrap", "Tailwind CSS", "Alpine.js", "htmx", "Svelte"]);
const PROMPT = { frontend: "Teknologi frontend apa ini?", backend: "Teknologi backend apa ini?", fullstack: "Teknologi apa ini?" };

function devQ(role, e, kind) {
  e = e || pk(POOL[role]); kind = kind || pk(["guess", "guess", "guess", "fill", "valid"]);
  const [name, year, , hl, note, kw, fn] = e;
  const code = fn(pk(W), pk(N), pk(P), ri(2, 99), H);
  const hint = `Dirilis sekitar tahun ${year}. ${note}`;
  if (kind === "fill" && kw && code.includes(kw)) {
    const others = [...new Set(POOL[role].map((x) => x[5]).filter((k) => k && k !== kw))];
    const o = shuf([kw, ...shuf(others).slice(0, 2)]);
    return ["fill", `Lengkapi kode ${name} ini agar valid`, code.replace(kw, "____"), hl, o, o.indexOf(kw), `${kw} adalah bagian khas ${name}. ${note}`, hint];
  }
  const re = /(["'])([^"'\n]*)\1/;
  if (kind === "valid" && !NOVALID.has(name)) {
    const muts = [];
    if (re.test(code)) muts.push("str");
    if (code.includes(")")) muts.push("par");
    if (kw && code.includes(kw)) muts.push("name");
    if (muts.length) {
      const bad = rnd() < 0.6, t = pk(muts), li = code.lastIndexOf(")");
      let shown = code;
      if (bad) shown = t === "str" ? code.replace(re, (_, q2, body) => q2 + body) : t === "par" ? code.slice(0, li) + code.slice(li + 1) : code.replace(kw, kw + "x");
      const good = "Valid, struktur kodenya lengkap";
      const wrong = shuf(Object.keys(ERR).filter((k) => k !== t)).slice(0, bad ? 1 : 2).map((k) => ERR[k]);
      const o = shuf(bad ? [ERR[t], good, ...wrong] : [good, ...wrong]);
      const why = { str: "Tanda kutip penutup hilang sehingga literal string tidak lengkap.", par: "Ada kurung tutup yang hilang sehingga kurung tidak seimbang.", name: `"${kw}" salah ketik menjadi "${kw}x" sehingga tidak dikenal oleh ${name}.` };
      return ["valid", `Apakah kode ${name} ini valid?`, shown, hl, o, o.indexOf(bad ? ERR[t] : good), bad ? why[t] : `Kode ${name} ini lengkap dan valid. ${note}`, hint];
    }
  }
  return guess(role, name, code, hl, `${name}: ${note}`, hint, PROMPT[role]);
}

const q = (s) => "'" + String(s).replace(/'/g, "''") + "'";
const TARGET = 250;
const FILE = { frontend: "dev-1-frontend", backend: "dev-2-backend", fullstack: "dev-3-fullstack" };
mkdirSync(new URL("../supabase/seed/", import.meta.url), { recursive: true });
const counts = {};
for (const role of Object.keys(POOL)) {
  const seen = new Set(), rows = [];
  // Catatan: v2.1 Developer Mode baru berbahasa Indonesia saja (kolom _en dibiarkan null, UI akan
  // jatuh ke teks Indonesia seperti pola fallback yang sudah ada di seluruh aplikasi).
  const add = (r) => { if (!r) return false; const key = r[1] + r[2]; if (seen.has(key)) return false; seen.add(key);
    rows.push(`(${q(role)},${q(r[0])},${q(r[1])},null,${q(r[2])},${q(r[3])},${q(JSON.stringify(r[4]))}::jsonb,null,${r[5]},${q(r[6])},null,${q(r[7])},null)`);
    return true; };
  for (const e of POOL[role]) for (const kind of ["guess", "guess", "guess", "guess", "fill", "valid"]) for (let k = 0; k < 8 && !add(devQ(role, e, kind)); k++);
  let tries = 0;
  while (seen.size < TARGET && tries++ < 40000) add(devQ(role));
  // Jaminan cakupan (minimal 6 soal/entri) bisa melebihi TARGET untuk katalog besar — pangkas ke batas maksimal.
  const finalRows = rows.length > TARGET ? shuf(rows).slice(0, TARGET) : rows;
  counts[role] = finalRows.length;
  const sql = `-- DIHASILKAN oleh scripts/gen-dev.mjs (${role}) — ${finalRows.length} soal\n` +
    `insert into questions (difficulty,type,prompt,prompt_en,code,language,options,options_en,correct_index,explanation,explanation_en,hint,hint_en) values\n` +
    finalRows.join(",\n") + ";\n";
  writeFileSync(new URL(`../supabase/seed/${FILE[role]}.sql`, import.meta.url), sql);
}
console.log("Soal Developer Mode dihasilkan:", counts, "(maks per peran:", TARGET, ")");
