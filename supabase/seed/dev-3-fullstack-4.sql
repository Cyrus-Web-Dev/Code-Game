-- DIHASILKAN oleh scripts/gen-dev.mjs (fullstack, bagian 4/4) — 50 soal HARD MODE (v2.4)
insert into questions (difficulty,type,prompt,prompt_en,code,language,options,options_en,correct_index,explanation,explanation_en,hint,hint_en) values
('fullstack','guess','Hubungan kedua URL ini?',null,'halaman : https://toko.com:3000
permintaan: https://toko.com:8080','text','["cross-origin dan cross-site","cross-origin tetapi same-site","same-origin (dan same-site)"]'::jsonb,null,1,'Origin = skema+host+port; site = eTLD+1 (+ skema). toko.com → toko.com, toko.com → toko.com. github.io dan vercel.app ada di Public Suffix List, jadi subdomainnya berbeda site.',null,'Public Suffix List menentukan batas site.',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
const o = { n: 78, get() { return this.n; } };
const g = o.get;
try { console.log(g()); } catch (e) { console.log(e.name); }','javascript','["TypeError","157","ReferenceError"]'::jsonb,null,0,'g() dipanggil tanpa receiver; di strict mode this = undefined sehingga this.n melempar TypeError.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','output','Apa output kode ini?',null,'console.log(encodeURIComponent("d &=/é"), encodeURI("https://app.kampus.ac.id/b x?q=a b&r=é"));','javascript','["d%20%26%3D%2F%C3%A9 https://app.kampus.ac.id/b%20x?q=a%20b&r=%C3%A9","d%20%26%3D%2F%C1%A9 https://app.kampus.ac.id/b%20x?q=a%20b&r=%C3%A9","d%20%26%3D%3F%C3%A9 https://app.kampus.ac.id/b%20x?q=a%20b&r=%C3%A9"]'::jsonb,null,0,'Hasil: d%20%26%3D%2F%C3%A9 https://app.kampus.ac.id/b%20x?q=a%20b&r=%C3%A9. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src ''unsafe-inline'' https://cdn.toko.id

A. <script>inisiasi()</script>
B. <script nonce="r4nd">inisiasi()</script>
C. <script src="/app.js"></script>  <!-- same-origin -->
D. <script src="https://cdn.toko.id/lib.js"></script>
G. eval("1 + 1")  // di dalam skrip yang diizinkan','http','["A B C","A C G","B C G"]'::jsonb,null,2,'Diblokir: B C G. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tengah.addEventListener("click", () => log("A"), true);
luar.addEventListener("click", () => log("B"), true);
tengah.addEventListener("click", (e) => { log("C"); e.stopPropagation(); });
luar.addEventListener("click", () => log("D"));
luar.addEventListener("click", () => log("E"), true);','javascript','["A B C E","A C","B E A C"]'::jsonb,null,2,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: B E A C.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_B → LOCK tabel_A → COMMIT
T2: LOCK tabel_B → LOCK tabel_A → COMMIT
T3: LOCK tabel_C → LOCK tabel_A → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_B → tabel_A","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh"]'::jsonb,null,0,'Graf urutan kunci memuat siklus tabel_A → tabel_B → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('fullstack','output','Apa output kode ini?',null,'Promise.resolve(4)
  .then((v) => { throw new Error("e" + v); })
  .then(() => console.log("A"))
  .catch((e) => e.message)
  .then((m) => console.log("B", m));','javascript','["B e5","B e4","undefined"]'::jsonb,null,1,'Dijalankan: B e4.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 295 → tiba t=295
"ko": kirim t=123, latensi 328 → tiba t=451
"kop": kirim t=192, latensi 137 → tiba t=329

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"kop\" — respons yang tiba paling awal","\"ko\" — respons yang tiba paling akhir","\"kop\" — query yang diketik paling akhir"]'::jsonb,null,1,'Urutan tiba: "k" → "kop" → "ko". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','guess','Apakah cookie ini ikut terkirim pada permintaan tersebut?',null,'# dari halaman https://shop.toko.id/keranjang
Set-Cookie: id=7; Path=/akun; Secure

# permintaan berikutnya ke:
https://shop.toko.id/akun/pengaturan','http','["Tidak","Ya","Tergantung SameSite saja"]'::jsonb,null,1,'Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (/). Path cocok pada batas ''/''. Secure butuh https. Hasil: terkirim.',null,'Cek berurutan: host, path (aturan batas ''/''), skema.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 5 item
halaman 1 → [100, 99, 98, 97, 96]
# lalu 3 item teratas dihapus sebelum halaman 2 diminta
GET /item?limit=5&offset=5','text','["[95, 94, 93, 92, 91]","[91, 90, 89, 88, 87]","[92, 91, 90, 89, 88]"]'::jsonb,null,2,'Offset menghitung dari posisi, bukan dari item terakhir yang dilihat: penghapusan menggeser daftar naik sehingga ada item yang terlewat.',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Dedi, Bandung) (2, Eka, Padang) (3, Ayu, Padang) (4, Citra, Bandung) (5, Gita, NULL)
-- pesanan(id, pelanggan_id, total, status)
(1, 2, 30, lunas) (2, 3, 90, batal) (3, 3, 90, baru) (4, 1, 70, lunas) (5, NULL, 30, batal) (6, 1, 40, lunas) (7, 1, 40, baru)

SELECT p.nama FROM pelanggan p
WHERE (SELECT SUM(total) FROM pesanan o WHERE o.pelanggan_id = p.id)
  > (SELECT AVG(total) FROM pesanan)
ORDER BY p.nama;','sql','["Dedi | Ayu","Ayu | Dedi","(kosong)"]'::jsonb,null,1,'Subquery berkorelasi dihitung per pelanggan; pelanggan tanpa pesanan menghasilkan NULL sehingga perbandingan tidak lolos. Hasil: Ayu | Dedi.',null,'Bandingkan SUM per pelanggan dengan AVG seluruh pesanan (termasuk yang pelanggan_id-nya NULL).',null),
('fullstack','output','Berapa query SQL yang dijalankan (200 post, 8 penulis berbeda)?',null,'posts = Post.objects.prefetch_related("penulis")[:200]
for p in posts:
    print(p.penulis.nama)','python','["2","201","1"]'::jsonb,null,0,'prefetch_related memakai query kedua dengan WHERE id IN (...): total 2 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 60 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1759999990, nbf: 1760000090, iss: "auth.lain.id", aud: "api.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: belum berlaku (nbf)","Diterima","Ditolak: issuer tidak sesuai"]'::jsonb,null,0,'Cek berurutan: Ditolak: belum berlaku (nbf). exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (kota, negara, umur);

SELECT * FROM orang
WHERE kota > 30 AND negara > 30 AND umur = ''x'';','sql','["3","1","2"]'::jsonb,null,1,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(1);
  function klik() {
    setN((p) => p + 2);
    setN(n + 1);
    setN((p) => p * 2);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["8","4","2"]'::jsonb,null,1,'Antrean update diproses berurutan mulai dari n=1 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 1 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 4.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 600 detik yang lalu
Cache-Control: no-store, s-maxage=86400
(tanpa ETag/Last-Modified)
# resource di server TIDAK berubah; permintaan ulang oleh CDN (shared cache)','http','["Unduh penuh (200) dari server","Dilayani dari cache (basi) sekarang, revalidasi di latar belakang","Dilayani dari cache tanpa request ke jaringan"]'::jsonb,null,0,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.all([bad("A", 10), bad("B", 5), ok("C", 15)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["ok [\"rA\",\"rB\",\"fC\"]","ok \"C\"","err B"]'::jsonb,null,2,'Promise.all menghasilkan: err B. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 3; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. A: tmpA = counter
3. A: counter = tmpA + 1
4. B: counter = tmpB + 1
5. B: tmpB = counter
6. A: tmpA = counter
7. A: counter = tmpA + 1
8. B: counter = tmpB + 1','python','["5","6","7"]'::jsonb,null,0,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 5, bukan 7. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 19; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. A: counter = tmpA + 1
3. B: tmpB = counter
4. A: tmpA = counter
5. A: counter = tmpA + 1
6. B: counter = tmpB + 1
7. B: tmpB = counter
8. B: counter = tmpB + 1','python','["22","23","21"]'::jsonb,null,0,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 22, bukan 23. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','guess','Apakah cookie ini ikut terkirim pada permintaan tersebut?',null,'# dari halaman https://shop.toko.id/keranjang
Set-Cookie: id=7; Path=/akun/profil; Secure

# permintaan berikutnya ke:
https://shop.toko.id/akun/pengaturan','http','["Tidak","Tergantung SameSite saja","Ya"]'::jsonb,null,0,'Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (/). Path cocok pada batas ''/''. Secure butuh https. Hasil: tidak terkirim.',null,'Cek berurutan: host, path (aturan batas ''/''), skema.',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 30 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1759999990, nbf: 1760000010, iss: "auth.lain.id", aud: "web.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: tanda tangan tidak valid","Diterima","Ditolak: issuer tidak sesuai"]'::jsonb,null,2,'Cek berurutan: Ditolak: issuer tidak sesuai. exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Gita, Bandung) (2, Ayu, Padang) (3, Eka, NULL) (4, Fajar, Medan) (5, Hana, Medan) (6, Citra, Medan)
-- pesanan(id, pelanggan_id, total, status)
(1, 3, 30, baru) (2, NULL, 30, baru) (3, 4, 90, lunas) (4, 2, 80, baru) (5, 1, 30, batal) (6, 5, 30, batal) (7, 2, 30, lunas) (8, 2, 40, batal)

SELECT COUNT(*), COUNT(o.id), COUNT(DISTINCT p.id)
FROM pelanggan p LEFT JOIN pesanan o ON o.pelanggan_id = p.id;','sql','["7,8,6","8,8,7","8,7,6"]'::jsonb,null,2,'COUNT(*) menghitung semua baris hasil join (satu pelanggan tampil sebanyak pesanannya, atau sekali bila tak punya), COUNT(kolom) melewati NULL, COUNT(DISTINCT) menghilangkan duplikat. Hasil: 8,7,6.',null,'Mana yang melewati NULL?',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 97 → tiba t=97
"ko": kirim t=85, latensi 581 → tiba t=666
"kop": kirim t=205, latensi 126 → tiba t=331

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"kop\" — query yang diketik paling akhir","\"k\" — respons yang tiba paling awal","\"ko\" — respons yang tiba paling akhir"]'::jsonb,null,2,'Urutan tiba: "k" → "kop" → "ko". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(7);
  function klik() {
    setN((p) => p * 4);
    setN(n + 2);
    setN((p) => p + 3);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["9","12","33"]'::jsonb,null,1,'Antrean update diproses berurutan mulai dari n=7 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 7 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 12.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 40) (2, B, 10) (3, A, 40) (4, A, 30) (5, B, 20) (6, B, 20) (7, B, 40)

SELECT id, DENSE_RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,1 | 2,4 | 3,2 | 4,3 | 5,2 | 6,3 | 7,1","1,1 | 2,3 | 3,1 | 4,2 | 5,2 | 6,2 | 7,1","1,1 | 2,4 | 3,1 | 4,3 | 5,2 | 6,2 | 7,1"]'::jsonb,null,1,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,1 | 2,3 | 3,1 | 4,2 | 5,2 | 6,2 | 7,1.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'(async () => {
  console.log("E");
  await null;
  console.log("C");
})();
setTimeout(() => {
  console.log("B");
  Promise.resolve().then(() => console.log("A"));
}, 0);
console.log("F");
Promise.resolve().then(() => console.log("D"));
setTimeout(() => console.log("H"), 0);','javascript','["E C B A F D H","E C F D B A H","E F C D B A H"]'::jsonb,null,2,'Urutan nyata: E F C D B A H. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','output','Apa output kode ini?',null,'(async () => {
  try {
    await Promise.reject(new Error("r7"));
  } catch (e) {
    console.log("c", e.message);
  } finally {
    console.log("f");
  }
  console.log("end");
})();
console.log("sync");','javascript','["sync | c r7 | f | end","end | f | c r7 | sync","sync | c r8 | f | end"]'::jsonb,null,0,'Dijalankan: sync | c r7 | f | end.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','guess','Dari daftar ini, nomor mana yang BUKAN meta-framework lintas sisi?',null,'1. Astro
2. SvelteKit
3. ActiveMQ
4. Testing Library
5. Nuxt','text','["3 dan 4","1 dan 2 dan 4","2 dan 3 dan 4"]'::jsonb,null,0,'Testing Library dan ActiveMQ termasuk kategori lain; SvelteKit, Nuxt, Astro adalah meta-framework lintas sisi.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_B → LOCK tabel_C → COMMIT
T2: LOCK tabel_C → LOCK tabel_A → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan"]'::jsonb,null,1,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('fullstack','output','Berapa p50 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [243,782,214,888,250,416,145,130,495,204,267,772,105]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["378","267","250"]'::jsonb,null,2,'N=13, rank=⌈50/100×13⌉=7 → 250 ms. Rata-rata (378) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.any([ok("A", 15), ok("B", 5), bad("C", 10)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["ok [\"fA\",\"fB\",\"rC\"]","err C","ok \"B\""]'::jsonb,null,2,'Promise.any menghasilkan: ok "B". all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~1.2.3" }
// versi yang tersedia di registry:
1.2.3  1.2.4  1.3.6  1.4.5  1.4.6  2.2.0  2.2.3  2.2.5','json','["1.2.4","2.2.5","1.4.6"]'::jsonb,null,0,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 1.2.4.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (umur, kota, negara);

SELECT * FROM orang
WHERE kota > 30 AND negara > 30 AND umur = ''x'';','sql','["3","1","2"]'::jsonb,null,2,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 2.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src ''self'' ''unsafe-inline'' ''nonce-r4nd''

A. <script>inisiasi()</script>
B. <script nonce="r4nd">inisiasi()</script>
C. <script src="/app.js"></script>  <!-- same-origin -->
E. <script src="https://evil.example/x.js"></script>
F. <button onclick="kirim()">OK</button>','http','["A E F","A C F","C E F"]'::jsonb,null,0,'Diblokir: A E F. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','output','Berapa saldo akhir?',null,'-- saldo awal = 360, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 360
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 360
T1: UPDATE akun SET saldo = x + 30 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 20 WHERE id = 1; COMMIT;','sql','["410","380","390"]'::jsonb,null,1,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 360+20, sehingga tambahan 30 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(JSON.stringify(JSON.parse(''{"a":48,"b":[1,2],"c":{"d":null}}'', (k, v) => (typeof v === "number" ? v + 1 : v))));','javascript','["{''a'':49,''b'':[2,3],''c'':{''d'':null}}","{\"a\":50,\"b\":[2,3],\"c\":{\"d\":undefined}}","{\"a\":49,\"b\":[2,3],\"c\":{\"d\":null}}"]'::jsonb,null,2,'Hasil: {"a":49,"b":[2,3],"c":{"d":null}}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','guess','Apakah cookie ini ikut dikirim pada permintaan ke toko.web.id?',null,'halaman        : https://toko.id
fetch() dari JavaScript halaman
tujuan         : https://toko.web.id
Set-Cookie     : sid=1; SameSite=None; Secure; Domain milik tujuan','text','["Hanya dikirim jika memakai HTTP/2","Tidak, cookie tidak dikirim","Ya, cookie dikirim"]'::jsonb,null,2,'Hubungan: cross-origin dan cross-site. Pada konteks same-site cookie selalu dikirim; pada cross-site: Strict tidak pernah, Lax hanya untuk navigasi top-level dengan metode aman (GET), None dikirim (wajib Secure).',null,'Apakah ini same-site? Jika bukan, cek nilai SameSite dan jenis permintaan.',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tombol.addEventListener("click", () => log("A"), true);
tengah.addEventListener("click", () => log("B"));
tengah.addEventListener("click", () => log("C"), true);
tombol.addEventListener("click", () => log("D"));
tengah.addEventListener("click", () => log("E"), true);','javascript','["A D B C E","C E A D B","A B C D E"]'::jsonb,null,1,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: C E A D B.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 5 item
halaman 1 → [100, 99, 98, 97, 96]
# lalu 2 item baru (id 101…102) ditambahkan sebelum halaman 2 diminta
GET /item?limit=5&sebelum_id=96','text','["[96, 95, 94, 93, 92]","[97, 96, 95, 94, 93]","[95, 94, 93, 92, 91]"]'::jsonb,null,2,'Cursor memakai id terakhir yang sudah dilihat sehingga hasil stabil terhadap sisipan/hapus di depan: [95, 94, 93, 92, 91].',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("https://api.toko.id:8443/pesanan", {
  method: "PUT",
  headers: { "Content-Type": "application/json" },
  credentials: "omit",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: https://app.toko.id
Access-Control-Allow-Credentials: true
Access-Control-Allow-Methods: GET, POST
Access-Control-Allow-Headers: content-type','javascript','["Request asli TERKIRIM ke server, tetapi respons diblokir untuk JavaScript","Preflight gagal: request asli tidak pernah dikirim","Same-origin: CORS tidak berlaku, request berhasil"]'::jsonb,null,1,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 900px) 50vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1024px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-640.jpg","foto-2000.jpg","foto-1024.jpg"]'::jsonb,null,2,'Slot = 50vw × 1024 = 512px CSS; × DPR 2 = 1024px fisik → kandidat terkecil yang ≥ itu: 1024w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','output','Apa output kode ini?',null,'const u = new URL("https://toko.id:443/cari?tag=a&tag=b&q=kopi+susu&q2=%20x#h");
console.log(u.origin, u.searchParams.getAll("tag").join("|"), u.searchParams.get("q"), u.searchParams.get("q2").length, u.hash);','javascript','["b kopi susu 2 #h|https://toko.id a","https://toko.id a|b kopi susu 2 #h","https://toko.id a|b kopi susu 3 #h"]'::jsonb,null,1,'Hasil: https://toko.id a|b kopi susu 2 #h. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 3600 detik yang lalu
Cache-Control: private, max-age=600, s-maxage=86400, stale-while-revalidate=600
(tanpa ETag/Last-Modified)
# resource di server TIDAK berubah; permintaan ulang oleh browser (private cache), navigasi biasa','http','["Unduh penuh (200) dari server","Dilayani dari cache tanpa request ke jaringan","Request kondisional; server membalas 304 tanpa body"]'::jsonb,null,0,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
function buat() {
  return { n: 17, get: () => this.n };
}
const o = buat.call({ n: 120 });
console.log(o.get(), o.n);','javascript','["17 TypeError","120 17","17 undefined"]'::jsonb,null,1,'Arrow memakai this dari fungsi pembungkusnya (buat), yaitu objek yang di-call; bukan objek literal yang dikembalikan. o.n tetap nilai propertinya sendiri.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','output','Berapa query SQL yang dijalankan (50 post, 5 penulis berbeda)?',null,'posts = Post.objects.all()[:50]
for p in posts:
    print(p.penulis.nama)        # relasi ForeignKey, lazy','python','["51","1","2"]'::jsonb,null,0,'Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','guess','Apakah cookie ini ikut dikirim pada permintaan ke toko.org?',null,'halaman        : https://toko.com
<img> yang dimuat halaman
tujuan         : https://toko.org
Set-Cookie     : sid=1; SameSite=Lax; Domain milik tujuan','text','["Hanya dikirim jika memakai HTTP/2","Ya, cookie dikirim","Tidak, cookie tidak dikirim"]'::jsonb,null,2,'Hubungan: cross-origin dan cross-site. Pada konteks same-site cookie selalu dikirim; pada cross-site: Strict tidak pernah, Lax hanya untuk navigasi top-level dengan metode aman (GET), None dikirim (wajib Secure).',null,'Apakah ini same-site? Jika bukan, cek nilai SameSite dan jenis permintaan.',null),
('fullstack','output','Berapa p90 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [114,572,240,858,771,698,596,824,469,194,898,153,760,209,390,98,136,86,84,676]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["441","858","824"]'::jsonb,null,2,'N=20, rank=⌈90/100×20⌉=18 → 824 ms. Rata-rata (441) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 910, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 910
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 910
T1: UPDATE akun SET saldo = x + 50 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 40 WHERE id = 1; COMMIT;','sql','["Gunakan UPDATE atomik","Menambah indeks pada kolom saldo","Mengganti COMMIT menjadi ROLLBACK"]'::jsonb,null,0,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('fullstack','output','Apa output kode ini?',null,'console.log(encodeURIComponent("img &=/é"), encodeURI("https://api.toko.id/c x?q=a b&r=é"));','javascript','["img%20%26%3D%2F%C3%A9 https://api.toko.id/c%20x?q=a%20b&r=%C3%A9","img%21%26%3D%2F%C3%A9 https://api.toko.id/c%20x?q=a%20b&r=%C3%A9","img%20%25%3D%2F%C3%A9 https://api.toko.id/c%20x?q=a%20b&r=%C3%A9"]'::jsonb,null,0,'Hasil: img%20%26%3D%2F%C3%A9 https://api.toko.id/c%20x?q=a%20b&r=%C3%A9. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','guess','Apakah cookie ini ikut terkirim pada permintaan tersebut?',null,'# dari halaman https://shop.toko.id/keranjang
Set-Cookie: id=7

# permintaan berikutnya ke:
https://shop.toko.id/','http','["Ya","Tergantung SameSite saja","Tidak"]'::jsonb,null,0,'Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (/). Path cocok pada batas ''/''. Secure butuh https. Hasil: terkirim.',null,'Cek berurutan: host, path (aturan batas ''/''), skema.',null);
