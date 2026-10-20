// Tipe soal tambahan Developer Mode v2.4 (usulan: pengelompokan teknologi, studi kasus stack, REST/HTTP, Git, responsif/mobile,
// jargon, keamanan, isian kode). Dinaikkan ke tingkat hard–hell: jawaban dihitung (git nyata / simulator), bukan tebak-tebakan.
import { spawnSync } from "node:child_process";
import { mkdtempSync, writeFileSync, readFileSync, rmSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { rnd, ri, pk, shuf, sample, chance, mk, perturb } from "./engine.mjs";

// ───────── 1. Pengelompokan teknologi (kategori halus, bukan sekadar "frontend atau backend") ─────────
const CAT = {
  f: {
    "pustaka/framework UI": ["React", "Vue", "Svelte", "SolidJS", "Angular", "Preact"],
    "tooling/framework CSS": ["Tailwind CSS", "Bootstrap", "Sass", "PostCSS", "Bulma"],
    "pengelola state klien": ["Redux", "Zustand", "Pinia", "MobX", "Jotai"],
    "bundler/build tool": ["Vite", "Webpack", "esbuild", "Rollup", "Parcel"],
    "alat uji end-to-end/komponen di browser": ["Cypress", "Playwright", "Testing Library", "WebdriverIO"],
  },
  b: {
    "basis data relasional": ["PostgreSQL", "MySQL", "SQLite", "MariaDB", "SQL Server"],
    "basis data dokumen NoSQL": ["MongoDB", "CouchDB", "Firestore", "RavenDB"],
    "penyimpan key-value/in-memory": ["Redis", "Memcached", "etcd", "Valkey"],
    "message broker/antrean": ["RabbitMQ", "Kafka", "NATS", "ActiveMQ", "Amazon SQS"],
    "ORM/query builder": ["Prisma", "Hibernate", "SQLAlchemy", "Eloquent", "TypeORM", "Sequelize"],
    "framework web sisi server": ["Express", "Django", "Flask", "Spring Boot", "Rails", "Laravel", "FastAPI"],
    "reverse proxy/web server": ["Nginx", "Caddy", "HAProxy", "Traefik", "Apache HTTP Server"],
  },
  s: {
    "gaya/protokol API": ["REST", "GraphQL", "gRPC", "tRPC", "SOAP"],
    "meta-framework lintas sisi": ["Next.js", "Nuxt", "Remix", "SvelteKit", "Astro"],
  },
};
const grouping = (role) => ({
  id: "x-group",
  gen: async () => {
    const cats = { ...(role !== "b" ? CAT.f : {}), ...(role !== "f" ? CAT.b : {}), ...(role === "s" ? CAT.s : {}) };
    const all = { ...CAT.f, ...CAT.b, ...CAT.s };
    const AMBIG = { "pustaka/framework UI": ["meta-framework lintas sisi"], "framework web sisi server": ["meta-framework lintas sisi"], "gaya/protokol API": ["framework web sisi server"], "meta-framework lintas sisi": ["pustaka/framework UI", "framework web sisi server"] };
    const name = pk(Object.keys(cats)), inC = sample(cats[name], 3), other = sample(Object.entries(all).filter(([k]) => k !== name && !(AMBIG[name] || []).includes(k)).flatMap(([, v]) => v), 2);
    const items = shuf([...inC, ...other]); const idx = (arr) => arr.map((x) => items.indexOf(x) + 1).sort().join(", ");
    const c = idx(inC); const w = new Set();
    for (let k = 0; k < 40 && w.size < 2; k++) { const pick = sample([1, 2, 3, 4, 5], 3).sort().join(", "); if (pick !== c) w.add(pick); }
    const neg = chance(0.35);
    if (neg) { const notIn = idx(other); const ex = [...[1, 2, 3, 4, 5]].filter((x) => !notIn.split(", ").map(Number).includes(x)); const wr = [...w].slice(0, 2); return mk("guess", `Dari daftar ini, nomor mana yang BUKAN ${name}?`, items.map((x, i) => `${i + 1}. ${x}`).join("\n"), "text", notIn.replace(/, /g, " dan ").replace(/^(\d)$/, "$1"), wr.map((x) => x.replace(/, /g, " dan ")), `${other.join(" dan ")} termasuk kategori lain; ${inC.join(", ")} adalah ${name}.`, "Cari dua yang berasal dari kategori berbeda."); }
    return mk("guess", `Manakah kombinasi nomor yang SEMUANYA merupakan ${name}?`, items.map((x, i) => `${i + 1}. ${x}`).join("\n"), "text", c, [...w], `${inC.join(", ")} adalah ${name}; ${other.join(" dan ")} termasuk kategori lain.`, "Kategorinya spesifik, bukan sekadar 'frontend' atau 'backend'.");
  },
});

// ───────── 2. Git: repositori NYATA di folder sementara ─────────
const G = (dir, args) => spawnSync("git", ["-c", "user.name=x", "-c", "user.email=x@x.id", "-c", "commit.gpgsign=false", "-c", "init.defaultBranch=main", ...args], { cwd: dir, encoding: "utf8" });
const sh = (dir, cmd) => spawnSync("sh", ["-c", cmd], { cwd: dir, encoding: "utf8" });
export const gitConflict = {
  id: "x-git-conflict",
  gen: async () => {
    const dir = mkdtempSync(join(tmpdir(), "kt-")); try {
      const N = 9, base = Array.from({ length: N }, (_, i) => `baris${i + 1}`); G(dir, ["init", "-q"]);
      writeFileSync(join(dir, "f.txt"), base.join("\n") + "\n"); writeFileSync(join(dir, "g.txt"), "g\n"); G(dir, ["add", "."]); G(dir, ["commit", "-qm", "awal"]);
      const i = ri(1, N), j = ri(1, N), mode = pk(["beda", "sama", "fileLain", "ffonly"]);
      const edit = (f, ln, txt) => { const l = readFileSync(join(dir, f), "utf8").split("\n"); l[ln - 1] = txt; writeFileSync(join(dir, f), l.join("\n")); };
      G(dir, ["checkout", "-qb", "fitur"]); edit("f.txt", i, "fitur"); G(dir, ["commit", "-qam", "fitur"]); G(dir, ["checkout", "-q", "main"]);
      if (mode === "beda") { edit("f.txt", j, "utama"); G(dir, ["commit", "-qam", "utama"]); } else if (mode === "sama") { edit("f.txt", i, "fitur"); G(dir, ["commit", "-qam", "utama"]); } else if (mode === "fileLain") { edit("g.txt", 1, "g2"); G(dir, ["commit", "-qam", "utama"]); }
      const r = G(dir, ["merge", "--no-edit", "fitur"]); let out;
      if (r.status !== 0) out = "CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"; else out = G(dir, ["rev-parse", "-q", "--verify", "HEAD^2"]).status === 0 ? "Merge otomatis berhasil dan membuat merge commit baru" : "Fast-forward: tidak ada merge commit baru";
      const ALL = ["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual", "Merge otomatis berhasil dan membuat merge commit baru", "Fast-forward: tidak ada merge commit baru"];
      const mainDesc = { beda: `main: mengubah baris ${j} f.txt menjadi "utama" (commit baru)`, sama: `main: mengubah baris ${i} f.txt menjadi "fitur" (isi IDENTIK, commit sendiri)`, fileLain: `main: mengubah g.txt (commit baru)`, ffonly: "main: tidak ada commit baru sejak fitur dibuat" }[mode];
      const code = `# f.txt berisi baris1 … baris${N}\nfitur: mengubah baris ${i} f.txt menjadi "fitur"\n${mainDesc}\n\n$ git checkout main\n$ git merge fitur`;
      return mk("guess", "Apa hasil git merge?", code, "bash", out, ALL.filter((x) => x !== out), `Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: ${out}.`, "Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.");
    } finally { rmSync(dir, { recursive: true, force: true }); }
  },
};
export const gitState = {
  id: "x-git-state",
  gen: async () => {
    const CMDS = ["git reset --soft HEAD~1", "git reset --mixed HEAD~1", "git reset --hard HEAD~1", "git revert --no-edit HEAD", "git stash", "git restore f.txt", 'git commit --amend -qm "baru"'];
    const wip = chance(0.6), cmd = pk(CMDS), runIt = (c) => { const dir = mkdtempSync(join(tmpdir(), "kt-")); try { G(dir, ["init", "-q"]); for (const v of ["v1", "v2"]) { writeFileSync(join(dir, "f.txt"), v + "\n"); G(dir, ["add", "."]); G(dir, ["commit", "-qm", v]); } if (wip) writeFileSync(join(dir, "f.txt"), "wip\n"); sh(dir, c); const st = G(dir, ["status", "--short"]).stdout.split("\n").filter(Boolean).map((l) => { const x = l[0], y = l[1], f = l.slice(3); return x !== " " && y !== " " ? `${f} (staging + perubahan lanjutan)` : x !== " " ? `${f} ter-staging` : `${f} berubah, belum di-staging`; }).join("; ") || "bersih"; const n = G(dir, ["rev-list", "--count", "HEAD"]).stdout.trim(); const body = readFileSync(join(dir, "f.txt"), "utf8").trim(); return `status: ${st} | commit: ${n} | isi f.txt: ${body}`; } finally { rmSync(dir, { recursive: true, force: true }); } };
    const c = runIt(cmd); const alts = CMDS.filter((x) => x !== cmd).map(runIt).filter((x) => x !== c);
    if (alts.length < 2) return null;
    const code = `# riwayat: commit 1 "v1" (f.txt = v1), commit 2 "v2" (f.txt = v2)\n${wip ? "# lalu f.txt diedit dan BELUM di-commit: isinya \"wip\"\n" : ""}$ ${cmd}`;
    return mk("output", "Keadaan repositori sesudah perintah ini (git status --short | jumlah commit | isi f.txt)?", code, "bash", c, [...new Set(alts)], `Dijalankan di repositori nyata: ${c}. --soft hanya memindahkan HEAD; --mixed juga mengosongkan staging; --hard membuang perubahan di working tree; revert membuat commit baru yang membalik; stash menyimpan perubahan lalu membersihkan; restore membuang suntingan file.`, "Tiga area: HEAD, index (staging), working tree — perintah mana mengubah yang mana?");
  },
};

// ───────── 3. Gambar responsif: srcset + sizes + DPR ─────────
export const srcset = {
  id: "x-srcset",
  gen: async () => {
    const W = pk([360, 390, 768, 1024, 1366, 1440]), dpr = pk([1, 2, 3]), bp = pk([700, 900, 1024]), big = pk([40, 50, 60]), small = pk([100, 90]);
    const cands = [320, 480, 640, 800, 1024, 1280, 1600, 2000]; const slot = (W >= bp ? big : small) * W / 100, need = slot * dpr;
    const pick = (n) => cands.find((c) => c >= n) ?? cands[cands.length - 1];
    const ans = pick(need), noDpr = pick(slot), no100 = pick(W * dpr), next = cands[Math.min(cands.length - 1, cands.indexOf(ans) + 1)];
    const f = (n) => `foto-${n}.jpg`; const code = `<img\n  srcset="${cands.map((c) => `${f(c)} ${c}w`).join(", ")}"\n  sizes="(min-width: ${bp}px) ${big}vw, ${small}vw"\n  src="${f(480)}" alt="">\n<!-- viewport ${W}px, device pixel ratio ${dpr}; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->`;
    return mk("guess", "Berkas gambar mana yang dipilih browser?", code, "html", f(ans), [f(noDpr), f(no100), f(next)].filter((x) => x !== f(ans)), `Slot = ${W >= bp ? big : small}vw × ${W} = ${Math.round(slot)}px CSS; × DPR ${dpr} = ${Math.round(need)}px fisik → kandidat terkecil yang ≥ itu: ${ans}w.`, "Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.");
  },
};

// ───────── 4. SemVer & rentang npm ─────────
const P = (v) => v.split(".").map(Number), cmpV = (a, b) => { for (let i = 0; i < 3; i++) if (a[i] !== b[i]) return a[i] - b[i]; return 0; };
const sat = (v, op, base) => { const b = P(base), x = P(v); if (cmpV(x, b) < 0) return false; if (op === "~") return x[0] === b[0] && x[1] === b[1]; if (b[0] > 0) return x[0] === b[0]; if (b[1] > 0) return x[0] === 0 && x[1] === b[1]; return x[0] === 0 && x[1] === 0 && x[2] === b[2]; };
export const semver = {
  id: "x-semver",
  gen: async () => {
    const zero = chance(0.5), op = pk(["^", "~"]); const base = zero ? pk([`0.${ri(1, 4)}.${ri(0, 3)}`, `0.0.${ri(1, 4)}`]) : `${ri(1, 3)}.${ri(0, 4)}.${ri(0, 4)}`;
    const b = P(base); const pool = new Set([base]); const mkv = (a, m, p) => `${a}.${m}.${p}`;
    for (let i = 0; i < 9; i++) pool.add(mkv(pk([b[0], b[0], b[0] + 1]), pk([b[1], b[1], b[1] + 1, b[1] + 2]), pk([b[2], b[2] + 1, b[2] + 2, b[2] + 3, 0])));
    const vs = [...pool].filter((v) => cmpV(P(v), b) >= 0).sort((x, y) => cmpV(P(x), P(y))).slice(0, 8); if (vs.length < 5) return null;
    const best = [...vs].filter((v) => sat(v, op, base)).pop(), top = vs[vs.length - 1], other = [...vs].filter((v) => sat(v, op === "^" ? "~" : "^", base)).pop();
    return mk("guess", `Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?`, `"dependencies": { "pustaka": "${op}${base}" }\n// versi yang tersedia di registry:\n${vs.join("  ")}`, "json", best, [top, other].filter((x) => x !== best), `${op === "^" ? "Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z)." : "Tilde mengizinkan hanya perubahan patch (minor tetap)."} Tertinggi yang memenuhi: ${best}.`, "Cari digit bukan-nol paling kiri; ia terkunci pada caret.");
  },
};

// ───────── 5. Keamanan: skenario → serangan / mitigasi ─────────
const SEC = [
  ["SQL Injection", "Penyerang mengisi kolom login dengan ' OR '1'='1' -- dan masuk tanpa password.", "Query berparameter (prepared statement) dan hak akses DB minimum", "fb"], ["Stored XSS", "Komentar berisi <script> tersimpan di database dan dieksekusi di browser setiap pengunjung yang membuka halaman.", "Escape output sesuai konteks + sanitasi HTML + Content-Security-Policy", "fs"],
  ["Reflected XSS", "Tautan /cari?q=<script>…</script> membuat halaman memantulkan input itu ke HTML tanpa menyimpannya.", "Escape output sesuai konteks dan validasi input; CSP sebagai lapis tambahan", "fs"], ["DOM-based XSS", "Kode klien: el.innerHTML = location.hash.slice(1) — payload di fragmen URL dieksekusi tanpa lewat server.", "Gunakan textContent, hindari innerHTML dengan data tak tepercaya; Trusted Types", "fs"],
  ["CSRF", "Pengguna yang sedang login membuka situs jahat; form tersembunyi di sana mengirim POST /transfer ke bank dengan cookie sesinya.", "SameSite pada cookie sesi dan token CSRF anti-pemalsuan", "bs"], ["SSRF", "Endpoint POST /ambil?url=… membuat server mengunduh URL; penyerang meminta http://169.254.169.254/latest/meta-data/.", "Allowlist tujuan, blokir alamat internal/metadata, dan jangan ikuti redirect ke jaringan privat", "bs"],
  ["IDOR (Broken Access Control)", "Pengguna mengganti /invoice/1042 menjadi /invoice/1043 dan melihat faktur milik orang lain.", "Periksa kepemilikan/otorisasi di server pada setiap akses objek", "bs"], ["Path Traversal", "GET /unduh?berkas=../../etc/passwd mengembalikan isi berkas sistem.", "Normalisasi path, batasi ke direktori dasar, dan jangan pakai input langsung sebagai nama berkas", "bs"],
  ["Open Redirect", "Setelah login, /login?next=https://evil.example mengarahkan pengguna ke situs lain yang tampak resmi.", "Validasi tujuan redirect dengan allowlist atau hanya path relatif", "fs"], ["Clickjacking", "Situs target dimuat dalam iframe transparan; pengguna mengira mengeklik tombol permainan tetapi menekan 'Hapus akun'.", "CSP frame-ancestors atau X-Frame-Options agar halaman tidak bisa dibingkai situs lain", "fs"],
  ["Credential Stuffing", "Penyerang mencoba jutaan pasangan email-password hasil kebocoran situs lain secara otomatis di halaman login.", "Rate limiting, MFA, pemantauan login anomali, dan pengecekan kata sandi bocor", "bs"], ["Mass Assignment", "User::create($request->all()) menerima is_admin=1 dari klien sehingga pengguna biasa jadi admin.", "Daftar atribut yang diizinkan ($fillable/validated) — jangan bind seluruh input", "bs"],
  ["Command Injection", "os.system(\"ping \" + host) dengan host berisi 'x; rm -rf /'.", "Hindari shell: pakai API/argumen terpisah (subprocess dengan list) dan validasi input", "bs"], ["Insecure Deserialization", "pickle.loads() dipakai pada cookie yang dikirim klien sehingga penyerang bisa menjalankan kode.", "Jangan deserialisasi data tak tepercaya dengan format yang bisa menjalankan kode; pakai JSON dan tanda tangan", "b"],
  ["CORS salah konfigurasi", "Server memantulkan header Origin apa pun ke Access-Control-Allow-Origin dan mengaktifkan Allow-Credentials: true.", "Allowlist origin eksplisit; jangan memantulkan origin sembarang bersama credentials", "bs"],
  ["Subdomain takeover", "CNAME blog.toko.id masih menunjuk ke layanan hosting yang sudah dihapus; pihak lain mendaftarkan nama itu dan menayangkan konten di subdomain Anda.", "Hapus catatan DNS yang menggantung saat layanan dinonaktifkan", "bs"],
];
const security = (role) => ({
  id: "x-security",
  gen: async () => {
    const pool = SEC.filter((e) => e[3].includes(role)), e = pk(pool), mit = chance(0.45);
    if (!mit) return mk("guess", "Jenis kerentanan/serangan apa ini?", e[1], "text", e[0], sample(SEC.filter((x) => x[0] !== e[0]).map((x) => x[0]), 2), `${e[0]}: ${e[2]}.`, "Apa yang dikendalikan penyerang, dan di mana ia dieksekusi?");
    return mk("guess", `Mitigasi UTAMA untuk kasus ini?\n${e[1]}`, "# keamanan aplikasi web", "text", e[2], sample(SEC.filter((x) => x[0] !== e[0]).map((x) => x[2]), 2), `Mitigasi yang tepat untuk ${e[0]}: ${e[2]}.`, `Akar masalahnya: ${e[0]}.`);
  },
});

// ───────── 6. Soal tulis tangan: [roles, prompt, kode, bahasa, benar, salah1, salah2, penjelasan, petunjuk, tipe?] ─────────
const POOL = [
  // studi kasus stack
  ["fs", "Andi ingin membuat aplikasi mobile Android+iOS dengan satu basis kode. Laptopnya lemah untuk Android Studio dan ia hanya menguasai JavaScript/TypeScript. Pilihan paling masuk akal?", "# kendala: spesifikasi rendah, keahlian JS", "text", "React Native + TypeScript (cross-platform, dijalankan di perangkat/Expo tanpa emulator berat)", "Laravel + PHP (menghasilkan aplikasi native langsung)", "Django + Python (merender UI native lewat template)", "Laravel/Django adalah kerangka sisi server; keduanya tidak menghasilkan UI native. React Native menulis UI memakai JS/TS dan menjalankannya lintas platform.", "Mana yang menghasilkan UI di perangkat?"],
  ["fb", "Joko membuat kasir dengan HTML + Tailwind + JavaScript murni. Data hilang setiap halaman dimuat ulang. Apa yang paling tepat ditambahkan?", "tambahBarang(item) { daftar.push(item); render(); }", "javascript", "Penyimpanan persisten: database di server melalui API (atau minimal IndexedDB/localStorage untuk mode offline)", "Framework CSS yang lebih baru", "Mengganti Tailwind dengan Bootstrap", "Array di memori hilang saat halaman dimuat ulang. Persistensi butuh penyimpanan di luar memori halaman: server+DB untuk data bersama, atau penyimpanan browser untuk data lokal.", "Di mana data hidup setelah refresh?"],
  ["fs", "Toko online butuh halaman produk yang diindeks mesin pencari, cepat dimuat pertama kali, dan stoknya harus segar. Pendekatan paling seimbang?", "# kebutuhan: SEO + kesegaran data", "text", "SSR atau ISR (HTML dirender di server/edge, stok diambil saat render atau divalidasi ulang berkala)", "CSR murni; data diambil setelah JavaScript dimuat", "Halaman statis yang dibangun sekali setahun", "Perayap butuh HTML berisi konten; data stok yang berubah menuntut render dinamis atau revalidasi periodik.", "Apa yang dilihat perayap pada CSR murni?"],
  ["bs", "Tim kecil (2 orang) membangun aplikasi internal CRUD dengan autentikasi, admin, dan laporan. Tidak ada kebutuhan UI sangat interaktif; ingin cepat selesai. Pilihan paling efisien?", "# kendala: tim kecil, tenggat singkat", "text", "Framework monolit 'baterai-lengkap' (Laravel/Django/Rails) dengan templating server", "Mikroservis terpisah untuk tiap tabel plus SPA", "Membangun semuanya dari nol dengan HTTP server mentah", "Untuk CRUD internal, monolit full-featured memangkas biaya koordinasi. Mikroservis menambah kompleksitas operasional tanpa kebutuhan skala yang jelas.", "Biaya koordinasi vs kebutuhan skala."],
  ["fs", "Aplikasi chat harus menampilkan pesan baru ke layar tanpa refresh dan tanpa polling terus-menerus; pengguna juga mengirim pesan sering. Teknologi kunci?", "# kebutuhan: dua arah, latensi rendah", "text", "WebSocket (mis. Socket.io) untuk kanal dua arah persisten", "REST dengan GET berkala tiap 100 ms", "localStorage untuk saling bertukar pesan antarpengguna", "WebSocket menyediakan kanal dua arah; polling boros dan lambat; localStorage tidak lintas perangkat/pengguna.", "Satu arah atau dua arah?"],
  ["f", "Portofolio foto menampilkan ratusan gambar resolusi tinggi dan lambat dibuka. Dua teknik yang paling berdampak?", "<img src=\"foto-4k.jpg\">  <!-- ×300 -->", "html", "loading=\"lazy\" untuk gambar di bawah lipatan + srcset/format modern (AVIF/WebP) sesuai ukuran tampil", "Mengubah semua gambar menjadi font ikon", "Memasang HTTPS pada domain", "Lazy loading menunda gambar di luar layar; srcset/format modern mengurangi byte yang diunduh. HTTPS tidak mempercepat muatan gambar.", "Kurangi apa yang diunduh dan kapan diunduh."],
  // REST / HTTP
  ["bs", "Pembatalan pesanan #45 (pesanan tetap tersimpan dengan status 'dibatalkan' untuk audit). Desain endpoint REST yang paling tepat?", "# resource: orders", "http", "POST /orders/45/cancel (aksi yang mengubah status, resource tidak dihapus)", "DELETE /orders/45 (menghapus resource)", "GET /orders/45/cancel (mengubah status lewat metode aman)", "DELETE menyiratkan resource hilang; GET harus aman (tidak boleh mengubah state). Aksi domain non-CRUD cocok sebagai sub-aksi dengan POST.", "Apakah data tetap ada setelah aksi? Apakah GET boleh mengubah state?"],
  ["bs", "Klien mengganti SELURUH data profil pengguna 7 dan ingin pengulangan request yang sama aman (hasil identik). Metode dan jalur yang tepat?", "# representasi lengkap dikirim klien", "http", "PUT /users/7", "POST /users/7/update", "PATCH /users/7 dengan seluruh field wajib", "PUT bersifat idempoten dan menggantikan seluruh representasi; POST tidak idempoten; PATCH ditujukan untuk perubahan parsial.", "Idempoten + pengganti penuh."],
  ["bs", "Server baru saja membuat pesanan lewat POST /orders. Respons yang paling sesuai standar?", "POST /orders  { ... }", "http", "201 Created dengan header Location: /orders/{id}", "200 OK dengan body kosong tanpa petunjuk alamat resource", "302 Found ke /orders", "201 menyatakan resource baru dibuat dan Location menunjuk alamat kanoniknya.", "Kode yang menandakan pembuatan."],
  ["bs", "Daftar produk perlu filter kategori dan harga maksimum serta pagination. Desain URL yang paling tepat?", "# GET koleksi produk", "http", "GET /products?kategori=kopi&harga_maks=50000&limit=20&cursor=abc", "GET /products/kategori/kopi/harga/50000/halaman/3/hapus-cache", "POST /products/search dengan filter di URL path", "Filter, urutan, dan pagination adalah parameter query pada koleksi; path mengidentifikasi resource.", "Path = identitas resource; query = penyaring."],
  // responsif / mobile
  ["f", "Halaman tampil seperti versi desktop yang diperkecil di HP (teks sangat kecil). Penyebab paling mungkin?", "<head>\n  <title>Toko</title>\n</head>", "html", "Tidak ada <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">: browser mobile memakai viewport virtual ±980px", "Tidak memakai flexbox", "Gambar terlalu besar", "Tanpa meta viewport, browser mobile merender pada lebar virtual desktop lalu mengecilkannya; media query pun tidak bereaksi seperti yang diharapkan.", "Lebar layout yang dipakai browser mobile saat tak diberi tahu?"],
  ["f", "Judul harus 32px di laptop, 24px di HP, dan berubah mulus di antaranya tanpa breakpoint. Solusi CSS yang paling tepat?", "h1 { font-size: ???; }", "css", "font-size: clamp(1.5rem, 1rem + 2vw, 2rem)", "@media (max-width: 600px) { h1 { font-size: 24px } }", "font-size: calc(32px - 100vw)", "clamp() membatasi nilai cair antara minimum dan maksimum; media query menghasilkan lompatan, bukan transisi mulus.", "Mana yang menghasilkan nilai cair berbatas?"],
  ["f", "Elemen setinggi 100vh tertutup bilah alamat browser mobile dan sebagian terpotong. Perbaikan yang tepat?", ".hero { height: 100vh; }", "css", "Gunakan satuan viewport dinamis: height: 100dvh (dengan fallback 100vh)", "Naikkan z-index menjadi 9999", "Tambahkan overflow: scroll pada body", "vh dihitung terhadap viewport terbesar (toolbar tersembunyi); dvh mengikuti viewport aktual saat toolbar tampil/hilang.", "Satuan mana yang mengikuti toolbar dinamis?"],
  ["f", "Efek :hover pada kartu 'menempel' setelah disentuh di layar sentuh. Praktik yang tepat?", ".kartu:hover { transform: scale(1.05); }", "css", "Bungkus dalam @media (hover: hover) agar hanya berlaku untuk perangkat yang benar-benar bisa hover", "Ganti :hover dengan :visited", "Tambahkan !important", "Di layar sentuh, :hover bisa tertinggal setelah tap. (hover: hover) mendeteksi kemampuan hover.", "Fitur media apa yang menanyakan kemampuan input?"],
  ["f", "Mengetuk <input> di iPhone membuat halaman ter-zoom otomatis. Penyebab umum dan perbaikannya?", "input { font-size: 14px; }", "css", "Font input di bawah 16px memicu auto-zoom iOS; setel font-size: 16px atau lebih", "Atribut autocomplete hilang", "meta charset salah", "Safari iOS memperbesar halaman saat fokus pada input berfont < 16px.", "Ukuran font minimal input pada iOS?"],
  // jargon
  ["fbs", "Dalam pengembangan, 'refactoring' yang benar berarti?", "# praktik rekayasa perangkat lunak", "text", "Menstrukturkan ulang kode internal tanpa mengubah perilaku yang teramati, dengan dijaga oleh tes otomatis", "Menulis ulang seluruh aplikasi dengan bahasa baru dari nol", "Menambah fitur baru sambil merapikan kode", "Refactoring menjaga perilaku tetap sama; tes menjadi jaring pengaman. Menambah fitur atau menulis ulang total bukan refactoring.", "Apa yang tidak boleh berubah?"],
  ["fbs", "Apa itu 'technical debt'?", "# jargon rekayasa", "text", "Biaya tambahan di masa depan akibat jalan pintas desain/kode saat ini; makin lama dibiarkan, 'bunganya' (kesulitan perubahan) makin besar", "Utang uang perusahaan kepada vendor server", "Jumlah bug yang tercatat di issue tracker", "Metafora utang: jalan pintas mempercepat sekarang tetapi menambah biaya perubahan kelak.", "Apa 'bunga'-nya?"],
  ["bs", "Rilis 'blue-green' berbeda dari 'canary' dalam hal?", "# strategi deploy", "text", "Blue-green memindahkan SELURUH lalu lintas sekaligus ke lingkungan baru yang identik; canary mengalihkan sebagian kecil lalu bertahap", "Blue-green hanya untuk frontend, canary untuk backend", "Keduanya identik; hanya beda nama vendor", "Blue-green: dua lingkungan penuh dan saklar lalu lintas (rollback cepat). Canary: paparan bertahap untuk mendeteksi masalah dini.", "Seberapa banyak lalu lintas yang dialihkan pada tahap awal?"],
  ["fbs", "Fungsi utama 'feature flag' dalam praktik CI/CD?", "if (flag('checkout-baru')) { tampilkanBaru(); }", "javascript", "Memisahkan deploy dari rilis: kode dapat dideploy terlebih dulu lalu fitur dinyalakan/dimatikan tanpa deploy ulang", "Menandai fitur yang gagal di tes unit", "Mengompresi bundle", "Flag memungkinkan peluncuran bertahap, uji A/B, dan tombol darurat (kill switch) tanpa rilis ulang.", "Deploy dan rilis adalah dua hal yang berbeda."],
  ["fbs", "Perbedaan Continuous Delivery dan Continuous Deployment?", "# pipeline CI/CD", "text", "Delivery: siap dirilis kapan saja tetapi dirilis dengan persetujuan manual; Deployment: setiap perubahan lolos tes otomatis langsung ke produksi", "Delivery untuk frontend, Deployment untuk backend", "Tidak ada perbedaan", "Keduanya mengotomatiskan pipeline; perbedaannya ada pada langkah rilis ke produksi: manual versus otomatis.", "Siapa yang menekan tombol rilis?"],
  ["bs", "SLI, SLO, dan SLA — pernyataan yang benar?", "# keandalan layanan", "text", "SLI = pengukuran (mis. % request sukses), SLO = target internal atas SLI, SLA = perjanjian dengan pelanggan yang biasanya berkonsekuensi (kompensasi)", "SLA adalah pengukuran, SLI adalah kontrak", "Ketiganya sinonim", "Indikator (SLI) diukur; tujuan (SLO) ditargetkan; perjanjian (SLA) mengikat secara kontrak.", "Ukuran, target, kontrak."],
  ["bs", "'Eventual consistency' berarti?", "# basis data terdistribusi", "text", "Tanpa penulisan baru, semua replika akhirnya konvergen ke nilai yang sama, tetapi pembacaan sesaat dapat melihat data lama", "Semua replika selalu identik pada setiap saat", "Data tidak pernah konsisten", "Konsistensi 'akhirnya' menukar kesegaran seketika dengan ketersediaan dan latensi.", "Kapan replika sama: selalu atau akhirnya?"],
  ["f", "Beda 'tree shaking' dan 'code splitting'?", "# optimasi bundle", "text", "Tree shaking membuang kode ekspor yang tak terpakai saat build; code splitting memecah bundle menjadi bagian yang dimuat sesuai kebutuhan", "Tree shaking memecah bundle, code splitting menghapus kode mati", "Keduanya mengompresi gambar", "Tree shaking mengeliminasi kode mati (bergantung pada ES modules); splitting menunda pemuatan bagian yang belum diperlukan.", "Membuang vs memecah."],
  // isian kode
  ["f", "Lengkapi agar grid otomatis mengisi baris dan menyesuaikan jumlah kolom dengan lebar kontainer:", "grid-template-columns: repeat(____, minmax(200px, 1fr));", "css", "auto-fit", "auto-size", "fit-content", "repeat(auto-fit, minmax(…)) membuat sebanyak mungkin kolom yang muat dan merenggangkan sisanya.", "Kata kunci repeat() untuk kolom otomatis.", "fill"],
  ["fs", "Lengkapi agar permintaan fetch lama dibatalkan oleh pengendali:", "const ctrl = new AbortController();\nfetch(url, { ____: ctrl.signal });\nctrl.abort();", "javascript", "signal", "abort", "cancel", "Opsi fetch yang menerima AbortSignal bernama signal.", "Nama opsi sama dengan properti AbortController.", "fill"],
  ["bs", "Lengkapi agar hanya pelanggan TANPA pesanan yang muncul:", "SELECT p.nama FROM pelanggan p\nLEFT JOIN pesanan o ON o.pelanggan_id = p.id\nWHERE o.id IS ____;", "sql", "NULL", "EMPTY", "FALSE", "Pada LEFT JOIN, baris tanpa pasangan memiliki kolom kanan NULL; perbandingan memakai IS NULL, bukan = NULL.", "Bagaimana kolom kanan terlihat saat tak ada pasangan?", "fill"],
  ["bs", "Lengkapi middleware penanganan galat Express (empat parameter):", "app.use((____, req, res, next) => {\n  res.status(500).json({ pesan: \"galat\" });\n});", "javascript", "err", "next", "done", "Express mengenali penanganan galat dari tanda tangan 4 parameter dengan galat sebagai yang pertama.", "Parameter pertama pada middleware galat.", "fill"],
  ["fbs", "Lengkapi agar cookie sesi tidak ikut terkirim pada permintaan lintas situs yang bukan navigasi top-level GET:", "Set-Cookie: sid=1; HttpOnly; Secure; ____=Lax", "http", "SameSite", "Domain", "Path", "Atribut SameSite=Lax membatasi pengiriman cookie pada konteks lintas situs.", "Atribut yang mengatur konteks lintas situs.", "fill"],
  ["fbs", "Lengkapi agar CORS dengan cookie diizinkan:", "Access-Control-Allow-____: true", "http", "Credentials", "Cookies", "Headers", "Allow-Credentials: true diperlukan agar browser mengizinkan respons dibaca pada permintaan ber-credentials.", "Apa yang diizinkan terkirim bersama permintaan?", "fill"],
  ["fbs", "Lengkapi agar berkas berhash dapat disimpan setahun dan tidak pernah divalidasi ulang:", "Cache-Control: public, max-age=31536000, ____", "http", "immutable", "must-revalidate", "no-cache", "immutable memberi tahu cache bahwa isi tak akan berubah selama masa segar, sehingga tak perlu revalidasi.", "Isi berkas tidak akan berubah.", "fill"],
  ["bs", "Lengkapi keyset pagination agar halaman berikutnya urut naik:", "SELECT * FROM log\nWHERE id > :terakhir\nORDER BY id ____\nLIMIT 20;", "sql", "ASC", "DESC", "RANDOM()", "Dengan id > :terakhir, urutan naik (ASC) menjamin halaman berikutnya kontigu dan memakai indeks.", "Arah perbandingan menentukan arah urutan.", "fill"],
];
const curatedX = (role, id) => ({ id, gen: async () => { const pool = POOL.filter((e) => e[0].includes(role)); const e = pk(pool); return mk(e[9] || "guess", e[9] === "fill" ? e[1] : e[1], e[2], e[3], e[4], [e[5], e[6]], e[7], e[8]); } });

export function extraFamilies(role) {
  return [grouping(role), gitConflict, gitState, security(role), semver, ...(role !== "b" ? [srcset] : []), curatedX(role, "x-concept")];
}
export const EXTRA_POOL_SIZE = (role) => POOL.filter((e) => e[0].includes(role)).length;
