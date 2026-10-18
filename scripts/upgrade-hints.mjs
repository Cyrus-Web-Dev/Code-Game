#!/usr/bin/env node
// Menulis ulang hint (Indonesia & Inggris) untuk setiap soal berdasarkan ISI soalnya.
//   node scripts/upgrade-hints.mjs
// Membaca supabase/seed/*.sql, menulis ulang file itu (instalasi baru) dan membuat supabase/hints/*.sql
// (UPDATE untuk database yang sudah berisi soal; mencocokkan soal lewat md5(prompt || '|' || code)).
import { readFileSync, writeFileSync, readdirSync, mkdirSync, rmSync } from "node:fs";
import { createHash } from "node:crypto";
import { CLUES } from "./hint-clues.mjs";

const root = new URL("../supabase/", import.meta.url);
const unq = (raw) => { const m = /^'((?:[^']|'')*)'(::jsonb)?$/s.exec(raw.trim()); return m ? m[1].replace(/''/g, "'") : raw.trim(); };
const esc = (s) => "'" + s.replace(/'/g, "''") + "'";
const md5 = (s) => createHash("md5").update(s, "utf8").digest("hex");

export function parseSeed(text) {
  const start = text.indexOf("values\n") + 7, head = text.slice(0, start), body = text.slice(start), rows = [];
  let i = 0;
  while (i < body.length) {
    while (i < body.length && body[i] !== "(" && body[i] !== ";") i++;
    if (i >= body.length || body[i] === ";") break;
    i++;
    const f = []; let cur = "", q = false;
    for (; i < body.length; i++) {
      const c = body[i];
      if (q) { cur += c; if (c === "'") { if (body[i + 1] === "'") { cur += "'"; i++; } else q = false; } continue; }
      if (c === "'") { q = true; cur += c; continue; }
      if (c === ",") { f.push(cur); cur = ""; continue; }
      if (c === ")") { f.push(cur); i++; break; }
      cur += c;
    }
    rows.push(f);
  }
  return { head, rows };
}
export const buildSeed = (head, rows) => head + rows.map((f) => `(${f.join(",")})`).join(",\n") + ";\n";

const OP = { "+": ["menjumlahkan", "adds"], "-": ["mengurangkan (a dikurangi b)", "subtracts (a minus b)"], "*": ["mengalikan", "multiplies"], "//": ["membagi lalu membulatkan ke bawah (pembagian bulat)", "divides and rounds down (integer division)"], "%": ["memberi sisa pembagian (a dibagi b)", "gives the remainder of the division (a divided by b)"] };
const ASM = { add: ["+", "penjumlahan", "addition"], sub: ["-", "pengurangan", "subtraction"], imul: ["×", "perkalian", "multiplication"] };
const nums = (s) => s.split(",").map(Number);
const calc = (a, o, b) => (o === "+" ? a + b : o === "-" ? a - b : a * b);

function outputHint(code, prompt) {
  let m;
  if (/x86/.test(prompt)) return ["Rentang opcode: 50-57 push, 58-5F pop, 40-47 inc, 48-4F dec; urutan register: eax, ecx, edx, ebx, esp, ebp, esi, edi. Kurangi byte pertama dengan awal rentang untuk mendapat nomor register. Byte B8 + angka 32-bit berarti mov eax, nilai.", "Opcode ranges: 50-57 push, 58-5F pop, 40-47 inc, 48-4F dec; register order: eax, ecx, edx, ebx, esp, ebp, esi, edi. Subtract the range start from the first byte to get the register number. Byte B8 + a 32-bit number means mov eax, value."];
  if (/^[01]{8}$/.test(code) && /ASCII/.test(prompt)) return ["Ubah biner ke desimal (bobot tiap posisi: 128, 64, 32, 16, 8, 4, 2, 1), lalu cocokkan ke tabel ASCII: A = 65, B = 66, dan seterusnya.", "Convert the binary to decimal (position weights 128, 64, 32, 16, 8, 4, 2, 1), then match it to the ASCII table: A = 65, B = 66, and so on."];
  if (/^[01]{8}$/.test(code)) return ["Jumlahkan bobot posisi yang bernilai 1 dari kiri ke kanan: 128, 64, 32, 16, 8, 4, 2, 1.", "Add the weights of the positions holding a 1, from left to right: 128, 64, 32, 16, 8, 4, 2, 1."];
  if (/^0x[0-9A-F]+$/.test(code)) return ["Heksadesimal: digit pertama dikali 16, lalu tambahkan digit kedua (A = 10, B = 11, ... F = 15).", "Hexadecimal: multiply the first digit by 16, then add the second digit (A = 10, B = 11, ... F = 15)."];
  if ((m = /^a = (\d+)\nb = (\d+)\nprint\(a (\+|-|\*|\/\/|%) b\)$/.exec(code))) return [`Ganti a dengan ${m[1]} dan b dengan ${m[2]}. Operator ${m[3]} ${OP[m[3]][0]}.`, `Replace a with ${m[1]} and b with ${m[2]}. The ${m[3]} operator ${OP[m[3]][1]}.`];
  if ((m = /^console\.log\("(.+)"\.length\)$/.exec(code))) return [`Hitung jumlah huruf di antara tanda kutip ("${m[1]}"); tanda kutipnya sendiri tidak dihitung.`, `Count the letters between the quotes ("${m[1]}"); the quotes themselves do not count.`];
  if ((m = /^console\.log\("(.+)"\.repeat\((\d+)\)\)$/.exec(code))) return [`repeat(${m[2]}) menyambung string "${m[1]}" sebanyak ${m[2]} kali, tanpa spasi di antaranya.`, `repeat(${m[2]}) joins the string "${m[1]}" ${m[2]} times, with no spaces between.`];
  if ((m = /^total = 0\nfor i in range\((\d+)\):\n    total \+= i\nprint\(total\)$/.exec(code))) return [`total mulai dari 0 lalu ditambah i pada tiap putaran. i bernilai 0 sampai ${m[1] - 1} (range berhenti sebelum ${m[1]}). Jumlahkan semua nilai i.`, `total starts at 0 and gets i added on every pass. i runs from 0 to ${m[1] - 1} (range stops before ${m[1]}). Add up all the values of i.`];
  if ((m = /^print\(\[x \* (\d+) for x in range\((\d+)\)\]\)$/.exec(code))) return [`range(${m[2]}) menghasilkan 0 sampai ${m[2] - 1}. Kalikan tiap angka dengan ${m[1]}, lalu tulis hasilnya sebagai daftar dalam kurung siku.`, `range(${m[2]}) yields 0 through ${m[2] - 1}. Multiply each number by ${m[1]}, then write the results as a list in square brackets.`];
  if ((m = /^console\.log\(\[([\d,]+)\]\.map\(x => x \* (\d+)\)\.join\("(.*)"\)\)$/.exec(code))) return [`map mengalikan setiap elemen dengan ${m[2]}; join menyatukan hasilnya dengan pemisah "${m[3]}". Perhatikan pemisahnya.`, `map multiplies every element by ${m[2]}; join glues the results together with the separator "${m[3]}". Watch the separator.`];
  if ((m = /^const a = \[([\d,]+)\];\nconsole\.log\(a\.filter\(x => x > (\d+)\)\.length\);$/.exec(code))) return [`Periksa tiap elemen dan hitung hanya yang LEBIH BESAR dari ${m[2]} (yang sama dengan ${m[2]} tidak dihitung). length adalah banyaknya elemen yang lolos.`, `Check each element and count only those GREATER than ${m[2]} (equal to ${m[2]} does not count). length is the number of elements that pass.`];
  if (/^const \[n\] = useState\(5\)/.test(code)) return ["n bernilai angka 5. Operator + pada dua angka menjumlahkan, bukan menyambung teks.", "n holds the number 5. The + operator on two numbers adds them; it does not join text."];
  if ((m = /^int a\[\] = \{([\d,]+)\};\nprintf\("%d", \*\(a \+ (\d+)\)\);$/.exec(code))) return [`*(a + ${m[2]}) berarti elemen pada indeks ${m[2]}. Indeks dimulai dari 0, jadi itu elemen ke-${+m[2] + 1} dari kiri.`, `*(a + ${m[2]}) means the element at index ${m[2]}. Indexes start at 0, so that is element number ${+m[2] + 1} from the left.`];
  if ((m = /^int a\[\] = \{([\d,]+)\};\nprintf\("%d", a\[(\d+)\] \+ a\[(\d+)\]\);$/.exec(code))) return [`Ambil elemen pada indeks ${m[2]} dan ${m[3]} (indeks mulai dari 0), lalu jumlahkan keduanya.`, `Take the elements at index ${m[2]} and ${m[3]} (indexes start at 0), then add them.`];
  if ((m = /^print \$ foldr \(\+\) 0 \[([\d,]+)\]$/.exec(code)) || (m = /^IO\.puts Enum\.reduce\(\[([\d,]+)\], 0, fn x, acc -> x \+ acc end\)$/.exec(code)) || (m = /^println!\("\{\}", vec!\[([\d,]+)\]\.iter\(\)\.sum::<i32>\(\)\);$/.exec(code))) { const n = nums(m[1]); return [`Jumlahkan semua angka dalam daftar satu per satu. Dua angka pertama: ${n[0]} + ${n[1]} = ${n[0] + n[1]}.`, `Add up every number in the list one by one. The first two: ${n[0]} + ${n[1]} = ${n[0] + n[1]}.`]; }
  if ((m = /^mov eax, (\d+)\n(add|sub|imul) eax, (\d+)$/.exec(code))) { const o = ASM[m[2]]; return [`mov mengisi eax dengan ${m[1]}. Lalu ${m[2]} (${o[1]}) memakai ${m[3]}: ${m[1]} ${o[0]} ${m[3]}.`, `mov loads eax with ${m[1]}. Then ${m[2]} (${o[2]}) uses ${m[3]}: ${m[1]} ${o[0]} ${m[3]}.`]; }
  if ((m = /^mov r0, #(\d+)\n(add|sub) r0, r0, #(\d+)$/.exec(code))) { const s = m[2] === "add" ? "+" : "-"; return [`mov memuat ${m[1]} ke r0, lalu ${m[2]} mengubah r0 dengan ${m[3]}: ${m[1]} ${s} ${m[3]}. Format ARM: tujuan, sumber, nilai.`, `mov loads ${m[1]} into r0, then ${m[2]} changes r0 by ${m[3]}: ${m[1]} ${s} ${m[3]}. ARM format: destination, source, value.`]; }
  if ((m = /^(\d+) (\d+) ([+*]) (\d+) ([+*-]) \.$/.exec(code))) { const r = calc(+m[1], m[3], +m[2]); return [`Notasi postfix: operator bekerja pada dua angka terakhir di stack. Langkah pertama: ${m[1]} ${m[3]} ${m[2]} = ${r}; hasilnya dipakai bersama ${m[4]} pada operator terakhir.`, `Postfix notation: an operator works on the last two numbers on the stack. First step: ${m[1]} ${m[3]} ${m[2]} = ${r}; that result is used with ${m[4]} by the last operator.`]; }
  if ((m = /^\(([+*-]) (\d+) \(([+*]) (\d+) (\d+)\)\)$/.exec(code))) { const r = calc(+m[4], m[3], +m[5]); return [`Hitung dari kurung terdalam: (${m[3]} ${m[4]} ${m[5]}) = ${r}, lalu pakai hasilnya pada operasi luar bersama ${m[2]}. Notasi prefix: operator ditulis lebih dulu.`, `Work from the innermost parentheses: (${m[3]} ${m[4]} ${m[5]}) = ${r}, then use that result in the outer operation together with ${m[2]}. Prefix notation: the operator comes first.`]; }
  if ((m = /^(\+*)\[>(\+*)<-\]>(\+*)\.(?:(\+*)\.)?$/.exec(code))) { const a = m[1].length, b = m[2].length, r = m[3].length, d = m[4]?.length;
    return [`Loop menambah ${b} ke sel kedua sebanyak ${a} kali, lalu ditambah ${r} lagi. Hasil akhirnya dicetak sebagai karakter ASCII (A = 65).${d ? ` Setelah itu sel dinaikkan ${d} dan dicetak lagi.` : ""}`, `The loop adds ${b} to the second cell ${a} times, then ${r} more. The final value is printed as an ASCII character (A = 65).${d ? ` Afterwards the cell is raised by ${d} and printed again.` : ""}`]; }
  if ((m = /^(\+*)\[>(\+*)<-\]>$/.exec(code))) return [`Loop berjalan ${m[1].length} kali (sel pertama dikurangi 1 tiap putaran) dan setiap putaran menambah ${m[2].length} ke sel kedua. Pointer berakhir di sel kedua.`, `The loop runs ${m[1].length} times (the first cell drops by 1 each pass) and every pass adds ${m[2].length} to the second cell. The pointer ends on the second cell.`];
  return null;
}

function buildHint(row) {
  const [lv, type, prompt, , code, , opts, , ci, expl, , hint] = row.map(unq);
  const options = JSON.parse(opts), ans = options[+ci], oldHint = hint;
  const year = /(\d{4})/.exec(oldHint)?.[1];
  const clueOf = (n) => CLUES[n];
  if (type === "guess") { const c = clueOf(ans); if (!c) return null; return [`${c[0]}${year ? ` (Muncul sekitar tahun ${year}.)` : ""}`, `${c[1]}${year ? ` (First appeared around ${year}.)` : ""}`]; }
  if (type === "fill") {
    const name = /^Lengkapi kode (.+) ini agar valid$/.exec(prompt)?.[1] ?? "", c = clueOf(name); if (!c) return null;
    // petunjuk bahasa tidak boleh menyebut kata yang dicari: samarkan kemunculannya
    const mask = (t) => t.split(ans).join("…");
    const len = ans.length, ends = len >= 4 ? [` dan diakhiri "${ans.at(-1)}"`, ` and ends with "${ans.at(-1)}"`] : ["", ""];
    return [`Kata yang hilang terdiri dari ${len} karakter, diawali "${ans[0]}"${ends[0]}. Ciri bahasa ini: ${mask(c[0])}`, `The missing word has ${len} characters, starts with "${ans[0]}"${ends[1]}. About this language: ${mask(c[1])}`];
  }
  if (type === "valid") {
    const name = /^Apakah kode (.+) ini valid\?$/.exec(prompt)?.[1] ?? "", c = clueOf(name); if (!c) return null;
    if (/Tanda kutip penutup hilang/.test(expl)) return [`Telusuri setiap string di kode ${name} ini: apakah tiap tanda kutip pembuka punya pasangan penutup? Ingat: ${c[0]}`, `Trace every string in this ${name} code: does each opening quote have a closing one? Remember: ${c[1]}`];
    if (/kurung tutup yang hilang/.test(expl)) return [`Hitung pasangan kurung: setiap '(' harus punya ')'. Periksa terutama baris yang memanggil fungsi. Ingat: ${c[0]}`, `Count the parentheses: every '(' needs a ')'. Look especially at the line that calls a function. Remember: ${c[1]}`];
    const t = /menjadi "(.+)" sehingga/.exec(expl)?.[1];
    if (t) return [`Periksa ejaan nama fungsi atau kata kunci utamanya (di sini tertulis "${t}"). Apakah persis sama dengan yang dikenal ${name}? Ingat: ${c[0]}`, `Check the spelling of the main function or keyword (here it reads "${t}"). Does it match exactly what ${name} recognizes? Remember: ${c[1]}`];
    return [`Tidak semua kode di sini pasti salah. Periksa tanda kutip, kurung, dan ejaan kata kunci; bila semuanya lengkap, jawabannya "valid". Ingat: ${c[0]}`, `Not every code here is necessarily broken. Check the quotes, parentheses, and keyword spelling; if everything is complete, the answer is "valid". Remember: ${c[1]}`];
  }
  const o = outputHint(code, prompt);
  return o ?? ["Jalankan kode langkah demi langkah: tulis nilai tiap variabel di setiap baris, lalu hitung hasil akhirnya.", "Run the code step by step: write down each variable's value on every line, then work out the final result."];
}

// ───────────────────────────────── eksekusi ─────────────────────────────────
if (process.argv[1] && process.argv[1].endsWith("upgrade-hints.mjs")) {
  const dir = new URL("seed/", root), files = readdirSync(dir).filter((f) => f.endsWith(".sql")).sort();
  rmSync(new URL("hints/", root), { recursive: true, force: true }); mkdirSync(new URL("hints/", root), { recursive: true });
  let total = 0, fallback = 0; const leaks = [], seen = new Set(), names = new Map();
  for (const file of files) {
    const text = readFileSync(new URL(file, dir), "utf8"), { head, rows } = parseSeed(text);
    if (buildSeed(head, rows) !== text) throw new Error("Round-trip gagal untuk " + file); // parser harus lossless
    const upd = [], lens = [];
    for (const f of rows) {
      const h = buildHint(f); total++;
      if (!h) { fallback++; continue; }
      const [type, prompt, code, lv] = [unq(f[1]), unq(f[2]), unq(f[4]), unq(f[0])];
      const opts = JSON.parse(unq(f[6])), ans = opts[+unq(f[8])];
      for (const [i, t] of [[0, "id"], [1, "en"]]) if ((type === "guess" || type === "fill") && ans.length > 2 && new RegExp("(^|[^A-Za-z0-9])" + ans.replace(/[.*+?^${}()|[\]\\]/g, "\\$&") + "([^A-Za-z0-9]|$)", "i").test(h[i])) leaks.push([ans, t, h[i].slice(0, 90)]);
      f[11] = esc(h[0]); f[12] = esc(h[1]);
      const key = md5(prompt + "|" + code); if (seen.has(lv + key)) throw new Error("kunci ganda"); seen.add(lv + key);
      upd.push(`(${esc(key)},${esc(h[0])},${esc(h[1])})`); lens.push(h[0].length); names.set(h[0], (names.get(h[0]) ?? 0) + 1);
    }
    writeFileSync(new URL(file, dir), buildSeed(head, rows));
    const lv = unq(rows[0][0]);
    writeFileSync(new URL(`hints/${file}`, root), `-- Memperbarui hint soal ${lv} yang sudah ada (cocok lewat md5(prompt || '|' || code)). Aman diulang.\nupdate questions q set hint = v.h, hint_en = v.he\nfrom (values\n${upd.join(",\n")}\n) as v(k, h, he)\nwhere q.difficulty = '${lv}' and md5(q.prompt || '|' || q.code) = v.k;\n\n-- Cek: kolom hint_baru harus sama dengan total. Bila lebih kecil, sebagian soal tidak cocok (mis. teks soal diubah) dan hint lamanya tetap dipakai.\nselect count(*) as total, count(*) filter (where length(hint) >= ${Math.min(...lens)}) as hint_baru from questions where difficulty = '${lv}';\n`);
  }
  console.log({ total, tanpaPetunjukBaru: fallback, hintUnik: names.size });
  if (leaks.length) { console.log("KEBOCORAN NAMA JAWABAN:", leaks.length); console.log([...new Set(leaks.map((l) => l[0]))].join(", ")); }
}
