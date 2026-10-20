// Backend — SQL (dijalankan di SQLite 3.45), indeks, isolasi transaksi.
import { rnd, ri, pk, shuf, sample, chance, mk, runSQL, fmtRows, perturb } from "./engine.mjs";

const NAMA = ["Ayu", "Budi", "Citra", "Dedi", "Eka", "Fajar", "Gita", "Hana"], KOTA = ["Padang", "Medan", "Bandung"];
function data() {
  const np = ri(5, 6), ids = Array.from({ length: np }, (_, i) => i + 1), nm = sample(NAMA, np);
  const pel = ids.map((id, i) => [id, nm[i], chance(0.18) ? null : pk(KOTA)]);
  const no = ri(7, 9), ord = Array.from({ length: no }, (_, i) => [i + 1, chance(0.14) ? null : pk(ids.slice(0, np - 1)), ri(2, 9) * 10, pk(["lunas", "lunas", "batal", "baru"])]);
  const v = (x) => (x === null ? "NULL" : typeof x === "number" ? x : `'${x}'`);
  const setup = `create table pelanggan(id int, nama text, kota text);\ncreate table pesanan(id int, pelanggan_id int, total int, status text);\n` + pel.map((r) => `insert into pelanggan values(${r.map(v).join(",")});`).join("\n") + "\n" + ord.map((r) => `insert into pesanan values(${r.map(v).join(",")});`).join("\n");
  const show = `-- pelanggan(id, nama, kota)\n${pel.map((r) => `(${r.map((x) => (x === null ? "NULL" : x)).join(", ")})`).join(" ")}\n-- pesanan(id, pelanggan_id, total, status)\n${ord.map((r) => `(${r.map((x) => (x === null ? "NULL" : x)).join(", ")})`).join(" ")}`;
  return { setup, show };
}
const run = (d, q) => { const r = runSQL(d.setup, q); return r ? fmtRows(r) : null; };
const mkq = (d, q, alts, expl, hint, prompt = "Apa hasil query ini?") => {
  const c = run(d, q); if (c === null) return null;
  const a = alts.map((x) => run(d, x)).filter((x) => x !== null && x !== c);
  const extra = perturb(c); while (a.length < 2 && extra.length) a.push(extra.shift());
  return mk("output", prompt, `${d.show}\n\n${q}`, "sql", c, a, `${expl} Hasil: ${c}.`, hint);
};

export const sqlJoin = {
  id: "be-sql-join",
  gen: async () => {
    const d = data(), t = ri(0, 6), st = pk(["lunas", "baru"]), k = ri(1, 2);
    const T = [
      () => mkq(d, `SELECT COUNT(*) FROM pelanggan p\nLEFT JOIN pesanan o ON o.pelanggan_id = p.id\nWHERE o.status = '${st}';`, [`SELECT COUNT(*) FROM pelanggan p LEFT JOIN pesanan o ON o.pelanggan_id = p.id AND o.status = '${st}'`, `SELECT COUNT(*) FROM pelanggan p JOIN pesanan o ON o.pelanggan_id = p.id`, `SELECT COUNT(*) FROM pesanan WHERE status='${st}'`], "Kondisi pada tabel kanan di WHERE membuang baris NULL hasil LEFT JOIN sehingga ia berperilaku seperti INNER JOIN; bila kondisi ada di ON, pelanggan tanpa pesanan tetap muncul.", "WHERE atau ON — mana yang menyaring SETELAH join?"),
      () => mkq(d, `SELECT COUNT(*), COUNT(o.id), COUNT(DISTINCT p.id)\nFROM pelanggan p LEFT JOIN pesanan o ON o.pelanggan_id = p.id;`, [`SELECT COUNT(*), COUNT(p.id), COUNT(DISTINCT o.id) FROM pelanggan p LEFT JOIN pesanan o ON o.pelanggan_id = p.id`, `SELECT COUNT(o.id), COUNT(*), COUNT(DISTINCT p.id) FROM pelanggan p LEFT JOIN pesanan o ON o.pelanggan_id = p.id`, `SELECT COUNT(*), COUNT(*), COUNT(DISTINCT p.id) FROM pelanggan p LEFT JOIN pesanan o ON o.pelanggan_id = p.id`], "COUNT(*) menghitung semua baris hasil join (satu pelanggan tampil sebanyak pesanannya, atau sekali bila tak punya), COUNT(kolom) melewati NULL, COUNT(DISTINCT) menghilangkan duplikat.", "Mana yang melewati NULL?"),
      () => mkq(d, `SELECT COUNT(*) FROM pelanggan\nWHERE id NOT IN (SELECT pelanggan_id FROM pesanan);`, [`SELECT COUNT(*) FROM pelanggan WHERE NOT EXISTS (SELECT 1 FROM pesanan o WHERE o.pelanggan_id = pelanggan.id)`, `SELECT COUNT(*) FROM pelanggan WHERE id NOT IN (SELECT pelanggan_id FROM pesanan WHERE pelanggan_id IS NOT NULL)`, `SELECT COUNT(*) FROM pelanggan`], "NOT IN dengan subquery yang mengandung NULL menghasilkan UNKNOWN untuk setiap baris sehingga tidak ada yang lolos (0). NOT EXISTS atau NOT IN yang menyaring NULL berperilaku sesuai harapan.", "Apa hasil `x NOT IN (1, NULL)`?"),
      () => mkq(d, `SELECT kota, COUNT(*) AS n FROM pelanggan\nGROUP BY kota\nHAVING COUNT(*) >= ${k}\nORDER BY n DESC, kota;`, [`SELECT kota, COUNT(kota) AS n FROM pelanggan GROUP BY kota HAVING COUNT(kota) >= ${k} ORDER BY n DESC, kota`, `SELECT kota, COUNT(*) AS n FROM pelanggan WHERE kota IS NOT NULL GROUP BY kota HAVING COUNT(*) >= ${k} ORDER BY n DESC, kota`, `SELECT kota, COUNT(*) AS n FROM pelanggan GROUP BY kota HAVING COUNT(*) > ${k} ORDER BY n DESC, kota`], "GROUP BY menganggap semua NULL sebagai satu grup; COUNT(*) menghitungnya, COUNT(kota) tidak.", "Apakah NULL membentuk grup sendiri?"),
      () => mkq(d, `SELECT p.nama, SUM(o.total)\nFROM pelanggan p JOIN pesanan o ON o.pelanggan_id = p.id\nWHERE o.status <> 'batal'\nGROUP BY p.nama\nHAVING SUM(o.total) > ${ri(3, 6) * 10}\nORDER BY p.nama;`, [`SELECT p.nama, SUM(o.total) FROM pelanggan p JOIN pesanan o ON o.pelanggan_id = p.id GROUP BY p.nama HAVING SUM(o.total) > 30 ORDER BY p.nama`, `SELECT p.nama, COUNT(o.total) FROM pelanggan p JOIN pesanan o ON o.pelanggan_id = p.id WHERE o.status <> 'batal' GROUP BY p.nama ORDER BY p.nama`, `SELECT p.nama, SUM(o.total) FROM pelanggan p LEFT JOIN pesanan o ON o.pelanggan_id = p.id GROUP BY p.nama ORDER BY p.nama`], "WHERE menyaring baris SEBELUM pengelompokan; HAVING menyaring grup SESUDAH agregasi. Perhatikan status NULL tidak lolos <> 'batal'.", "Urutan eksekusi: FROM → WHERE → GROUP BY → HAVING."),
      () => mkq(d, `SELECT p.nama FROM pelanggan p\nWHERE (SELECT SUM(total) FROM pesanan o WHERE o.pelanggan_id = p.id)\n  > (SELECT AVG(total) FROM pesanan)\nORDER BY p.nama;`, [`SELECT p.nama FROM pelanggan p WHERE (SELECT MAX(total) FROM pesanan o WHERE o.pelanggan_id = p.id) > (SELECT AVG(total) FROM pesanan) ORDER BY p.nama`, `SELECT p.nama FROM pelanggan p WHERE (SELECT SUM(total) FROM pesanan o WHERE o.pelanggan_id = p.id) >= (SELECT MAX(total) FROM pesanan) ORDER BY p.nama`, `SELECT p.nama FROM pelanggan p WHERE (SELECT SUM(total) FROM pesanan o WHERE o.pelanggan_id = p.id) > (SELECT SUM(total) FROM pesanan)/2 ORDER BY p.nama`], "Subquery berkorelasi dihitung per pelanggan; pelanggan tanpa pesanan menghasilkan NULL sehingga perbandingan tidak lolos.", "Bandingkan SUM per pelanggan dengan AVG seluruh pesanan (termasuk yang pelanggan_id-nya NULL)."),
      () => mkq(d, `SELECT COUNT(*) FROM (\n  SELECT kota FROM pelanggan\n  UNION ALL\n  SELECT kota FROM pelanggan WHERE kota IS NOT NULL\n) x\nWHERE kota IS NULL OR kota <> 'Padang';`, [`SELECT COUNT(*) FROM (SELECT kota FROM pelanggan UNION SELECT kota FROM pelanggan WHERE kota IS NOT NULL) x WHERE kota IS NULL OR kota <> 'Padang'`, `SELECT COUNT(*) FROM (SELECT kota FROM pelanggan UNION ALL SELECT kota FROM pelanggan WHERE kota IS NOT NULL) x WHERE kota <> 'Padang'`, `SELECT COUNT(*) FROM (SELECT kota FROM pelanggan UNION ALL SELECT kota FROM pelanggan) x WHERE kota IS NULL OR kota <> 'Padang'`], "UNION ALL mempertahankan duplikat, UNION menghapusnya; kota <> 'Padang' bernilai UNKNOWN untuk NULL sehingga perlu IS NULL eksplisit.", "UNION vs UNION ALL; perbandingan dengan NULL tidak pernah true."),
    ];
    return T[t]();
  },
};

export const sqlWindow = {
  id: "be-sql-window",
  gen: async () => {
    const n = ri(6, 8), vals = Array.from({ length: n }, () => ri(1, 5) * 10), grp = Array.from({ length: n }, () => pk(["A", "B"]));
    const setup = `create table skor(id int, grup text, nilai int);\n` + vals.map((v, i) => `insert into skor values(${i + 1},'${grp[i]}',${v});`).join("\n");
    const show = `-- skor(id, grup, nilai)\n${vals.map((v, i) => `(${i + 1}, ${grp[i]}, ${v})`).join(" ")}`;
    const fn = pk(["RANK()", "DENSE_RANK()", "ROW_NUMBER()"]), t = ri(0, 2);
    const mkw = (f) => `SELECT id, ${f} OVER (PARTITION BY grup ORDER BY nilai DESC, id) FROM skor ORDER BY id;`;
    let q, alts;
    if (t === 0) { const f = pk(["RANK()", "DENSE_RANK()"]); q = `SELECT id, ${f} OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;`; alts = ["RANK()", "DENSE_RANK()", "ROW_NUMBER()"].filter((x) => x !== f).map((g) => `SELECT id, ${g} OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;`); }
    else if (t === 1) { q = `SELECT id, SUM(nilai) OVER (ORDER BY id) AS s FROM skor ORDER BY id;`; alts = [`SELECT id, SUM(nilai) OVER (PARTITION BY grup ORDER BY id) FROM skor ORDER BY id`, `SELECT id, SUM(nilai) OVER () FROM skor ORDER BY id`, `SELECT id, SUM(nilai) OVER (ORDER BY nilai) FROM skor ORDER BY id`]; }
    else { q = `SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;`; alts = [`SELECT id, nilai - LAG(nilai, 1, nilai) OVER (ORDER BY id) FROM skor ORDER BY id`, `SELECT id, LEAD(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) - nilai FROM skor ORDER BY id`, `SELECT id, nilai - LAG(nilai, 1, 0) OVER (PARTITION BY grup ORDER BY id) FROM skor ORDER BY id`]; }
    const d = { setup, show }; const c = run(d, q); if (!c) return null;
    const a = alts.map((x) => run(d, x)).filter((x) => x && x !== c);
    return mk("output", "Apa hasil query ini (id,nilai per baris, dipisah |)?", `${show}\n\n${q}`, "sql", c, a.length >= 2 ? a : [...a, ...perturb(c)],
      ["RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik.", "SUM() OVER (ORDER BY id) adalah jumlah kumulatif (frame default: awal sampai baris saat ini, termasuk seri pada kunci urut).", "LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama."][t] + ` Hasil: ${c}.`, "Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.");
  },
};

export const sqlRecursive = {
  id: "be-sql-cte",
  gen: async () => {
    const n = ri(5, 8), edges = []; for (let i = 2; i <= n; i++) edges.push([i, ri(1, i - 1)]);
    const setup = `create table staf(id int, atasan int);\ninsert into staf values(1,NULL);\n` + edges.map(([a, b]) => `insert into staf values(${a},${b});`).join("\n");
    const show = `-- staf(id, atasan)\n(1, NULL) ${edges.map(([a, b]) => `(${a}, ${b})`).join(" ")}`;
    const t = ri(0, 1), tgt = ri(2, n);
    const q = t === 0 ? `WITH RECURSIVE r(id, d) AS (\n  SELECT id, 0 FROM staf WHERE atasan IS NULL\n  UNION ALL\n  SELECT s.id, r.d + 1 FROM staf s JOIN r ON s.atasan = r.id\n)\nSELECT MAX(d) FROM r;` : `WITH RECURSIVE naik(id) AS (\n  SELECT ${tgt}\n  UNION ALL\n  SELECT s.atasan FROM staf s JOIN naik ON s.id = naik.id WHERE s.atasan IS NOT NULL\n)\nSELECT COUNT(*) FROM naik;`;
    const d = { setup, show }; const c = run(d, q); if (c === null) return null;
    const alt1 = t === 0 ? `WITH RECURSIVE r(id, d) AS (SELECT id, 1 FROM staf WHERE atasan IS NULL UNION ALL SELECT s.id, r.d + 1 FROM staf s JOIN r ON s.atasan = r.id) SELECT MAX(d) FROM r` : `WITH RECURSIVE naik(id) AS (SELECT ${tgt} UNION ALL SELECT s.atasan FROM staf s JOIN naik ON s.id = naik.id WHERE s.atasan IS NOT NULL) SELECT COUNT(*) - 1 FROM naik`;
    const alt2 = t === 0 ? `SELECT COUNT(*) FROM staf` : `SELECT COUNT(*) FROM staf WHERE id <= ${tgt}`;
    const a = [alt1, alt2].map((x) => run(d, x)).filter((x) => x && x !== c); const ex = perturb(c); while (a.length < 2) a.push(ex.shift());
    return mk("output", t === 0 ? "Berapa hasil query hierarki ini?" : `Berapa hasil query penelusuran ke atas dari pegawai ${tgt}?`, `${show}\n\n${q}`, "sql", c, a, t === 0 ? `Kedalaman pohon (akar = 0) dihitung rekursif; hasil maksimum ${c}.` : `Penelusuran naik menyertakan titik awal dan seluruh atasan hingga akar: ${c} baris.`, "Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.");
  },
};

// ── Indeks komposit & sargability ──
export const indexPrefix = {
  id: "be-index",
  gen: async () => {
    const t = ri(0, 1);
    if (t === 0) {
      const cols = ["negara", "kota", "umur"].slice(0, ri(3, 3)), idx = shuf(cols), ops = idx.map(() => pk(["=", "=", ">", "-"]));
      let used = 0; for (const o of ops) { if (o === "=") used++; else if (o === ">") { used++; break; } else break; }
      const preds = idx.map((c, i) => (ops[i] === "-" ? null : `${c} ${ops[i]} ${ops[i] === "=" ? "'x'" : "30"}`)).filter(Boolean); if (!preds.length) return null;
      const where = shuf(preds).join(" AND "), eqAll = ops.filter((o) => o === "=").length;
      return mk("guess", "Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?", `CREATE INDEX idx ON orang (${idx.join(", ")});\n\nSELECT * FROM orang\nWHERE ${where};`, "sql", used, [preds.length, eqAll, used + 1].filter((x) => x !== used).map(String),
        `Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: ${used}.`, "Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.");
    }
    const GOOD = ["WHERE email = 'a@x.id'", "WHERE email LIKE 'budi%'", "WHERE kode >= 100 AND kode < 200", "WHERE tgl >= '2026-01-01' AND tgl < '2026-02-01'"], BAD = ["WHERE LOWER(email) = 'a@x.id'", "WHERE email LIKE '%budi'", "WHERE kode + 1 = 150", "WHERE DATE(tgl) = '2026-01-15'", "WHERE CAST(kode AS TEXT) = '150'", "WHERE kode <> 150"];
    const g = pk(GOOD), b = sample(BAD, 2);
    return mk("guess", "Pada kolom yang diberi indeks B-tree biasa, query mana yang BISA memanfaatkan indeks (sargable)?", "-- indeks B-tree pada email, kode, dan tgl\nSELECT * FROM t\n(pilih salah satu klausa WHERE)", "sql", g, b,
      `${g} membandingkan kolom apa adanya atau dengan prefiks/rentang sehingga B-tree bisa di-seek. Membungkus kolom dengan fungsi/aritmetika, LIKE berawalan wildcard, atau <> memaksa pemindaian.`, "Apakah kolom dibiarkan 'telanjang' di sisi perbandingan?");
  },
};

// ── Isolasi transaksi ──
const ANOM = ["dirty read", "non-repeatable read", "phantom read"];
const LEVELS = { "READ UNCOMMITTED": [0, 1, 2], "READ COMMITTED": [1, 2], "REPEATABLE READ": [2], SERIALIZABLE: [] };
export const isolation = {
  id: "be-isolation",
  gen: async () => {
    const t = ri(0, 3), a = ri(1, 9) * 10, b = ri(1, 9) * 10, S = ri(10, 99) * 10;
    if (t === 0) { const lv = pk(Object.keys(LEVELS)); const set = (l) => (LEVELS[l].length ? LEVELS[l].map((i) => ANOM[i]).join(", ") : "tidak ada"); const c = set(lv); const o = Object.keys(LEVELS).filter((x) => x !== lv).map(set);
      return mk("guess", `Menurut standar SQL, anomali apa yang MASIH mungkin terjadi pada level ${lv}?`, `SET TRANSACTION ISOLATION LEVEL ${lv};`, "sql", c, o, `Standar SQL: READ UNCOMMITTED mengizinkan ketiganya; READ COMMITTED mencegah dirty read; REPEATABLE READ juga mencegah non-repeatable read; SERIALIZABLE mencegah semuanya. (Implementasi nyata, mis. PostgreSQL, bisa lebih ketat.)`, "Semakin tinggi level, semakin sedikit anomali yang tersisa."); }
    if (t === 1) { const sc = pk([
      ["T1: UPDATE akun SET saldo = saldo - 50 WHERE id = 1;  -- belum commit\nT2: SELECT saldo FROM akun WHERE id = 1;  -- melihat nilai baru\nT1: ROLLBACK;", "dirty read", "T2 membaca data yang belum di-commit lalu dibatalkan."],
      ["T1: SELECT saldo FROM akun WHERE id = 1;     -- 100\nT2: UPDATE akun SET saldo = 70 WHERE id = 1; COMMIT;\nT1: SELECT saldo FROM akun WHERE id = 1;     -- 70", "non-repeatable read", "Baris yang sama dibaca dua kali dalam satu transaksi dengan nilai berbeda."],
      ["T1: SELECT COUNT(*) FROM pesanan WHERE total > 50;   -- 3\nT2: INSERT INTO pesanan(total) VALUES (70); COMMIT;\nT1: SELECT COUNT(*) FROM pesanan WHERE total > 50;   -- 4", "phantom read", "Kumpulan baris yang memenuhi predikat berubah di antara dua pembacaan."],
      ["T1: SELECT jaga FROM dokter WHERE aktif;   -- 2 orang\nT2: SELECT jaga FROM dokter WHERE aktif;   -- 2 orang\nT1: UPDATE dokter SET aktif = false WHERE nama = 'A'; COMMIT;\nT2: UPDATE dokter SET aktif = false WHERE nama = 'B'; COMMIT;  -- 0 dokter jaga", "write skew", "Dua transaksi membaca kondisi yang sama lalu menulis baris berbeda sehingga invarian rusak; hanya SERIALIZABLE (atau penguncian eksplisit) yang mencegahnya."],
    ]); const wrong = shuf(["dirty read", "non-repeatable read", "phantom read", "write skew", "lost update"].filter((x) => x !== sc[1])).slice(0, 2);
      return mk("guess", "Anomali konkurensi apa yang terjadi pada jadwal ini?", sc[0], "sql", sc[1], wrong, sc[2], "Apa yang berubah di antara dua langkah baca, atau apa yang dibaca sebelum commit?"); }
    const lose = t === 2; const code = `-- saldo awal = ${S}, READ COMMITTED, tanpa locking\nT1: x = SELECT saldo FROM akun WHERE id = 1;       -- ${S}\nT2: y = SELECT saldo FROM akun WHERE id = 1;       -- ${S}\nT1: UPDATE akun SET saldo = x + ${a} WHERE id = 1; COMMIT;\nT2: UPDATE akun SET saldo = y + ${b} WHERE id = 1; COMMIT;`;
    if (lose) return mk("output", "Berapa saldo akhir?", code, "sql", S + b, [S + a + b, S + a, S].map(String), `Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan ${S}+${b}, sehingga tambahan ${a} dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.`, "T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.");
    return mk("guess", "Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?", code, "sql", "Gunakan UPDATE atomik (saldo = saldo + n) atau SELECT ... FOR UPDATE", ["Menambah indeks pada kolom saldo", "Mengganti COMMIT menjadi ROLLBACK"], "Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.", "Siapa yang menghitung penjumlahannya: aplikasi atau database?");
  },
};

export const BE_SQL = [sqlJoin, sqlWindow, sqlRecursive, indexPrefix, isolation];
