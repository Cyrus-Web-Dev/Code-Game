// Backend — sistem & infrastruktur: simulator algoritma (rate limit, LRU, sharding, deadlock, cron…) + soal konseptual tulis tangan.
import { rnd, ri, pk, shuf, sample, chance, mk, fmtNum, perturb } from "./engine.mjs";

const sorted = (a) => [...a].sort((x, y) => x - y);

export const rateLimit = {
  id: "be-ratelimit",
  gen: async () => {
    if (chance(0.5)) {
      const C = ri(3, 5), r = ri(1, 2); let t = 0; const ts = []; for (let i = 0; i < ri(9, 11); i++) { t += pk([0, 0, 0, 1, 1, 2, 3]); ts.push(t); }
      let tok = C, last = 0, ok = 0; for (const x of ts) { tok = Math.min(C, tok + (x - last) * r); last = x; if (tok >= 1) { tok -= 1; ok++; } }
      let ok2 = 0, tk = C; for (const x of ts) { if (tk >= 1) { tk--; ok2++; } } // tanpa isi ulang
      const code = `# Token bucket: kapasitas ${C} token, mulai penuh pada detik 0\n# isi ulang ${r} token/detik (kontinu, maksimum ${C}); tiap request memakai 1 token\nwaktu_request = ${JSON.stringify(ts)}  # detik`;
      return mk("output", "Berapa request yang DITERIMA?", code, "python", ok, [ok2, ts.length - 1, ok + 1, ok - 1].filter((x) => x !== ok).map(String), `Simulasi: token = min(${C}, token + Δt×${r}); request diterima jika token ≥ 1. Diterima ${ok} dari ${ts.length}.`, "Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.");
    }
    const L = ri(3, 5), W = pk([5, 10]); let t = 0; const ts = []; for (let i = 0; i < ri(9, 12); i++) { t += pk([0, 1, 1, 2, 3]); ts.push(t); }
    const fixed = (() => { const c = {}; let ok = 0; for (const x of ts) { const w = Math.floor(x / W); c[w] = c[w] || 0; if (c[w] < L) { c[w]++; ok++; } } return ok; })();
    const slide = (() => { const acc = []; for (const x of ts) if (acc.filter((a) => a > x - W).length < L) acc.push(x); return acc.length; })();
    if (fixed === slide) return null;
    return mk("output", `Berapa request yang diterima oleh FIXED WINDOW (jendela [0,${W}), [${W},${2 * W}), …)?`, `# batas ${L} request per ${W} detik\nwaktu_request = ${JSON.stringify(ts)}  # detik`, "python", fixed, [slide, ts.length, fixed + 1].filter((x) => x !== fixed).map(String), `Fixed window mereset hitungan pada batas kelipatan ${W} detik (menerima ${fixed}); sliding window menimbang ${W} detik terakhir (menerima ${slide}). Fixed window dapat meloloskan 2×${L} request di sekitar batas jendela.`, "Reset terjadi pada kelipatan tetap, bukan relatif terhadap tiap request.");
  },
};

export const lru = {
  id: "be-lru",
  gen: async () => {
    const cap = ri(3, 4), keys = sample("ABCDEF".split(""), 5), seq = Array.from({ length: ri(10, 12) }, () => pk(keys));
    const sim = (policy) => { let c = [], hits = 0; for (const k of seq) { const i = c.indexOf(k); if (i >= 0) { hits++; if (policy === "lru") { c.splice(i, 1); c.push(k); } } else { if (c.length >= cap) c.shift(); c.push(k); } } return { hits, c }; };
    const L = sim("lru"), F = sim("fifo"); const t = ri(0, 1);
    const ans = t === 0 ? L.hits : L.c.join(" "), wrong = t === 0 ? [F.hits, L.hits + 1, L.hits - 1] : [F.c.join(" "), [...L.c].reverse().join(" "), shuf(L.c).join(" ")];
    return mk("output", t === 0 ? "Berapa jumlah cache HIT pada cache LRU ini?" : "Isi cache LRU di akhir, dari yang paling lama dipakai ke yang paling baru?", `kapasitas = ${cap}\nakses = ${JSON.stringify(seq)}\n# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai`, "python", ans, wrong.map(String), `Simulasi LRU: hit=${L.hits}, isi akhir (lama→baru) = ${L.c.join(" ")}. Pada FIFO hit tidak memperbarui urutan (hit=${F.hits}).`, "Setiap hit memindahkan kunci ke posisi 'paling baru'.");
  },
};

export const sharding = {
  id: "be-shard",
  gen: async () => {
    const K = pk([60, 100, 120, 200]), n = ri(3, 6); let moved = 0; for (let k = 0; k < K; k++) if (k % n !== k % (n + 1)) moved++;
    return mk("output", `Berapa kunci yang PINDAH shard saat shard ditambah dari ${n} menjadi ${n + 1}?`, `# shard = kunci % jumlah_shard\nkunci = 0 .. ${K - 1}\nsebelum: shard = kunci % ${n}\nsesudah: shard = kunci % ${n + 1}`, "python", moved, [Math.round(K / (n + 1)), moved + pk([-5, -4, -3, 3, 4, 5]), moved + pk([-2, -1, 1, 2, 6, -6])].filter((x) => x !== moved && x > 0).map(String),
      `Dihitung langsung: ${moved} dari ${K} kunci berpindah. Modulo membuat hampir semua kunci pindah; consistent hashing hanya memindahkan ≈ K/(n+1) = ${Math.round(K / (n + 1))}.`, "Hitung berapa kunci yang hasil modulo-nya berubah, jangan menebak 1/n.");
  },
};

const BIGO = [
  (v) => ["O(n²)", `for i in range(${v.n}):\n    for j in range(${v.n}):\n        total += i * j`],
  (v) => ["O(log n)", `i = 1\nwhile i < ${v.n}:\n    i *= 2`],
  (v) => ["O(n²)", `for i in range(${v.n}):\n    for j in range(i):\n        work()`],
  (v) => ["O(n log n)", `for i in range(${v.n}):\n    j = 1\n    while j < ${v.n}:\n        j *= 2`],
  (v) => ["O(n)", `for i in range(${v.n}):\n    for j in range(10):\n        work()`],
  (v) => ["O(2ⁿ)", `def f(${v.n}):\n    if ${v.n} <= 1: return 1\n    return f(${v.n} - 1) + f(${v.n} - 1)`],
  (v) => ["O(log n)", `def f(${v.n}):\n    if ${v.n} <= 1: return 0\n    return 1 + f(${v.n} // 2)`],
  (v) => ["O(n·m)", `for a in daftar_a:      # n elemen\n    if a in daftar_b:   # list dengan m elemen\n        hit += 1`],
  (v) => ["O(n + m)", `set_b = set(daftar_b)    # m elemen\nfor a in daftar_a:       # n elemen\n    if a in set_b:\n        hit += 1`],
  (v) => ["O(n²)", `hasil = []\nfor i in range(${v.n}):\n    hasil.insert(0, i)`],
  (v) => ["O(n log n)", `data = sorted(${v.n}_item)\nfor x in data:\n    proses(x)`],
  (v) => ["O(n + m)", `for a in daftar_a:   # n\n    proses(a)\nfor b in daftar_b:   # m\n    proses(b)`],
  (v) => ["O(log n)", `while ${v.n} > 0:\n    ${v.n} //= 10`],
  (v) => ["O(n)", `memo = {}\ndef fib(${v.n}):\n    if ${v.n} < 2: return ${v.n}\n    if ${v.n} not in memo:\n        memo[${v.n}] = fib(${v.n} - 1) + fib(${v.n} - 2)\n    return memo[${v.n}]`],
  (v) => ["O(n²)", `for i in range(${v.n}):\n    if ${v.n} > 0 and i in hasil_list:   # list\n        hasil_list.remove(i)`],
];
const CX = ["O(1)", "O(log n)", "O(n)", "O(n log n)", "O(n²)", "O(2ⁿ)", "O(n + m)", "O(n·m)"];
export const bigO = {
  id: "be-bigo",
  gen: async () => {
    const v = { n: pk(["n", "N", "jumlah", "panjang"]) }; const [c, code] = pk(BIGO)(v);
    const pool = CX.filter((x) => x !== c && !(c.includes("m") !== x.includes("m") && rnd() < 0.5));
    return mk("guess", "Kompleksitas waktu terburuk kode ini terhadap ukuran input?", code, "python", c, sample(pool, 2), `Kompleksitas: ${c}. Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).`, "Berapa kali badan terdalam dijalankan sebagai fungsi n?");
  },
};

export const raceCounter = {
  id: "be-race",
  gen: async () => {
    const k = 2, S = ri(0, 20), steps = []; const a = ["R", "W", "R", "W"], b = ["R", "W", "R", "W"]; let ia = 0, ib = 0;
    while (ia < 4 || ib < 4) { if (ia < 4 && (ib >= 4 || chance(0.5))) steps.push(["A", a[ia++]]); else steps.push(["B", b[ib++]]); }
    let c = S; const tmp = { A: 0, B: 0 }; for (const [w, o] of steps) { if (o === "R") tmp[w] = c; else c = tmp[w] + 1; }
    const expected = S + 4; if (c === expected) return null;
    const code = `# counter awal = ${S}; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1\n# langkah berurutan (interleaving thread):\n` + steps.map(([w, o], i) => `${i + 1}. ${w}: ${o === "R" ? `tmp${w} = counter` : `counter = tmp${w} + 1`}`).join("\n");
    return mk("output", "Berapa nilai akhir counter?", code, "python", c, [expected, c + 1, c - 1].filter((x) => x !== c).map(String), `Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil ${c}, bukan ${expected}. Gunakan lock atau operasi atomik.`, "Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.");
  },
};

export const deadlock = {
  id: "be-deadlock",
  gen: async () => {
    const R = ["tabel_A", "tabel_B", "tabel_C"], nt = ri(2, 3), tx = Array.from({ length: nt }, () => shuf(R).slice(0, ri(2, 3)));
    const adj = {}; R.forEach((r) => (adj[r] = new Set())); tx.forEach((p) => p.slice(1).forEach((r, i) => adj[p[i]].add(r)));
    let cyc = null; const col = {}; const dfs = (u, path) => { col[u] = 1; for (const v of adj[u]) { if (col[v] === 1) { cyc = [...path.slice(path.indexOf(v)), v]; return; } if (!col[v]) dfs(v, [...path, v]); if (cyc) return; } col[u] = 2; };
    for (const r of R) if (!col[r] && !cyc) dfs(r, [r]);
    const code = tx.map((p, i) => `T${i + 1}: ${p.map((r) => `LOCK ${r}`).join(" → ")} → COMMIT`).join("\n") + "\n-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela";
    const yes = cyc ? `Deadlock mungkin: urutan penguncian membentuk siklus ${cyc.join(" → ")}` : null;
    const no = "Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten";
    const w1 = "Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh";
    const w2 = "Deadlock pasti terjadi pada setiap eksekusi";
    return cyc ? mk("guess", "Pernyataan mana yang benar tentang jadwal ini?", code, "sql", yes, [no, w1], `Graf urutan kunci memuat siklus ${cyc.join(" → ")}: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.`, "Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?")
      : mk("guess", "Pernyataan mana yang benar tentang jadwal ini?", code, "sql", no, [`Deadlock mungkin: ${R[0]} → ${R[1]} → ${R[0]} dapat saling menunggu bila transaksi bersilangan`, `${w2} karena transaksi berjalan bersamaan`], "Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.", "Gambar panah antar kunci; adakah siklus?");
  },
};

export const backoff = {
  id: "be-backoff",
  gen: async () => {
    const b = pk([100, 200, 250, 500]), cap = pk([1000, 2000, 3000, 5000]), r = ri(4, 7); const d = Array.from({ length: r }, (_, i) => Math.min(cap, b * 2 ** i)); const total = d.reduce((s, x) => s + x, 0);
    const nocap = Array.from({ length: r }, (_, i) => b * 2 ** i).reduce((s, x) => s + x, 0);
    if (nocap === total) return null;
    return mk("output", "Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?", `# percobaan pertama langsung; lalu ${r} percobaan ulang\nbase = ${b} ms, faktor = 2 (tanpa jitter)\ndelay_ke_i = min(${cap}, base * 2**i)   # i = 0, 1, 2, …`, "python", total, [nocap, total + d[d.length - 1], total - d[0]].filter((x) => x !== total).map(String), `Jeda: ${d.join(", ")} ms → total ${total} ms (cap ${cap} memangkas jeda besar).`, "Hitung setiap jeda dengan cap, lalu jumlahkan.");
  },
};

export const percentile = {
  id: "be-percentile",
  gen: async () => {
    const n = ri(10, 20), v = Array.from({ length: n }, () => ri(20, 900)), p = pk([50, 90, 95, 99]); const s = sorted(v), rk = Math.ceil((p / 100) * n); const ans = s[rk - 1];
    const mean = Math.round(v.reduce((a, b) => a + b, 0) / n);
    return mk("output", `Berapa p${p} latensi (ms) dengan metode nearest-rank?`, `latensi_ms = ${JSON.stringify(v)}\n# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)`, "python", ans, [mean, s[Math.min(n - 1, rk)], s[Math.max(0, rk - 2)], s[n - 1]].filter((x) => x !== ans).map(String), `N=${n}, rank=⌈${p}/100×${n}⌉=${rk} → ${ans} ms. Rata-rata (${mean}) menyembunyikan ekor latensi.`, "Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.");
  },
};

export const littleLaw = {
  id: "be-little",
  gen: async () => {
    const t = ri(0, 1), W = pk([20, 40, 50, 80, 120, 250]), lam = pk([200, 500, 800, 1200, 2000]);
    if (t === 0) { const L = (lam * W) / 1000; return mk("output", "Rata-rata request yang sedang diproses bersamaan (in-flight)?", `# hukum Little: L = λ × W\nλ = ${lam} request/detik\nW = ${W} ms rata-rata per request`, "python", fmtNum(L), [fmtNum(lam * W), fmtNum(lam / W), fmtNum(L * 2)].filter((x) => x !== fmtNum(L)), `L = ${lam} × ${W / 1000} s = ${fmtNum(L)}.`, "Samakan satuan waktu dulu: ms → detik."); }
    const P = pk([10, 20, 40, 50, 100]), tq = pk([5, 10, 20, 25, 50]), mx = (P * 1000) / tq;
    return mk("output", "Throughput maksimum (query/detik) yang bisa dilayani kolam ini?", `kolam_koneksi = ${P}\nrata-rata_query = ${tq} ms, satu koneksi menangani satu query pada satu waktu`, "python", fmtNum(mx), [fmtNum(P * tq), fmtNum(mx / 10), fmtNum(P / tq)].filter((x) => x !== fmtNum(mx)), `Tiap koneksi menyelesaikan ${1000 / tq} query/detik × ${P} koneksi = ${fmtNum(mx)} q/s.`, "Satu koneksi menyelesaikan 1000/ms query per detik.");
  },
};

// cron: *, */n, a-b, a-b/n, daftar
const parseField = (f, lo, hi) => { const out = new Set(); for (const part of f.split(",")) { const [rg, st] = part.split("/"); const step = st ? +st : 1; let a, b; if (rg === "*") [a, b] = [lo, hi]; else if (rg.includes("-")) [a, b] = rg.split("-").map(Number); else { a = +rg; b = st ? hi : a; } for (let x = a; x <= b; x += step) out.add(x); } return out; };
const CRON = ["*/15 9-17 * * 1-5", "0 */6 * * *", "30 2 * * 0", "0,30 8-12 * * *", "*/10 * * * *", "5 4 * * 1,3,5", "*/20 8-18/2 * * 1-5", "15,45 * * * 1-5", "0 0 * * 0", "*/7 22-23 * * *", "10 */4 * * 6,0", "*/30 6-9 * * 1-3"];
export const cron = {
  id: "be-cron",
  gen: async () => {
    const e = pk(CRON), [m, h, , , w] = e.split(" "), M = parseField(m, 0, 59), H = parseField(h, 0, 23), W = parseField(w, 0, 6);
    const perDay = M.size * H.size, week = perDay * W.size, t = ri(0, 1);
    const hEx = [...H].length > 1 && /-/.test(h) ? M.size * (H.size - 1) : M.size * H.size + M.size;
    return t === 0 ? mk("output", "Berapa kali job ini berjalan pada hari yang cocok (satu hari)?", `# menit jam tgl bulan hari-minggu\n${e}`, "bash", perDay, [hEx, M.size * 24, perDay + M.size].filter((x) => x !== perDay).map(String), `Menit: ${M.size} nilai × jam: ${H.size} nilai = ${perDay}. Rentang a-b bersifat inklusif; */n dihitung dari awal rentang.`, "Hitung nilai menit × nilai jam; rentang inklusif.")
      : mk("output", "Berapa kali job ini berjalan dalam satu minggu penuh (Senin–Minggu)?", `# menit jam tgl bulan hari-minggu\n${e}`, "bash", week, [perDay, perDay * 7, hEx * W.size].filter((x) => x !== week).map(String), `${perDay} kali sehari × ${W.size} hari yang cocok (0=Minggu … 6=Sabtu) = ${week}.`, "Kalikan jumlah eksekusi per hari dengan jumlah hari yang cocok.");
  },
};

export const nPlusOne = {
  id: "be-nplus1",
  gen: async () => {
    const N = pk([20, 50, 100, 200]), M = ri(3, 8), t = ri(0, 2);
    const code = [`posts = Post.objects.all()[:${N}]\nfor p in posts:\n    print(p.penulis.nama)        # relasi ForeignKey, lazy`, `posts = Post.objects.select_related("penulis")[:${N}]\nfor p in posts:\n    print(p.penulis.nama)`, `posts = Post.objects.prefetch_related("penulis")[:${N}]\nfor p in posts:\n    print(p.penulis.nama)`][t];
    const c = [1 + N, 1, 2][t];
    return mk("output", `Berapa query SQL yang dijalankan (${N} post, ${M} penulis berbeda)?`, code, "python", c, [1 + N, 1, 2, 1 + M, N].filter((x) => x !== c).map(String), ["Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.", "select_related melakukan JOIN sehingga semuanya dalam 1 query.", "prefetch_related memakai query kedua dengan WHERE id IN (...): total 2 query."][t], "Berapa query untuk daftar, dan berapa untuk relasinya?");
  },
};

// ── Status HTTP: skenario → kode ──
const ST = [
  ["Klien mengirim body JSON yang tidak bisa di-parse", "400 Bad Request"], ["Token akses kedaluwarsa atau tidak ada", "401 Unauthorized"], ["Pengguna sudah login tetapi bukan admin dan mengakses endpoint admin", "403 Forbidden"], ["Resource dengan ID tersebut tidak ada", "404 Not Found"],
  ["Mengirim DELETE ke endpoint yang hanya menerima GET dan POST", "405 Method Not Allowed"], ["Mendaftar dengan email yang sudah dipakai (konflik dengan keadaan resource)", "409 Conflict"], ["JSON valid secara sintaks tetapi field 'umur' berisi teks (gagal validasi semantik)", "422 Unprocessable Content"],
  ["Klien melampaui kuota 100 request/menit", "429 Too Many Requests"], ["POST berhasil membuat resource baru dan Location menunjuk ke resource itu", "201 Created"], ["DELETE berhasil dan tidak ada isi respons", "204 No Content"], ["Permintaan diterima tetapi akan diproses asinkron nanti", "202 Accepted"],
  ["URL dipindahkan PERMANEN ke alamat baru", "301 Moved Permanently"], ["Dialihkan sementara dan metode serta body HARUS dipertahankan", "307 Temporary Redirect"], ["Klien mengirim If-None-Match yang cocok dan konten tidak berubah", "304 Not Modified"],
  ["Gateway menerima respons rusak dari server upstream", "502 Bad Gateway"], ["Server sedang maintenance dan sementara tidak bisa melayani", "503 Service Unavailable"], ["Gateway menunggu upstream terlalu lama hingga timeout", "504 Gateway Timeout"], ["Body unggahan melebihi batas ukuran server", "413 Content Too Large"],
  ["Klien mengirim Content-Type yang tidak didukung endpoint", "415 Unsupported Media Type"], ["Header If-Match tidak cocok dengan ETag saat memperbarui (kontrol konkurensi optimis)", "412 Precondition Failed"], ["Resource sudah dihapus permanen dan tidak akan kembali", "410 Gone"], ["Terjadi pengecualian tak tertangani di kode server", "500 Internal Server Error"],
];
const GROUPS = [[400, 401, 403, 404, 405, 409, 410, 412, 413, 415, 422, 429], [200, 201, 202, 204], [301, 302, 304, 307, 308], [500, 502, 503, 504]];
export const httpStatus = {
  id: "be-http",
  gen: async () => {
    const [s, ans] = pk(ST), code = +ans.slice(0, 3), g = GROUPS.find((x) => x.includes(code)); const names = Object.fromEntries(ST.map(([, a]) => [+a.slice(0, 3), a]));
    const wr = sample(g.filter((x) => x !== code && names[x]), 2).map((x) => names[x]);
    return mk("guess", `Kode status HTTP paling tepat untuk situasi ini:\n${s}`, "# API REST", "http", ans, wr, `${ans} adalah kode yang sesuai dengan semantik situasi tersebut.`, "Cari kata kunci: salah klien (4xx) atau server (5xx)? autentikasi atau otorisasi?");
  },
};

const POOL = [
  ["Cara penyimpanan password pengguna yang benar?", "# register\nsimpan(user, ???(password))", "python", "Hash lambat berparameter dengan salt unik per pengguna (bcrypt/scrypt/argon2id)", "SHA-256 tanpa salt supaya pencarian cepat", "Enkripsi AES dengan satu kunci aplikasi agar password bisa dipulihkan", "Password harus di-hash dengan fungsi yang sengaja lambat dan bersalt agar brute force/rainbow table mahal. Enkripsi dua arah dan hash cepat tanpa salt keliru.", "Ingin bisa membaca kembali password, atau cukup memverifikasinya?"],
  ["Server menerima token ini sebagai valid. Apa kelemahannya?", "{\"alg\":\"none\",\"typ\":\"JWT\"}.{\"sub\":\"1\",\"admin\":true}.", "json", "Verifikasi tidak memaksa algoritma yang diharapkan sehingga token tanpa tanda tangan diterima", "JWT tidak boleh memuat klaim admin", "Token harus selalu dienkripsi dengan Base64", "Verifier harus menetapkan daftar algoritma yang diizinkan dan menolak 'none'. Base64 bukan enkripsi.", "Siapa yang menentukan algoritma verifikasi: header token atau server?"],
  ["Perbaikan paling tepat untuk kerentanan ini?", "db.query(\"SELECT * FROM user WHERE nama = '\" + nama + \"'\")", "javascript", "Query berparameter (prepared statement) sehingga input tidak pernah ditafsirkan sebagai SQL", "Mengganti tanda kutip tunggal dengan dua kutip secara manual di semua input", "Membatasi panjang input maksimal 20 karakter", "Parameter dikirim terpisah dari struktur query. Escape manual rawan terlewat; batas panjang tidak menutup injeksi.", "Pisahkan data dari struktur perintah."],
  ["Manakah metode HTTP yang idempoten tetapi TIDAK aman (safe)?", "GET, HEAD, PUT, DELETE, POST, PATCH", "http", "PUT dan DELETE", "GET dan HEAD", "POST dan PATCH (selalu)", "Idempoten: efek N kali sama dengan 1 kali. PUT/DELETE idempoten tetapi mengubah state (tidak safe). GET/HEAD safe. POST tidak idempoten; PATCH tidak dijamin.", "Safe berarti tidak mengubah state; idempoten berarti mengulang tidak menambah efek."],
  ["Latensi melonjak dengan galat 'timeout acquiring connection', padahal CPU database rendah. Penyebab paling mungkin?", "pool = ConnectionPool(max=20)", "python", "Kolam koneksi aplikasi habis karena koneksi/transaksi tertahan lama (mis. dipegang saat memanggil layanan eksternal)", "Terlalu banyak indeks pada tabel", "Disk database penuh", "Antrean ada di kolam koneksi, bukan di CPU DB. Lepas koneksi sebelum I/O eksternal, perpendek transaksi, atur ukuran kolam.", "Di mana antrean menunggu — aplikasi atau database?"],
  ["Apa dampak indeks ini pada query tersebut?", "CREATE INDEX idx_aktif ON user(aktif);   -- 95% baris aktif = true\nSELECT * FROM user WHERE aktif = true;", "sql", "Hampir tidak membantu: selektivitas rendah sehingga optimizer cenderung memilih full scan", "Mempercepat 20 kali lipat karena ada indeks", "Mengubah hasil query menjadi lebih sedikit", "Indeks efektif untuk predikat selektif. Mengambil 95% baris lewat indeks justru lebih mahal daripada scan berurutan.", "Seberapa sedikit baris yang dipilih predikat?"],
  ["Kapan SELECT ... FOR UPDATE dipakai?", "BEGIN;\nSELECT saldo FROM akun WHERE id = 1 FOR UPDATE;\n-- hitung di aplikasi\nUPDATE akun SET saldo = ? WHERE id = 1;\nCOMMIT;", "sql", "Mengunci baris yang dibaca sampai transaksi selesai agar baca-hitung-tulis tidak diselingi transaksi lain", "Mempercepat pembacaan dengan melewati cache", "Membuat baris menjadi read-only selamanya", "FOR UPDATE memberi kunci eksklusif pada baris terpilih hingga COMMIT/ROLLBACK, mencegah lost update pada pola read-modify-write.", "Apa yang ditahan, dan sampai kapan?"],
  ["Dua thread CPython menghitung loop CPU-bound masing-masing. Speedup yang diharapkan?", "t1 = Thread(target=hitung); t2 = Thread(target=hitung)", "python", "Nyaris tidak ada: GIL mengizinkan satu thread menjalankan bytecode pada satu waktu; gunakan multiprocessing untuk CPU-bound", "Sekitar 2x karena dua core", "Selalu 2x lebih lambat", "GIL membatasi eksekusi bytecode Python paralel. Thread tetap berguna untuk I/O-bound karena GIL dilepas saat menunggu I/O.", "Beban CPU-bound atau I/O-bound?"],
  ["Apa masalah handler async ini?", "async def handler():\n    time.sleep(2)\n    return \"ok\"", "python", "time.sleep memblokir event loop sehingga semua coroutine lain tertahan; gunakan await asyncio.sleep", "Tidak ada masalah; handler async selalu non-blokir", "await wajib dipasang sebelum return", "Kode sinkron yang memblokir di dalam coroutine menahan satu-satunya thread event loop.", "Siapa yang menjalankan semua coroutine?"],
  ["Apa output program Go ini?", "for i := 0; i < 3; i++ {\n    defer fmt.Print(i, \" \")\n}", "go", "2 1 0", "0 1 2", "3 3 3", "defer berjalan LIFO saat fungsi selesai, dan argumen dievaluasi saat defer dideklarasikan.", "Urutan tumpukan (LIFO)."],
  ["Apa yang terjadi saat kode Go ini dijalankan?", "var m map[string]int\nfmt.Println(m[\"a\"])\nm[\"a\"] = 1", "go", "Mencetak 0 lalu panic: assignment to entry in nil map", "Mencetak 0 dan menyimpan a=1", "Panic pada baris pembacaan", "Membaca dari nil map aman (nilai nol); menulis ke nil map menyebabkan panic. Inisialisasi dengan make.", "Bedakan membaca dan menulis pada nil map."],
  ["Apa isi a setelah baris terakhir?", "a := []int{1, 2, 3}\nb := a[:2]\nb = append(b, 99)\nfmt.Println(a)", "go", "[1 2 99]", "[1 2 3]", "[1 2 3 99]", "b berbagi array dasar dengan a dan kapasitasnya masih 3, sehingga append menimpa a[2].", "Apakah kapasitas b cukup sehingga append tanpa alokasi baru?"],
  ["Apa output kode Java ini?", "Integer a = 127, b = 127, c = 128, d = 128;\nSystem.out.println((a == b) + \" \" + (c == d));", "java", "true false", "true true", "false false", "Autoboxing memakai cache Integer untuk -128..127, sehingga == membandingkan objek yang sama hanya di rentang itu. Pakai equals().", "Cache Integer."],
  ["Apa hasil map.get(k) di akhir?", "Map<Kunci, String> map = new HashMap<>();\nKunci k = new Kunci(1);        // hashCode memakai id\nmap.put(k, \"nilai\");\nk.setId(2);\nSystem.out.println(map.get(k));", "java", "null (kemungkinan besar): hash berubah sehingga pencarian ke bucket yang salah", "nilai", "Melempar ConcurrentModificationException", "Mengubah field yang dipakai hashCode setelah dimasukkan 'menghilangkan' entri. Kunci peta harus immutable.", "Di bucket mana entri disimpan dan di bucket mana ia dicari?"],
  ["Hasil kedua pembandingan ini di PHP 8?", "var_dump(\"1e3\" == \"1000\");\nvar_dump(\"abc\" == 0);", "php", "true lalu false", "false lalu true", "true lalu true", "Dua string numerik dibandingkan sebagai angka (1e3 = 1000). Sejak PHP 8, string non-numerik dibandingkan dengan angka sebagai string, sehingga 'abc' == 0 false.", "String numerik vs non-numerik."],
  ["Apa risiko kode Laravel ini?", "User::create($request->all());   // tabel punya kolom is_admin", "php", "Mass assignment: pengguna bisa mengirim is_admin=1; batasi dengan $fillable atau $request->validated()", "Tidak ada risiko; Eloquent mengabaikan kolom tak dikenal", "Hanya risiko performa karena all() lambat", "all() menyertakan semua input. Tanpa daftar fillable/validated, atribut sensitif bisa disetel penyerang.", "Siapa menentukan field mana yang boleh diisi?"],
  ["Konsumen memproses pesan lalu crash SEBELUM mengirim ack. Apa yang terjadi?", "# antrean dengan jaminan at-least-once", "python", "Pesan dikirim ulang dan bisa diproses dua kali; handler harus idempoten", "Pesan hilang selamanya", "Pesan diproses tepat sekali oleh broker", "At-least-once menjamin tidak hilang tetapi dapat duplikat. Pakai kunci idempotensi atau deduplikasi.", "Broker tahu pesan sudah beres dari apa?"],
  ["Kunci cache populer kedaluwarsa dan ribuan request serentak menembus ke database. Apa namanya dan mitigasinya?", "cache.get('beranda') → miss → query berat", "python", "Cache stampede; mitigasi: kunci/penggabungan request, TTL berjitter, atau stale-while-revalidate", "Cache poisoning; mitigasi: HTTPS", "Cache penetration; mitigasi: memperbesar RAM saja", "Stampede terjadi saat banyak request mengisi ulang kunci yang sama bersamaan. Gabungkan request atau sebar kedaluwarsa.", "Banyak pihak mengisi ulang hal yang sama pada saat yang sama."],
  ["UPDATE ini mempengaruhi 0 baris. Apa artinya?", "UPDATE produk SET stok = 9, versi = 4\nWHERE id = 1 AND versi = 3;", "sql", "Baris sudah diubah transaksi lain (versi tidak lagi 3): konflik optimistic locking, baca ulang lalu coba lagi atau tolak", "Produk dengan id 1 pasti dihapus", "Query tidak valid", "Optimistic locking mendeteksi konflik lewat kolom versi pada klausa WHERE.", "Mengapa kondisi versi = 3 bisa gagal?"],
  ["Saat partisi jaringan, sistem memilih tetap menjawab dengan data yang mungkin basi. Pilihan CAP-nya?", "# replika terpisah oleh partisi", "text", "AP (mengutamakan Availability di atas Consistency)", "CP (mengutamakan Consistency)", "CA (tanpa toleransi partisi)", "Saat partisi, sistem harus memilih: tetap tersedia (AP) atau menolak untuk menjaga konsistensi (CP). CA tidak realistis di sistem terdistribusi.", "Menjawab dengan data lama = mengorbankan apa?"],
  ["Layanan A memanggil B tanpa timeout dan B melambat. Dampak paling mungkin?", "resp = http.get(url_b)   # tanpa timeout", "python", "Thread/koneksi di A menumpuk menunggu sehingga A ikut lumpuh (cascading failure); pasang timeout dan circuit breaker", "A otomatis menyerah setelah 1 detik", "Tidak ada dampak karena B yang lambat", "Tanpa batas waktu, sumber daya A terkunci menunggu B. Timeout, bulkhead, dan circuit breaker membatasi dampak.", "Siapa yang menanggung biaya menunggu?"],
  ["Mengapa query ini makin lambat pada halaman jauh, dan apa solusinya?", "SELECT * FROM log ORDER BY id LIMIT 20 OFFSET 1000000;", "sql", "Database tetap membaca lalu membuang satu juta baris; gunakan keyset pagination (WHERE id > :terakhir)", "OFFSET tidak boleh melebihi 1000 pada standar SQL", "ORDER BY harus dihapus", "OFFSET N memaksa pemindaian N baris. Keyset memakai indeks langsung dari posisi terakhir.", "Apakah OFFSET 'melompat' atau 'menghitung'?"],
  ["Setelah COMMIT sukses, listrik padam dan data hilang. Properti ACID mana yang dilanggar?", "COMMIT;  -- sukses\n-- server mati", "sql", "Durability", "Atomicity", "Isolation", "Durability menjamin data yang sudah di-commit bertahan meski crash (lewat WAL/fsync).", "Properti mana yang berbicara tentang bertahan setelah crash?"],
  ["Efek UUIDv4 acak sebagai primary key pada B-tree dibanding kunci berurutan?", "id UUID PRIMARY KEY DEFAULT gen_random_uuid()", "sql", "Penyisipan tersebar acak sehingga page split dan cache miss meningkat; UUID berurutan waktu (v7) lebih ramah indeks", "Tidak ada bedanya", "Selalu lebih cepat karena tidak ada kontensi", "Kunci acak menyisip di sembarang halaman indeks, memperbesar fragmentasi dan I/O.", "Di halaman indeks mana baris baru disisipkan?"],
];
export const beCurated = { id: "be-concept", gen: async () => { const e = pk(POOL); return mk("guess", e[0], e[1], e[2], e[3], [e[4], e[5]], e[6], e[7]); } };
export const BE_CURATED_SIZE = POOL.length;

export const BE_SYS = [rateLimit, lru, sharding, bigO, raceCounter, deadlock, backoff, percentile, littleLaw, cron, nPlusOne, httpStatus, beCurated];
