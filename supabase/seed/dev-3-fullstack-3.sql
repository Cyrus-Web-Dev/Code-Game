-- DIHASILKAN oleh scripts/gen-dev.mjs (fullstack, bagian 3/4) — 250 soal HARD MODE (v2.4)
insert into questions (difficulty,type,prompt,prompt_en,code,language,options,options_en,correct_index,explanation,explanation_en,hint,hint_en) values
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tengah.addEventListener("click", () => log("A"), true);
luar.addEventListener("click", () => log("B"), true);
tengah.addEventListener("click", () => log("C"));
tombol.addEventListener("click", () => log("D"));','javascript','["A B C D","D A C B","B A D C"]'::jsonb,null,2,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: B A D C.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'setTimeout(() => {
  console.log("G");
  Promise.resolve().then(() => console.log("H"));
}, 0);
queueMicrotask(() => console.log("E"));
(async () => {
  console.log("C");
  await null;
  console.log("A");
})();
Promise.resolve().then(() => console.log("undefined"));
setTimeout(() => console.log("undefined"), 0);','javascript','["G H E C A","C E A undefined G H undefined","C E A G undefined H undefined"]'::jsonb,null,1,'Urutan nyata: C E A undefined G H undefined. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','output','Berapa p99 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [345,240,76,586,821,329,760,319,650,397,156,323,415,430,845,522,82,348,51,399]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["845","821","405"]'::jsonb,null,0,'N=20, rank=⌈99/100×20⌉=20 → 845 ms. Rata-rata (405) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','guess','Apakah cookie ini ikut terkirim pada permintaan tersebut?',null,'# dari halaman https://shop.toko.id/akun/profil
Set-Cookie: id=7; Domain=toko.id; Path=/akun; HttpOnly

# permintaan berikutnya ke:
https://shop.toko.id/akun/pengaturan','http','["Tidak","Ya","Tergantung SameSite saja"]'::jsonb,null,1,'Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (/akun). Path cocok pada batas ''/''. Secure butuh https. Hasil: terkirim.',null,'Cek berurutan: host, path (aturan batas ''/''), skema.',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("http://api.toko.id/pesanan", {
  method: "POST",
  headers: { "Authorization": "Bearer abc", "Content-Type": "application/json" },
  credentials: "omit",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: https://lain.id
Access-Control-Allow-Credentials: true
Access-Control-Allow-Methods: PUT, POST
Access-Control-Allow-Headers: content-type','javascript','["Browser mengirim preflight OPTIONS dulu, lalu request asli berhasil","Request langsung dikirim (tanpa preflight) dan respons boleh dibaca JavaScript","Preflight gagal: request asli tidak pernah dikirim"]'::jsonb,null,2,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src ''self'' ''nonce-r4nd''

A. <script>inisiasi()</script>
B. <script nonce="r4nd">inisiasi()</script>
C. <script src="/app.js"></script>  <!-- same-origin -->
E. <script src="https://evil.example/x.js"></script>
F. <button onclick="kirim()">OK</button>','http','["A E F","C E F","A B F"]'::jsonb,null,0,'Diblokir: A E F. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 417 → tiba t=417
"ko": kirim t=98, latensi 72 → tiba t=170
"kop": kirim t=198, latensi 207 → tiba t=405

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"k\" — respons yang tiba paling akhir","\"kop\" — query yang diketik paling akhir","\"ko\" — respons yang tiba paling awal"]'::jsonb,null,0,'Urutan tiba: "ko" → "kop" → "k". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.allSettled([ok("A", 10), ok("B", 15), bad("C", 5)])
  .then((r) => console.log("ok", JSON.stringify(r.map((x) => x.status[0] + (x.value ?? x.reason.message)))))
  .catch((e) => console.log("err", e.message));','javascript','["err C","ok \"A\"","ok [\"fA\",\"fB\",\"rC\"]"]'::jsonb,null,2,'Promise.allSettled menghasilkan: ok ["fA","fB","rC"]. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 0 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1759999990, nbf: 1760000010, iss: "auth.toko.id", aud: "web.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: belum berlaku (nbf)","Ditolak: token kedaluwarsa","Diterima"]'::jsonb,null,1,'Cek berurutan: Ditolak: token kedaluwarsa (exp). exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','guess','Apakah cookie ini ikut dikirim pada permintaan ke api.toko.id?',null,'halaman        : https://app.toko.id
form POST top-level
tujuan         : https://api.toko.id
Set-Cookie     : sid=1; SameSite=None; Secure; Domain milik tujuan','text','["Tidak, cookie tidak dikirim","Ya, cookie dikirim","Hanya dikirim jika memakai HTTP/2"]'::jsonb,null,1,'Hubungan: cross-origin tetapi same-site. Pada konteks same-site cookie selalu dikirim; pada cross-site: Strict tidak pernah, Lax hanya untuk navigasi top-level dengan metode aman (GET), None dikirim (wajib Secure).',null,'Apakah ini same-site? Jika bukan, cek nilai SameSite dan jenis permintaan.',null),
('fullstack','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 600, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 600
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 600
T1: UPDATE akun SET saldo = x + 60 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 90 WHERE id = 1; COMMIT;','sql','["Mengganti COMMIT menjadi ROLLBACK","Gunakan UPDATE atomik","Menambah indeks pada kolom saldo"]'::jsonb,null,1,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('fullstack','output','Apa output kode ini?',null,'console.log(encodeURIComponent("img &=/é"), encodeURI("https://toko.id/produk x?q=a b&r=é"));','javascript','["img%20%26%3D%2F%C3%A9 https://toko.id/produk%20x?q=a%20b&r=%C3%A9","img%20%26%13D%2F%C3%A9 https://toko.id/produk%20x?q=a%20b&r=%C3%A9","img%20%26%3D%3F%C3%A9 https://toko.id/produk%20x?q=a%20b&r=%C3%A9"]'::jsonb,null,0,'Hasil: img%20%26%3D%2F%C3%A9 https://toko.id/produk%20x?q=a%20b&r=%C3%A9. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','guess','Apakah cookie ini ikut dikirim pada permintaan ke toko.org?',null,'halaman        : https://toko.com
form POST top-level
tujuan         : https://toko.org
Set-Cookie     : sid=1; SameSite=Lax; Domain milik tujuan','text','["Hanya dikirim jika memakai HTTP/2","Tidak, cookie tidak dikirim","Ya, cookie dikirim"]'::jsonb,null,1,'Hubungan: cross-origin dan cross-site. Pada konteks same-site cookie selalu dikirim; pada cross-site: Strict tidak pernah, Lax hanya untuk navigasi top-level dengan metode aman (GET), None dikirim (wajib Secure).',null,'Apakah ini same-site? Jika bukan, cek nilai SameSite dan jenis permintaan.',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 20) (2, A, 10) (3, A, 40) (4, B, 30) (5, A, 20) (6, A, 40) (7, B, 10)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,0 | 2,-10 | 3,30 | 4,-10 | 5,-10 | 6,20 | 7,-30","1,0 | 2,0 | 3,30 | 4,10 | 5,-20 | 6,20 | 7,-20","1,10 | 2,30 | 3,-20 | 4,-20 | 5,20 | 6,0 | 7,0"]'::jsonb,null,1,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,0 | 3,30 | 4,10 | 5,-20 | 6,20 | 7,-20.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 30 detik yang lalu
Cache-Control: private, max-age=300
(tanpa ETag/Last-Modified)
# resource di server TIDAK berubah; permintaan ulang oleh browser (private cache), navigasi biasa','http','["Dilayani dari cache tanpa request ke jaringan","Request kondisional; server membalas 304 tanpa body","Dilayani dari cache (basi) sekarang, revalidasi di latar belakang"]'::jsonb,null,0,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
luar.addEventListener("click", (e) => { log("A"); e.stopImmediatePropagation(); });
tengah.addEventListener("click", () => log("B"));
luar.addEventListener("click", () => log("C"));
tengah.addEventListener("click", () => log("D"));
luar.addEventListener("click", () => log("E"), true);','javascript','["B D A","E B D A","A B D E"]'::jsonb,null,1,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: E B D A.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','output','Berapa query SQL yang dijalankan (100 post, 3 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:100]
for p in posts:
    print(p.penulis.nama)','python','["1","2","101"]'::jsonb,null,0,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~0.0.4" }
// versi yang tersedia di registry:
0.0.4  0.0.5  0.2.4  1.0.4  1.0.5  1.0.7  1.1.4  1.1.6','json','["1.1.6","0.0.5","0.0.4"]'::jsonb,null,1,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 0.0.5.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','guess','Mengapa gambar/skrip bernama app.v123.js bisa diberi ''Cache-Control: public, max-age=31536000, immutable''?',null,'<script src="/app.v123.js"></script>','http','["Karena browser mengabaikan umur cache untuk .js","Karena immutable membuat server tidak menerima deploy baru","Nama berkas berversi/hash"]'::jsonb,null,2,'Cache busting lewat nama berkas memungkinkan umur cache sangat panjang tanpa risiko basi.',null,'Bagaimana versi baru diminta?',null),
('fullstack','guess','Manakah kombinasi nomor yang SEMUANYA merupakan basis data relasional?',null,'1. CouchDB
2. PostgreSQL
3. SQL Server
4. SolidJS
5. MySQL','text','["1, 2, 3","1, 4, 5","2, 3, 5"]'::jsonb,null,2,'PostgreSQL, SQL Server, MySQL adalah basis data relasional; CouchDB dan SolidJS termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 14; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. A: counter = tmpA + 1
4. A: tmpA = counter
5. A: counter = tmpA + 1
6. B: counter = tmpB + 1
7. B: tmpB = counter
8. B: counter = tmpB + 1','python','["18","16","17"]'::jsonb,null,1,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 16, bukan 18. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'queueMicrotask(() => console.log("D"));
(async () => {
  console.log("E");
  await null;
  console.log("G");
})();
setTimeout(() => console.log("H"), 0);
console.log("F");
setTimeout(() => {
  console.log("A");
  Promise.resolve().then(() => console.log("B"));
}, 0);','javascript','["E F D G H A B","D E G H F A B","E F D H G A B"]'::jsonb,null,0,'Urutan nyata: E F D G H A B. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.any([ok("A", 10), ok("B", 15), ok("C", 5)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["ok \"C\"","ok [\"fA\",\"fB\",\"fC\"]","ok [\"A\",\"B\",\"C\"]"]'::jsonb,null,0,'Promise.any menghasilkan: ok "C". all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, umur, kota);

SELECT * FROM orang
WHERE umur = ''x'' AND kota = ''x'' AND negara > 30;','sql','["2","1","3"]'::jsonb,null,1,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','guess','Bisakah JavaScript di halaman penyetel membaca cookie ini lewat document.cookie?',null,'Set-Cookie: id=7; Secure
// dari halaman https://shop.toko.id/keranjang','http','["Ya, bisa dibaca","Hanya jika SameSite=None","Tidak: hanya server yang bisa"]'::jsonb,null,0,'Tanpa HttpOnly, skrip pada halaman yang cocok domain/path bisa membacanya (risiko XSS).',null,'Atribut mana yang mengatur akses dari JavaScript?',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("http://api.toko.id/pesanan", {
  method: "GET",
  headers: { "Content-Type": "application/json" },
  credentials: "include",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: https://app.toko.id
Access-Control-Allow-Methods: DELETE, POST
Access-Control-Allow-Headers: content-type','javascript','["Browser mengirim preflight OPTIONS dulu, lalu request asli berhasil","Same-origin: CORS tidak berlaku, request berhasil","Preflight gagal: request asli tidak pernah dikirim"]'::jsonb,null,2,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
const o = { n: 75, get() { return this.n; } };
const g = o.get;
try { console.log(g()); } catch (e) { console.log(e.name); }','javascript','["75","ReferenceError","TypeError"]'::jsonb,null,2,'g() dipanggil tanpa receiver; di strict mode this = undefined sehingga this.n melempar TypeError.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','output','Apa output kode ini?',null,'function f() {
  try { return "t1"; } finally { console.log("fin"); }
}
console.log(f());','javascript','["fin | t1","t1 | fin","fin | t2"]'::jsonb,null,0,'Dijalankan: fin | t1.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 700px) 40vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1440px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1280.jpg","foto-640.jpg","foto-2000.jpg"]'::jsonb,null,0,'Slot = 40vw × 1440 = 576px CSS; × DPR 2 = 1152px fisik → kandidat terkecil yang ≥ itu: 1280w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 4 item
halaman 1 → [100, 99, 98, 97]
# lalu 1 item baru (id 101) ditambahkan sebelum halaman 2 diminta
GET /item?limit=4&offset=4','text','["[98, 97, 96, 95]","[97, 96, 95, 94]","[96, 95, 94, 93]"]'::jsonb,null,1,'Offset menghitung dari posisi, bukan dari item terakhir yang dilihat: item baru menggeser daftar sehingga item akhir halaman 1 muncul lagi (duplikat).',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_C → LOCK tabel_B → LOCK tabel_A → COMMIT
T2: LOCK tabel_B → LOCK tabel_C → COMMIT
T3: LOCK tabel_C → LOCK tabel_A → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_B → tabel_A","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh"]'::jsonb,null,1,'Graf urutan kunci memuat siklus tabel_A → tabel_B → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('fullstack','output','Apa output kode ini?',null,'const o = { n: 7, toJSON() { return { v: this.n * 2 }; } };
console.log(JSON.stringify({ o, a: [o] }));','javascript','["{''o'':{''v'':14},''a'':[{''v'':14}]}","{\"o\":{\"v\":15},\"a\":[{\"v\":14}]}","{\"o\":{\"v\":14},\"a\":[{\"v\":14}]}"]'::jsonb,null,2,'Hasil: {"o":{"v":14},"a":[{"v":14}]}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(4);
  function klik() {
    setN(n + 1);
    setN(n + 5);
    setN((p) => p + 3);
    setN((p) => p + 1);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["13","9","14"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=4 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 4 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 13.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 470, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 470
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 470
T1: UPDATE akun SET saldo = x + 30 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 10 WHERE id = 1; COMMIT;','sql','["Gunakan UPDATE atomik","Menambah indeks pada kolom saldo","Mengganti COMMIT menjadi ROLLBACK"]'::jsonb,null,0,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 0 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1760003600, nbf: 1760000090, iss: "auth.toko.id", aud: "web.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: belum berlaku (nbf)","Ditolak: tanda tangan tidak valid","Diterima"]'::jsonb,null,0,'Cek berurutan: Ditolak: belum berlaku (nbf). exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src https://cdn.toko.id ''self'' ''nonce-r4nd''

A. <script>inisiasi()</script>
B. <script nonce="r4nd">inisiasi()</script>
D. <script src="https://cdn.toko.id/lib.js"></script>
E. <script src="https://evil.example/x.js"></script>
F. <button onclick="kirim()">OK</button>','http','["A E F","B E F","A B F"]'::jsonb,null,0,'Diblokir: A E F. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','output','Berapa p99 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [817,426,384,570,591,56,387,887,80,217,121,364,40,404,650,92,250,246,838]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["391","887","838"]'::jsonb,null,1,'N=19, rank=⌈99/100×19⌉=19 → 887 ms. Rata-rata (391) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 278 → tiba t=278
"ko": kirim t=97, latensi 536 → tiba t=633
"kop": kirim t=248, latensi 252 → tiba t=500

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"ko\" — respons yang tiba paling akhir","\"kop\" — query yang diketik paling akhir","\"kop\" — respons yang tiba paling awal"]'::jsonb,null,0,'Urutan tiba: "k" → "kop" → "ko". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 4 f.txt menjadi "fitur"
main: mengubah baris 3 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Ayu, Padang) (2, Gita, Bandung) (3, Citra, Bandung) (4, Hana, Medan) (5, Dedi, Medan) (6, Eka, Bandung)
-- pesanan(id, pelanggan_id, total, status)
(1, 3, 20, batal) (2, 3, 60, batal) (3, 5, 90, baru) (4, 3, 70, baru) (5, 5, 30, lunas) (6, 4, 40, batal) (7, 2, 50, lunas)

SELECT COUNT(*), COUNT(o.id), COUNT(DISTINCT p.id)
FROM pelanggan p LEFT JOIN pesanan o ON o.pelanggan_id = p.id;','sql','["9,7,6","7,9,6","9,9,7"]'::jsonb,null,0,'COUNT(*) menghitung semua baris hasil join (satu pelanggan tampil sebanyak pesanannya, atau sekali bila tak punya), COUNT(kolom) melewati NULL, COUNT(DISTINCT) menghilangkan duplikat. Hasil: 9,7,6.',null,'Mana yang melewati NULL?',null),
('fullstack','output','Berapa query SQL yang dijalankan (20 post, 4 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:20]
for p in posts:
    print(p.penulis.nama)','python','["2","21","1"]'::jsonb,null,2,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 0 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1760000020, nbf: 1759999980, iss: "auth.lain.id", aud: "web.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: token kedaluwarsa (exp)","Ditolak: audience tidak sesuai","Ditolak: issuer tidak sesuai"]'::jsonb,null,2,'Cek berurutan: Ditolak: issuer tidak sesuai. exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','guess','Hubungan kedua URL ini?',null,'halaman : https://shop.toko.id
permintaan: https://toko.id','text','["cross-origin dan cross-site","same-origin (dan same-site)","cross-origin tetapi same-site"]'::jsonb,null,2,'Origin = skema+host+port; site = eTLD+1 (+ skema). shop.toko.id → toko.id, toko.id → toko.id. github.io dan vercel.app ada di Public Suffix List, jadi subdomainnya berbeda site.',null,'Public Suffix List menentukan batas site.',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("https://api.toko.id/pesanan", {
  method: "PATCH",
  credentials: "omit",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: https://app.toko.id
Access-Control-Allow-Methods: GET, PATCH, PUT
Access-Control-Allow-Headers: authorization, content-type','javascript','["Request asli TERKIRIM ke server, tetapi respons diblokir untuk JavaScript","Browser mengirim preflight OPTIONS dulu, lalu request asli berhasil","Same-origin: CORS tidak berlaku, request berhasil"]'::jsonb,null,1,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','output','Apa output kode ini?',null,'console.log(JSON.stringify(JSON.parse(''{"a":6,"b":[1,2],"c":{"d":null}}'', (k, v) => (typeof v === "number" ? v + 1 : v))));','javascript','["{\"a\":8,\"b\":[2,3],\"c\":{\"d\":undefined}}","{\"a\":7,\"b\":[2,3],\"c\":{\"d\":null}}","{''a'':7,''b'':[2,3],''c'':{''d'':null}}"]'::jsonb,null,1,'Hasil: {"a":7,"b":[2,3],"c":{"d":null}}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','output','Berapa saldo akhir?',null,'-- saldo awal = 470, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 470
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 470
T1: UPDATE akun SET saldo = x + 40 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 40 WHERE id = 1; COMMIT;','sql','["550","510","470"]'::jsonb,null,1,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 470+40, sehingga tambahan 40 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, kota, umur);

SELECT * FROM orang
WHERE umur = ''x'' AND kota = ''x'';','sql','["1","2","0"]'::jsonb,null,2,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 0.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 6 item
halaman 1 → [100, 99, 98, 97, 96, 95]
# lalu 3 item teratas dihapus sebelum halaman 2 diminta
GET /item?limit=6&offset=6','text','["[91, 90, 89, 88, 87, 86]","[90, 89, 88, 87, 86, 85]","[94, 93, 92, 91, 90, 89]"]'::jsonb,null,0,'Offset menghitung dari posisi, bukan dari item terakhir yang dilihat: penghapusan menggeser daftar naik sehingga ada item yang terlewat.',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.any([ok("A", 5), ok("B", 15), ok("C", 10)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["ok [\"fA\",\"fB\",\"fC\"]","ok \"A\"","ok [\"A\",\"B\",\"C\"]"]'::jsonb,null,1,'Promise.any menghasilkan: ok "A". all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 600 detik yang lalu
Cache-Control: no-store, max-age=300
ETag: "v7"
# resource di server TIDAK berubah; permintaan ulang oleh browser (private cache), navigasi biasa','http','["Dilayani dari cache tanpa request ke jaringan","Unduh penuh (200) dari server","Dilayani dari cache (basi) sekarang, revalidasi di latar belakang"]'::jsonb,null,1,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
const o = { n: 70, get() { return this.n; } };
const g = o.get;
try { console.log(g()); } catch (e) { console.log(e.name); }','javascript','["ReferenceError","TypeError","232"]'::jsonb,null,1,'g() dipanggil tanpa receiver; di strict mode this = undefined sehingga this.n melempar TypeError.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','guess','Dari daftar ini, nomor mana yang BUKAN pustaka/framework UI?',null,'1. Vue
2. React
3. GraphQL
4. Jotai
5. SolidJS','text','["3 dan 4","2 dan 3 dan 5","1 dan 2 dan 3"]'::jsonb,null,0,'GraphQL dan Jotai termasuk kategori lain; React, Vue, SolidJS adalah pustaka/framework UI.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 6 f.txt menjadi "fitur"
main: mengubah baris 2 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(7);
  function klik() {
    setN((p) => p + 3);
    setN(n + 4);
    setN((p) => p * 3);
    setN((p) => p + 1);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["34","11","43"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=7 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 7 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 34.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 10) (2, B, 20) (3, A, 30) (4, A, 10) (5, A, 10) (6, A, 20)

SELECT id, RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,2 | 2,1 | 1,1 | 4,3 | 5,3 | 6,2","1,2 | 2,1 | 3,1 | 4,3 | 5,3 | 6,2","1,2 | 2,1 | 3,1 | 4,3 | 5,4 | 6,2"]'::jsonb,null,1,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,2 | 2,1 | 3,1 | 4,3 | 5,3 | 6,2.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','output','Berapa p99 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [248,674,479,212,651,624,857,804,113,798,222,305]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["499","804","857"]'::jsonb,null,2,'N=12, rank=⌈99/100×12⌉=12 → 857 ms. Rata-rata (499) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Fajar, Medan) (2, Eka, Padang) (3, Gita, NULL) (4, Ayu, Medan) (5, Hana, Bandung)
-- pesanan(id, pelanggan_id, total, status)
(1, 3, 50, lunas) (2, NULL, 40, lunas) (3, 2, 50, lunas) (4, 4, 20, lunas) (5, 3, 40, lunas) (6, 1, 60, lunas) (7, 2, 50, batal) (8, 4, 50, lunas)

SELECT COUNT(*) FROM pelanggan p
LEFT JOIN pesanan o ON o.pelanggan_id = p.id
WHERE o.status = ''baru'';','sql','["5","0","7"]'::jsonb,null,1,'Kondisi pada tabel kanan di WHERE membuang baris NULL hasil LEFT JOIN sehingga ia berperilaku seperti INNER JOIN; bila kondisi ada di ON, pelanggan tanpa pesanan tetap muncul. Hasil: 0.',null,'WHERE atau ON — mana yang menyaring SETELAH join?',null),
('fullstack','output','Apa output kode ini?',null,'function f() {
  try { throw new Error("x"); } catch { return "c8"; } finally { return "f94"; }
}
console.log(f());','javascript','["f94","undefined","f95"]'::jsonb,null,0,'Dijalankan: f94.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','guess','Apakah cookie ini ikut terkirim pada permintaan tersebut?',null,'# dari halaman https://shop.toko.id/akun/profil
Set-Cookie: id=7; Path=/akun

# permintaan berikutnya ke:
http://shop.toko.id/akun/pengaturan','http','["Ya","Tidak","Tergantung SameSite saja"]'::jsonb,null,0,'Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (/akun). Path cocok pada batas ''/''. Secure butuh https. Hasil: terkirim.',null,'Cek berurutan: host, path (aturan batas ''/''), skema.',null),
('fullstack','guess','Fungsi header ini?',null,'Strict-Transport-Security: max-age=31536000; includeSubDomains','http','["Mengenkripsi isi cookie sebelum dikirim ke server tujuan","Mengizinkan CORS dari semua subdomain tanpa pengecekan origin","Memerintahkan browser memakai HTTPS saja untuk host"]'::jsonb,null,2,'HSTS mencegah downgrade ke HTTP dan stripping SSL pada kunjungan berikutnya.',null,'Apa yang diingat browser?',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 2; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. B: counter = tmpB + 1
4. A: counter = tmpA + 1
5. A: tmpA = counter
6. B: tmpB = counter
7. A: counter = tmpA + 1
8. B: counter = tmpB + 1','python','["4","5","6"]'::jsonb,null,0,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 4, bukan 6. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_B → LOCK tabel_A → LOCK tabel_C → COMMIT
T2: LOCK tabel_B → LOCK tabel_A → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan"]'::jsonb,null,1,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 427 → tiba t=427
"ko": kirim t=86, latensi 624 → tiba t=710
"kop": kirim t=247, latensi 114 → tiba t=361

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"ko\" — respons yang tiba paling akhir","\"kop\" — query yang diketik paling akhir","\"kop\" — respons yang tiba paling awal"]'::jsonb,null,0,'Urutan tiba: "kop" → "k" → "ko". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tengah.addEventListener("click", () => log("A"), true);
luar.addEventListener("click", () => log("B"), true);
luar.addEventListener("click", () => log("C"));
tengah.addEventListener("click", () => log("D"));
tombol.addEventListener("click", () => log("E"));','javascript','["A B C D E","B A E D C","E A D B C"]'::jsonb,null,1,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: B A E D C.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src ''nonce-r4nd'' ''self'' ''unsafe-inline''

A. <script>inisiasi()</script>
B. <script nonce="r4nd">inisiasi()</script>
C. <script src="/app.js"></script>  <!-- same-origin -->
D. <script src="https://cdn.toko.id/lib.js"></script>
G. eval("1 + 1")  // di dalam skrip yang diizinkan','http','["C D G","A D G","A B G"]'::jsonb,null,1,'Diblokir: A D G. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'setTimeout(() => console.log("F"), 0);
Promise.resolve().then(() => console.log("H"));
Promise.resolve().then(() => console.log("B"));
queueMicrotask(() => console.log("G"));
setTimeout(() => console.log("C"), 0);','javascript','["H B G C F","H B G F C","F H B G C"]'::jsonb,null,1,'Urutan nyata: H B G F C. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(new URL("../b/x.png?v=9#top", "https://api.toko.id/img/c/h.html").href);','javascript','["https://api.toko.id/img/b/x.png?v=8#top","https://api.toko.id/img/b/x.png?v=7#top","https://api.toko.id/img/b/x.png?v=9#top"]'::jsonb,null,2,'Hasil: https://api.toko.id/img/b/x.png?v=9#top. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 700px) 50vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 390px, device pixel ratio 3; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1280.jpg","foto-480.jpg","foto-1600.jpg"]'::jsonb,null,0,'Slot = 90vw × 390 = 351px CSS; × DPR 3 = 1053px fisik → kandidat terkecil yang ≥ itu: 1280w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^0.0.4" }
// versi yang tersedia di registry:
0.0.4  0.0.5  0.1.0  0.1.7  1.0.7  1.1.0  1.1.5','json','["0.0.5","0.0.4","1.1.5"]'::jsonb,null,1,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 0.0.4.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
luar.addEventListener("click", () => log("A"));
luar.addEventListener("click", () => log("B"));
tengah.addEventListener("click", () => log("C"), true);
tombol.addEventListener("click", () => log("D"), true);','javascript','["C D A B","A B C D","D C A B"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: C D A B.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 30 detik yang lalu
Cache-Control: no-cache
ETag: "v7"
# resource di server TIDAK berubah; permintaan ulang oleh browser (private cache), navigasi biasa','http','["Request kondisional; server membalas 304 tanpa body","Dilayani dari cache (basi) sekarang, revalidasi di latar belakang","Dilayani dari cache tanpa request ke jaringan"]'::jsonb,null,0,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','output','Berapa query SQL yang dijalankan (20 post, 7 penulis berbeda)?',null,'posts = Post.objects.all()[:20]
for p in posts:
    print(p.penulis.nama)        # relasi ForeignKey, lazy','python','["21","1","2"]'::jsonb,null,0,'Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','output','Apa output kode ini?',null,'Promise.resolve(2)
  .finally(() => 24)
  .then((v) => console.log("v", v));','javascript','["v 3","undefined","v 2"]'::jsonb,null,2,'Dijalankan: v 2.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','guess','Apakah cookie ini ikut terkirim pada permintaan tersebut?',null,'# dari halaman https://shop.toko.id/akun/profil
Set-Cookie: id=7; Path=/

# permintaan berikutnya ke:
http://shop.toko.id/akun/pengaturan','http','["Tidak","Tergantung SameSite saja","Ya"]'::jsonb,null,2,'Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (/akun). Path cocok pada batas ''/''. Secure butuh https. Hasil: terkirim.',null,'Cek berurutan: host, path (aturan batas ''/''), skema.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 5 item
halaman 1 → [100, 99, 98, 97, 96]
# lalu 2 item baru (id 101…102) ditambahkan sebelum halaman 2 diminta
GET /item?limit=5&offset=5','text','["[95, 94, 93, 92, 91]","[97, 96, 95, 94, 93]","[96, 95, 94, 93, 92]"]'::jsonb,null,1,'Offset menghitung dari posisi, bukan dari item terakhir yang dilihat: item baru menggeser daftar sehingga item akhir halaman 1 muncul lagi (duplikat).',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'Promise.resolve().then(() => {
  console.log("B");
  queueMicrotask(() => console.log("A"));
});
Promise.resolve().then(() => {
  console.log("F");
  queueMicrotask(() => console.log("H"));
});
(async () => {
  console.log("G");
  await null;
  console.log("undefined");
})();
Promise.resolve().then(() => {
  console.log("undefined");
  queueMicrotask(() => console.log("undefined"));
});
Promise.resolve().then(() => {
  console.log("undefined");
  queueMicrotask(() => console.log("undefined"));
});','javascript','["G B F undefined undefined A undefined H undefined undefined","G B F undefined undefined undefined A H undefined undefined","B A F H G"]'::jsonb,null,1,'Urutan nyata: G B F undefined undefined undefined A H undefined undefined. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.all([bad("A", 5), bad("B", 15), bad("C", 10)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["err All promises were rejected","ok [\"rA\",\"rB\",\"rC\"]","err A"]'::jsonb,null,2,'Promise.all menghasilkan: err A. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (umur, negara, kota);

SELECT * FROM orang
WHERE negara = ''x'' AND umur = ''x'' AND kota > 30;','sql','["4","2","3"]'::jsonb,null,2,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 3.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','guess','Manakah kombinasi nomor yang SEMUANYA merupakan bundler/build tool?',null,'1. Rollup
2. PostCSS
3. Laravel
4. Webpack
5. Parcel','text','["1, 4, 5","1, 2, 4","1, 3, 4"]'::jsonb,null,0,'Rollup, Webpack, Parcel adalah bundler/build tool; Laravel dan PostCSS termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('fullstack','guess','Token WebSocket ditaruh di query string. Risiko utamanya?',null,'new WebSocket("wss://x.id/ws?token=" + jwt)','javascript','["WebSocket tidak mendukung query string pada URL koneksi awal","Token otomatis kedaluwarsa dalam 1 menit saat berada di URL","URL tercatat di log proxy/server dan riwayat sehingga token bocor"]'::jsonb,null,2,'URL sering dicatat (access log, monitoring). Rahasia sebaiknya tidak berada di URL.',null,'Di mana URL biasanya dicatat?',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 60 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1759999955, nbf: 1759999980, iss: "auth.lain.id", aud: "api.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: tanda tangan tidak valid","Ditolak: issuer tidak sesuai","Ditolak: audience tidak sesuai"]'::jsonb,null,1,'Cek berurutan: Ditolak: issuer tidak sesuai. exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','output','Apa output kode ini?',null,'const o = { n: 41, toJSON() { return { v: this.n * 2 }; } };
console.log(JSON.stringify({ o, a: [o] }));','javascript','["{\"o\":{\"v\":82},\"a\":[{\"v\":82}]}","{\"o\":{\"v\":83},\"a\":[{\"v\":82}]}","{''o'':{''v'':82},''a'':[{''v'':82}]}"]'::jsonb,null,0,'Hasil: {"o":{"v":82},"a":[{"v":82}]}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 7 f.txt menjadi "fitur"
main: mengubah baris 2 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Budi, Padang) (2, Fajar, Bandung) (3, Gita, Bandung) (4, Dedi, Bandung) (5, Hana, Medan) (6, Citra, Medan)
-- pesanan(id, pelanggan_id, total, status)
(1, 3, 20, lunas) (2, 3, 80, batal) (3, 5, 60, lunas) (4, 2, 40, lunas) (5, 3, 40, lunas) (6, 2, 80, baru) (7, 4, 50, lunas) (8, NULL, 90, batal) (9, 5, 60, baru)

SELECT p.nama FROM pelanggan p
WHERE (SELECT SUM(total) FROM pesanan o WHERE o.pelanggan_id = p.id)
  > (SELECT AVG(total) FROM pesanan)
ORDER BY p.nama;','sql','["Fajar | Gita | Hana","Fajar | Hana | Gita","(kosong)"]'::jsonb,null,0,'Subquery berkorelasi dihitung per pelanggan; pelanggan tanpa pesanan menghasilkan NULL sehingga perbandingan tidak lolos. Hasil: Fajar | Gita | Hana.',null,'Bandingkan SUM per pelanggan dengan AVG seluruh pesanan (termasuk yang pelanggan_id-nya NULL).',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 20) (2, B, 50) (3, A, 40) (4, A, 40) (5, B, 30) (6, B, 10) (7, B, 40) (8, A, 10)

SELECT id, DENSE_RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,3 | 2,1 | 3,1 | 4,2 | 5,3 | 6,4 | 7,2 | 8,4","1,3 | 2,1 | 3,1 | 4,1 | 5,3 | 6,4 | 7,2 | 8,4","1,2 | 2,1 | 3,1 | 4,1 | 5,3 | 6,4 | 7,2 | 8,3"]'::jsonb,null,2,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,2 | 2,1 | 3,1 | 4,1 | 5,3 | 6,4 | 7,2 | 8,3.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src ''unsafe-eval'' https://cdn.toko.id ''nonce-r4nd''

B. <script nonce="r4nd">inisiasi()</script>
C. <script src="/app.js"></script>  <!-- same-origin -->
D. <script src="https://cdn.toko.id/lib.js"></script>
E. <script src="https://evil.example/x.js"></script>
F. <button onclick="kirim()">OK</button>','http','["C E F","B C E","D E F"]'::jsonb,null,0,'Diblokir: C E F. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','output','Berapa p90 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [845,815,273,547,725,177,659,715,483,428,484,265,132,557,566,822,489,292,784,73]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["822","507","815"]'::jsonb,null,2,'N=20, rank=⌈90/100×20⌉=18 → 815 ms. Rata-rata (507) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 508 → tiba t=508
"ko": kirim t=134, latensi 514 → tiba t=648
"kop": kirim t=241, latensi 171 → tiba t=412

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"kop\" — respons yang tiba paling awal","\"ko\" — respons yang tiba paling akhir","\"kop\" — query yang diketik paling akhir"]'::jsonb,null,1,'Urutan tiba: "kop" → "k" → "ko". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_C → LOCK tabel_B → COMMIT
T2: LOCK tabel_A → LOCK tabel_B → LOCK tabel_C → COMMIT
T3: LOCK tabel_C → LOCK tabel_B → LOCK tabel_A → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mungkin: urutan penguncian membentuk siklus tabel_B → tabel_C → tabel_B"]'::jsonb,null,2,'Graf urutan kunci memuat siklus tabel_B → tabel_C → tabel_B: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 1024px) 60vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 768px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-800.jpg","foto-1600.jpg","foto-2000.jpg"]'::jsonb,null,1,'Slot = 90vw × 768 = 691px CSS; × DPR 2 = 1382px fisik → kandidat terkecil yang ≥ itu: 1600w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 640, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 640
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 640
T1: UPDATE akun SET saldo = x + 30 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 20 WHERE id = 1; COMMIT;','sql','["Mengganti COMMIT menjadi ROLLBACK","Menambah indeks pada kolom saldo","Gunakan UPDATE atomik"]'::jsonb,null,2,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(9);
  function klik() {
    setN((p) => p * 4);
    setN(17);
    setN(n + 3);
    setN(n + 4);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["13","16","24"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=9 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 9 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 13.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("http://api.toko.id/pesanan", {
  method: "POST",
  credentials: "omit",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: https://app.toko.id
Access-Control-Allow-Methods: GET, POST
Access-Control-Allow-Headers: authorization, x-token','javascript','["Request langsung dikirim","Browser mengirim preflight OPTIONS dulu, lalu request asli berhasil","Preflight gagal: request asli tidak pernah dikirim"]'::jsonb,null,0,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
function buat() {
  return { n: 61, get: () => this.n };
}
const o = buat.call({ n: 111 });
console.log(o.get(), o.n);','javascript','["61 TypeError","111 61","61 undefined"]'::jsonb,null,1,'Arrow memakai this dari fungsi pembungkusnya (buat), yaitu objek yang di-call; bukan objek literal yang dikembalikan. o.n tetap nilai propertinya sendiri.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','guess','Apakah cookie ini ikut dikirim pada permintaan ke lab.kampus.ac.id?',null,'halaman        : https://kampus.ac.id
<img> yang dimuat halaman
tujuan         : https://lab.kampus.ac.id
Set-Cookie     : sid=1; SameSite=None; Secure; Domain milik tujuan','text','["Tidak, cookie tidak dikirim","Hanya dikirim jika memakai HTTP/2","Ya, cookie dikirim"]'::jsonb,null,2,'Hubungan: cross-origin tetapi same-site. Pada konteks same-site cookie selalu dikirim; pada cross-site: Strict tidak pernah, Lax hanya untuk navigasi top-level dengan metode aman (GET), None dikirim (wajib Secure).',null,'Apakah ini same-site? Jika bukan, cek nilai SameSite dan jenis permintaan.',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^3.3.4" }
// versi yang tersedia di registry:
3.3.4  3.3.5  3.3.6  3.5.4  3.5.5  3.5.6  3.5.7  4.3.7','json','["4.3.7","3.5.7","3.3.6"]'::jsonb,null,1,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 3.5.7.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 7; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. A: counter = tmpA + 1
4. A: tmpA = counter
5. B: counter = tmpB + 1
6. B: tmpB = counter
7. B: counter = tmpB + 1
8. A: counter = tmpA + 1','python','["10","9","11"]'::jsonb,null,1,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 9, bukan 11. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','output','Apa output kode ini?',null,'const u = new URL("https://api.toko.id:443/cari?tag=a&tag=b&q=kopi+susu&q2=%20x#h");
console.log(u.origin, u.searchParams.getAll("tag").join("|"), u.searchParams.get("q"), u.searchParams.get("q2").length, u.hash);','javascript','["https://api.toko.id a|b kopi susu 1 #h","https://api.toko.id a|b kopi susu 2 #h","b kopi susu 2 #h|https://api.toko.id a"]'::jsonb,null,1,'Hasil: https://api.toko.id a|b kopi susu 2 #h. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(new URL("?q=8", "https://toko.id/a/d?lama=1#h").href, new URL("#baru", "https://toko.id/a?x=1").href);','javascript','["https://toko.id/a/d?q=8 https://toko.id/a?x=1#baru","https://toko.id/a/d?q=6 https://toko.id/a?x=1#baru","https://toko.id/a/d?q=8 https://toko.id/a?x=11#baru"]'::jsonb,null,0,'Hasil: https://toko.id/a/d?q=8 https://toko.id/a?x=1#baru. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','output','Apa output kode ini?',null,'function f() {
  try { throw new Error("x"); } catch { return "c7"; } finally { return "f94"; }
}
console.log(f());','javascript','["f95","f94","undefined"]'::jsonb,null,1,'Dijalankan: f94.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','guess','Apakah cookie ini ikut dikirim pada permintaan ke budi.github.io?',null,'halaman        : https://ayu.github.io
<img> yang dimuat halaman
tujuan         : https://budi.github.io
Set-Cookie     : sid=1; SameSite=Lax; Domain milik tujuan','text','["Hanya dikirim jika memakai HTTP/2","Tidak, cookie tidak dikirim","Ya, cookie dikirim"]'::jsonb,null,1,'Hubungan: cross-origin dan cross-site. Pada konteks same-site cookie selalu dikirim; pada cross-site: Strict tidak pernah, Lax hanya untuk navigasi top-level dengan metode aman (GET), None dikirim (wajib Secure).',null,'Apakah ini same-site? Jika bukan, cek nilai SameSite dan jenis permintaan.',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Citra, NULL) (2, Dedi, Medan) (3, Budi, Padang) (4, Eka, NULL) (5, Ayu, Medan) (6, Fajar, Bandung)
-- pesanan(id, pelanggan_id, total, status)
(1, 4, 60, batal) (2, NULL, 80, batal) (3, 2, 80, batal) (4, 4, 60, baru) (5, NULL, 90, batal) (6, 5, 60, lunas) (7, NULL, 60, batal)

SELECT p.nama FROM pelanggan p
WHERE (SELECT SUM(total) FROM pesanan o WHERE o.pelanggan_id = p.id)
  > (SELECT AVG(total) FROM pesanan)
ORDER BY p.nama;','sql','["Eka","Dedi","Dedi | Eka"]'::jsonb,null,2,'Subquery berkorelasi dihitung per pelanggan; pelanggan tanpa pesanan menghasilkan NULL sehingga perbandingan tidak lolos. Hasil: Dedi | Eka.',null,'Bandingkan SUM per pelanggan dengan AVG seluruh pesanan (termasuk yang pelanggan_id-nya NULL).',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 40) (2, B, 10) (3, A, 30) (4, A, 10) (5, A, 30) (6, A, 40)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,0 | 2,-30 | 3,20 | 4,-20 | 5,20 | 6,10","1,0 | 2,0 | 3,-10 | 4,-20 | 5,20 | 6,10","1,-10 | 2,0 | 3,-20 | 4,20 | 5,10 | 6,0"]'::jsonb,null,1,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,0 | 3,-10 | 4,-20 | 5,20 | 6,10.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','output','Berapa saldo akhir?',null,'-- saldo awal = 990, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 990
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 990
T1: UPDATE akun SET saldo = x + 80 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 90 WHERE id = 1; COMMIT;','sql','["1160","1070","1080"]'::jsonb,null,2,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 990+90, sehingga tambahan 80 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('fullstack','guess','Mengunggah berkas 2 GB lewat API JSON dengan base64 tidak praktis. Pendekatan yang lebih baik?',null,'POST /upload { "berkas": "<base64 2 GB>" }','http','["Memecah string base64 menjadi potongan pendek di dalam URL","Memperbesar batas body server menjadi 4 GB agar JSON base64 muat","Presigned URL: klien mengunggah langsung ke object storage"]'::jsonb,null,2,'Base64 menambah ±33% ukuran dan memuat seluruh berkas di memori server. Unggah langsung mengurangi beban dan mendukung resume.',null,'Apakah server perlu menjadi perantara data?',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.any([ok("A", 5), bad("B", 15), ok("C", 10)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["ok \"A\"","err B","ok [\"fA\",\"rB\",\"fC\"]"]'::jsonb,null,0,'Promise.any menghasilkan: ok "A". all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','output','Berapa query SQL yang dijalankan (200 post, 6 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:200]
for p in posts:
    print(p.penulis.nama)','python','["201","1","2"]'::jsonb,null,1,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
const o = { n: 20, get() { return this.n; } };
const g = o.get;
try { console.log(g()); } catch (e) { console.log(e.name); }','javascript','["object","ReferenceError","TypeError"]'::jsonb,null,2,'g() dipanggil tanpa receiver; di strict mode this = undefined sehingga this.n melempar TypeError.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src https://cdn.toko.id ''unsafe-eval''

B. <script nonce="r4nd">inisiasi()</script>
C. <script src="/app.js"></script>  <!-- same-origin -->
D. <script src="https://cdn.toko.id/lib.js"></script>
E. <script src="https://evil.example/x.js"></script>
F. <button onclick="kirim()">OK</button>','http','["C D E F","B C E F","B D E F"]'::jsonb,null,1,'Diblokir: B C E F. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (kota, umur, negara);

SELECT * FROM orang
WHERE umur = ''x'' AND negara = ''x'';','sql','["0","2","1"]'::jsonb,null,0,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 0.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 120 detik yang lalu
Cache-Control: max-age=300, s-maxage=60
ETag: "v7"
# resource di server TIDAK berubah; permintaan ulang oleh CDN (shared cache)','http','["Request kondisional","Unduh penuh (200) dari server","Dilayani dari cache tanpa request ke jaringan"]'::jsonb,null,0,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','output','Apa output kode ini?',null,'console.log(JSON.stringify({ b: 42, a: 2, 1: "x" }, ["a", "b"]), JSON.stringify([new Date(0)]), JSON.stringify("\u00e9\n"));','javascript','["{''a'':2,''b'':42} [''1970-01-01T00:00:00.000Z''] ''é\\n''","{\"a\":2,\"b\":42} [\"1970-01-01T00:00:00.000Z\"] \"é\\n\"","{\"a\":3,\"b\":42} [\"1970-01-01T00:00:00.000Z\"] \"é\\n\""]'::jsonb,null,1,'Hasil: {"a":2,"b":42} ["1970-01-01T00:00:00.000Z"] "é\n". JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_B → LOCK tabel_A → COMMIT
T2: LOCK tabel_B → LOCK tabel_A → COMMIT
T3: LOCK tabel_B → LOCK tabel_C → LOCK tabel_A → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan"]'::jsonb,null,1,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 0 detik
waktu_sekarang = 1760000000
tanda_tangan   = TIDAK VALID
klaim = { exp: 1759999955, nbf: 1759999980, iss: "auth.toko.id", aud: "api.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: tanda tangan tidak valid","Ditolak: issuer tidak sesuai","Ditolak: audience tidak sesuai"]'::jsonb,null,0,'Cek berurutan: Ditolak: tanda tangan tidak valid. exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 4 f.txt menjadi "fitur"
main: mengubah baris 9 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(2);
  function klik() {
    setN(n + 1);
    setN((p) => p + 4);
    setN((p) => p * 4);
    setN(15);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["15","7","3"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=2 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 2 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 15.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tombol.addEventListener("click", () => log("A"), true);
luar.addEventListener("click", () => log("B"));
tengah.addEventListener("click", () => log("C"), true);
tengah.addEventListener("click", (e) => { log("D"); e.stopPropagation(); });
tombol.addEventListener("click", () => log("E"), true);','javascript','["A E C D","C A E D","A C D E"]'::jsonb,null,1,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: C A E D.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','guess','Manakah kombinasi nomor yang SEMUANYA merupakan pustaka/framework UI?',null,'1. Svelte
2. esbuild
3. Vue
4. React
5. Express','text','["1, 3, 4","2, 3, 4","3, 4, 5"]'::jsonb,null,0,'Svelte, React, Vue adalah pustaka/framework UI; esbuild dan Express termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 900px) 50vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1366px, device pixel ratio 1; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1600.jpg","foto-1024.jpg","foto-800.jpg"]'::jsonb,null,2,'Slot = 50vw × 1366 = 683px CSS; × DPR 1 = 683px fisik → kandidat terkecil yang ≥ itu: 800w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 559 → tiba t=559
"ko": kirim t=87, latensi 292 → tiba t=379
"kop": kirim t=228, latensi 193 → tiba t=421

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"kop\" — query yang diketik paling akhir","\"kop\" — respons yang tiba paling awal","\"k\" — respons yang tiba paling akhir"]'::jsonb,null,2,'Urutan tiba: "ko" → "kop" → "k". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 13; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. A: tmpA = counter
3. A: counter = tmpA + 1
4. A: tmpA = counter
5. B: counter = tmpB + 1
6. A: counter = tmpA + 1
7. B: tmpB = counter
8. B: counter = tmpB + 1','python','["15","16","17"]'::jsonb,null,1,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 16, bukan 17. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("http://api.toko.id/pesanan", {
  method: "GET",
  credentials: "omit",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: https://lain.id
Access-Control-Allow-Methods: GET, POST, PUT
Access-Control-Allow-Headers: x-token, authorization, content-type','javascript','["Browser mengirim preflight OPTIONS dulu, lalu request asli berhasil","Same-origin: CORS tidak berlaku, request berhasil","Request asli TERKIRIM ke server, tetapi respons diblokir untuk JavaScript"]'::jsonb,null,2,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','guess','Apakah cookie ini ikut terkirim pada permintaan tersebut?',null,'# dari halaman https://shop.toko.id/akun/profil
Set-Cookie: id=7; Path=/; Secure

# permintaan berikutnya ke:
https://api.toko.id/akun','http','["Ya","Tergantung SameSite saja","Tidak"]'::jsonb,null,2,'Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (/akun). Path cocok pada batas ''/''. Secure butuh https. Hasil: tidak terkirim.',null,'Cek berurutan: host, path (aturan batas ''/''), skema.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 6 item
halaman 1 → [100, 99, 98, 97, 96, 95]
# lalu 2 item baru (id 101…102) ditambahkan sebelum halaman 2 diminta
GET /item?limit=6&sebelum_id=95','text','["[95, 94, 93, 92, 91, 90]","[94, 93, 92, 91, 90, 89]","[96, 95, 94, 93, 92, 91]"]'::jsonb,null,1,'Cursor memakai id terakhir yang sudah dilihat sehingga hasil stabil terhadap sisipan/hapus di depan: [94, 93, 92, 91, 90, 89].',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'console.log("F");
(async () => {
  console.log("B");
  await null;
  console.log("H");
})();
Promise.resolve().then(() => {
  console.log("G");
  queueMicrotask(() => console.log("A"));
});
setTimeout(() => console.log("E"), 0);
Promise.resolve().then(() => console.log("C"));','javascript','["F B H G A E C","F B H C G A E","F B H G C A E"]'::jsonb,null,2,'Urutan nyata: F B H G C A E. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','output','Berapa p99 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [766,404,601,283,709,440,418,741,466,204]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["766","503","741"]'::jsonb,null,0,'N=10, rank=⌈99/100×10⌉=10 → 766 ms. Rata-rata (503) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^2.0.2" }
// versi yang tersedia di registry:
2.0.2  2.0.3  2.0.4  2.1.2  2.1.4  3.0.3  3.0.4  3.2.3','json','["2.1.4","3.2.3","2.0.4"]'::jsonb,null,0,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 2.1.4.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 30) (2, A, 30) (3, B, 10) (4, B, 50) (5, B, 50) (6, A, 20)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,0 | 2,0 | 3,-20 | 4,40 | 5,0 | 6,-30","1,-20 | 2,-10 | 3,40 | 4,0 | 5,0 | 6,0","1,0 | 2,0 | 3,-20 | 4,40 | 5,0 | 6,-10"]'::jsonb,null,2,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,0 | 3,-20 | 4,40 | 5,0 | 6,-10.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','guess','Apakah cookie ini ikut dikirim pada permintaan ke api.toko.id?',null,'halaman        : https://app.toko.id
pengguna mengeklik tautan (navigasi top-level GET)
tujuan         : https://api.toko.id
Set-Cookie     : sid=1; SameSite=Strict; Domain milik tujuan','text','["Ya, cookie dikirim","Hanya dikirim jika memakai HTTP/2","Tidak, cookie tidak dikirim"]'::jsonb,null,0,'Hubungan: cross-origin tetapi same-site. Pada konteks same-site cookie selalu dikirim; pada cross-site: Strict tidak pernah, Lax hanya untuk navigasi top-level dengan metode aman (GET), None dikirim (wajib Secure).',null,'Apakah ini same-site? Jika bukan, cek nilai SameSite dan jenis permintaan.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(JSON.stringify({ a: undefined, b: () => 1, c: NaN, d: [undefined, 30], e: null }));','javascript','["{''c'':null,''d'':[null,30],''e'':null}","{\"c\":null,\"d\":[null,30],\"e\":null}","{\"c\":undefined,\"d\":[null,31],\"e\":null}"]'::jsonb,null,1,'Hasil: {"c":null,"d":[null,30],"e":null}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
luar.addEventListener("click", () => log("A"));
tombol.addEventListener("click", () => log("B"));
luar.addEventListener("click", () => log("C"), true);
luar.addEventListener("click", () => log("D"), true);
tombol.addEventListener("click", () => log("E"));
tombol.addEventListener("click", (e) => { log("F"); e.stopImmediatePropagation(); });','javascript','["C D B E F","B C D E F","B E F"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: C D B E F.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (kota, umur, negara);

SELECT * FROM orang
WHERE umur > 30 AND negara = ''x'' AND kota > 30;','sql','["1","2","3"]'::jsonb,null,0,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
class A {
  n = 54;
  h = () => this.n;
  m() { return this.n; }
}
const { h, m } = new A();
try { console.log(h(), m()); } catch (e) { console.log(h(), e.name); }','javascript','["54 undefined","184","54 TypeError"]'::jsonb,null,2,'h adalah arrow field yang terikat ke instance; m hasil destructuring kehilangan receiver sehingga this undefined → TypeError.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 60 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1759999990, nbf: 1759999980, iss: "auth.toko.id", aud: "api.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: tanda tangan tidak valid","Diterima","Ditolak: belum berlaku (nbf)"]'::jsonb,null,1,'Cek berurutan: Diterima. exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 120 detik yang lalu
Cache-Control: s-maxage=3600
(tanpa ETag/Last-Modified)
# resource di server TIDAK berubah; permintaan ulang oleh browser (private cache), navigasi biasa','http','["Unduh penuh (200) dari server","Request kondisional; server membalas 304 tanpa body","Dilayani dari cache (basi) sekarang, revalidasi di latar belakang"]'::jsonb,null,0,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 700px) 50vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 390px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-800.jpg","foto-480.jpg","foto-1024.jpg"]'::jsonb,null,0,'Slot = 100vw × 390 = 390px CSS; × DPR 2 = 780px fisik → kandidat terkecil yang ≥ itu: 800w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','guess','Cara yang tepat menghentikan fetch usang saat query berubah di React?',null,'useEffect(() => {
  fetch(`/cari?q=${q}`).then(tampil);
}, [q]);','javascript','["Menambahkan setTimeout sebelum fetch agar respons lama selesai lebih dulu sebelum yang baru","Menghapus q dari array dependensi supaya efek tidak pernah berjalan ulang saat query berubah","Buat AbortController di efek, teruskan signal ke fetch, dan panggil abort() pada fungsi cleanup"]'::jsonb,null,2,'Cleanup efek berjalan sebelum efek berikutnya, cocok untuk membatalkan permintaan lama.',null,'Fungsi cleanup berjalan sebelum efek berikutnya.',null),
('fullstack','guess','Dari daftar ini, nomor mana yang BUKAN gaya/protokol API?',null,'1. Playwright
2. React
3. SOAP
4. REST
5. gRPC','text','["2 dan 3 dan 5","1 dan 2 dan 4","1 dan 2"]'::jsonb,null,2,'Playwright dan React termasuk kategori lain; gRPC, SOAP, REST adalah gaya/protokol API.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 651 → tiba t=651
"ko": kirim t=118, latensi 383 → tiba t=501
"kop": kirim t=221, latensi 173 → tiba t=394

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"kop\" — query yang diketik paling akhir","\"k\" — respons yang tiba paling akhir","\"kop\" — respons yang tiba paling awal"]'::jsonb,null,1,'Urutan tiba: "kop" → "ko" → "k". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','output','Apa output kode ini?',null,'function f() {
  try { return "t7"; } finally { console.log("fin"); }
}
console.log(f());','javascript','["fin | t7","t7 | fin","fin | t8"]'::jsonb,null,0,'Dijalankan: fin | t7.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','output','Berapa saldo akhir?',null,'-- saldo awal = 300, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 300
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 300
T1: UPDATE akun SET saldo = x + 10 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 70 WHERE id = 1; COMMIT;','sql','["380","310","370"]'::jsonb,null,2,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 300+70, sehingga tambahan 10 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 5 item
halaman 1 → [100, 99, 98, 97, 96]
# lalu 2 item teratas dihapus sebelum halaman 2 diminta
GET /item?limit=5&sebelum_id=96','text','["[95, 94, 93, 92, 91]","[93, 92, 91, 90, 89]","[92, 91, 90, 89, 88]"]'::jsonb,null,0,'Cursor memakai id terakhir yang sudah dilihat sehingga hasil stabil terhadap sisipan/hapus di depan: [95, 94, 93, 92, 91].',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','output','Berapa p99 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [671,417,526,571,357,646,697,81,610,206,786,868,777,95,61,580,727,542,641]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["786","519","868"]'::jsonb,null,2,'N=19, rank=⌈99/100×19⌉=19 → 868 ms. Rata-rata (519) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','guess','Apakah cookie ini ikut terkirim pada permintaan tersebut?',null,'# dari halaman https://shop.toko.id/akun/profil
Set-Cookie: id=7

# permintaan berikutnya ke:
https://toko.id/akunku','http','["Tidak","Ya","Tergantung SameSite saja"]'::jsonb,null,0,'Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (/akun). Path cocok pada batas ''/''. Secure butuh https. Hasil: tidak terkirim.',null,'Cek berurutan: host, path (aturan batas ''/''), skema.',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("https://api.toko.id/pesanan", {
  method: "PATCH",
  headers: { "Accept": "application/json", "Authorization": "Bearer abc" },
  credentials: "omit",
});

// header respons server (preflight dan respons asli sama):
(tanpa Access-Control-Allow-Origin)
Access-Control-Allow-Credentials: true
Access-Control-Allow-Methods: POST, GET
Access-Control-Allow-Headers: content-type, x-token','javascript','["Preflight gagal: request asli tidak pernah dikirim","Same-origin: CORS tidak berlaku, request berhasil","Request asli TERKIRIM ke server, tetapi respons diblokir untuk JavaScript"]'::jsonb,null,0,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','output','Apa output kode ini?',null,'console.log(new URL("?q=1", "https://api.toko.id/img/b?lama=1#h").href, new URL("#baru", "https://api.toko.id/img?x=1").href);','javascript','["https://api.toko.id/img/b?q=1 https://api.toko.id/img?x=-1#baru","https://api.toko.id/img/b?q=1 https://api.toko.id/img?x=1#baru","https://api.toko.id/img/b?q=3 https://api.toko.id/img?x=1#baru"]'::jsonb,null,1,'Hasil: https://api.toko.id/img/b?q=1 https://api.toko.id/img?x=1#baru. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 7 f.txt menjadi "fitur"
main: mengubah baris 7 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_B → LOCK tabel_C → COMMIT
T2: LOCK tabel_B → LOCK tabel_C → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan","Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten"]'::jsonb,null,2,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.allSettled([ok("A", 5), ok("B", 10), ok("C", 15)])
  .then((r) => console.log("ok", JSON.stringify(r.map((x) => x.status[0] + (x.value ?? x.reason.message)))))
  .catch((e) => console.log("err", e.message));','javascript','["ok [\"fA\",\"fB\",\"fC\"]","ok \"A\"","ok [\"A\",\"B\",\"C\"]"]'::jsonb,null,0,'Promise.allSettled menghasilkan: ok ["fA","fB","fC"]. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 2; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. A: counter = tmpA + 1
3. A: tmpA = counter
4. B: tmpB = counter
5. A: counter = tmpA + 1
6. B: counter = tmpB + 1
7. B: tmpB = counter
8. B: counter = tmpB + 1','python','["4","5","6"]'::jsonb,null,1,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 5, bukan 6. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','output','Berapa query SQL yang dijalankan (20 post, 3 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:20]
for p in posts:
    print(p.penulis.nama)','python','["2","21","1"]'::jsonb,null,2,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src ''unsafe-eval'' ''unsafe-inline'' ''nonce-r4nd''

A. <script>inisiasi()</script>
B. <script nonce="r4nd">inisiasi()</script>
C. <script src="/app.js"></script>  <!-- same-origin -->
D. <script src="https://cdn.toko.id/lib.js"></script>
F. <button onclick="kirim()">OK</button>','http','["B C D F","A B C F","A C D F"]'::jsonb,null,2,'Diblokir: A C D F. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Hana, Padang) (2, Ayu, Medan) (3, Gita, NULL) (4, Citra, Padang) (5, Dedi, Medan)
-- pesanan(id, pelanggan_id, total, status)
(1, NULL, 60, lunas) (2, 4, 70, lunas) (3, 1, 30, baru) (4, 2, 40, lunas) (5, 4, 70, baru) (6, 3, 60, lunas) (7, 4, 80, lunas)

SELECT COUNT(*) FROM pelanggan
WHERE id NOT IN (SELECT pelanggan_id FROM pesanan);','sql','["0","1","5"]'::jsonb,null,0,'NOT IN dengan subquery yang mengandung NULL menghasilkan UNKNOWN untuk setiap baris sehingga tidak ada yang lolos (0). NOT EXISTS atau NOT IN yang menyaring NULL berperilaku sesuai harapan. Hasil: 0.',null,'Apa hasil `x NOT IN (1, NULL)`?',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^3.3.3" }
// versi yang tersedia di registry:
3.3.3  3.3.6  3.4.0  3.4.3  3.5.0  3.5.3  4.3.0  4.3.3','json','["3.3.6","3.5.3","4.3.3"]'::jsonb,null,1,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 3.5.3.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'Promise.resolve().then(() => {
  console.log("E");
  queueMicrotask(() => console.log("C"));
});
setTimeout(() => {
  console.log("H");
  Promise.resolve().then(() => console.log("F"));
}, 0);
setTimeout(() => {
  console.log("D");
  Promise.resolve().then(() => console.log("G"));
}, 0);
setTimeout(() => {
  console.log("A");
  Promise.resolve().then(() => console.log("undefined"));
}, 0);
Promise.resolve().then(() => {
  console.log("undefined");
  queueMicrotask(() => console.log("undefined"));
});','javascript','["E undefined undefined C H F D G A undefined","E C H F D G A","E undefined C undefined H F D G A undefined"]'::jsonb,null,2,'Urutan nyata: E undefined C undefined H F D G A undefined. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(9);
  function klik() {
    setN(n + 5);
    setN((p) => p * 3);
    setN((p) => p + 1);
    setN((p) => p + 5);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["48","20","14"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=9 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 9 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 48.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','output','Apa output kode ini?',null,'Promise.resolve(4)
  .finally(() => 90)
  .then((v) => console.log("v", v));','javascript','["undefined","v 4","v 5"]'::jsonb,null,1,'Dijalankan: v 4.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^1.2.3" }
// versi yang tersedia di registry:
1.2.3  1.2.5  1.3.4  1.3.5  1.4.3  1.4.4  2.2.0  2.2.4','json','["1.2.5","2.2.4","1.4.4"]'::jsonb,null,2,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 1.4.4.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_C → LOCK tabel_A → LOCK tabel_B → COMMIT
T2: LOCK tabel_C → LOCK tabel_A → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan"]'::jsonb,null,1,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(1);
  function klik() {
    setN(n + 3);
    setN((p) => p * 2);
    setN(n + 1);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["5","9","2"]'::jsonb,null,2,'Antrean update diproses berurutan mulai dari n=1 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 1 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 2.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 30 detik yang lalu
Cache-Control: no-cache, max-age=60, s-maxage=3600
ETag: "v7"
# resource di server TIDAK berubah; permintaan ulang oleh CDN (shared cache)','http','["Dilayani dari cache tanpa request ke jaringan","Request kondisional; server membalas 304 tanpa body","Dilayani dari cache (basi) sekarang, revalidasi di latar belakang"]'::jsonb,null,1,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','guess','Apakah cookie ini ikut dikirim pada permintaan ke toko.id:8443?',null,'halaman        : https://toko.id
fetch() dari JavaScript halaman
tujuan         : https://toko.id:8443
Set-Cookie     : sid=1; SameSite=Lax; Domain milik tujuan','text','["Tidak, cookie tidak dikirim","Hanya dikirim jika memakai HTTP/2","Ya, cookie dikirim"]'::jsonb,null,2,'Hubungan: cross-origin tetapi same-site. Pada konteks same-site cookie selalu dikirim; pada cross-site: Strict tidak pernah, Lax hanya untuk navigasi top-level dengan metode aman (GET), None dikirim (wajib Secure).',null,'Apakah ini same-site? Jika bukan, cek nilai SameSite dan jenis permintaan.',null),
('fullstack','output','Berapa p50 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [401,748,237,339,375,634,182,883,280,519,503]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["503","401","464"]'::jsonb,null,1,'N=11, rank=⌈50/100×11⌉=6 → 401 ms. Rata-rata (464) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 430, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 430
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 430
T1: UPDATE akun SET saldo = x + 80 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 50 WHERE id = 1; COMMIT;','sql','["Gunakan UPDATE atomik","Mengganti COMMIT menjadi ROLLBACK","Menambah indeks pada kolom saldo"]'::jsonb,null,0,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('fullstack','guess','Dari daftar ini, nomor mana yang BUKAN alat uji end-to-end/komponen di browser?',null,'1. Sass
2. Playwright
3. Testing Library
4. WebdriverIO
5. Next.js','text','["1 dan 3 dan 4","1 dan 5","2 dan 4 dan 5"]'::jsonb,null,1,'Sass dan Next.js termasuk kategori lain; WebdriverIO, Testing Library, Playwright adalah alat uji end-to-end/komponen di browser.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 4 item
halaman 1 → [100, 99, 98, 97]
# lalu 1 item teratas dihapus sebelum halaman 2 diminta
GET /item?limit=4&offset=4','text','["[94, 93, 92, 91]","[96, 95, 94, 93]","[95, 94, 93, 92]"]'::jsonb,null,2,'Offset menghitung dari posisi, bukan dari item terakhir yang dilihat: penghapusan menggeser daftar naik sehingga ada item yang terlewat.',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 289 → tiba t=289
"ko": kirim t=89, latensi 663 → tiba t=752
"kop": kirim t=208, latensi 368 → tiba t=576

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"ko\" — respons yang tiba paling akhir","\"kop\" — query yang diketik paling akhir","\"k\" — respons yang tiba paling awal"]'::jsonb,null,0,'Urutan tiba: "k" → "kop" → "ko". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Hana, NULL) (2, Eka, Padang) (3, Gita, Medan) (4, Fajar, Padang) (5, Dedi, Medan)
-- pesanan(id, pelanggan_id, total, status)
(1, 1, 50, lunas) (2, NULL, 80, batal) (3, 1, 20, lunas) (4, 2, 90, lunas) (5, 3, 50, lunas) (6, 2, 60, baru) (7, 2, 90, batal) (8, 3, 50, lunas)

SELECT COUNT(*), COUNT(o.id), COUNT(DISTINCT p.id)
FROM pelanggan p LEFT JOIN pesanan o ON o.pelanggan_id = p.id;','sql','["9,7,5","9,9,7","7,9,5"]'::jsonb,null,0,'COUNT(*) menghitung semua baris hasil join (satu pelanggan tampil sebanyak pesanannya, atau sekali bila tak punya), COUNT(kolom) melewati NULL, COUNT(DISTINCT) menghilangkan duplikat. Hasil: 9,7,5.',null,'Mana yang melewati NULL?',null),
('fullstack','guess','Kolom pencarian memicu request di setiap ketikan. Teknik yang tepat agar request dikirim setelah pengguna berhenti mengetik 300 ms?',null,'input.oninput = () => cari(input.value);','javascript','["Throttle","Memoization","Debounce"]'::jsonb,null,2,'Debounce menunda eksekusi sampai tidak ada pemicu baru dalam jeda tertentu; throttle membatasi frekuensi maksimum.',null,'Menunggu hening atau membatasi laju?',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, kota, umur);

SELECT * FROM orang
WHERE kota > 30 AND umur = ''x'';','sql','["0","2","1"]'::jsonb,null,0,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 0.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src ''nonce-r4nd'' https://cdn.toko.id

A. <script>inisiasi()</script>
B. <script nonce="r4nd">inisiasi()</script>
D. <script src="https://cdn.toko.id/lib.js"></script>
E. <script src="https://evil.example/x.js"></script>
F. <button onclick="kirim()">OK</button>','http','["A D F","A E F","A B E"]'::jsonb,null,1,'Diblokir: A E F. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
luar.addEventListener("click", () => log("A"));
tengah.addEventListener("click", () => log("B"));
luar.addEventListener("click", () => log("C"));
luar.addEventListener("click", () => log("D"), true);
luar.addEventListener("click", () => log("E"));','javascript','["B A C D E","A B C D E","D B A C E"]'::jsonb,null,2,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: D B A C E.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
const o = {
  n: 50,
  list() { return [1].map(() => this.n)[0]; },
};
console.log(o.list());','javascript','["176","50","255"]'::jsonb,null,1,'Arrow function tidak punya this sendiri; ia memakai this dari list() yang dipanggil sebagai o.list().',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','output','Apa output kode ini?',null,'console.log(JSON.stringify({ b: 31, a: 2, 1: "x" }, ["a", "b"]), JSON.stringify([new Date(0)]), JSON.stringify("\u00e9\n"));','javascript','["{''a'':2,''b'':31} [''1970-01-01T00:00:00.000Z''] ''é\\n''","{\"a\":2,\"b\":31} [\"1970-01-01T00:00:00.000Z\"] \"é\\n\"","{\"a\":3,\"b\":31} [\"1970-01-01T00:00:00.000Z\"] \"é\\n\""]'::jsonb,null,1,'Hasil: {"a":2,"b":31} ["1970-01-01T00:00:00.000Z"] "é\n". JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','output','Berapa query SQL yang dijalankan (100 post, 6 penulis berbeda)?',null,'posts = Post.objects.prefetch_related("penulis")[:100]
for p in posts:
    print(p.penulis.nama)','python','["1","2","101"]'::jsonb,null,1,'prefetch_related memakai query kedua dengan WHERE id IN (...): total 2 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 20) (2, B, 50) (3, B, 20) (4, A, 30) (5, B, 40) (6, B, 30) (7, B, 50)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,0 | 2,0 | 3,-30 | 4,10 | 5,20 | 6,-10 | 7,20","1,0 | 2,30 | 3,-30 | 4,10 | 5,10 | 6,-10 | 7,20","1,10 | 2,-30 | 3,20 | 4,0 | 5,-10 | 6,20 | 7,0"]'::jsonb,null,0,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,0 | 3,-30 | 4,10 | 5,20 | 6,-10 | 7,20.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','guess','Apakah cookie ini ikut terkirim pada permintaan tersebut?',null,'# dari halaman https://shop.toko.id/akun/profil
Set-Cookie: id=7; Path=/akun; Secure; HttpOnly

# permintaan berikutnya ke:
https://toko.id/akunku','http','["Tidak","Ya","Tergantung SameSite saja"]'::jsonb,null,0,'Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (/akun). Path cocok pada batas ''/''. Secure butuh https. Hasil: tidak terkirim.',null,'Cek berurutan: host, path (aturan batas ''/''), skema.',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 5; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. B: counter = tmpB + 1
3. B: tmpB = counter
4. A: tmpA = counter
5. B: counter = tmpB + 1
6. A: counter = tmpA + 1
7. A: tmpA = counter
8. A: counter = tmpA + 1','python','["7","8","9"]'::jsonb,null,1,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 8, bukan 9. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'setTimeout(() => {
  console.log("G");
  Promise.resolve().then(() => console.log("E"));
}, 0);
console.log("D");
setTimeout(() => console.log("A"), 0);
Promise.resolve().then(() => {
  console.log("F");
  queueMicrotask(() => console.log("C"));
});
setTimeout(() => console.log("undefined"), 0);','javascript','["G E D A F C","D F C G E undefined A","D F C G E A undefined"]'::jsonb,null,2,'Urutan nyata: D F C G E A undefined. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 1024px) 60vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 390px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1024.jpg","foto-800.jpg","foto-480.jpg"]'::jsonb,null,1,'Slot = 100vw × 390 = 390px CSS; × DPR 2 = 780px fisik → kandidat terkecil yang ≥ itu: 800w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 30 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1760003600, nbf: 1760000010, iss: "auth.lain.id", aud: "web.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Diterima","Ditolak: token kedaluwarsa (exp)","Ditolak: issuer tidak sesuai"]'::jsonb,null,2,'Cek berurutan: Ditolak: issuer tidak sesuai. exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(new URL("?q=6", "https://api.toko.id/img/a?lama=1#h").href, new URL("#baru", "https://api.toko.id/img?x=1").href);','javascript','["https://api.toko.id/img/a?q=6 https://api.toko.id/img?x=11#baru","https://api.toko.id/img/a?q=16 https://api.toko.id/img?x=1#baru","https://api.toko.id/img/a?q=6 https://api.toko.id/img?x=1#baru"]'::jsonb,null,2,'Hasil: https://api.toko.id/img/a?q=6 https://api.toko.id/img?x=1#baru. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("http://api.toko.id/pesanan", {
  method: "PATCH",
  headers: { "Content-Type": "application/json", "Accept": "application/json" },
  credentials: "omit",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: https://lain.id
Access-Control-Allow-Credentials: true
Access-Control-Allow-Methods: DELETE, POST
Access-Control-Allow-Headers: authorization','javascript','["Request asli TERKIRIM ke server, tetapi respons diblokir untuk JavaScript","Preflight gagal: request asli tidak pernah dikirim","Same-origin: CORS tidak berlaku, request berhasil"]'::jsonb,null,1,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.race([ok("A", 10), ok("B", 15), bad("C", 5)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["ok [\"fA\",\"fB\",\"rC\"]","err C","ok \"A\""]'::jsonb,null,1,'Promise.race menghasilkan: err C. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 2 f.txt menjadi "fitur"
main: mengubah baris 6 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','output','Berapa saldo akhir?',null,'-- saldo awal = 180, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 180
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 180
T1: UPDATE akun SET saldo = x + 70 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 10 WHERE id = 1; COMMIT;','sql','["250","190","260"]'::jsonb,null,1,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 180+10, sehingga tambahan 70 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 10) (2, B, 20) (3, A, 40) (4, B, 20) (5, A, 10) (6, A, 10)

SELECT id, RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,2 | 2,1 | 3,1 | 4,2 | 5,3 | 6,4","1,2 | 2,1 | 1,1 | 4,1 | 5,2 | 6,2","1,2 | 2,1 | 3,1 | 4,1 | 5,2 | 6,2"]'::jsonb,null,2,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,2 | 2,1 | 3,1 | 4,1 | 5,2 | 6,2.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','guess','Bisakah JavaScript di halaman penyetel membaca cookie ini lewat document.cookie?',null,'Set-Cookie: id=7; Domain=toko.id
// dari halaman https://shop.toko.id/akun/profil','http','["Ya, bisa dibaca","Hanya jika SameSite=None","Tidak: hanya server yang bisa"]'::jsonb,null,0,'Tanpa HttpOnly, skrip pada halaman yang cocok domain/path bisa membacanya (risiko XSS).',null,'Atribut mana yang mengatur akses dari JavaScript?',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 482 → tiba t=482
"ko": kirim t=140, latensi 157 → tiba t=297
"kop": kirim t=193, latensi 150 → tiba t=343

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"k\" — respons yang tiba paling akhir","\"kop\" — query yang diketik paling akhir","\"kop\" — respons yang tiba paling awal"]'::jsonb,null,0,'Urutan tiba: "ko" → "kop" → "k". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','output','Apa output kode ini?',null,'console.log(JSON.stringify(JSON.parse(''{"a":45,"b":[1,2],"c":{"d":null}}'', (k, v) => (typeof v === "number" ? v + 1 : v))));','javascript','["{\"a\":46,\"b\":[2,3],\"c\":{\"d\":null}}","{''a'':46,''b'':[2,3],''c'':{''d'':null}}","{\"a\":47,\"b\":[2,3],\"c\":{\"d\":undefined}}"]'::jsonb,null,0,'Hasil: {"a":46,"b":[2,3],"c":{"d":null}}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_A → LOCK tabel_B → LOCK tabel_C → COMMIT
T2: LOCK tabel_C → LOCK tabel_A → COMMIT
T3: LOCK tabel_A → LOCK tabel_C → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_B → tabel_C → tabel_A","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh"]'::jsonb,null,0,'Graf urutan kunci memuat siklus tabel_A → tabel_B → tabel_C → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~1.0.4" }
// versi yang tersedia di registry:
1.0.4  1.1.7  1.2.4  1.2.5  2.0.0  2.0.5  2.0.7','json','["1.2.5","2.0.7","1.0.4"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 1.0.4.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 4 item
halaman 1 → [100, 99, 98, 97]
# lalu 1 item teratas dihapus sebelum halaman 2 diminta
GET /item?limit=4&sebelum_id=97','text','["[95, 94, 93, 92]","[94, 93, 92, 91]","[96, 95, 94, 93]"]'::jsonb,null,2,'Cursor memakai id terakhir yang sudah dilihat sehingga hasil stabil terhadap sisipan/hapus di depan: [96, 95, 94, 93].',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tombol.addEventListener("click", () => log("A"), true);
tengah.addEventListener("click", () => log("B"), true);
tengah.addEventListener("click", () => log("C"), true);
tombol.addEventListener("click", () => log("D"));
luar.addEventListener("click", () => log("E"));','javascript','["B C A D E","A B C D E","A D B C E"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: B C A D E.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','output','Apa output kode ini?',null,'function f() {
  try { throw new Error("x"); } catch { return "c5"; } finally { return "f96"; }
}
console.log(f());','javascript','["undefined","f97","f96"]'::jsonb,null,2,'Dijalankan: f96.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(4);
  function klik() {
    setN(n + 2);
    setN((p) => p + 4);
    setN(22);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["22","6","10"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=4 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 4 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 22.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 700px) 40vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 390px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-480.jpg","foto-800.jpg","foto-1024.jpg"]'::jsonb,null,1,'Slot = 90vw × 390 = 351px CSS; × DPR 2 = 702px fisik → kandidat terkecil yang ≥ itu: 800w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 0 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1760000020, nbf: 1760000090, iss: "auth.lain.id", aud: "api.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: belum berlaku (nbf)","Ditolak: issuer tidak sesuai","Diterima"]'::jsonb,null,0,'Cek berurutan: Ditolak: belum berlaku (nbf). exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','output','Berapa p95 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [133,413,767,552,708,313,545,850,288,889,208,112,104]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["850","889","452"]'::jsonb,null,1,'N=13, rank=⌈95/100×13⌉=13 → 889 ms. Rata-rata (452) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.all([ok("A", 10), bad("B", 15), ok("C", 5)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["err B","ok \"C\"","ok [\"fA\",\"rB\",\"fC\"]"]'::jsonb,null,0,'Promise.all menghasilkan: err B. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
function buat() {
  return { n: 97, get: () => this.n };
}
const o = buat.call({ n: 169 });
console.log(o.get(), o.n);','javascript','["169 97","97 TypeError","97 undefined"]'::jsonb,null,0,'Arrow memakai this dari fungsi pembungkusnya (buat), yaitu objek yang di-call; bukan objek literal yang dikembalikan. o.n tetap nilai propertinya sendiri.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("https://app.toko.id/pesanan", {
  method: "POST",
  headers: { "X-Token": "t1", "Authorization": "Bearer abc" },
  credentials: "omit",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: https://app.toko.id
Access-Control-Allow-Methods: DELETE, PUT, PATCH
Access-Control-Allow-Headers: x-token, authorization, content-type','javascript','["Same-origin: CORS tidak berlaku, request berhasil","Browser mengirim preflight OPTIONS dulu, lalu request asli berhasil","Preflight gagal: request asli tidak pernah dikirim"]'::jsonb,null,0,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Ayu, Bandung) (2, Dedi, Bandung) (3, Citra, Medan) (4, Hana, Padang) (5, Eka, Padang) (6, Budi, Bandung)
-- pesanan(id, pelanggan_id, total, status)
(1, 1, 30, batal) (2, 5, 30, lunas) (3, 5, 50, baru) (4, 1, 30, batal) (5, 2, 20, lunas) (6, NULL, 30, batal) (7, 2, 80, baru)

SELECT p.nama, SUM(o.total)
FROM pelanggan p JOIN pesanan o ON o.pelanggan_id = p.id
WHERE o.status <> ''batal''
GROUP BY p.nama
HAVING SUM(o.total) > 40
ORDER BY p.nama;','sql','["Ayu,60 | Dedi,100 | Eka,80","Dedi,2 | Eka,2","Dedi,100 | Eka,80"]'::jsonb,null,2,'WHERE menyaring baris SEBELUM pengelompokan; HAVING menyaring grup SESUDAH agregasi. Perhatikan status NULL tidak lolos <> ''batal''. Hasil: Dedi,100 | Eka,80.',null,'Urutan eksekusi: FROM → WHERE → GROUP BY → HAVING.',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (kota, umur, negara);

SELECT * FROM orang
WHERE umur > 30 AND negara > 30 AND kota = ''x'';','sql','["2","3","1"]'::jsonb,null,0,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 2.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','guess','Manakah kombinasi nomor yang SEMUANYA merupakan tooling/framework CSS?',null,'1. SQLite
2. Tailwind CSS
3. Bulma
4. Remix
5. Bootstrap','text','["2, 3, 5","1, 3, 4","2, 4, 5"]'::jsonb,null,0,'Tailwind CSS, Bootstrap, Bulma adalah tooling/framework CSS; Remix dan SQLite termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src https://cdn.toko.id ''nonce-r4nd''

B. <script nonce="r4nd">inisiasi()</script>
C. <script src="/app.js"></script>  <!-- same-origin -->
D. <script src="https://cdn.toko.id/lib.js"></script>
F. <button onclick="kirim()">OK</button>
G. eval("1 + 1")  // di dalam skrip yang diizinkan','http','["C D F","D F G","C F G"]'::jsonb,null,2,'Diblokir: C F G. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','output','Berapa query SQL yang dijalankan (200 post, 8 penulis berbeda)?',null,'posts = Post.objects.all()[:200]
for p in posts:
    print(p.penulis.nama)        # relasi ForeignKey, lazy','python','["201","1","2"]'::jsonb,null,0,'Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 2; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. B: counter = tmpB + 1
3. A: tmpA = counter
4. B: tmpB = counter
5. B: counter = tmpB + 1
6. A: counter = tmpA + 1
7. A: tmpA = counter
8. A: counter = tmpA + 1','python','["5","6","4"]'::jsonb,null,0,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 5, bukan 6. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 3600 detik yang lalu
Cache-Control: max-age=60
ETag: "v7"
# resource di server TIDAK berubah; permintaan ulang oleh CDN (shared cache)','http','["Unduh penuh (200) dari server","Request kondisional","Dilayani dari cache tanpa request ke jaringan"]'::jsonb,null,1,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','guess','Apakah cookie ini ikut dikirim pada permintaan ke cdn.toko.co.id?',null,'halaman        : https://toko.co.id
pengguna mengeklik tautan (navigasi top-level GET)
tujuan         : https://cdn.toko.co.id
Set-Cookie     : sid=1; SameSite=Strict; Domain milik tujuan','text','["Ya, cookie dikirim","Hanya dikirim jika memakai HTTP/2","Tidak, cookie tidak dikirim"]'::jsonb,null,0,'Hubungan: cross-origin tetapi same-site. Pada konteks same-site cookie selalu dikirim; pada cross-site: Strict tidak pernah, Lax hanya untuk navigasi top-level dengan metode aman (GET), None dikirim (wajib Secure).',null,'Apakah ini same-site? Jika bukan, cek nilai SameSite dan jenis permintaan.',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'Promise.resolve().then(() => {
  console.log("D");
  queueMicrotask(() => console.log("H"));
});
console.log("A");
(async () => {
  console.log("G");
  await null;
  console.log("C");
})();
queueMicrotask(() => console.log("E"));
Promise.resolve().then(() => {
  console.log("undefined");
  queueMicrotask(() => console.log("undefined"));
});','javascript','["A G D C E undefined H undefined","D H A G C E","A G D E C undefined H undefined"]'::jsonb,null,0,'Urutan nyata: A G D C E undefined H undefined. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 6 f.txt menjadi "fitur"
main: mengubah baris 5 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(new URL("../b/x.png?v=2#top", "https://app.kampus.ac.id/img/produk/h.html").href);','javascript','["https://app.kampus.ac.id/img/b/x.png?v=2#top","https://app.kampus.ac.id/img/b/x.png?v=0#top","https://app.kampus.ac.id/img/b/x.png?v=4#top"]'::jsonb,null,0,'Hasil: https://app.kampus.ac.id/img/b/x.png?v=2#top. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
const o = { n: 11, get() { return this.n; } };
const g = o.get.bind({ n: 121 });
console.log(g.call({ n: 264 }));','javascript','["11","121","264"]'::jsonb,null,1,'bind menetapkan this secara permanen; call() tidak bisa menimpanya, jadi hasilnya nilai pada objek yang di-bind.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^0.0.3" }
// versi yang tersedia di registry:
0.0.3  0.0.4  0.0.5  0.2.3  0.2.6  1.1.0  1.1.4  1.1.5','json','["0.0.5","0.0.3","1.1.5"]'::jsonb,null,1,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 0.0.3.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','output','Apa output kode ini?',null,'function f() {
  try { throw new Error("x"); } catch { return "c9"; } finally { return "f93"; }
}
console.log(f());','javascript','["f94","f93","undefined"]'::jsonb,null,1,'Dijalankan: f93.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 4 item
halaman 1 → [100, 99, 98, 97]
# lalu 3 item baru (id 101…103) ditambahkan sebelum halaman 2 diminta
GET /item?limit=4&sebelum_id=97','text','["[96, 95, 94, 93]","[99, 98, 97, 96]","[98, 97, 96, 95]"]'::jsonb,null,0,'Cursor memakai id terakhir yang sudah dilihat sehingga hasil stabil terhadap sisipan/hapus di depan: [96, 95, 94, 93].',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (umur, negara, kota);

SELECT * FROM orang
WHERE umur > 30 AND negara > 30;','sql','["1","2","0"]'::jsonb,null,0,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 1; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. A: counter = tmpA + 1
3. A: tmpA = counter
4. B: tmpB = counter
5. B: counter = tmpB + 1
6. B: tmpB = counter
7. B: counter = tmpB + 1
8. A: counter = tmpA + 1','python','["5","3","4"]'::jsonb,null,1,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 3, bukan 5. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'console.log("F");
Promise.resolve().then(() => {
  console.log("G");
  queueMicrotask(() => console.log("A"));
});
Promise.resolve().then(() => {
  console.log("C");
  queueMicrotask(() => console.log("H"));
});
Promise.resolve().then(() => {
  console.log("D");
  queueMicrotask(() => console.log("undefined"));
});','javascript','["F C G D A H undefined","F G C D A H undefined","F G A C H D"]'::jsonb,null,1,'Urutan nyata: F G C D A H undefined. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_A → LOCK tabel_C → LOCK tabel_B → COMMIT
T2: LOCK tabel_C → LOCK tabel_A → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_C → tabel_A"]'::jsonb,null,2,'Graf urutan kunci memuat siklus tabel_A → tabel_C → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('fullstack','guess','Dari daftar ini, nomor mana yang BUKAN message broker/antrean?',null,'1. TypeORM
2. Apache HTTP Server
3. ActiveMQ
4. RabbitMQ
5. NATS','text','["1 dan 3 dan 5","2 dan 4 dan 5","1 dan 2"]'::jsonb,null,2,'Apache HTTP Server dan TypeORM termasuk kategori lain; ActiveMQ, NATS, RabbitMQ adalah message broker/antrean.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tombol.addEventListener("click", () => log("A"));
luar.addEventListener("click", () => log("B"));
tombol.addEventListener("click", () => log("C"), true);
tombol.addEventListener("click", () => log("D"), true);','javascript','["A C D B","C D A B","A B C D"]'::jsonb,null,1,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: C D A B.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 5 f.txt menjadi "fitur"
main: mengubah baris 6 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src https://cdn.toko.id ''self'' ''unsafe-inline''

B. <script nonce="r4nd">inisiasi()</script>
D. <script src="https://cdn.toko.id/lib.js"></script>
E. <script src="https://evil.example/x.js"></script>
F. <button onclick="kirim()">OK</button>
G. eval("1 + 1")  // di dalam skrip yang diizinkan','http','["B E G","E F G","B F G"]'::jsonb,null,0,'Diblokir: B E G. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','output','Berapa saldo akhir?',null,'-- saldo awal = 880, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 880
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 880
T1: UPDATE akun SET saldo = x + 10 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 60 WHERE id = 1; COMMIT;','sql','["940","890","950"]'::jsonb,null,0,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 880+60, sehingga tambahan 10 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(new URL("?q=9", "https://toko.id/b/d?lama=1#h").href, new URL("#baru", "https://toko.id/b?x=1").href);','javascript','["https://toko.id/b/d?q=9 https://toko.id/b?x=2#baru","https://toko.id/b/d?q=9 https://toko.id/b?x=1#baru","https://toko.id/b/d?q=11 https://toko.id/b?x=1#baru"]'::jsonb,null,1,'Hasil: https://toko.id/b/d?q=9 https://toko.id/b?x=1#baru. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Gita, Padang) (2, Citra, Medan) (3, Fajar, Bandung) (4, Eka, Medan) (5, Ayu, Bandung)
-- pesanan(id, pelanggan_id, total, status)
(1, 2, 40, batal) (2, 3, 80, lunas) (3, 3, 70, lunas) (4, 1, 70, batal) (5, 3, 20, baru) (6, 3, 40, batal) (7, 4, 30, lunas) (8, 3, 30, lunas)

SELECT COUNT(*) FROM (
  SELECT kota FROM pelanggan
  UNION ALL
  SELECT kota FROM pelanggan WHERE kota IS NOT NULL
) x
WHERE kota IS NULL OR kota <> ''Padang'';','sql','["8","2","9"]'::jsonb,null,0,'UNION ALL mempertahankan duplikat, UNION menghapusnya; kota <> ''Padang'' bernilai UNKNOWN untuk NULL sehingga perlu IS NULL eksplisit. Hasil: 8.',null,'UNION vs UNION ALL; perbandingan dengan NULL tidak pernah true.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 120 detik yang lalu
Cache-Control: no-store, no-cache, s-maxage=60, stale-while-revalidate=600
ETag: "v7"
# resource di server TIDAK berubah; permintaan ulang oleh CDN (shared cache)','http','["Request kondisional; server membalas 304 tanpa body","Dilayani dari cache tanpa request ke jaringan","Unduh penuh (200) dari server"]'::jsonb,null,2,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','output','Berapa p50 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [893,887,788,626,279,895,493,481,90,787,465,286,288,58,518,414]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["481","516","493"]'::jsonb,null,0,'N=16, rank=⌈50/100×16⌉=8 → 481 ms. Rata-rata (516) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 30) (2, A, 10) (3, A, 40) (4, A, 40) (5, B, 50) (6, A, 50)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,-20 | 2,30 | 3,0 | 4,10 | 5,0 | 6,0","1,0 | 2,-20 | 3,30 | 4,0 | 5,10 | 6,0","1,0 | 2,-20 | 3,30 | 4,0 | 5,0 | 6,10"]'::jsonb,null,2,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,-20 | 3,30 | 4,0 | 5,0 | 6,10.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 124 → tiba t=124
"ko": kirim t=130, latensi 541 → tiba t=671
"kop": kirim t=216, latensi 261 → tiba t=477

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"k\" — respons yang tiba paling awal","\"kop\" — query yang diketik paling akhir","\"ko\" — respons yang tiba paling akhir"]'::jsonb,null,2,'Urutan tiba: "k" → "kop" → "ko". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("https://api.toko.id:8443/pesanan", {
  method: "DELETE",
  headers: { "Authorization": "Bearer abc" },
  credentials: "omit",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: https://lain.id
Access-Control-Allow-Credentials: true
Access-Control-Allow-Methods: DELETE, POST, PATCH
Access-Control-Allow-Headers: authorization','javascript','["Preflight gagal: request asli tidak pernah dikirim","Request langsung dikirim (tanpa preflight) dan respons boleh dibaca JavaScript","Browser mengirim preflight OPTIONS dulu, lalu request asli berhasil"]'::jsonb,null,0,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','output','Apa output kode ini?',null,'const o = { n: 26, toJSON() { return { v: this.n * 2 }; } };
console.log(JSON.stringify({ o, a: [o] }));','javascript','["{\"o\":{\"v\":53},\"a\":[{\"v\":52}]}","{\"o\":{\"v\":52},\"a\":[{\"v\":52}]}","{''o'':{''v'':52},''a'':[{''v'':52}]}"]'::jsonb,null,1,'Hasil: {"o":{"v":52},"a":[{"v":52}]}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 1024px) 40vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 360px, device pixel ratio 3; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1280.jpg","foto-1024.jpg","foto-480.jpg"]'::jsonb,null,1,'Slot = 90vw × 360 = 324px CSS; × DPR 3 = 972px fisik → kandidat terkecil yang ≥ itu: 1024w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','guess','Apakah cookie ini ikut dikirim pada permintaan ke cdn.toko.co.id?',null,'halaman        : https://toko.co.id
pengguna mengeklik tautan (navigasi top-level GET)
tujuan         : https://cdn.toko.co.id
Set-Cookie     : sid=1; SameSite=Lax; Domain milik tujuan','text','["Tidak, cookie tidak dikirim","Ya, cookie dikirim","Hanya dikirim jika memakai HTTP/2"]'::jsonb,null,1,'Hubungan: cross-origin tetapi same-site. Pada konteks same-site cookie selalu dikirim; pada cross-site: Strict tidak pernah, Lax hanya untuk navigasi top-level dengan metode aman (GET), None dikirim (wajib Secure).',null,'Apakah ini same-site? Jika bukan, cek nilai SameSite dan jenis permintaan.',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(6);
  function klik() {
    setN((p) => p * 2);
    setN(n + 4);
    setN(26);
    setN((p) => p + 4);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["30","14","10"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=6 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 6 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 30.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.any([ok("A", 5), ok("B", 10), bad("C", 15)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["err C","ok \"A\"","ok [\"fA\",\"fB\",\"rC\"]"]'::jsonb,null,1,'Promise.any menghasilkan: ok "A". all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','guess','Apakah cookie ini ikut terkirim pada permintaan tersebut?',null,'# dari halaman https://shop.toko.id/keranjang
Set-Cookie: id=7; Secure; HttpOnly

# permintaan berikutnya ke:
https://shop.toko.id/','http','["Ya","Tidak","Tergantung SameSite saja"]'::jsonb,null,0,'Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (/). Path cocok pada batas ''/''. Secure butuh https. Hasil: terkirim.',null,'Cek berurutan: host, path (aturan batas ''/''), skema.',null),
('fullstack','output','Berapa query SQL yang dijalankan (100 post, 4 penulis berbeda)?',null,'posts = Post.objects.all()[:100]
for p in posts:
    print(p.penulis.nama)        # relasi ForeignKey, lazy','python','["2","101","1"]'::jsonb,null,1,'Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 0 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1759999955, nbf: 1759996400, iss: "auth.toko.id", aud: "api.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: token kedaluwarsa","Ditolak: belum berlaku (nbf)","Diterima"]'::jsonb,null,0,'Cek berurutan: Ditolak: token kedaluwarsa (exp). exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("https://app.toko.id/pesanan", {
  method: "GET",
  credentials: "include",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: https://app.toko.id
Access-Control-Allow-Methods: DELETE, GET, PATCH
Access-Control-Allow-Headers: authorization, x-token','javascript','["Same-origin: CORS tidak berlaku, request berhasil","Request langsung dikirim (tanpa preflight) dan respons boleh dibaca JavaScript","Request asli TERKIRIM ke server, tetapi respons diblokir untuk JavaScript"]'::jsonb,null,0,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 900px) 50vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1024px, device pixel ratio 3; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1600.jpg","foto-2000.jpg","foto-640.jpg"]'::jsonb,null,0,'Slot = 50vw × 1024 = 512px CSS; × DPR 3 = 1536px fisik → kandidat terkecil yang ≥ itu: 1600w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'setTimeout(() => console.log("H"), 0);
queueMicrotask(() => console.log("G"));
Promise.resolve().then(() => {
  console.log("D");
  queueMicrotask(() => console.log("C"));
});
Promise.resolve().then(() => console.log("A"));','javascript','["H G D C A","G D C A H","G D A C H"]'::jsonb,null,2,'Urutan nyata: G D A C H. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 50) (2, B, 10) (3, A, 10) (4, B, 30) (5, B, 40) (6, B, 50) (7, A, 10)

SELECT id, SUM(nilai) OVER (ORDER BY id) AS s FROM skor ORDER BY id;','sql','["1,50 | 2,60 | 3,10 | 4,90 | 5,130 | 6,180 | 7,20","1,200 | 2,200 | 3,200 | 4,200 | 5,200 | 6,200 | 7,200","1,50 | 2,60 | 3,70 | 4,100 | 5,140 | 6,190 | 7,200"]'::jsonb,null,2,'SUM() OVER (ORDER BY id) adalah jumlah kumulatif (frame default: awal sampai baris saat ini, termasuk seri pada kunci urut). Hasil: 1,50 | 2,60 | 3,70 | 4,100 | 5,140 | 6,190 | 7,200.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(JSON.stringify({ a: undefined, b: () => 1, c: NaN, d: [undefined, 28], e: null }));','javascript','["{''c'':null,''d'':[null,28],''e'':null}","{\"c\":undefined,\"d\":[null,29],\"e\":null}","{\"c\":null,\"d\":[null,28],\"e\":null}"]'::jsonb,null,2,'Hasil: {"c":null,"d":[null,28],"e":null}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^2.3.2" }
// versi yang tersedia di registry:
2.3.2  2.3.3  2.3.5  2.4.5  3.3.0  3.3.2  3.4.0','json','["2.4.5","3.4.0","2.3.5"]'::jsonb,null,0,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 2.4.5.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 540, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 540
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 540
T1: UPDATE akun SET saldo = x + 60 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 80 WHERE id = 1; COMMIT;','sql','["Mengganti COMMIT menjadi ROLLBACK","Gunakan UPDATE atomik","Menambah indeks pada kolom saldo"]'::jsonb,null,1,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('fullstack','output','Berapa p95 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [407,38,772,545,897,799,519,610,187,391,245,337,170,872]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["485","872","897"]'::jsonb,null,2,'N=14, rank=⌈95/100×14⌉=14 → 897 ms. Rata-rata (485) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','guess','Dari daftar ini, nomor mana yang BUKAN meta-framework lintas sisi?',null,'1. Next.js
2. Testing Library
3. Nuxt
4. Redis
5. Remix','text','["1 dan 2 dan 3","2 dan 3 dan 5","2 dan 4"]'::jsonb,null,2,'Redis dan Testing Library termasuk kategori lain; Next.js, Remix, Nuxt adalah meta-framework lintas sisi.',null,'Cari dua yang berasal dari kategori berbeda.',null);
