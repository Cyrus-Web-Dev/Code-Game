// Generator massal: jawaban DIHITUNG oleh kode (bukan ditulis tangan). Jalankan: npm run gen:bulk
import { writeFileSync } from "node:fs";
let seed = 20261011;
const rnd = () => { seed |= 0; seed = (seed + 0x6d2b79f5) | 0; let t = Math.imul(seed ^ (seed >>> 15), 1 | seed); t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t; return ((t ^ (t >>> 14)) >>> 0) / 4294967296; };
const ri = (a, b) => a + Math.floor(rnd() * (b - a + 1));
const pk = (a) => a[Math.floor(rnd() * a.length)];
const shuf = (a) => a.map((v) => [rnd(), v]).sort((x, y) => x[0] - y[0]).map((x) => x[1]);
const cap = (s) => s[0].toUpperCase() + s.slice(1);
const rep = (s, n) => s.repeat(n);
import { CATALOG, EXTRA } from "./catalog.mjs";
import { NOTES_EN } from "./notes-en.mjs";
const L = {};
for (const e of CATALOG) (L[e[2]] ||= []).push(e[0]);
const W = ["halo","dunia","kopi","senja","nasi","bakso","padang","laut","gunung","angin","hujan","bunga","batik","wayang","garuda","merdeka","sate","rendang","tempe","gado","sambal","durian","pantai","sawah","candi","angkot","becak","kerupuk"];
const N = ["total","hasil","jumlah","skor","nilai","umur","harga","stok","level","waktu","bobot","tinggi","lebar","ukuran","porsi","antrian","tiket","saldo","poin","kuota","batas","indeks","urut","laju","suhu"];
const P = ["users","produk","artikel","blog","kontak","tentang","login","profil","pesan","galeri","harga","menu","kota","toko","kelas","jadwal","berita","video","tiket","admin"];
const guess = (lv, lang, code, hl, expl, hint, prompt) => {
  const o = shuf([lang, ...shuf(L[lv].filter((x) => x !== lang)).slice(0, 2)]);
  return ["guess", prompt || (lv === "normal" ? "Framework apa ini?" : "Bahasa apa ini?"), code, hl, o, o.indexOf(lang), expl, hint];
};
const withOpts = (type, prompt, code, hl, ans, wrongs, expl, hint) => {
  const w = [...new Set(wrongs.map(String))].filter((x) => x !== String(ans)).slice(0, 2);
  const o = shuf([String(ans), ...w]);
  return [type, prompt, code, hl, o, o.indexOf(String(ans)), expl, hint];
};
const numQ = (prompt, code, hl, c, expl, hint) => withOpts("output", prompt, code, hl, c, shuf([c + 1, c - 1, c + 2, c - 2, c * 2, c + 10, c - 10]).filter((x) => c < 0 || x >= 0), expl, hint);
// ---- Interpreter Brainfuck (untuk verifikasi jawaban Hell) ----
function bf(code) {
  const m = new Uint8Array(300); let p = 0, out = "", st = [], jump = {};
  for (let i = 0; i < code.length; i++) { if (code[i] === "[") st.push(i); if (code[i] === "]") { const j = st.pop(); jump[i] = j; jump[j] = i; } }
  for (let i = 0, n = 0; i < code.length && n < 1e6; i++, n++) {
    const c = code[i];
    if (c === "+") m[p]++; else if (c === "-") m[p]--; else if (c === ">") p++; else if (c === "<") p--;
    else if (c === ".") out += String.fromCharCode(m[p]); else if (c === "[" && !m[p]) i = jump[i]; else if (c === "]" && m[p]) i = jump[i];
  }
  return { out, cell: m[p] };
}
const T = {
  easy: [
    () => { const a = ri(2, 30), b = ri(2, 12), op = pk(["+","-","*","//","%"]);
      const r = { "+": a + b, "-": a - b, "*": a * b, "//": Math.floor(a / b), "%": a % b }[op];
      return numQ("Apa output kode ini?", `a = ${a}\nb = ${b}\nprint(a ${op} b)`, "python", r, `${a} ${op} ${b} = ${r} di Python.`, "Hitung dengan teliti."); },
    () => { const w = pk(W), n = ri(2, 4);
      return rnd() < 0.5 ? numQ("Apa output kode ini?", `console.log("${w}".length)`, "javascript", w.length, `Panjang "${w}" adalah ${w.length}.`, "Hitung hurufnya.")
        : withOpts("output", "Apa output kode ini?", `console.log("${w}".repeat(${n}))`, "javascript", rep(w, n), [rep(w, n + 1), rep(w, n - 1)], `repeat(${n}) mengulang string ${n} kali.`, "Tanpa spasi."); },
    () => { const n = ri(3, 15);
      return numQ("Berapa nilai total di akhir?", `total = 0\nfor i in range(${n}):\n    total += i\nprint(total)`, "python", (n * (n - 1)) / 2, `Jumlah 0 sampai ${n - 1} = ${(n * (n - 1)) / 2}.`, "range berhenti sebelum n."); },
  ],
  normal: [
    () => { const n = ri(3, 7), k = ri(2, 9), r = Array.from({ length: n }, (_, i) => i * k);
      return withOpts("output", "Apa output kode ini?", `print([x * ${k} for x in range(${n})])`, "python", `[${r.join(", ")}]`, [`[${r.map((x) => x + k).join(", ")}]`, `[${r.slice(0, -1).join(", ")}]`], "List comprehension mengalikan setiap elemen.", "range mulai dari 0."); },
    () => { const a = Array.from({ length: 3 }, () => ri(1, 9)), k = ri(2, 5);
      return withOpts("output", "Apa output kode ini?", `console.log([${a}].map(x => x * ${k}).join("-"))`, "javascript", a.map((x) => x * k).join("-"), [a.map((x) => x * k).join(","), a.map((x) => x + k).join("-")], "map lalu join dengan tanda hubung.", "Perhatikan pemisah join."); },
    () => { const a = Array.from({ length: 6 }, () => ri(1, 20)), t = ri(5, 15);
      return numQ("Berapa nilai yang tercetak?", `const a = [${a}];\nconsole.log(a.filter(x => x > ${t}).length);`, "javascript", a.filter((x) => x > t).length, `Ada ${a.filter((x) => x > t).length} elemen lebih dari ${t}.`, "Hitung yang lolos filter."); },
  ],
  hard: [
    () => { const a = Array.from({ length: ri(4, 6) }, () => ri(1, 20)), i = ri(0, a.length - 1), j = ri(0, a.length - 1);
      return rnd() < 0.5 ? numQ("Apa output kode ini?", `int a[] = {${a}};\nprintf("%d", *(a + ${i}));`, "c", a[i], `*(a + ${i}) sama dengan a[${i}] = ${a[i]}.`, "Indeks mulai dari 0.")
        : numQ("Apa output kode ini?", `int a[] = {${a}};\nprintf("%d", a[${i}] + a[${j}]);`, "c", a[i] + a[j], `a[${i}] + a[${j}] = ${a[i] + a[j]}.`, "Indeks mulai dari 0."); },
    () => { const a = Array.from({ length: ri(3, 5) }, () => ri(1, 9)), s = a.reduce((x, y) => x + y, 0), l = pk(["Haskell","Elixir","Rust"]);
      const c = { Haskell: `print $ foldr (+) 0 [${a}]`, Elixir: `IO.puts Enum.reduce([${a}], 0, fn x, acc -> x + acc end)`, Rust: `println!("{}", vec![${a}].iter().sum::<i32>());` }[l];
      return numQ("Apa hasil yang tercetak?", c, l.toLowerCase(), s, `Jumlah semua elemen = ${s}.`, "Lipat daftar dengan penjumlahan."); },
  ],
  extreme: [
    () => { const a = ri(5, 40), b = ri(2, 9), op = pk(["add","sub","imul"]); const r = op === "add" ? a + b : op === "sub" ? a - b : a * b;
      return numQ("Isi register eax setelah dijalankan?", `mov eax, ${a}\n${op} eax, ${b}`, "asm", r, `${a} ${op} ${b} = ${r}.`, "Hitung langkah demi langkah."); },
    () => { const a = ri(2, 9), b = ri(2, 9), c = ri(2, 5), o1 = pk(["+","*"]), o2 = pk(["+","*","-"]);
      const r = (o1 === "+" ? a + b : a * b); const f = o2 === "+" ? r + c : o2 === "*" ? r * c : r - c;
      return numQ("Berapa isi stack di akhir?", `${a} ${b} ${o1} ${c} ${o2} .`, "forth", f, `Notasi postfix: (${a} ${o1} ${b}) ${o2} ${c} = ${f}.`, "Operator memakai dua angka terakhir."); },
    () => { const a = ri(2, 9), b = ri(2, 9), c = ri(2, 9); const o = pk(["+","-","*"]); const f = o === "+" ? a + b * c : o === "-" ? a - b * c : a * (b + c);
      const code = o === "*" ? `(* ${a} (+ ${b} ${c}))` : `(${o} ${a} (* ${b} ${c}))`;
      return numQ("Berapa hasil evaluasi Lisp ini?", code, "lisp", f, "Evaluasi dari kurung terdalam ke luar.", "Notasi prefix."); },
    () => { const a = ri(10, 90), b = ri(1, 9), s = pk(["add","sub"]); return numQ("Isi r0 setelah dijalankan?", `mov r0, #${a}\n${s} r0, r0, #${b}`, "asm", s === "add" ? a + b : a - b, `${s} r0, r0, #${b} mengubah r0 menjadi ${s === "add" ? a + b : a - b}.`, "Format ARM: tujuan, sumber, nilai."); },
  ],
  hell: [
    () => { for (;;) { const ch = ri(65, 88), a = ri(5, 12), b = ri(5, 12), r = ch - a * b; if (r < 0 || r > 12) continue;
      let code = rep("+", a) + "[>" + rep("+", b) + "<-]>" + rep("+", r) + "."; let ans = String.fromCharCode(ch);
      if (rnd() < 0.5) { const d = ri(1, 2); code += rep("+", d) + "."; ans += String.fromCharCode(ch + d); }
      const out = bf(code).out; if (out !== ans) continue;
      const alt = (s, k) => s.split("").map((c) => String.fromCharCode(c.charCodeAt(0) + k)).join("");
      return withOpts("output", "Apa output program Brainfuck ini?", code, "brainfuck", out, [alt(out, 1), alt(out, -1), alt(out, 2)], `Loop menghitung ${a}x${b}, ditambah ${r}, lalu dicetak sebagai ASCII.`, "Hitung isi sel lalu ubah ke ASCII."); } },
    () => { const a = ri(3, 15), b = ri(3, 15), code = rep("+", a) + "[>" + rep("+", b) + "<-]>"; const v = bf(code.slice(0, -1) + ">").cell;
      return numQ("Berapa nilai sel yang ditunjuk pointer di akhir program?", code, "brainfuck", v, `Loop menambah ${b} sebanyak ${a} kali = ${v}.`, "Perkalian lewat loop."); },
    () => { const R = ["eax","ecx","edx","ebx","esp","ebp","esi","edi"], r = ri(0, 7), k = ri(0, 4);
      let hex, ans, wr;
      if (k === 0) { hex = (0x50 + r).toString(16).toUpperCase(); ans = `push ${R[r]}`; wr = [`pop ${R[r]}`, `push ${R[(r + 1) % 8]}`]; }
      else if (k === 1) { hex = (0x58 + r).toString(16).toUpperCase(); ans = `pop ${R[r]}`; wr = [`push ${R[r]}`, `pop ${R[(r + 2) % 8]}`]; }
      else if (k === 2) { hex = (0x40 + r).toString(16).toUpperCase(); ans = `inc ${R[r]}`; wr = [`dec ${R[r]}`, `inc ${R[(r + 1) % 8]}`]; }
      else if (k === 3) { hex = (0x48 + r).toString(16).toUpperCase(); ans = `dec ${R[r]}`; wr = [`inc ${R[r]}`, `dec ${R[(r + 3) % 8]}`]; }
      else { const v = ri(1, 255); hex = `B8 ${v.toString(16).toUpperCase().padStart(2, "0")} 00 00 00`; ans = `mov eax, ${v}`; wr = [`mov ebx, ${v}`, `mov eax, ${v + 1}`]; }
      return withOpts("output", "Apa arti byte mesin x86 ini?", hex, "text", ans, wr, "Opcode x86: 50-57 push, 58-5F pop, 40-47 inc, 48-4F dec, B8 mov eax.", "Lihat tabel opcode."); },
    () => { const k = ri(0, 2);
      if (k === 0) { const c = ri(65, 90); return withOpts("output", "Karakter ASCII apa ini?", c.toString(2).padStart(8, "0"), "text", String.fromCharCode(c), [String.fromCharCode(c + 1), String.fromCharCode(c - 1)], `Biner ${c} adalah '${String.fromCharCode(c)}'.`, "A = 65."); }
      if (k === 1) { const n = ri(16, 255); return numQ("Berapa nilai desimalnya?", "0x" + n.toString(16).toUpperCase(), "text", n, `0x${n.toString(16).toUpperCase()} = ${n}.`, "Digit pertama dikali 16."); }
      const n = ri(16, 255); return numQ("Berapa nilai desimal biner ini?", n.toString(2).padStart(8, "0"), "text", n, `Biner tersebut bernilai ${n}.`, "Jumlahkan bit yang menyala."); },
  ],
};
// ---- Soal berbasis katalog: tebak, lengkapi, valid/error ----
const H = { ri, pk, rep, cap };
const byLv = (lv) => CATALOG.filter((e) => e[2] === lv);
const ERR = { str: "Error: string tidak ditutup", par: "Error: tanda kurung tidak seimbang", name: "Error: nama fungsi atau kata kunci tidak dikenal", entry: "Error: titik masuk program tidak ditemukan" };
const NOVALID = new Set(["HTML", "CSS", "BASIC", "Bootstrap", "Tailwind CSS", "Alpine.js", "htmx", "Svelte"]);
function catQ(lv, e, kind) {
  e = e || pk(byLv(lv)); kind = kind || pk(["guess", "guess", "guess", "fill", "valid"]);
  const [name, year, , hl, note, kw, fn] = e;
  const code = fn(pk(W), pk(N), pk(P), ri(2, 99), H);
  const hint = `Dirilis sekitar tahun ${year}.`;
  const prompt = lv === "normal" ? "Framework atau pustaka apa ini?" : "Bahasa apa ini?";
  if (kind === "fill" && kw && code.includes(kw)) {
    const others = [...new Set(byLv(lv).map((x) => x[5]).filter((k) => k && k !== kw))];
    const o = shuf([kw, ...shuf(others).slice(0, 2)]);
    return ["fill", `Lengkapi kode ${name} ini agar valid`, code.replace(kw, "____"), hl, o, o.indexOf(kw), `${kw} adalah bagian khas ${name}. ${note}`, hint];
  }
  const re = /(["'])([^"'\n]*)\1/;
  if (kind === "valid" && lv !== "hell" && !NOVALID.has(name)) {
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
  return guess(lv, name, code, hl, `${name}: ${note}`, hint, prompt);
}
for (const lv of Object.keys(T)) for (let i = 0; i < 4; i++) T[lv].push(() => catQ(lv));

// ---- Terjemahan Inggris: prompt, penjelasan, hint, dan pilihan (kode & angka tidak berubah) ----
const NOTE_MAP = new Map(CATALOG.map((e) => [e[4], NOTES_EN[e[0]]]));
const RULES = [
  [/^Apa output kode ini\?$/, "What is the output of this code?"], [/^Apa output program Brainfuck ini\?$/, "What does this Brainfuck program output?"],
  [/^Berapa nilai yang tercetak\?$/, "What value is printed?"], [/^Berapa nilai total di akhir\?$/, "What is the final value of total?"],
  [/^Apa yang tampil di layar\?$/, "What appears on screen?"], [/^Apa hasil yang tercetak\?$/, "What result is printed?"],
  [/^Isi register eax setelah dijalankan\?$/, "What is in register eax after running?"], [/^Isi r0 setelah dijalankan\?$/, "What is in r0 after running?"],
  [/^Berapa isi stack di akhir\?$/, "What is on the stack at the end?"], [/^Berapa hasil evaluasi Lisp ini\?$/, "What does this Lisp expression evaluate to?"],
  [/^Berapa nilai sel yang ditunjuk pointer di akhir program\?$/, "What is the value of the cell under the pointer at the end?"],
  [/^Apa arti byte mesin x86 ini\?$/, "What do these x86 machine bytes mean?"], [/^Karakter ASCII apa ini\?$/, "Which ASCII character is this?"],
  [/^Berapa nilai desimalnya\?$/, "What is its decimal value?"], [/^Berapa nilai desimal biner ini\?$/, "What is the decimal value of this binary number?"],
  [/^Framework atau pustaka apa ini\?$/, "Which framework or library is this?"], [/^Bahasa apa ini\?$/, "Which language is this?"],
  [/^Lengkapi kode (.+) ini agar valid$/, "Complete this $1 code so it is valid"], [/^Apakah kode (.+) ini valid\?$/, "Is this $1 code valid?"],
  [/^Valid, struktur kodenya lengkap$/, "Valid, the code structure is complete"], [/^Error: string tidak ditutup$/, "Error: unterminated string"],
  [/^Error: tanda kurung tidak seimbang$/, "Error: unbalanced parentheses"], [/^Error: nama fungsi atau kata kunci tidak dikenal$/, "Error: unknown function or keyword name"],
  [/^Error: titik masuk program tidak ditemukan$/, "Error: program entry point not found"],
  [/^Tanda kutip penutup hilang sehingga literal string tidak lengkap\.$/, "The closing quote is missing, so the string literal is incomplete."],
  [/^Ada kurung tutup yang hilang sehingga kurung tidak seimbang\.$/, "A closing parenthesis is missing, so the parentheses are unbalanced."],
  [/^"(.+)" salah ketik menjadi "(.+)" sehingga tidak dikenal oleh (.+)\.$/, '"$1" was misspelled as "$2", so $3 does not recognize it.'],
  [/^Kode (.+?) ini lengkap dan valid\. (.*)$/, "This $1 code is complete and valid. $2"], [/^(.+?) adalah bagian khas (.+?)\. (.*)$/, "$1 is characteristic of $2. $3"],
  [/^Dirilis sekitar tahun (\d+)\.$/, "Released around $1."], [/^(.+) di Python\.$/, "$1 in Python."], [/^Hitung dengan teliti\.$/, "Calculate carefully."],
  [/^Panjang "(.+)" adalah (\d+)\.$/, 'The length of "$1" is $2.'], [/^Hitung hurufnya\.$/, "Count the letters."], [/^Tanpa spasi\.$/, "No spaces."],
  [/^repeat\((\d+)\) mengulang string (\d+) kali\.$/, "repeat($1) repeats the string $2 times."], [/^Jumlah 0 sampai (\d+) = (\d+)\.$/, "The sum of 0 through $1 = $2."],
  [/^range berhenti sebelum n\.$/, "range stops before n."], [/^List comprehension mengalikan setiap elemen\.$/, "The list comprehension multiplies each element."],
  [/^range mulai dari 0\.$/, "range starts at 0."], [/^map lalu join dengan tanda hubung\.$/, "map, then join with a hyphen."], [/^Perhatikan pemisah join\.$/, "Watch the join separator."],
  [/^Ada (\d+) elemen lebih dari (\d+)\.$/, "There are $1 elements greater than $2."], [/^Hitung yang lolos filter\.$/, "Count the ones that pass the filter."],
  [/^n adalah angka, jadi (.+)\.$/, "n is a number, so $1."], [/^Tipe number\.$/, "Number type."],
  [/^\*\(a \+ (\d+)\) sama dengan a\[(\d+)\] = (\d+)\.$/, "*(a + $1) equals a[$2] = $3."], [/^Indeks mulai dari 0\.$/, "Indexes start at 0."],
  [/^Jumlah semua elemen = (\d+)\.$/, "The sum of all elements = $1."], [/^Lipat daftar dengan penjumlahan\.$/, "Fold the list with addition."],
  [/^Hitung langkah demi langkah\.$/, "Calculate step by step."], [/^Notasi postfix: (.*)$/, "Postfix notation: $1"], [/^Operator memakai dua angka terakhir\.$/, "An operator uses the last two numbers."],
  [/^Evaluasi dari kurung terdalam ke luar\.$/, "Evaluate from the innermost parentheses outward."], [/^Notasi prefix\.$/, "Prefix notation."],
  [/^(.+) mengubah r0 menjadi (\d+)\.$/, "$1 changes r0 to $2."], [/^Format ARM: tujuan, sumber, nilai\.$/, "ARM format: destination, source, value."],
  [/^Loop menghitung (\d+)x(\d+), ditambah (\d+), lalu dicetak sebagai ASCII\.$/, "The loop computes $1x$2, plus $3, then prints it as ASCII."],
  [/^Hitung isi sel lalu ubah ke ASCII\.$/, "Compute the cell value, then convert it to ASCII."], [/^Loop menambah (\d+) sebanyak (\d+) kali = (\d+)\.$/, "The loop adds $1, $2 times = $3."],
  [/^Perkalian lewat loop\.$/, "Multiplication via a loop."], [/^Opcode x86: (.*)$/, "x86 opcodes: $1"], [/^Lihat tabel opcode\.$/, "Check the opcode table."],
  [/^Biner (\d+) adalah '(.)'\.$/, "Binary $1 is '$2'."], [/^Digit pertama dikali 16\.$/, "The first digit is multiplied by 16."],
  [/^Biner tersebut bernilai (\d+)\.$/, "That binary equals $1."], [/^Jumlahkan bit yang menyala\.$/, "Add up the set bits."],
];
function trEn(s) {
  if (s == null) return s;
  let x = String(s);
  for (const [idn, en] of NOTE_MAP) if (en && x.includes(idn)) x = x.split(idn).join(en);
  for (const [re, rep] of RULES) if (re.test(x)) return x.replace(re, rep);
  return x;
}
const ID_WORDS = /\b(yang|dengan|adalah|kode|hitung|angka|nilai|dari|pada|tidak|atau|sebagai|jumlah|lalu|setelah|karena)\b/i;
const leftovers = new Set();

const q = (s) => "'" + String(s).replace(/'/g, "''") + "'";
const TARGET = +(process.argv[2] || 300);
const counts = {}, files = {};
for (const lv of Object.keys(T)) {
  const seen = new Set(), rows = []; let tries = 0;
  const add = (r) => {
    if (!r) return false;
    const key = r[1] + r[2]; if (seen.has(key)) return false; seen.add(key);
    const pe = trEn(r[1]), ee = trEn(r[6]), he = trEn(r[7]), oe = r[4].map(trEn);
    for (const v of [[r[1], pe], [r[6], ee], [r[7], he]]) if (v[0] === v[1] && ID_WORDS.test(v[0])) leftovers.add(v[0]);
    const optsEn = oe.some((o, i) => o !== r[4][i]) ? q(JSON.stringify(oe)) + "::jsonb" : "null";
    rows.push(`(${q(lv)},${q(r[0])},${q(r[1])},${q(pe)},${q(r[2])},${q(r[3])},${q(JSON.stringify(r[4]))}::jsonb,${optsEn},${r[5]},${q(r[6])},${q(ee)},${q(r[7])},${q(he)})`);
    return true;
  };
  // Jaminan cakupan: setiap bahasa/framework di katalog muncul minimal 6 soal (4 tebak, 1 lengkapi, 1 valid)
  for (const e of byLv(lv)) for (const kind of ["guess", "guess", "guess", "guess", "fill", "valid"]) for (let k = 0; k < 8 && !add(catQ(lv, e, kind)); k++);
  while (seen.size < TARGET && tries++ < 80000) add(pk(T[lv])());
  counts[lv] = seen.size;
  files[lv] = "-- DIHASILKAN oleh scripts/gen-bulk.mjs (" + lv + ")\ninsert into questions (difficulty,type,prompt,prompt_en,code,language,options,options_en,correct_index,explanation,explanation_en,hint,hint_en) values\n" + rows.join(",\n") + ";\n";
}
console.log(counts);
if (leftovers.size) console.log("Teks belum diterjemahkan:", [...leftovers].slice(0, 15));
const missing = [...CATALOG.map((e) => e[0]), ...EXTRA.map((e) => e[0])].filter((n) => !NOTES_EN[n]);
if (missing.length) console.log("Catatan EN belum ada:", missing);
import { mkdirSync, rmSync } from "node:fs";
rmSync(new URL("../supabase/seed", import.meta.url), { recursive: true, force: true });
rmSync(new URL("../supabase/seed_bulk.sql", import.meta.url), { force: true });
mkdirSync(new URL("../supabase/seed/", import.meta.url), { recursive: true });
Object.entries(files).forEach(([lv, sql], i) => writeFileSync(new URL(`../supabase/seed/${i + 1}-${lv}.sql`, import.meta.url), sql));
// Data halaman Info & formulir
mkdirSync(new URL("../src/data/", import.meta.url), { recursive: true });
const info = [...CATALOG.map((e) => ({ name: e[0], year: e[1], level: e[2], note: e[4], noteEn: NOTES_EN[e[0]] })), ...EXTRA.map((e) => ({ name: e[0], year: e[1], level: null, note: e[2], noteEn: NOTES_EN[e[0]] }))].sort((a, b) => a.year - b.year || a.name.localeCompare(b.name));
writeFileSync(new URL("../src/data/languages.json", import.meta.url), JSON.stringify(info, null, 1));
console.log("Info:", info.length, "entri");
