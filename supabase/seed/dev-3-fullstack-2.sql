-- DIHASILKAN oleh scripts/gen-dev.mjs (fullstack, bagian 2/4) — 250 soal HARD MODE (v2.4)
insert into questions (difficulty,type,prompt,prompt_en,code,language,options,options_en,correct_index,explanation,explanation_en,hint,hint_en) values
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 5 item
halaman 1 → [100, 99, 98, 97, 96]
# lalu 1 item baru (id 101) ditambahkan sebelum halaman 2 diminta
GET /item?limit=5&offset=5','text','["[96, 95, 94, 93, 92]","[95, 94, 93, 92, 91]","[97, 96, 95, 94, 93]"]'::jsonb,null,0,'Offset menghitung dari posisi, bukan dari item terakhir yang dilihat: item baru menggeser daftar sehingga item akhir halaman 1 muncul lagi (duplikat).',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','guess','Hubungan kedua URL ini?',null,'halaman : https://app.toko.id
permintaan: https://api.toko.id','text','["cross-origin tetapi same-site","cross-origin dan cross-site","same-origin (dan same-site)"]'::jsonb,null,0,'Origin = skema+host+port; site = eTLD+1 (+ skema). app.toko.id → toko.id, api.toko.id → toko.id. github.io dan vercel.app ada di Public Suffix List, jadi subdomainnya berbeda site.',null,'Public Suffix List menentukan batas site.',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src ''nonce-r4nd'' ''self'' https://cdn.toko.id

A. <script>inisiasi()</script>
B. <script nonce="r4nd">inisiasi()</script>
C. <script src="/app.js"></script>  <!-- same-origin -->
D. <script src="https://cdn.toko.id/lib.js"></script>
E. <script src="https://evil.example/x.js"></script>','http','["D E","A E","C E"]'::jsonb,null,1,'Diblokir: A E. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','output','Apa output kode ini?',null,'console.log(JSON.stringify({ a: undefined, b: () => 1, c: NaN, d: [undefined, 1], e: null }));','javascript','["{\"c\":null,\"d\":[null,1],\"e\":null}","{''c'':null,''d'':[null,1],''e'':null}","{\"c\":undefined,\"d\":[null,2],\"e\":null}"]'::jsonb,null,0,'Hasil: {"c":null,"d":[null,1],"e":null}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 700px) 60vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1024px, device pixel ratio 1; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1024.jpg","foto-640.jpg","foto-800.jpg"]'::jsonb,null,1,'Slot = 60vw × 1024 = 614px CSS; × DPR 1 = 614px fisik → kandidat terkecil yang ≥ itu: 640w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(2);
  function klik() {
    setN((p) => p + 1);
    setN(12);
    setN(n + 1);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["13","4","3"]'::jsonb,null,2,'Antrean update diproses berurutan mulai dari n=2 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 2 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 3.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~2.1.2" }
// versi yang tersedia di registry:
2.1.2  2.1.3  2.1.5  2.2.2  2.2.3  2.3.2  2.3.4  3.3.3','json','["2.3.4","2.1.5","3.3.3"]'::jsonb,null,1,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 2.1.5.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','output','Berapa query SQL yang dijalankan (200 post, 4 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:200]
for p in posts:
    print(p.penulis.nama)','python','["201","1","2"]'::jsonb,null,1,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'Promise.resolve().then(() => {
  console.log("A");
  queueMicrotask(() => console.log("B"));
});
setTimeout(() => {
  console.log("D");
  Promise.resolve().then(() => console.log("F"));
}, 0);
Promise.resolve().then(() => {
  console.log("C");
  queueMicrotask(() => console.log("G"));
});
Promise.resolve().then(() => {
  console.log("undefined");
  queueMicrotask(() => console.log("undefined"));
});','javascript','["A C undefined B G undefined F D","A C undefined B G undefined D F","A B D F C G"]'::jsonb,null,1,'Urutan nyata: A C undefined B G undefined D F. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','output','Berapa kali saldo pelanggan dipotong?',null,'// klien: timeout 3 detik, retry maksimal 4 kali
// server memproses TIAP request yang tiba (mengurangi saldo), lalu membalas
// jaringan menghilangkan respons 2 percobaan pertama; respons percobaan ke-3 sampai
POST /bayar  { jumlah: 50000 }   // tanpa Idempotency-Key','http','["3","1","4"]'::jsonb,null,0,'Klien hanya tahu ''tidak ada respons'', bukan ''server belum memproses''. Tiap percobaan yang sampai diproses: 2 yang responsnya hilang + 1 yang berhasil = 3. Idempotency-Key membuat server mengembalikan hasil yang sama (dipotong 1 kali).',null,'Apakah server tahu request itu retry dari yang sebelumnya?',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 50) (2, A, 30) (3, A, 50) (4, A, 20) (5, B, 30) (6, B, 40) (7, A, 40) (8, B, 10)

SELECT id, RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,1 | 2,4 | 3,2 | 4,5 | 5,2 | 6,1 | 7,3 | 8,3","1,1 | 2,3 | 3,1 | 4,4 | 5,2 | 6,1 | 7,2 | 8,3","1,1 | 2,4 | 3,1 | 4,5 | 5,2 | 6,1 | 7,3 | 8,3"]'::jsonb,null,2,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,1 | 2,4 | 3,1 | 4,5 | 5,2 | 6,1 | 7,3 | 8,3.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','output','Berapa p99 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [271,118,161,537,411,145,529,383,195,829,539,134,643,246,54,275,425,630,666,348]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["666","829","377"]'::jsonb,null,1,'N=20, rank=⌈99/100×20⌉=20 → 829 ms. Rata-rata (377) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.race([bad("A", 15), ok("B", 5), ok("C", 10)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["ok [\"rA\",\"fB\",\"fC\"]","err A","ok \"B\""]'::jsonb,null,2,'Promise.race menghasilkan: ok "B". all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 13; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. A: counter = tmpA + 1
4. B: counter = tmpB + 1
5. B: tmpB = counter
6. B: counter = tmpB + 1
7. A: tmpA = counter
8. A: counter = tmpA + 1','python','["16","15","17"]'::jsonb,null,0,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 16, bukan 17. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','output','Apa output kode ini?',null,'Promise.resolve(3)
  .then((v) => { throw new Error("e" + v); })
  .then(() => console.log("A"))
  .catch((e) => e.message)
  .then((m) => console.log("B", m));','javascript','["B e4","B e3","undefined"]'::jsonb,null,1,'Dijalankan: B e3.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tombol.addEventListener("click", () => log("A"), true);
tengah.addEventListener("click", () => log("B"), true);
tengah.addEventListener("click", () => log("C"));
tombol.addEventListener("click", () => log("D"));','javascript','["B A D C","A B C D","A D B C"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: B A D C.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 30 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1760003600, nbf: 1760000010, iss: "auth.lain.id", aud: "api.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: token kedaluwarsa (exp)","Ditolak: belum berlaku (nbf)","Ditolak: issuer tidak sesuai"]'::jsonb,null,2,'Cek berurutan: Ditolak: issuer tidak sesuai. exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 120 detik yang lalu
Cache-Control: stale-while-revalidate=600
(tanpa ETag/Last-Modified)
# resource di server TIDAK berubah; permintaan ulang oleh browser (private cache), navigasi biasa','http','["Request kondisional; server membalas 304 tanpa body","Unduh penuh (200) dari server","Dilayani dari cache (basi) sekarang, revalidasi di latar belakang"]'::jsonb,null,1,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','guess','Manakah kombinasi nomor yang SEMUANYA merupakan ORM/query builder?',null,'1. Sequelize
2. Prisma
3. Kafka
4. MariaDB
5. Hibernate','text','["3, 4, 5","1, 2, 5","2, 3, 5"]'::jsonb,null,1,'Hibernate, Prisma, Sequelize adalah ORM/query builder; Kafka dan MariaDB termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('fullstack','guess','Halaman blog jarang berubah, butuh SEO dan sangat cepat. Strategi render yang paling cocok?',null,'// Next.js','javascript','["SSG / ISR: dibangun statis dan disajikan dari CDN","CSR murni dengan data diambil setelah JavaScript dimuat","SSR pada setiap request tanpa cache sama sekali"]'::jsonb,null,0,'Konten statis diuntungkan oleh HTML yang sudah jadi di edge; SEO bagus dan latensi minimum.',null,'Kapan HTML paling murah dibuat?',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("https://api.toko.id/pesanan", {
  method: "PUT",
  credentials: "omit",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: https://app.toko.id
Access-Control-Allow-Credentials: true
Access-Control-Allow-Methods: DELETE, POST, PATCH
Access-Control-Allow-Headers: content-type','javascript','["Same-origin: CORS tidak berlaku, request berhasil","Preflight gagal: request asli tidak pernah dikirim","Request asli TERKIRIM ke server, tetapi respons diblokir untuk JavaScript"]'::jsonb,null,1,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, umur, kota);

SELECT * FROM orang
WHERE umur > 30 AND kota = ''x'' AND negara > 30;','sql','["2","1","3"]'::jsonb,null,1,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Budi, Bandung) (2, Eka, Bandung) (3, Ayu, Padang) (4, Dedi, Bandung) (5, Gita, NULL)
-- pesanan(id, pelanggan_id, total, status)
(1, 3, 20, lunas) (2, 3, 30, lunas) (3, 3, 90, baru) (4, NULL, 20, lunas) (5, NULL, 40, baru) (6, 2, 70, lunas) (7, 1, 50, lunas) (8, NULL, 70, lunas) (9, 4, 50, batal)

SELECT p.nama FROM pelanggan p
WHERE (SELECT SUM(total) FROM pesanan o WHERE o.pelanggan_id = p.id)
  > (SELECT AVG(total) FROM pesanan)
ORDER BY p.nama;','sql','["Ayu","(kosong)","Ayu | Budi | Dedi | Eka"]'::jsonb,null,2,'Subquery berkorelasi dihitung per pelanggan; pelanggan tanpa pesanan menghasilkan NULL sehingga perbandingan tidak lolos. Hasil: Ayu | Budi | Dedi | Eka.',null,'Bandingkan SUM per pelanggan dengan AVG seluruh pesanan (termasuk yang pelanggan_id-nya NULL).',null),
('fullstack','output','Berapa saldo akhir?',null,'-- saldo awal = 110, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 110
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 110
T1: UPDATE akun SET saldo = x + 50 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 90 WHERE id = 1; COMMIT;','sql','["200","250","160"]'::jsonb,null,0,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 110+90, sehingga tambahan 50 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
const o = { n: 14, get() { return this.n; } };
const g = o.get.bind({ n: 178 });
console.log(g.call({ n: 254 }));','javascript','["254","178","14"]'::jsonb,null,1,'bind menetapkan this secara permanen; call() tidak bisa menimpanya, jadi hasilnya nilai pada objek yang di-bind.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 699 → tiba t=699
"ko": kirim t=93, latensi 433 → tiba t=526
"kop": kirim t=196, latensi 475 → tiba t=671

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"kop\" — query yang diketik paling akhir","\"ko\" — respons yang tiba paling awal","\"k\" — respons yang tiba paling akhir"]'::jsonb,null,2,'Urutan tiba: "ko" → "kop" → "k". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','output','Apa output kode ini?',null,'const s = new URLSearchParams("a=2&b=2");
s.append("a", "x y");
s.delete("b");
s.set("c", "&");
console.log(s.toString(), s.getAll("a").length);','javascript','["a=2&a=x+y&c=%24 2","a=2&a=x+y&c=%26 2","a=2&a=x+y&c=%26 3"]'::jsonb,null,1,'Hasil: a=2&a=x+y&c=%26 2. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','guess','Bisakah JavaScript di halaman penyetel membaca cookie ini lewat document.cookie?',null,'Set-Cookie: id=7; Domain=toko.id; HttpOnly
// dari halaman https://shop.toko.id/keranjang','http','["Hanya jika SameSite=None","Ya, bisa dibaca","Tidak: HttpOnly menyembunyikannya dari JavaScript"]'::jsonb,null,2,'HttpOnly melarang akses skrip (membatasi dampak XSS) tetapi cookie tetap terkirim ke server.',null,'Atribut mana yang mengatur akses dari JavaScript?',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 1 f.txt menjadi "fitur"
main: mengubah baris 3 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("https://api.toko.id/pesanan", {
  method: "POST",
  headers: { "Accept": "application/json" },
  credentials: "include",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: https://lain.id
Access-Control-Allow-Methods: GET, DELETE
Access-Control-Allow-Headers: content-type, x-token','javascript','["Request asli TERKIRIM ke server, tetapi respons diblokir untuk JavaScript","Same-origin: CORS tidak berlaku, request berhasil","Request langsung dikirim (tanpa preflight) dan respons boleh dibaca JavaScript"]'::jsonb,null,0,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
const o = {
  n: 56,
  list() { return [1].map(() => this.n)[0]; },
};
console.log(o.list());','javascript','["56","149","260"]'::jsonb,null,0,'Arrow function tidak punya this sendiri; ia memakai this dari list() yang dipanggil sebagai o.list().',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src ''nonce-r4nd'' ''unsafe-eval''

A. <script>inisiasi()</script>
B. <script nonce="r4nd">inisiasi()</script>
D. <script src="https://cdn.toko.id/lib.js"></script>
F. <button onclick="kirim()">OK</button>
G. eval("1 + 1")  // di dalam skrip yang diizinkan','http','["A B F","A D F","A F G"]'::jsonb,null,1,'Diblokir: A D F. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(8);
  function klik() {
    setN((p) => p * 2);
    setN(n + 3);
    setN(n + 5);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["24","13","16"]'::jsonb,null,1,'Antrean update diproses berurutan mulai dari n=8 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 8 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 13.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 700px) 60vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1024px, device pixel ratio 1; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1024.jpg","foto-800.jpg","foto-640.jpg"]'::jsonb,null,2,'Slot = 60vw × 1024 = 614px CSS; × DPR 1 = 614px fisik → kandidat terkecil yang ≥ itu: 640w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','output','Berapa saldo akhir?',null,'-- saldo awal = 110, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 110
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 110
T1: UPDATE akun SET saldo = x + 30 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 80 WHERE id = 1; COMMIT;','sql','["190","140","220"]'::jsonb,null,0,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 110+80, sehingga tambahan 30 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('fullstack','output','Berapa p50 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [22,580,223,743,413,697,652,832,154,601,93,124,659,172]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["426","413","580"]'::jsonb,null,1,'N=14, rank=⌈50/100×14⌉=7 → 413 ms. Rata-rata (426) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','output','Berapa query SQL yang dijalankan (50 post, 3 penulis berbeda)?',null,'posts = Post.objects.all()[:50]
for p in posts:
    print(p.penulis.nama)        # relasi ForeignKey, lazy','python','["2","1","51"]'::jsonb,null,2,'Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','guess','Refresh token dicuri dan dipakai penyerang. Mitigasi yang mendeteksi pemakaian ganda?',null,'POST /token { grant_type: "refresh_token" }','http','["Menaikkan masa berlaku refresh token menjadi 1 tahun","Rotasi refresh token dengan deteksi reuse","Menyimpannya di URL agar mudah dibagikan"]'::jsonb,null,1,'Dengan rotasi, tiap token sekali pakai. Pemakaian ulang menandakan pencurian dan memicu pencabutan.',null,'Jika dua pihak memakai token yang sama, siapa yang pertama?',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^3.1.1" }
// versi yang tersedia di registry:
3.1.1  3.2.0  3.3.4  4.1.0  4.1.2  4.2.2  4.3.3','json','["3.1.1","3.3.4","4.3.3"]'::jsonb,null,1,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 3.3.4.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','guess','Apakah cookie ini ikut terkirim pada permintaan tersebut?',null,'# dari halaman https://shop.toko.id/keranjang
Set-Cookie: id=7; Path=/; Secure

# permintaan berikutnya ke:
https://toko.id/akun/profil/edit','http','["Ya","Tergantung SameSite saja","Tidak"]'::jsonb,null,2,'Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (/). Path cocok pada batas ''/''. Secure butuh https. Hasil: tidak terkirim.',null,'Cek berurutan: host, path (aturan batas ''/''), skema.',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, kota, umur);

SELECT * FROM orang
WHERE kota = ''x'' AND negara = ''x'' AND umur > 30;','sql','["3","4","2"]'::jsonb,null,0,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 3.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Gita, Padang) (2, Fajar, NULL) (3, Ayu, Bandung) (4, Hana, Padang) (5, Eka, NULL) (6, Dedi, Bandung)
-- pesanan(id, pelanggan_id, total, status)
(1, 1, 80, batal) (2, 2, 80, baru) (3, 4, 20, lunas) (4, 2, 40, lunas) (5, NULL, 90, batal) (6, 1, 50, lunas) (7, 3, 30, lunas)

SELECT p.nama, SUM(o.total)
FROM pelanggan p JOIN pesanan o ON o.pelanggan_id = p.id
WHERE o.status <> ''batal''
GROUP BY p.nama
HAVING SUM(o.total) > 40
ORDER BY p.nama;','sql','["Ayu,1 | Fajar,2 | Gita,1 | Hana,1","Fajar,120 | Gita,50","Fajar,120 | Gita,130"]'::jsonb,null,1,'WHERE menyaring baris SEBELUM pengelompokan; HAVING menyaring grup SESUDAH agregasi. Perhatikan status NULL tidak lolos <> ''batal''. Hasil: Fajar,120 | Gita,50.',null,'Urutan eksekusi: FROM → WHERE → GROUP BY → HAVING.',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.allSettled([ok("A", 5), ok("B", 15), ok("C", 10)])
  .then((r) => console.log("ok", JSON.stringify(r.map((x) => x.status[0] + (x.value ?? x.reason.message)))))
  .catch((e) => console.log("err", e.message));','javascript','["ok \"A\"","ok [\"A\",\"B\",\"C\"]","ok [\"fA\",\"fB\",\"fC\"]"]'::jsonb,null,2,'Promise.allSettled menghasilkan: ok ["fA","fB","fC"]. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tombol.addEventListener("click", () => log("A"));
tengah.addEventListener("click", () => log("B"));
luar.addEventListener("click", () => log("C"), true);
tengah.addEventListener("click", () => log("D"));
tombol.addEventListener("click", () => log("E"));
tengah.addEventListener("click", () => log("F"), true);','javascript','["A B C D E F","A E B D F C","C F A E B D"]'::jsonb,null,2,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: C F A E B D.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 6 item
halaman 1 → [100, 99, 98, 97, 96, 95]
# lalu 2 item baru (id 101…102) ditambahkan sebelum halaman 2 diminta
GET /item?limit=6&offset=6','text','["[96, 95, 94, 93, 92, 91]","[94, 93, 92, 91, 90, 89]","[95, 94, 93, 92, 91, 90]"]'::jsonb,null,0,'Offset menghitung dari posisi, bukan dari item terakhir yang dilihat: item baru menggeser daftar sehingga item akhir halaman 1 muncul lagi (duplikat).',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 0 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1759999955, nbf: 1760000010, iss: "auth.lain.id", aud: "api.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: issuer tidak sesuai","Ditolak: token kedaluwarsa","Ditolak: belum berlaku (nbf)"]'::jsonb,null,1,'Cek berurutan: Ditolak: token kedaluwarsa (exp). exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 120 detik yang lalu
Cache-Control: max-age=300, s-maxage=3600, stale-while-revalidate=60
ETag: "v7"
# resource di server TIDAK berubah; permintaan ulang oleh browser (private cache), navigasi biasa','http','["Unduh penuh (200) dari server","Dilayani dari cache (basi) sekarang, revalidasi di latar belakang","Dilayani dari cache tanpa request ke jaringan"]'::jsonb,null,2,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_A → LOCK tabel_B → COMMIT
T2: LOCK tabel_A → LOCK tabel_B → LOCK tabel_C → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan","Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten"]'::jsonb,null,2,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 8 f.txt menjadi "fitur"
main: mengubah baris 1 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 20) (2, B, 50) (3, B, 30) (4, B, 30) (5, B, 20) (6, A, 50) (7, A, 30)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,30 | 2,-20 | 3,0 | 4,-10 | 5,0 | 6,-20 | 7,0","1,0 | 2,30 | 3,-20 | 4,0 | 5,-10 | 6,30 | 7,-20","1,0 | 2,0 | 3,-20 | 4,0 | 5,-10 | 6,30 | 7,-20"]'::jsonb,null,2,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,0 | 3,-20 | 4,0 | 5,-10 | 6,30 | 7,-20.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'console.log("C");
setTimeout(() => console.log("H"), 0);
setTimeout(() => {
  console.log("A");
  Promise.resolve().then(() => console.log("F"));
}, 0);
setTimeout(() => {
  console.log("D");
  Promise.resolve().then(() => console.log("B"));
}, 0);
console.log("E");','javascript','["C H A F D B E","C E H A D F B","C E H A F D B"]'::jsonb,null,2,'Urutan nyata: C E H A F D B. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','output','Apa output kode ini?',null,'(async () => {
  try {
    await Promise.reject(new Error("r9"));
  } catch (e) {
    console.log("c", e.message);
  } finally {
    console.log("f");
  }
  console.log("end");
})();
console.log("sync");','javascript','["sync | c r9 | f | end","end | f | c r9 | sync","sync | c r10 | f | end"]'::jsonb,null,0,'Dijalankan: sync | c r9 | f | end.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','output','Apa output kode ini?',null,'const o = { n: 25, toJSON() { return { v: this.n * 2 }; } };
console.log(JSON.stringify({ o, a: [o] }));','javascript','["{''o'':{''v'':50},''a'':[{''v'':50}]}","{\"o\":{\"v\":50},\"a\":[{\"v\":50}]}","{\"o\":{\"v\":51},\"a\":[{\"v\":50}]}"]'::jsonb,null,1,'Hasil: {"o":{"v":50},"a":[{"v":50}]}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','guess','Apakah cookie ini ikut dikirim pada permintaan ke toko.com:8080?',null,'halaman        : https://toko.com:3000
fetch() dari JavaScript halaman
tujuan         : https://toko.com:8080
Set-Cookie     : sid=1; SameSite=Strict; Domain milik tujuan','text','["Tidak, cookie tidak dikirim","Ya, cookie dikirim","Hanya dikirim jika memakai HTTP/2"]'::jsonb,null,1,'Hubungan: cross-origin tetapi same-site. Pada konteks same-site cookie selalu dikirim; pada cross-site: Strict tidak pernah, Lax hanya untuk navigasi top-level dengan metode aman (GET), None dikirim (wajib Secure).',null,'Apakah ini same-site? Jika bukan, cek nilai SameSite dan jenis permintaan.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(new URL("?q=3", "https://toko.id/c/img?lama=1#h").href, new URL("#baru", "https://toko.id/c?x=1").href);','javascript','["https://toko.id/c/img?q=3 https://toko.id/c?x=1#baru","https://toko.id/c/img?q=3 https://toko.id/c?x=3#baru","https://toko.id/c/img?q=3 https://toko.id/c?x=11#baru"]'::jsonb,null,0,'Hasil: https://toko.id/c/img?q=3 https://toko.id/c?x=1#baru. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 454 → tiba t=454
"ko": kirim t=106, latensi 675 → tiba t=781
"kop": kirim t=199, latensi 301 → tiba t=500

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"kop\" — respons yang tiba paling awal","\"kop\" — query yang diketik paling akhir","\"ko\" — respons yang tiba paling akhir"]'::jsonb,null,2,'Urutan tiba: "k" → "kop" → "ko". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','guess','Manakah kombinasi nomor yang SEMUANYA merupakan framework web sisi server?',null,'1. Rails
2. Vite
3. Laravel
4. Tailwind CSS
5. FastAPI','text','["2, 4, 5","1, 2, 4","1, 3, 5"]'::jsonb,null,2,'Laravel, FastAPI, Rails adalah framework web sisi server; Tailwind CSS dan Vite termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 13; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. A: tmpA = counter
3. B: counter = tmpB + 1
4. A: counter = tmpA + 1
5. B: tmpB = counter
6. B: counter = tmpB + 1
7. A: tmpA = counter
8. A: counter = tmpA + 1','python','["15","17","16"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 16, bukan 17. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Hana, Bandung) (2, Citra, NULL) (3, Eka, Padang) (4, Dedi, NULL) (5, Ayu, NULL)
-- pesanan(id, pelanggan_id, total, status)
(1, 2, 50, batal) (2, 1, 40, batal) (3, 1, 70, lunas) (4, 1, 70, lunas) (5, 3, 40, lunas) (6, 2, 90, baru) (7, NULL, 40, lunas) (8, 4, 70, baru) (9, 4, 90, baru)

SELECT p.nama, SUM(o.total)
FROM pelanggan p JOIN pesanan o ON o.pelanggan_id = p.id
WHERE o.status <> ''batal''
GROUP BY p.nama
HAVING SUM(o.total) > 40
ORDER BY p.nama;','sql','["Citra,1 | Dedi,2 | Eka,1 | Hana,2","Citra,140 | Dedi,160 | Eka,40 | Hana,180","Citra,90 | Dedi,160 | Hana,140"]'::jsonb,null,2,'WHERE menyaring baris SEBELUM pengelompokan; HAVING menyaring grup SESUDAH agregasi. Perhatikan status NULL tidak lolos <> ''batal''. Hasil: Citra,90 | Dedi,160 | Hana,140.',null,'Urutan eksekusi: FROM → WHERE → GROUP BY → HAVING.',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 17; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. B: counter = tmpB + 1
3. B: tmpB = counter
4. A: tmpA = counter
5. B: counter = tmpB + 1
6. A: counter = tmpA + 1
7. A: tmpA = counter
8. A: counter = tmpA + 1','python','["20","21","19"]'::jsonb,null,0,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 20, bukan 21. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'queueMicrotask(() => console.log("E"));
(async () => {
  console.log("D");
  await null;
  console.log("B");
})();
Promise.resolve().then(() => console.log("F"));
(async () => {
  console.log("H");
  await null;
  console.log("undefined");
})();','javascript','["D H E B F undefined","D H E B undefined F","E D B F H"]'::jsonb,null,0,'Urutan nyata: D H E B F undefined. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_B → LOCK tabel_A → COMMIT
T2: LOCK tabel_B → LOCK tabel_C → LOCK tabel_A → COMMIT
T3: LOCK tabel_C → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: urutan penguncian membentuk siklus tabel_B → tabel_C → tabel_B","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten"]'::jsonb,null,0,'Graf urutan kunci memuat siklus tabel_B → tabel_C → tabel_B: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src ''self'' ''unsafe-eval'' ''unsafe-inline''

A. <script>inisiasi()</script>
B. <script nonce="r4nd">inisiasi()</script>
D. <script src="https://cdn.toko.id/lib.js"></script>
E. <script src="https://evil.example/x.js"></script>
F. <button onclick="kirim()">OK</button>','http','["B D E","D E F","B D F"]'::jsonb,null,0,'Diblokir: B D E. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(9);
  function klik() {
    setN((p) => p * 2);
    setN(n + 3);
    setN(23);
    setN(n + 3);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["26","15","12"]'::jsonb,null,2,'Antrean update diproses berurutan mulai dari n=9 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 9 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 12.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','guess','Apakah cookie ini ikut dikirim pada permintaan ke api.toko.id?',null,'halaman        : https://app.toko.id
fetch() dari JavaScript halaman
tujuan         : https://api.toko.id
Set-Cookie     : sid=1; SameSite=Strict; Domain milik tujuan','text','["Ya, cookie dikirim","Hanya dikirim jika memakai HTTP/2","Tidak, cookie tidak dikirim"]'::jsonb,null,0,'Hubungan: cross-origin tetapi same-site. Pada konteks same-site cookie selalu dikirim; pada cross-site: Strict tidak pernah, Lax hanya untuk navigasi top-level dengan metode aman (GET), None dikirim (wajib Secure).',null,'Apakah ini same-site? Jika bukan, cek nilai SameSite dan jenis permintaan.',null),
('fullstack','output','Berapa p50 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [611,204,304,659,752,347,366,783,436,581,254,293,154,501,650,484,774,552,61]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["484","461","501"]'::jsonb,null,0,'N=19, rank=⌈50/100×19⌉=10 → 484 ms. Rata-rata (461) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
const o = { n: 7, get() { return this.n; } };
const g = o.get.bind({ n: 130 });
console.log(g.call({ n: 289 }));','javascript','["130","7","289"]'::jsonb,null,0,'bind menetapkan this secara permanen; call() tidak bisa menimpanya, jadi hasilnya nilai pada objek yang di-bind.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','guess','Komponen App Router Next.js ini menimbulkan galat. Mengapa?',null,'// app/page.tsx (Server Component, tanpa ''use client'')
export default function Page() {
  const [n, setN] = useState(0);
  return <button onClick={() => setN(n + 1)}>{n}</button>;
}','javascript','["Server Component tidak boleh memakai state/efek/event handler","onClick tidak didukung React 18 sehingga harus diganti dengan onPress","useState hanya boleh dipakai di berkas bernama page.tsx dalam folder app"]'::jsonb,null,0,'Komponen server dirender di server tanpa interaktivitas klien. Batas klien ditandai ''use client''.',null,'Di mana komponen ini dieksekusi?',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
luar.addEventListener("click", () => log("A"), true);
tombol.addEventListener("click", () => log("B"), true);
tengah.addEventListener("click", () => log("C"), true);
tombol.addEventListener("click", () => log("D"));
tengah.addEventListener("click", () => log("E"), true);','javascript','["A C E B D","A B C D E","B D C E A"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: A C E B D.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','guess','Dari daftar ini, nomor mana yang BUKAN alat uji end-to-end/komponen di browser?',null,'1. Cypress
2. Playwright
3. Testing Library
4. Caddy
5. FastAPI','text','["4 dan 5","2 dan 3 dan 5","2 dan 4 dan 5"]'::jsonb,null,0,'Caddy dan FastAPI termasuk kategori lain; Playwright, Testing Library, Cypress adalah alat uji end-to-end/komponen di browser.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 97 → tiba t=97
"ko": kirim t=126, latensi 511 → tiba t=637
"kop": kirim t=202, latensi 165 → tiba t=367

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"kop\" — query yang diketik paling akhir","\"ko\" — respons yang tiba paling akhir","\"k\" — respons yang tiba paling awal"]'::jsonb,null,1,'Urutan tiba: "k" → "kop" → "ko". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 30 detik yang lalu
Cache-Control: no-cache, max-age=300, s-maxage=60
ETag: "v7"
# resource di server TIDAK berubah; permintaan ulang oleh CDN (shared cache)','http','["Unduh penuh (200) dari server","Dilayani dari cache tanpa request ke jaringan","Request kondisional"]'::jsonb,null,2,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (kota, negara, umur);

SELECT * FROM orang
WHERE negara > 30 AND kota = ''x'';','sql','["1","3","2"]'::jsonb,null,2,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 2.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 6 item
halaman 1 → [100, 99, 98, 97, 96, 95]
# lalu 2 item teratas dihapus sebelum halaman 2 diminta
GET /item?limit=6&sebelum_id=95','text','["[91, 90, 89, 88, 87, 86]","[94, 93, 92, 91, 90, 89]","[92, 91, 90, 89, 88, 87]"]'::jsonb,null,1,'Cursor memakai id terakhir yang sudah dilihat sehingga hasil stabil terhadap sisipan/hapus di depan: [94, 93, 92, 91, 90, 89].',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 50) (2, B, 30) (3, B, 20) (4, A, 20) (5, B, 40) (6, A, 40)

SELECT id, SUM(nilai) OVER (ORDER BY id) AS s FROM skor ORDER BY id;','sql','["1,50 | 2,30 | 3,50 | 4,70 | 5,90 | 6,110","1,200 | 2,200 | 3,200 | 4,200 | 5,200 | 6,200","1,50 | 2,80 | 3,100 | 4,120 | 5,160 | 6,200"]'::jsonb,null,2,'SUM() OVER (ORDER BY id) adalah jumlah kumulatif (frame default: awal sampai baris saat ini, termasuk seri pada kunci urut). Hasil: 1,50 | 2,80 | 3,100 | 4,120 | 5,160 | 6,200.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^2.4.1" }
// versi yang tersedia di registry:
2.4.1  2.4.2  2.4.3  2.4.4  2.5.2  2.6.3  3.4.0  3.4.4','json','["3.4.4","2.4.4","2.6.3"]'::jsonb,null,2,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 2.6.3.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 700px) 40vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 390px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-800.jpg","foto-480.jpg","foto-1024.jpg"]'::jsonb,null,0,'Slot = 100vw × 390 = 390px CSS; × DPR 2 = 780px fisik → kandidat terkecil yang ≥ itu: 800w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 990, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 990
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 990
T1: UPDATE akun SET saldo = x + 60 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 90 WHERE id = 1; COMMIT;','sql','["Menambah indeks pada kolom saldo","Mengganti COMMIT menjadi ROLLBACK","Gunakan UPDATE atomik"]'::jsonb,null,2,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 60 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1760003600, nbf: 1759996400, iss: "auth.lain.id", aud: "web.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: audience tidak sesuai","Diterima","Ditolak: issuer tidak sesuai"]'::jsonb,null,2,'Cek berurutan: Ditolak: issuer tidak sesuai. exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','output','Berapa query SQL yang dijalankan (50 post, 5 penulis berbeda)?',null,'posts = Post.objects.prefetch_related("penulis")[:50]
for p in posts:
    print(p.penulis.nama)','python','["2","1","51"]'::jsonb,null,0,'prefetch_related memakai query kedua dengan WHERE id IN (...): total 2 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','output','Apa output kode ini?',null,'(async () => {
  try {
    await Promise.reject(new Error("r3"));
  } catch (e) {
    console.log("c", e.message);
  } finally {
    console.log("f");
  }
  console.log("end");
})();
console.log("sync");','javascript','["sync | c r4 | f | end","sync | c r3 | f | end","end | f | c r3 | sync"]'::jsonb,null,1,'Dijalankan: sync | c r3 | f | end.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(JSON.stringify(JSON.parse(''{"a":40,"b":[1,2],"c":{"d":null}}'', (k, v) => (typeof v === "number" ? v + 1 : v))));','javascript','["{''a'':41,''b'':[2,3],''c'':{''d'':null}}","{\"a\":42,\"b\":[2,3],\"c\":{\"d\":undefined}}","{\"a\":41,\"b\":[2,3],\"c\":{\"d\":null}}"]'::jsonb,null,2,'Hasil: {"a":41,"b":[2,3],"c":{"d":null}}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','guess','Apakah cookie ini ikut terkirim pada permintaan tersebut?',null,'# dari halaman https://shop.toko.id/akun/profil
Set-Cookie: id=7; Domain=toko.id; Path=/akun/profil; HttpOnly

# permintaan berikutnya ke:
https://api.toko.id/akun','http','["Ya","Tidak","Tergantung SameSite saja"]'::jsonb,null,1,'Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (/akun). Path cocok pada batas ''/''. Secure butuh https. Hasil: tidak terkirim.',null,'Cek berurutan: host, path (aturan batas ''/''), skema.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(new URL("?q=1", "https://api.toko.id/d/a?lama=1#h").href, new URL("#baru", "https://api.toko.id/d?x=1").href);','javascript','["https://api.toko.id/d/a?q=1 https://api.toko.id/d?x=11#baru","https://api.toko.id/d/a?q=1 https://api.toko.id/d?x=1#baru","https://api.toko.id/d/a?q=11 https://api.toko.id/d?x=1#baru"]'::jsonb,null,1,'Hasil: https://api.toko.id/d/a?q=1 https://api.toko.id/d?x=1#baru. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.allSettled([bad("A", 15), ok("B", 5), ok("C", 10)])
  .then((r) => console.log("ok", JSON.stringify(r.map((x) => x.status[0] + (x.value ?? x.reason.message)))))
  .catch((e) => console.log("err", e.message));','javascript','["ok [\"rA\",\"fB\",\"fC\"]","ok \"B\"","err A"]'::jsonb,null,0,'Promise.allSettled menghasilkan: ok ["rA","fB","fC"]. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 7 f.txt menjadi "fitur"
main: mengubah baris 3 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("https://api.toko.id/pesanan", {
  method: "DELETE",
  credentials: "include",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: https://lain.id
Access-Control-Allow-Credentials: true
Access-Control-Allow-Methods: PATCH, DELETE, POST
Access-Control-Allow-Headers: authorization','javascript','["Preflight gagal: request asli tidak pernah dikirim","Same-origin: CORS tidak berlaku, request berhasil","Request langsung dikirim (tanpa preflight) dan respons boleh dibaca JavaScript"]'::jsonb,null,0,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 18; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. A: counter = tmpA + 1
4. B: counter = tmpB + 1
5. A: tmpA = counter
6. A: counter = tmpA + 1
7. B: tmpB = counter
8. B: counter = tmpB + 1','python','["20","21","22"]'::jsonb,null,1,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 21, bukan 22. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_C → LOCK tabel_B → LOCK tabel_A → COMMIT
T2: LOCK tabel_C → LOCK tabel_B → LOCK tabel_A → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan","Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten"]'::jsonb,null,2,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Citra, NULL) (2, Ayu, Bandung) (3, Eka, NULL) (4, Fajar, Bandung) (5, Hana, Medan) (6, Gita, Medan)
-- pesanan(id, pelanggan_id, total, status)
(1, 2, 50, lunas) (2, 3, 90, baru) (3, 1, 60, lunas) (4, 1, 40, batal) (5, NULL, 60, baru) (6, 2, 50, lunas) (7, 1, 70, lunas)

SELECT COUNT(*) FROM pelanggan p
LEFT JOIN pesanan o ON o.pelanggan_id = p.id
WHERE o.status = ''lunas'';','sql','["6","8","4"]'::jsonb,null,2,'Kondisi pada tabel kanan di WHERE membuang baris NULL hasil LEFT JOIN sehingga ia berperilaku seperti INNER JOIN; bila kondisi ada di ON, pelanggan tanpa pesanan tetap muncul. Hasil: 4.',null,'WHERE atau ON — mana yang menyaring SETELAH join?',null),
('fullstack','guess','Apakah cookie ini ikut dikirim pada permintaan ke api.toko.id?',null,'halaman        : https://app.toko.id
<img> yang dimuat halaman
tujuan         : https://api.toko.id
Set-Cookie     : sid=1; SameSite=Lax; Domain milik tujuan','text','["Ya, cookie dikirim","Hanya dikirim jika memakai HTTP/2","Tidak, cookie tidak dikirim"]'::jsonb,null,0,'Hubungan: cross-origin tetapi same-site. Pada konteks same-site cookie selalu dikirim; pada cross-site: Strict tidak pernah, Lax hanya untuk navigasi top-level dengan metode aman (GET), None dikirim (wajib Secure).',null,'Apakah ini same-site? Jika bukan, cek nilai SameSite dan jenis permintaan.',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
function buat() {
  return { n: 23, get: () => this.n };
}
const o = buat.call({ n: 185 });
console.log(o.get(), o.n);','javascript','["23 undefined","185 23","23 TypeError"]'::jsonb,null,1,'Arrow memakai this dari fungsi pembungkusnya (buat), yaitu objek yang di-call; bukan objek literal yang dikembalikan. o.n tetap nilai propertinya sendiri.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','output','Apa output kode ini?',null,'console.log(JSON.stringify({ a: undefined, b: () => 1, c: NaN, d: [undefined, 12], e: null }));','javascript','["{''c'':null,''d'':[null,12],''e'':null}","{\"c\":null,\"d\":[null,12],\"e\":null}","{\"c\":undefined,\"d\":[null,13],\"e\":null}"]'::jsonb,null,1,'Hasil: {"c":null,"d":[null,12],"e":null}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'setTimeout(() => {
  console.log("B");
  Promise.resolve().then(() => console.log("C"));
}, 0);
console.log("E");
(async () => {
  console.log("G");
  await null;
  console.log("A");
})();
setTimeout(() => console.log("D"), 0);','javascript','["B C E G A D","E G A C B D","E G A B C D"]'::jsonb,null,2,'Urutan nyata: E G A B C D. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src ''self'' ''nonce-r4nd''

A. <script>inisiasi()</script>
B. <script nonce="r4nd">inisiasi()</script>
C. <script src="/app.js"></script>  <!-- same-origin -->
E. <script src="https://evil.example/x.js"></script>
G. eval("1 + 1")  // di dalam skrip yang diizinkan','http','["A E G","A B E","A C E"]'::jsonb,null,0,'Diblokir: A E G. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','guess','Mengapa kode ini berbahaya jika konten berasal dari pengguna?',null,'<div dangerouslySetInnerHTML={{ __html: komentar }} />','javascript','["Karena memperlambat render pada daftar yang panjang","HTML/skrip sisipan pengguna ikut dieksekusi","Karena React melarang atribut __html di semua versi"]'::jsonb,null,1,'innerHTML menafsirkan markup mentah. Render teks biasa agar di-escape otomatis.',null,'Apakah teks atau markup yang dirender?',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.all([ok("A", 10), bad("B", 15), bad("C", 5)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["err C","ok \"A\"","ok [\"fA\",\"rB\",\"rC\"]"]'::jsonb,null,0,'Promise.all menghasilkan: err C. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','output','Berapa saldo akhir?',null,'-- saldo awal = 330, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 330
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 330
T1: UPDATE akun SET saldo = x + 30 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 40 WHERE id = 1; COMMIT;','sql','["400","370","360"]'::jsonb,null,1,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 330+40, sehingga tambahan 30 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('fullstack','output','Apa output kode ini?',null,'Promise.resolve(8)
  .finally(() => 30)
  .then((v) => console.log("v", v));','javascript','["v 9","undefined","v 8"]'::jsonb,null,2,'Dijalankan: v 8.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','output','Berapa p50 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [645,714,778,363,816,198,146,403,540,446,392,274,457]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["457","475","446"]'::jsonb,null,2,'N=13, rank=⌈50/100×13⌉=7 → 446 ms. Rata-rata (475) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("http://api.toko.id/pesanan", {
  method: "GET",
  headers: { "Content-Type": "application/json" },
  credentials: "include",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: https://app.toko.id
Access-Control-Allow-Methods: PATCH, DELETE, GET
Access-Control-Allow-Headers: content-type','javascript','["Browser mengirim preflight OPTIONS dulu, lalu request asli berhasil","Request langsung dikirim (tanpa preflight) dan respons boleh dibaca JavaScript","Preflight gagal: request asli tidak pernah dikirim"]'::jsonb,null,2,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
luar.addEventListener("click", () => log("A"), true);
tombol.addEventListener("click", () => log("B"));
luar.addEventListener("click", () => log("C"));
luar.addEventListener("click", () => log("D"), true);
tengah.addEventListener("click", () => log("E"));
tengah.addEventListener("click", () => log("F"), true);','javascript','["A B C D E F","B E F A C D","A D F B E C"]'::jsonb,null,2,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: A D F B E C.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','guess','Dari daftar ini, nomor mana yang BUKAN bundler/build tool?',null,'1. esbuild
2. Vite
3. Rollup
4. Eloquent
5. SOAP','text','["2 dan 4 dan 5","1 dan 3 dan 5","4 dan 5"]'::jsonb,null,2,'Eloquent dan SOAP termasuk kategori lain; esbuild, Vite, Rollup adalah bundler/build tool.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(8);
  function klik() {
    setN(n + 5);
    setN(n + 4);
    setN((p) => p * 2);
    setN(n + 3);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["11","37","20"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=8 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 8 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 11.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^3.3.4" }
// versi yang tersedia di registry:
3.3.4  3.3.5  3.4.4  3.4.5  3.4.6  4.3.4  4.3.6  4.4.4','json','["3.4.6","3.3.5","4.4.4"]'::jsonb,null,0,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 3.4.6.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 60 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1760003600, nbf: 1759999980, iss: "auth.toko.id", aud: "api.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: issuer tidak sesuai","Diterima","Ditolak: token kedaluwarsa (exp)"]'::jsonb,null,1,'Cek berurutan: Diterima. exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 120 detik yang lalu
Cache-Control: private, max-age=3600, stale-while-revalidate=600
ETag: "v7"
# resource di server TIDAK berubah; permintaan ulang oleh CDN (shared cache)','http','["Request kondisional; server membalas 304 tanpa body","Dilayani dari cache tanpa request ke jaringan","Unduh penuh (200) dari server"]'::jsonb,null,2,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, umur, kota);

SELECT * FROM orang
WHERE umur = ''x'' AND kota > 30 AND negara = ''x'';','sql','["3","4","2"]'::jsonb,null,0,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 3.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 592 → tiba t=592
"ko": kirim t=127, latensi 400 → tiba t=527
"kop": kirim t=205, latensi 224 → tiba t=429

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"kop\" — respons yang tiba paling awal","\"k\" — respons yang tiba paling akhir","\"kop\" — query yang diketik paling akhir"]'::jsonb,null,1,'Urutan tiba: "kop" → "ko" → "k". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 700px) 40vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 360px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-480.jpg","foto-1024.jpg","foto-800.jpg"]'::jsonb,null,2,'Slot = 90vw × 360 = 324px CSS; × DPR 2 = 648px fisik → kandidat terkecil yang ≥ itu: 800w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 5 item
halaman 1 → [100, 99, 98, 97, 96]
# lalu 3 item baru (id 101…103) ditambahkan sebelum halaman 2 diminta
GET /item?limit=5&offset=5','text','["[98, 97, 96, 95, 94]","[95, 94, 93, 92, 91]","[97, 96, 95, 94, 93]"]'::jsonb,null,0,'Offset menghitung dari posisi, bukan dari item terakhir yang dilihat: item baru menggeser daftar sehingga item akhir halaman 1 muncul lagi (duplikat).',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','guess','Apakah cookie ini ikut terkirim pada permintaan tersebut?',null,'# dari halaman https://shop.toko.id/keranjang
Set-Cookie: id=7; Domain=toko.id; Path=/akun

# permintaan berikutnya ke:
https://shop.toko.id/akun/pengaturan','http','["Tidak","Ya","Tergantung SameSite saja"]'::jsonb,null,1,'Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (/). Path cocok pada batas ''/''. Secure butuh https. Hasil: terkirim.',null,'Cek berurutan: host, path (aturan batas ''/''), skema.',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 20) (2, A, 50) (3, A, 40) (4, A, 30) (5, B, 40) (6, A, 20) (7, B, 10)

SELECT id, RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,4 | 2,1 | 3,2 | 4,3 | 5,1 | 6,4 | 7,2","1,4 | 2,1 | 3,2 | 4,3 | 7,1 | 6,4 | 7,2","1,4 | 2,1 | 3,2 | 4,3 | 5,1 | 6,5 | 7,2"]'::jsonb,null,0,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,4 | 2,1 | 3,2 | 4,3 | 5,1 | 6,4 | 7,2.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 4 f.txt menjadi "fitur"
main: mengubah baris 6 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','output','Berapa query SQL yang dijalankan (20 post, 4 penulis berbeda)?',null,'posts = Post.objects.prefetch_related("penulis")[:20]
for p in posts:
    print(p.penulis.nama)','python','["1","21","2"]'::jsonb,null,2,'prefetch_related memakai query kedua dengan WHERE id IN (...): total 2 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','output','Apa output kode ini?',null,'const s = new URLSearchParams("a=3&b=2");
s.append("a", "x y");
s.delete("b");
s.set("c", "&");
console.log(s.toString(), s.getAll("a").length);','javascript','["a=3&a=x+y&c=%24 2","a=3&a=x+y&c=%25 2","a=3&a=x+y&c=%26 2"]'::jsonb,null,2,'Hasil: a=3&a=x+y&c=%26 2. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
luar.addEventListener("click", () => log("A"));
luar.addEventListener("click", () => log("B"), true);
luar.addEventListener("click", () => log("C"), true);
tombol.addEventListener("click", (e) => { log("D"); e.stopPropagation(); });
luar.addEventListener("click", () => log("E"));
tengah.addEventListener("click", () => log("F"), true);','javascript','["B C F D","D","B C D F"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: B C F D.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','guess','Apakah cookie ini ikut terkirim pada permintaan tersebut?',null,'# dari halaman https://shop.toko.id/keranjang
Set-Cookie: id=7; Domain=toko.id; Path=/akun; Secure

# permintaan berikutnya ke:
https://shop.toko.id/akun/pengaturan','http','["Ya","Tergantung SameSite saja","Tidak"]'::jsonb,null,0,'Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (/). Path cocok pada batas ''/''. Secure butuh https. Hasil: terkirim.',null,'Cek berurutan: host, path (aturan batas ''/''), skema.',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^0.0.3" }
// versi yang tersedia di registry:
0.0.3  0.0.4  0.0.6  0.1.3  0.2.0  0.2.3  0.2.4  1.0.6','json','["0.0.6","1.0.6","0.0.3"]'::jsonb,null,2,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 0.0.3.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("https://api.toko.id/pesanan", {
  method: "GET",
  headers: { "Content-Type": "application/json" },
  credentials: "include",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: *
Access-Control-Allow-Methods: DELETE, GET, PUT
Access-Control-Allow-Headers: content-type, authorization','javascript','["Preflight gagal: request asli tidak pernah dikirim","Same-origin: CORS tidak berlaku, request berhasil","Browser mengirim preflight OPTIONS dulu, lalu request asli berhasil"]'::jsonb,null,0,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','output','Apa output kode ini?',null,'console.log(new URL("../a/x.png?v=1#top", "https://app.kampus.ac.id/img/produk/h.html").href);','javascript','["https://app.kampus.ac.id/img/a/x.png?v=3#top","https://app.kampus.ac.id/img/a/x.png?v=-1#top","https://app.kampus.ac.id/img/a/x.png?v=1#top"]'::jsonb,null,2,'Hasil: https://app.kampus.ac.id/img/a/x.png?v=1#top. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','output','Apa output kode ini?',null,'function f() {
  try { throw new Error("x"); } catch { return "c1"; } finally { return "f51"; }
}
console.log(f());','javascript','["f52","undefined","f51"]'::jsonb,null,2,'Dijalankan: f51.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','guess','Skenario: notifikasi satu arah dari server ke browser lewat HTTP biasa, perlu auto-reconnect bawaan. Pilihan paling sederhana?',null,'const es = new EventSource("/stream");','javascript','["Polling setiap 100 ms","Server-Sent Events (SSE)","WebSocket dua arah dengan protokol sendiri"]'::jsonb,null,1,'SSE: aliran satu arah server→klien di atas HTTP dengan reconnect otomatis dan Last-Event-ID.',null,'Satu arah atau dua arah?',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 50) (2, B, 40) (3, A, 20) (4, A, 40) (5, A, 20) (6, A, 10) (7, B, 40)

SELECT id, RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,1 | 2,1 | 3,3 | 4,2 | 5,4 | 6,5 | 7,2","1,1 | 2,1 | 3,3 | 4,2 | 5,3 | 6,4 | 7,1","1,1 | 2,1 | 3,3 | 4,2 | 5,3 | 6,5 | 7,1"]'::jsonb,null,2,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,1 | 2,1 | 3,3 | 4,2 | 5,3 | 6,5 | 7,1.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 6 item
halaman 1 → [100, 99, 98, 97, 96, 95]
# lalu 3 item baru (id 101…103) ditambahkan sebelum halaman 2 diminta
GET /item?limit=6&offset=6','text','["[94, 93, 92, 91, 90, 89]","[96, 95, 94, 93, 92, 91]","[97, 96, 95, 94, 93, 92]"]'::jsonb,null,2,'Offset menghitung dari posisi, bukan dari item terakhir yang dilihat: item baru menggeser daftar sehingga item akhir halaman 1 muncul lagi (duplikat).',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 16; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. A: tmpA = counter
3. A: counter = tmpA + 1
4. B: counter = tmpB + 1
5. B: tmpB = counter
6. B: counter = tmpB + 1
7. A: tmpA = counter
8. A: counter = tmpA + 1','python','["20","18","19"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 19, bukan 20. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 9 f.txt menjadi "fitur"
main: mengubah baris 5 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','output','Apa output kode ini?',null,'const o = { n: 23, toJSON() { return { v: this.n * 2 }; } };
console.log(JSON.stringify({ o, a: [o] }));','javascript','["{\"o\":{\"v\":47},\"a\":[{\"v\":46}]}","{\"o\":{\"v\":46},\"a\":[{\"v\":46}]}","{''o'':{''v'':46},''a'':[{''v'':46}]}"]'::jsonb,null,1,'Hasil: {"o":{"v":46},"a":[{"v":46}]}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(8);
  function klik() {
    setN(n + 3);
    setN((p) => p + 5);
    setN(n + 5);
    setN((p) => p * 2);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["13","26","42"]'::jsonb,null,1,'Antrean update diproses berurutan mulai dari n=8 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 8 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 26.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','guess','Manakah kombinasi nomor yang SEMUANYA merupakan pustaka/framework UI?',null,'1. Svelte
2. GraphQL
3. Redis
4. SolidJS
5. Preact','text','["1, 4, 5","2, 4, 5","1, 3, 5"]'::jsonb,null,0,'SolidJS, Preact, Svelte adalah pustaka/framework UI; Redis dan GraphQL termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 600 detik yang lalu
Cache-Control: max-age=300
ETag: "v7"
# resource di server TIDAK berubah; permintaan ulang oleh CDN (shared cache)','http','["Unduh penuh (200) dari server","Dilayani dari cache tanpa request ke jaringan","Request kondisional"]'::jsonb,null,2,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_A → LOCK tabel_C → LOCK tabel_B → COMMIT
T2: LOCK tabel_B → LOCK tabel_A → LOCK tabel_C → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_C → tabel_B → tabel_A","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten"]'::jsonb,null,1,'Graf urutan kunci memuat siklus tabel_A → tabel_C → tabel_B → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, kota, umur);

SELECT * FROM orang
WHERE kota > 30 AND umur = ''x'' AND negara > 30;','sql','["3","2","1"]'::jsonb,null,2,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','output','Berapa query SQL yang dijalankan (200 post, 6 penulis berbeda)?',null,'posts = Post.objects.all()[:200]
for p in posts:
    print(p.penulis.nama)        # relasi ForeignKey, lazy','python','["1","201","2"]'::jsonb,null,1,'Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.any([bad("A", 5), ok("B", 10), ok("C", 15)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["err A","ok [\"rA\",\"fB\",\"fC\"]","ok \"B\""]'::jsonb,null,2,'Promise.any menghasilkan: ok "B". all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Fajar, Medan) (2, Citra, NULL) (3, Eka, Padang) (4, Ayu, Bandung) (5, Hana, NULL)
-- pesanan(id, pelanggan_id, total, status)
(1, 1, 80, lunas) (2, 1, 80, lunas) (3, 4, 30, lunas) (4, 1, 70, lunas) (5, 2, 50, lunas) (6, 4, 20, lunas) (7, 3, 20, lunas) (8, 3, 50, batal) (9, 4, 60, baru)

SELECT kota, COUNT(*) AS n FROM pelanggan
GROUP BY kota
HAVING COUNT(*) >= 1
ORDER BY n DESC, kota;','sql','["NULL,2","Bandung,1 | Medan,1 | Padang,1","NULL,2 | Bandung,1 | Medan,1 | Padang,1"]'::jsonb,null,2,'GROUP BY menganggap semua NULL sebagai satu grup; COUNT(*) menghitungnya, COUNT(kota) tidak. Hasil: NULL,2 | Bandung,1 | Medan,1 | Padang,1.',null,'Apakah NULL membentuk grup sendiri?',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 700 → tiba t=700
"ko": kirim t=139, latensi 247 → tiba t=386
"kop": kirim t=245, latensi 220 → tiba t=465

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"kop\" — respons yang tiba paling awal","\"kop\" — query yang diketik paling akhir","\"k\" — respons yang tiba paling akhir"]'::jsonb,null,2,'Urutan tiba: "ko" → "kop" → "k". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','guess','Hubungan kedua URL ini?',null,'halaman : https://ayu.github.io
permintaan: https://budi.github.io','text','["same-origin (dan same-site)","cross-origin dan cross-site","cross-origin tetapi same-site"]'::jsonb,null,1,'Origin = skema+host+port; site = eTLD+1 (+ skema). ayu.github.io → ayu.github.io, budi.github.io → budi.github.io. github.io dan vercel.app ada di Public Suffix List, jadi subdomainnya berbeda site.',null,'Public Suffix List menentukan batas site.',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 700px) 60vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1366px, device pixel ratio 1; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1280.jpg","foto-1024.jpg","foto-1600.jpg"]'::jsonb,null,1,'Slot = 60vw × 1366 = 820px CSS; × DPR 1 = 820px fisik → kandidat terkecil yang ≥ itu: 1024w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 60 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1759999955, nbf: 1759996400, iss: "auth.lain.id", aud: "web.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: belum berlaku (nbf)","Ditolak: issuer tidak sesuai","Ditolak: token kedaluwarsa (exp)"]'::jsonb,null,1,'Cek berurutan: Ditolak: issuer tidak sesuai. exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'queueMicrotask(() => console.log("G"));
setTimeout(() => console.log("C"), 0);
setTimeout(() => {
  console.log("D");
  Promise.resolve().then(() => console.log("B"));
}, 0);
(async () => {
  console.log("H");
  await null;
  console.log("undefined");
})();
queueMicrotask(() => console.log("undefined"));','javascript','["H G undefined undefined C B D","G C D B H","H G undefined undefined C D B"]'::jsonb,null,2,'Urutan nyata: H G undefined undefined C D B. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
class A {
  n = 95;
  h = () => this.n;
  m() { return this.n; }
}
const { h, m } = new A();
try { console.log(h(), m()); } catch (e) { console.log(h(), e.name); }','javascript','["95 undefined","269","95 TypeError"]'::jsonb,null,2,'h adalah arrow field yang terikat ke instance; m hasil destructuring kehilangan receiver sehingga this undefined → TypeError.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','output','Berapa p95 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [78,524,385,268,701,216,76,208,51,870,235]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["701","870","328"]'::jsonb,null,1,'N=11, rank=⌈95/100×11⌉=11 → 870 ms. Rata-rata (328) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','output','Berapa saldo akhir?',null,'-- saldo awal = 660, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 660
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 660
T1: UPDATE akun SET saldo = x + 90 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 60 WHERE id = 1; COMMIT;','sql','["750","810","720"]'::jsonb,null,2,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 660+60, sehingga tambahan 90 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src ''nonce-r4nd'' https://cdn.toko.id ''unsafe-eval''

A. <script>inisiasi()</script>
C. <script src="/app.js"></script>  <!-- same-origin -->
E. <script src="https://evil.example/x.js"></script>
F. <button onclick="kirim()">OK</button>
G. eval("1 + 1")  // di dalam skrip yang diizinkan','http','["A C F G","A C E F","C E F G"]'::jsonb,null,1,'Diblokir: A C E F. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, kota, umur);

SELECT * FROM orang
WHERE kota = ''x'' AND umur > 30;','sql','["0","1","2"]'::jsonb,null,0,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 0.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(8);
  function klik() {
    setN((p) => p * 2);
    setN(n + 5);
    setN(n + 5);
    setN((p) => p + 1);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["27","14","13"]'::jsonb,null,1,'Antrean update diproses berurutan mulai dari n=8 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 8 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 14.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 122 → tiba t=122
"ko": kirim t=140, latensi 607 → tiba t=747
"kop": kirim t=188, latensi 502 → tiba t=690

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"kop\" — query yang diketik paling akhir","\"k\" — respons yang tiba paling awal","\"ko\" — respons yang tiba paling akhir"]'::jsonb,null,2,'Urutan tiba: "k" → "kop" → "ko". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Ayu, Padang) (2, Fajar, NULL) (3, Gita, Bandung) (4, Eka, NULL) (5, Budi, Medan)
-- pesanan(id, pelanggan_id, total, status)
(1, 4, 60, baru) (2, 4, 70, batal) (3, 4, 20, baru) (4, 4, 80, baru) (5, 4, 60, lunas) (6, 2, 90, lunas) (7, 1, 40, batal) (8, 4, 20, batal)

SELECT COUNT(*) FROM (
  SELECT kota FROM pelanggan
  UNION ALL
  SELECT kota FROM pelanggan WHERE kota IS NOT NULL
) x
WHERE kota IS NULL OR kota <> ''Padang'';','sql','["3","4","6"]'::jsonb,null,2,'UNION ALL mempertahankan duplikat, UNION menghapusnya; kota <> ''Padang'' bernilai UNKNOWN untuk NULL sehingga perlu IS NULL eksplisit. Hasil: 6.',null,'UNION vs UNION ALL; perbandingan dengan NULL tidak pernah true.',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.allSettled([bad("A", 5), bad("B", 10), bad("C", 15)])
  .then((r) => console.log("ok", JSON.stringify(r.map((x) => x.status[0] + (x.value ?? x.reason.message)))))
  .catch((e) => console.log("err", e.message));','javascript','["err A","ok [\"rA\",\"rB\",\"rC\"]","err All promises were rejected"]'::jsonb,null,1,'Promise.allSettled menghasilkan: ok ["rA","rB","rC"]. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','output','Berapa saldo akhir?',null,'-- saldo awal = 600, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 600
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 600
T1: UPDATE akun SET saldo = x + 90 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 20 WHERE id = 1; COMMIT;','sql','["690","620","710"]'::jsonb,null,1,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 600+20, sehingga tambahan 90 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
class A {
  n = 97;
  h = () => this.n;
  m() { return this.n; }
}
const { h, m } = new A();
try { console.log(h(), m()); } catch (e) { console.log(h(), e.name); }','javascript','["97 undefined","97 TypeError","169"]'::jsonb,null,1,'h adalah arrow field yang terikat ke instance; m hasil destructuring kehilangan receiver sehingga this undefined → TypeError.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 0 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1760003600, nbf: 1759999980, iss: "auth.lain.id", aud: "web.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: tanda tangan tidak valid","Ditolak: issuer tidak sesuai","Ditolak: audience tidak sesuai"]'::jsonb,null,1,'Cek berurutan: Ditolak: issuer tidak sesuai. exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'(async () => {
  console.log("B");
  await null;
  console.log("E");
})();
Promise.resolve().then(() => {
  console.log("G");
  queueMicrotask(() => console.log("H"));
});
setTimeout(() => {
  console.log("A");
  Promise.resolve().then(() => console.log("D"));
}, 0);
console.log("undefined");','javascript','["B undefined E G H A D","B undefined E G H D A","B E G H A D"]'::jsonb,null,0,'Urutan nyata: B undefined E G H A D. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tengah.addEventListener("click", () => log("A"));
luar.addEventListener("click", () => log("B"), true);
luar.addEventListener("click", () => log("C"), true);
luar.addEventListener("click", () => log("D"), true);
luar.addEventListener("click", () => log("E"), true);
tombol.addEventListener("click", () => log("F"), true);','javascript','["F A B C D E","A B C D E F","B C D E F A"]'::jsonb,null,2,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: B C D E F A.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','output','Apa output kode ini?',null,'Promise.resolve(7)
  .then((v) => { throw new Error("e" + v); })
  .then(() => console.log("A"))
  .catch((e) => e.message)
  .then((m) => console.log("B", m));','javascript','["B e8","B e7","undefined"]'::jsonb,null,1,'Dijalankan: B e7.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 5; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. A: counter = tmpA + 1
4. B: counter = tmpB + 1
5. B: tmpB = counter
6. A: tmpA = counter
7. A: counter = tmpA + 1
8. B: counter = tmpB + 1','python','["8","7","9"]'::jsonb,null,1,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 7, bukan 9. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 3600 detik yang lalu
Cache-Control: no-cache, max-age=60, s-maxage=3600
(tanpa ETag/Last-Modified)
# resource di server TIDAK berubah; permintaan ulang oleh browser (private cache), navigasi biasa','http','["Unduh penuh (200) dari server","Request kondisional; server membalas 304 tanpa body","Dilayani dari cache tanpa request ke jaringan"]'::jsonb,null,0,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src ''unsafe-eval'' ''unsafe-inline''

A. <script>inisiasi()</script>
B. <script nonce="r4nd">inisiasi()</script>
C. <script src="/app.js"></script>  <!-- same-origin -->
E. <script src="https://evil.example/x.js"></script>
F. <button onclick="kirim()">OK</button>','http','["B C E","A B C","A B E"]'::jsonb,null,0,'Diblokir: B C E. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_B → LOCK tabel_C → COMMIT
T2: LOCK tabel_A → LOCK tabel_B → COMMIT
T3: LOCK tabel_B → LOCK tabel_C → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan"]'::jsonb,null,1,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('fullstack','guess','Manakah kombinasi nomor yang SEMUANYA merupakan message broker/antrean?',null,'1. Angular
2. ActiveMQ
3. NATS
4. Parcel
5. RabbitMQ','text','["3, 4, 5","2, 3, 5","1, 2, 4"]'::jsonb,null,1,'ActiveMQ, NATS, RabbitMQ adalah message broker/antrean; Angular dan Parcel termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 6 item
halaman 1 → [100, 99, 98, 97, 96, 95]
# lalu 1 item teratas dihapus sebelum halaman 2 diminta
GET /item?limit=6&sebelum_id=95','text','["[92, 91, 90, 89, 88, 87]","[93, 92, 91, 90, 89, 88]","[94, 93, 92, 91, 90, 89]"]'::jsonb,null,2,'Cursor memakai id terakhir yang sudah dilihat sehingga hasil stabil terhadap sisipan/hapus di depan: [94, 93, 92, 91, 90, 89].',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 1024px) 50vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1024px, device pixel ratio 1; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1024.jpg","foto-640.jpg","foto-800.jpg"]'::jsonb,null,1,'Slot = 50vw × 1024 = 512px CSS; × DPR 1 = 512px fisik → kandidat terkecil yang ≥ itu: 640w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','guess','Bisakah JavaScript di halaman penyetel membaca cookie ini lewat document.cookie?',null,'Set-Cookie: id=7; Secure; HttpOnly
// dari halaman https://shop.toko.id/keranjang','http','["Ya, bisa dibaca","Tidak: HttpOnly menyembunyikannya dari JavaScript","Hanya jika SameSite=None"]'::jsonb,null,1,'HttpOnly melarang akses skrip (membatasi dampak XSS) tetapi cookie tetap terkirim ke server.',null,'Atribut mana yang mengatur akses dari JavaScript?',null),
('fullstack','output','Berapa p99 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [583,516,383,475,453,874,150,72,679,650,535,101,500,735]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["874","479","735"]'::jsonb,null,0,'N=14, rank=⌈99/100×14⌉=14 → 874 ms. Rata-rata (479) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("https://api.toko.id/pesanan", {
  method: "DELETE",
  headers: { "Authorization": "Bearer abc" },
  credentials: "omit",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: https://app.toko.id
Access-Control-Allow-Credentials: true
Access-Control-Allow-Methods: POST, PATCH, DELETE
Access-Control-Allow-Headers: authorization, x-token, content-type','javascript','["Request langsung dikirim (tanpa preflight) dan respons boleh dibaca JavaScript","Preflight gagal: request asli tidak pernah dikirim","Browser mengirim preflight OPTIONS dulu, lalu request asli berhasil"]'::jsonb,null,2,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~1.0.1" }
// versi yang tersedia di registry:
1.0.1  1.1.0  1.1.1  1.2.2  2.0.1  2.1.2  2.2.1','json','["1.2.2","2.2.1","1.0.1"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 1.0.1.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(JSON.stringify(JSON.parse(''{"a":31,"b":[1,2],"c":{"d":null}}'', (k, v) => (typeof v === "number" ? v + 1 : v))));','javascript','["{''a'':32,''b'':[2,3],''c'':{''d'':null}}","{\"a\":32,\"b\":[2,3],\"c\":{\"d\":null}}","{\"a\":33,\"b\":[2,3],\"c\":{\"d\":undefined}}"]'::jsonb,null,1,'Hasil: {"a":32,"b":[2,3],"c":{"d":null}}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','guess','Hubungan kedua URL ini?',null,'halaman : https://kampus.ac.id
permintaan: https://lab.kampus.ac.id','text','["cross-origin dan cross-site","same-origin (dan same-site)","cross-origin tetapi same-site"]'::jsonb,null,2,'Origin = skema+host+port; site = eTLD+1 (+ skema). kampus.ac.id → kampus.ac.id, lab.kampus.ac.id → kampus.ac.id. github.io dan vercel.app ada di Public Suffix List, jadi subdomainnya berbeda site.',null,'Public Suffix List menentukan batas site.',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 30) (2, B, 30) (3, A, 10) (4, B, 50) (5, B, 20) (6, A, 30) (7, A, 50) (8, B, 10)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,0 | 2,20 | 3,20 | 4,-30 | 5,-10 | 6,20 | 7,0 | 8,0","1,0 | 2,0 | 3,0 | 4,20 | 5,-30 | 6,20 | 7,20 | 8,-10","1,0 | 2,0 | 3,-20 | 4,40 | 5,-30 | 6,10 | 7,20 | 8,-40"]'::jsonb,null,1,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,0 | 3,0 | 4,20 | 5,-30 | 6,20 | 7,20 | 8,-10.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','output','Apa output kode ini?',null,'const s = new URLSearchParams("a=4&b=2");
s.append("a", "x y");
s.delete("b");
s.set("c", "&");
console.log(s.toString(), s.getAll("a").length);','javascript','["a=4&a=x+y&c=%28 2","a=2&a=x+y&c=%26 2","a=4&a=x+y&c=%26 2"]'::jsonb,null,2,'Hasil: a=4&a=x+y&c=%26 2. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','guess','Harga disimpan sebagai float dan total terkadang 0.30000000000000004. Perbaikan yang tepat?',null,'const total = 0.1 + 0.2;','javascript','["Pakai double precision lebih besar","Simpan dan hitung dalam satuan bulat terkecil","Selalu panggil toFixed(2) di setiap perhitungan"]'::jsonb,null,1,'Floating point biner tak merepresentasikan sebagian desimal secara tepat. Uang butuh integer/DECIMAL.',null,'Apakah 0.1 bisa persis di biner?',null),
('fullstack','output','Berapa query SQL yang dijalankan (100 post, 8 penulis berbeda)?',null,'posts = Post.objects.all()[:100]
for p in posts:
    print(p.penulis.nama)        # relasi ForeignKey, lazy','python','["1","101","2"]'::jsonb,null,1,'Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 3 f.txt menjadi "fitur"
main: mengubah baris 1 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 0 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1759999955, nbf: 1760000010, iss: "auth.toko.id", aud: "web.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: token kedaluwarsa (exp)","Ditolak: audience tidak sesuai","Ditolak: belum berlaku (nbf)"]'::jsonb,null,0,'Cek berurutan: Ditolak: token kedaluwarsa (exp). exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','guess','Apakah cookie ini ikut dikirim pada permintaan ke toko.id:8443?',null,'halaman        : https://toko.id
pengguna mengeklik tautan (navigasi top-level GET)
tujuan         : https://toko.id:8443
Set-Cookie     : sid=1; SameSite=None; Secure; Domain milik tujuan','text','["Ya, cookie dikirim","Hanya dikirim jika memakai HTTP/2","Tidak, cookie tidak dikirim"]'::jsonb,null,0,'Hubungan: cross-origin tetapi same-site. Pada konteks same-site cookie selalu dikirim; pada cross-site: Strict tidak pernah, Lax hanya untuk navigasi top-level dengan metode aman (GET), None dikirim (wajib Secure).',null,'Apakah ini same-site? Jika bukan, cek nilai SameSite dan jenis permintaan.',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Dedi, NULL) (2, Fajar, Padang) (3, Ayu, Medan) (4, Citra, Medan) (5, Budi, Bandung) (6, Eka, NULL)
-- pesanan(id, pelanggan_id, total, status)
(1, 4, 60, lunas) (2, 1, 20, batal) (3, 2, 20, lunas) (4, NULL, 60, baru) (5, 4, 50, lunas) (6, 4, 80, lunas) (7, 3, 60, lunas)

SELECT COUNT(*), COUNT(o.id), COUNT(DISTINCT p.id)
FROM pelanggan p LEFT JOIN pesanan o ON o.pelanggan_id = p.id;','sql','["6,8,6","8,8,6","8,6,6"]'::jsonb,null,2,'COUNT(*) menghitung semua baris hasil join (satu pelanggan tampil sebanyak pesanannya, atau sekali bila tak punya), COUNT(kolom) melewati NULL, COUNT(DISTINCT) menghilangkan duplikat. Hasil: 8,6,6.',null,'Mana yang melewati NULL?',null),
('fullstack','output','Berapa query SQL yang dijalankan (20 post, 8 penulis berbeda)?',null,'posts = Post.objects.prefetch_related("penulis")[:20]
for p in posts:
    print(p.penulis.nama)','python','["2","1","21"]'::jsonb,null,0,'prefetch_related memakai query kedua dengan WHERE id IN (...): total 2 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src ''unsafe-eval'' ''self''

A. <script>inisiasi()</script>
B. <script nonce="r4nd">inisiasi()</script>
C. <script src="/app.js"></script>  <!-- same-origin -->
E. <script src="https://evil.example/x.js"></script>
F. <button onclick="kirim()">OK</button>','http','["A B E F","A C E F","A B C E"]'::jsonb,null,0,'Diblokir: A B E F. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 2; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. A: tmpA = counter
3. B: counter = tmpB + 1
4. B: tmpB = counter
5. B: counter = tmpB + 1
6. A: counter = tmpA + 1
7. A: tmpA = counter
8. A: counter = tmpA + 1','python','["4","5","6"]'::jsonb,null,0,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 4, bukan 6. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(8);
  function klik() {
    setN((p) => p * 2);
    setN(n + 1);
    setN(n + 4);
    setN(n + 3);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["11","24","16"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=8 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 8 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 11.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 4 item
halaman 1 → [100, 99, 98, 97]
# lalu 2 item teratas dihapus sebelum halaman 2 diminta
GET /item?limit=4&sebelum_id=97','text','["[94, 93, 92, 91]","[96, 95, 94, 93]","[93, 92, 91, 90]"]'::jsonb,null,1,'Cursor memakai id terakhir yang sudah dilihat sehingga hasil stabil terhadap sisipan/hapus di depan: [96, 95, 94, 93].',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(new URL("../b/x.png?v=6#top", "https://api.toko.id/img/d/h.html").href);','javascript','["https://api.toko.id/img/b/x.png?v=6#top","https://api.toko.id/img/b/x.png?v=16#top","https://api.toko.id/img/b/x.png?v=7#top"]'::jsonb,null,0,'Hasil: https://api.toko.id/img/b/x.png?v=6#top. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 3 f.txt menjadi "fitur"
main: mengubah baris 4 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 272 → tiba t=272
"ko": kirim t=132, latensi 609 → tiba t=741
"kop": kirim t=256, latensi 132 → tiba t=388

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"kop\" — query yang diketik paling akhir","\"ko\" — respons yang tiba paling akhir","\"kop\" — respons yang tiba paling awal"]'::jsonb,null,1,'Urutan tiba: "k" → "kop" → "ko". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
luar.addEventListener("click", () => log("A"));
tengah.addEventListener("click", () => log("B"), true);
tombol.addEventListener("click", () => log("C"));
luar.addEventListener("click", () => log("D"));
tengah.addEventListener("click", () => log("E"));
luar.addEventListener("click", () => log("F"), true);','javascript','["A B C D E F","C B E A D F","F B C E A D"]'::jsonb,null,2,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: F B C E A D.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(JSON.stringify({ a: undefined, b: () => 1, c: NaN, d: [undefined, 8], e: null }));','javascript','["{''c'':null,''d'':[null,8],''e'':null}","{\"c\":undefined,\"d\":[null,9],\"e\":null}","{\"c\":null,\"d\":[null,8],\"e\":null}"]'::jsonb,null,2,'Hasil: {"c":null,"d":[null,8],"e":null}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
function buat() {
  return { n: 26, get: () => this.n };
}
const o = buat.call({ n: 100 });
console.log(o.get(), o.n);','javascript','["26 undefined","26 TypeError","100 26"]'::jsonb,null,2,'Arrow memakai this dari fungsi pembungkusnya (buat), yaitu objek yang di-call; bukan objek literal yang dikembalikan. o.n tetap nilai propertinya sendiri.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','guess','Manakah kombinasi nomor yang SEMUANYA merupakan bundler/build tool?',null,'1. esbuild
2. Remix
3. Memcached
4. Rollup
5. Webpack','text','["1, 4, 5","2, 3, 4","1, 2, 5"]'::jsonb,null,0,'Webpack, esbuild, Rollup adalah bundler/build tool; Memcached dan Remix termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 30) (2, B, 10) (3, A, 40) (4, A, 20) (5, B, 20) (6, A, 20)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,0 | 2,-20 | 3,30 | 4,-20 | 5,0 | 6,0","1,0 | 2,-20 | 3,0 | 4,-20 | 5,10 | 6,0","1,-20 | 2,10 | 3,-20 | 4,0 | 5,0 | 6,0"]'::jsonb,null,1,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,-20 | 3,0 | 4,-20 | 5,10 | 6,0.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','guess','Praktik terbaik menyimpan dan mengirim waktu antara server dan klien?',null,'{ "dibuat": "???" }','json','["UTC dalam ISO 8601 dengan penanda zona","String waktu lokal server tanpa zona","Epoch dalam milidetik zona WIB saja"]'::jsonb,null,0,'Waktu tanpa zona ambigu dan rusak saat DST/pindah server. Simpan UTC, format di tepi.',null,'Zona waktu siapa yang jadi acuan penyimpanan?',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("https://api.toko.id/pesanan", {
  method: "POST",
  headers: { "Accept": "application/json" },
  credentials: "include",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: https://app.toko.id
Access-Control-Allow-Methods: GET, PUT, PATCH
Access-Control-Allow-Headers: x-token','javascript','["Request langsung dikirim (tanpa preflight) dan respons boleh dibaca JavaScript","Request asli TERKIRIM ke server, tetapi respons diblokir untuk JavaScript","Same-origin: CORS tidak berlaku, request berhasil"]'::jsonb,null,1,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (kota, negara, umur);

SELECT * FROM orang
WHERE kota = ''x'' AND negara > 30 AND umur > 30;','sql','["1","3","2"]'::jsonb,null,2,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 2.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.any([bad("A", 10), ok("B", 5), ok("C", 15)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["err A","ok \"B\"","ok [\"rA\",\"fB\",\"fC\"]"]'::jsonb,null,1,'Promise.any menghasilkan: ok "B". all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'console.log("E");
Promise.resolve().then(() => console.log("C"));
setTimeout(() => {
  console.log("B");
  Promise.resolve().then(() => console.log("H"));
}, 0);
(async () => {
  console.log("D");
  await null;
  console.log("F");
})();','javascript','["E C D F B H","E D C F B H","E C B H D F"]'::jsonb,null,1,'Urutan nyata: E D C F B H. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 740, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 740
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 740
T1: UPDATE akun SET saldo = x + 60 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 70 WHERE id = 1; COMMIT;','sql','["Menambah indeks pada kolom saldo","Gunakan UPDATE atomik","Mengganti COMMIT menjadi ROLLBACK"]'::jsonb,null,1,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('fullstack','output','Apa output kode ini?',null,'function f() {
  try { throw new Error("x"); } catch { return "c1"; } finally { return "f34"; }
}
console.log(f());','javascript','["f34","undefined","f35"]'::jsonb,null,0,'Dijalankan: f34.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','output','Berapa p95 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [819,851,684,648,591,537,398,739,799,200,893,427,599,194]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["893","599","851"]'::jsonb,null,0,'N=14, rank=⌈95/100×14⌉=14 → 893 ms. Rata-rata (599) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 3600 detik yang lalu
Cache-Control: max-age=600
(tanpa ETag/Last-Modified)
# resource di server TIDAK berubah; permintaan ulang oleh browser (private cache), navigasi biasa','http','["Request kondisional; server membalas 304 tanpa body","Unduh penuh (200) dari server","Dilayani dari cache tanpa request ke jaringan"]'::jsonb,null,1,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_C → LOCK tabel_A → COMMIT
T2: LOCK tabel_B → LOCK tabel_C → COMMIT
T3: LOCK tabel_B → LOCK tabel_A → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan"]'::jsonb,null,1,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('fullstack','guess','Apakah cookie ini ikut terkirim pada permintaan tersebut?',null,'# dari halaman https://shop.toko.id/akun/profil
Set-Cookie: id=7; Domain=toko.id

# permintaan berikutnya ke:
https://toko.id/akun/profil/edit','http','["Tergantung SameSite saja","Ya","Tidak"]'::jsonb,null,1,'Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (/akun). Path cocok pada batas ''/''. Secure butuh https. Hasil: terkirim.',null,'Cek berurutan: host, path (aturan batas ''/''), skema.',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~0.0.2" }
// versi yang tersedia di registry:
0.0.2  0.0.3  0.2.5  1.0.0  1.0.2  1.0.4  1.1.2  1.1.3','json','["1.1.3","0.0.3","0.0.2"]'::jsonb,null,1,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 0.0.3.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 1024px) 60vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1440px, device pixel ratio 1; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1280.jpg","foto-1024.jpg","foto-1600.jpg"]'::jsonb,null,1,'Slot = 60vw × 1440 = 864px CSS; × DPR 1 = 864px fisik → kandidat terkecil yang ≥ itu: 1024w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~3.1.0" }
// versi yang tersedia di registry:
3.1.0  3.1.1  3.1.2  3.2.1  4.2.3  4.3.1','json','["4.3.1","3.2.1","3.1.2"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 3.1.2.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (kota, negara, umur);

SELECT * FROM orang
WHERE kota > 30 AND umur > 30;','sql','["2","1","0"]'::jsonb,null,1,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','guess','Manakah kombinasi nomor yang SEMUANYA merupakan tooling/framework CSS?',null,'1. Bulma
2. PostCSS
3. RabbitMQ
4. Cypress
5. Sass','text','["2, 3, 5","1, 2, 5","1, 4, 5"]'::jsonb,null,1,'Bulma, PostCSS, Sass adalah tooling/framework CSS; RabbitMQ dan Cypress termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(2);
  function klik() {
    setN(20);
    setN(n + 5);
    setN((p) => p * 2);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["50","7","14"]'::jsonb,null,2,'Antrean update diproses berurutan mulai dari n=2 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 2 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 14.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 120 detik yang lalu
Cache-Control: s-maxage=3600
ETag: "v7"
# resource di server TIDAK berubah; permintaan ulang oleh CDN (shared cache)','http','["Request kondisional; server membalas 304 tanpa body","Dilayani dari cache tanpa request ke jaringan","Dilayani dari cache (basi) sekarang, revalidasi di latar belakang"]'::jsonb,null,1,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 8; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. A: tmpA = counter
3. A: counter = tmpA + 1
4. A: tmpA = counter
5. B: counter = tmpB + 1
6. A: counter = tmpA + 1
7. B: tmpB = counter
8. B: counter = tmpB + 1','python','["10","12","11"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 11, bukan 12. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Budi, Medan) (2, Gita, NULL) (3, Citra, Bandung) (4, Fajar, Padang) (5, Ayu, Bandung) (6, Dedi, Medan)
-- pesanan(id, pelanggan_id, total, status)
(1, 2, 50, lunas) (2, NULL, 50, batal) (3, 2, 50, lunas) (4, 2, 70, baru) (5, 5, 70, lunas) (6, 4, 60, baru) (7, 5, 80, lunas) (8, 1, 90, baru)

SELECT kota, COUNT(*) AS n FROM pelanggan
GROUP BY kota
HAVING COUNT(*) >= 1
ORDER BY n DESC, kota;','sql','["Bandung,2 | Medan,2 | Padang,1","Bandung,2 | Medan,2","Bandung,2 | Medan,2 | NULL,1 | Padang,1"]'::jsonb,null,2,'GROUP BY menganggap semua NULL sebagai satu grup; COUNT(*) menghitungnya, COUNT(kota) tidak. Hasil: Bandung,2 | Medan,2 | NULL,1 | Padang,1.',null,'Apakah NULL membentuk grup sendiri?',null),
('fullstack','output','Apa output kode ini?',null,'Promise.resolve(7)
  .finally(() => 84)
  .then((v) => console.log("v", v));','javascript','["v 7","v 8","undefined"]'::jsonb,null,0,'Dijalankan: v 7.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 30 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1760003600, nbf: 1759996400, iss: "auth.toko.id", aud: "web.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: token kedaluwarsa (exp)","Diterima","Ditolak: audience tidak sesuai"]'::jsonb,null,2,'Cek berurutan: Ditolak: audience tidak sesuai. exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','guess','Apakah cookie ini ikut terkirim pada permintaan tersebut?',null,'# dari halaman https://shop.toko.id/keranjang
Set-Cookie: id=7; Domain=toko.id; Secure

# permintaan berikutnya ke:
http://shop.toko.id/akun/pengaturan','http','["Tidak","Ya","Tergantung SameSite saja"]'::jsonb,null,0,'Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (/). Path cocok pada batas ''/''. Secure butuh https. Hasil: tidak terkirim.',null,'Cek berurutan: host, path (aturan batas ''/''), skema.',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tengah.addEventListener("click", (e) => { log("A"); e.stopPropagation(); });
tombol.addEventListener("click", () => log("B"));
luar.addEventListener("click", () => log("C"), true);
tengah.addEventListener("click", () => log("D"));
tombol.addEventListener("click", () => log("E"), true);','javascript','["B E A D","A B C D E","C E B A D"]'::jsonb,null,2,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: C E B A D.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','guess','Halaman HTTPS memuat skrip dari http://cdn.toko.id/lib.js. Apa yang dilakukan browser modern?',null,'<script src="http://cdn.toko.id/lib.js"></script>','html','["Memblokir skrip (mixed content aktif)","Otomatis mengganti ke HTTP/2","Memuatnya dengan peringatan kuning"]'::jsonb,null,0,'Sumber aktif (skrip, iframe) lewat HTTP pada halaman HTTPS diblokir karena dapat dimodifikasi penyerang jaringan.',null,'Skrip adalah konten aktif atau pasif?',null),
('fullstack','guess','Hubungan kedua URL ini?',null,'halaman : https://toko.co.id
permintaan: https://cdn.toko.co.id','text','["cross-origin dan cross-site","same-origin (dan same-site)","cross-origin tetapi same-site"]'::jsonb,null,2,'Origin = skema+host+port; site = eTLD+1 (+ skema). toko.co.id → toko.co.id, cdn.toko.co.id → toko.co.id. github.io dan vercel.app ada di Public Suffix List, jadi subdomainnya berbeda site.',null,'Public Suffix List menentukan batas site.',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 40) (2, B, 30) (3, B, 30) (4, B, 20) (5, B, 40) (6, A, 40) (7, B, 20) (8, B, 50)

SELECT id, SUM(nilai) OVER (ORDER BY id) AS s FROM skor ORDER BY id;','sql','["1,270 | 2,270 | 3,270 | 4,270 | 5,270 | 6,270 | 7,270 | 8,270","1,40 | 2,70 | 3,100 | 4,120 | 5,160 | 6,200 | 7,220 | 8,270","1,40 | 2,30 | 3,60 | 4,80 | 5,120 | 6,80 | 7,140 | 8,190"]'::jsonb,null,1,'SUM() OVER (ORDER BY id) adalah jumlah kumulatif (frame default: awal sampai baris saat ini, termasuk seri pada kunci urut). Hasil: 1,40 | 2,70 | 3,100 | 4,120 | 5,160 | 6,200 | 7,220 | 8,270.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 4 item
halaman 1 → [100, 99, 98, 97]
# lalu 3 item teratas dihapus sebelum halaman 2 diminta
GET /item?limit=4&offset=4','text','["[93, 92, 91, 90]","[92, 91, 90, 89]","[96, 95, 94, 93]"]'::jsonb,null,0,'Offset menghitung dari posisi, bukan dari item terakhir yang dilihat: penghapusan menggeser daftar naik sehingga ada item yang terlewat.',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','output','Berapa p99 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [123,180,487,572,656,459,718,231,877,45,398,776,358,628,253,281,286]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["776","431","877"]'::jsonb,null,2,'N=17, rank=⌈99/100×17⌉=17 → 877 ms. Rata-rata (431) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.race([ok("A", 10), bad("B", 15), bad("C", 5)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["ok \"A\"","ok [\"fA\",\"rB\",\"rC\"]","err C"]'::jsonb,null,2,'Promise.race menghasilkan: err C. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','output','Berapa query SQL yang dijalankan (100 post, 5 penulis berbeda)?',null,'posts = Post.objects.prefetch_related("penulis")[:100]
for p in posts:
    print(p.penulis.nama)','python','["101","2","1"]'::jsonb,null,1,'prefetch_related memakai query kedua dengan WHERE id IN (...): total 2 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','output','Apa output kode ini?',null,'console.log(encodeURIComponent("d &=/é"), encodeURI("https://toko.id/produk x?q=a b&r=é"));','javascript','["d%19%26%3D%2F%C3%A9 https://toko.id/produk%20x?q=a%20b&r=%C3%A9","d%20%26%3D%2F%C3%A10 https://toko.id/produk%20x?q=a%20b&r=%C3%A9","d%20%26%3D%2F%C3%A9 https://toko.id/produk%20x?q=a%20b&r=%C3%A9"]'::jsonb,null,2,'Hasil: d%20%26%3D%2F%C3%A9 https://toko.id/produk%20x?q=a%20b&r=%C3%A9. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 2 f.txt menjadi "fitur"
main: mengubah baris 8 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 700px) 50vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 768px, device pixel ratio 1; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-800.jpg","foto-480.jpg","foto-640.jpg"]'::jsonb,null,1,'Slot = 50vw × 768 = 384px CSS; × DPR 1 = 384px fisik → kandidat terkecil yang ≥ itu: 480w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_A → LOCK tabel_B → LOCK tabel_C → COMMIT
T2: LOCK tabel_C → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mungkin: urutan penguncian membentuk siklus tabel_B → tabel_C → tabel_B","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten"]'::jsonb,null,1,'Graf urutan kunci memuat siklus tabel_B → tabel_C → tabel_B: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'setTimeout(() => {
  console.log("H");
  Promise.resolve().then(() => console.log("A"));
}, 0);
console.log("G");
Promise.resolve().then(() => {
  console.log("F");
  queueMicrotask(() => console.log("E"));
});
Promise.resolve().then(() => {
  console.log("undefined");
  queueMicrotask(() => console.log("undefined"));
});','javascript','["H A G F E","G F undefined E undefined H A","F G undefined E undefined H A"]'::jsonb,null,1,'Urutan nyata: G F undefined E undefined H A. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("https://api.toko.id/pesanan", {
  method: "PUT",
  headers: { "X-Token": "t1" },
  credentials: "omit",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: *
Access-Control-Allow-Methods: GET, DELETE, PATCH
Access-Control-Allow-Headers: x-token, authorization, content-type','javascript','["Same-origin: CORS tidak berlaku, request berhasil","Request langsung dikirim (tanpa preflight) dan respons boleh dibaca JavaScript","Preflight gagal: request asli tidak pernah dikirim"]'::jsonb,null,2,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src ''unsafe-eval'' ''nonce-r4nd'' ''unsafe-inline''

A. <script>inisiasi()</script>
B. <script nonce="r4nd">inisiasi()</script>
C. <script src="/app.js"></script>  <!-- same-origin -->
D. <script src="https://cdn.toko.id/lib.js"></script>
G. eval("1 + 1")  // di dalam skrip yang diizinkan','http','["A C D","A B C","A C G"]'::jsonb,null,0,'Diblokir: A C D. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','output','Apa output kode ini?',null,'console.log(JSON.stringify(JSON.parse(''{"a":16,"b":[1,2],"c":{"d":null}}'', (k, v) => (typeof v === "number" ? v + 1 : v))));','javascript','["{\"a\":18,\"b\":[2,3],\"c\":{\"d\":undefined}}","{''a'':17,''b'':[2,3],''c'':{''d'':null}}","{\"a\":17,\"b\":[2,3],\"c\":{\"d\":null}}"]'::jsonb,null,2,'Hasil: {"a":17,"b":[2,3],"c":{"d":null}}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 599 → tiba t=599
"ko": kirim t=110, latensi 155 → tiba t=265
"kop": kirim t=227, latensi 230 → tiba t=457

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"kop\" — query yang diketik paling akhir","\"k\" — respons yang tiba paling akhir","\"ko\" — respons yang tiba paling awal"]'::jsonb,null,1,'Urutan tiba: "ko" → "kop" → "k". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 150, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 150
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 150
T1: UPDATE akun SET saldo = x + 50 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 10 WHERE id = 1; COMMIT;','sql','["Menambah indeks pada kolom saldo","Mengganti COMMIT menjadi ROLLBACK","Gunakan UPDATE atomik"]'::jsonb,null,2,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
const o = { n: 56, get() { return this.n; } };
const g = o.get;
try { console.log(g()); } catch (e) { console.log(e.name); }','javascript','["ReferenceError","157","TypeError"]'::jsonb,null,2,'g() dipanggil tanpa receiver; di strict mode this = undefined sehingga this.n melempar TypeError.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','output','Apa output kode ini?',null,'function f() {
  try { throw new Error("x"); } catch { return "c8"; } finally { return "f39"; }
}
console.log(f());','javascript','["f39","f40","undefined"]'::jsonb,null,0,'Dijalankan: f39.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(JSON.stringify(JSON.parse(''{"a":18,"b":[1,2],"c":{"d":null}}'', (k, v) => (typeof v === "number" ? v + 1 : v))));','javascript','["{''a'':19,''b'':[2,3],''c'':{''d'':null}}","{\"a\":20,\"b\":[2,3],\"c\":{\"d\":undefined}}","{\"a\":19,\"b\":[2,3],\"c\":{\"d\":null}}"]'::jsonb,null,2,'Hasil: {"a":19,"b":[2,3],"c":{"d":null}}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Dedi, Bandung) (2, Citra, Padang) (3, Fajar, Medan) (4, Hana, Padang) (5, Gita, Medan) (6, Eka, Padang)
-- pesanan(id, pelanggan_id, total, status)
(1, 3, 40, batal) (2, 3, 20, baru) (3, 4, 40, lunas) (4, 1, 90, baru) (5, 2, 70, lunas) (6, 1, 60, lunas) (7, 4, 70, lunas)

SELECT kota, COUNT(*) AS n FROM pelanggan
GROUP BY kota
HAVING COUNT(*) >= 2
ORDER BY n DESC, kota;','sql','["Padang,3 | Medan,2","Padang,3 | Medan,12","Padang,3"]'::jsonb,null,0,'GROUP BY menganggap semua NULL sebagai satu grup; COUNT(*) menghitungnya, COUNT(kota) tidak. Hasil: Padang,3 | Medan,2.',null,'Apakah NULL membentuk grup sendiri?',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 20) (2, A, 50) (3, A, 50) (4, A, 50) (5, B, 20) (6, A, 40)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,0 | 2,30 | 3,0 | 4,0 | 5,0 | 6,-10","1,0 | 2,30 | 3,0 | 4,0 | 5,-30 | 6,20","1,30 | 2,0 | 3,0 | 4,-10 | 5,0 | 6,0"]'::jsonb,null,0,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,30 | 3,0 | 4,0 | 5,0 | 6,-10.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','output','Berapa query SQL yang dijalankan (200 post, 7 penulis berbeda)?',null,'posts = Post.objects.prefetch_related("penulis")[:200]
for p in posts:
    print(p.penulis.nama)','python','["201","1","2"]'::jsonb,null,2,'prefetch_related memakai query kedua dengan WHERE id IN (...): total 2 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','output','Apa output kode ini?',null,'console.log(new URL("../a/x.png?v=3#top", "https://app.kampus.ac.id/img/produk/h.html").href);','javascript','["https://app.kampus.ac.id/img/a/x.png?v=3#top","https://app.kampus.ac.id/img/a/x.png?v=1#top","https://app.kampus.ac.id/img/a/x.png?v=4#top"]'::jsonb,null,0,'Hasil: https://app.kampus.ac.id/img/a/x.png?v=3#top. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 700px) 40vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1366px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-640.jpg","foto-2000.jpg","foto-1280.jpg"]'::jsonb,null,2,'Slot = 40vw × 1366 = 546px CSS; × DPR 2 = 1093px fisik → kandidat terkecil yang ≥ itu: 1280w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
class A {
  n = 34;
  h = () => this.n;
  m() { return this.n; }
}
const { h, m } = new A();
try { console.log(h(), m()); } catch (e) { console.log(h(), e.name); }','javascript','["34 TypeError","34 undefined","188"]'::jsonb,null,0,'h adalah arrow field yang terikat ke instance; m hasil destructuring kehilangan receiver sehingga this undefined → TypeError.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','guess','Pengguna PWA tetap melihat versi lama situs setelah deploy. Penyebab paling mungkin?',null,'navigator.serviceWorker.register("/sw.js")','javascript','["Service worker lama masih aktif dan menyajikan aset dari cache-nya","Browser pengguna tidak mendukung versi baru dari situs tersebut","DNS belum menyebar sehingga pengguna masih diarahkan ke server lama"]'::jsonb,null,0,'SW baru menunggu sampai tab yang dikendalikan SW lama ditutup, kecuali skipWaiting dipakai.',null,'Siapa yang menjawab request sebelum jaringan?',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(8);
  function klik() {
    setN(n + 2);
    setN((p) => p + 5);
    setN((p) => p * 4);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["15","10","60"]'::jsonb,null,2,'Antrean update diproses berurutan mulai dari n=8 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 8 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 60.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 4 f.txt menjadi "fitur"
main: mengubah baris 4 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_A → LOCK tabel_B → LOCK tabel_C → COMMIT
T2: LOCK tabel_A → LOCK tabel_C → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan","Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan"]'::jsonb,null,0,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 20; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. B: counter = tmpB + 1
4. A: counter = tmpA + 1
5. A: tmpA = counter
6. B: tmpB = counter
7. A: counter = tmpA + 1
8. B: counter = tmpB + 1','python','["22","24","23"]'::jsonb,null,0,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 22, bukan 24. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 5 item
halaman 1 → [100, 99, 98, 97, 96]
# lalu 3 item baru (id 101…103) ditambahkan sebelum halaman 2 diminta
GET /item?limit=5&sebelum_id=96','text','["[95, 94, 93, 92, 91]","[98, 97, 96, 95, 94]","[97, 96, 95, 94, 93]"]'::jsonb,null,0,'Cursor memakai id terakhir yang sudah dilihat sehingga hasil stabil terhadap sisipan/hapus di depan: [95, 94, 93, 92, 91].',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 120 detik yang lalu
Cache-Control: max-age=300, s-maxage=3600
ETag: "v7"
# resource di server TIDAK berubah; permintaan ulang oleh CDN (shared cache)','http','["Dilayani dari cache tanpa request ke jaringan","Request kondisional; server membalas 304 tanpa body","Unduh penuh (200) dari server"]'::jsonb,null,0,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (kota, umur, negara);

SELECT * FROM orang
WHERE umur = ''x'' AND negara > 30 AND kota = ''x'';','sql','["2","4","3"]'::jsonb,null,2,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 3.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','guess','Dari daftar ini, nomor mana yang BUKAN basis data dokumen NoSQL?',null,'1. RavenDB
2. Vite
3. Firestore
4. Traefik
5. CouchDB','text','["2 dan 3 dan 4","3 dan 4 dan 5","2 dan 4"]'::jsonb,null,2,'Vite dan Traefik termasuk kategori lain; CouchDB, RavenDB, Firestore adalah basis data dokumen NoSQL.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~0.0.1" }
// versi yang tersedia di registry:
0.0.1  0.0.3  0.1.1  0.1.2  0.1.3  1.0.0  1.1.4  1.2.0','json','["0.0.3","1.2.0","0.0.1"]'::jsonb,null,0,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 0.0.3.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null);
