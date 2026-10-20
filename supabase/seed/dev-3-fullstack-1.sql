-- DIHASILKAN oleh scripts/gen-dev.mjs (fullstack, bagian 1/4) — 250 soal HARD MODE (v2.4)
-- Bagian 1 menonaktifkan soal Developer Mode lama (v2.1–v2.3) untuk peran ini; jalankan SEMUA bagian.
update questions set active = false where difficulty = 'fullstack';
insert into questions (difficulty,type,prompt,prompt_en,code,language,options,options_en,correct_index,explanation,explanation_en,hint,hint_en) values
('fullstack','guess','Menyimpan JWT di localStorage vs cookie HttpOnly: risiko utama masing-masing?',null,'localStorage.setItem("token", jwt)','javascript','["localStorage: dapat dibaca skrip XSS","Keduanya aman sepenuhnya jika memakai HTTPS","localStorage: rentan CSRF; cookie HttpOnly: rentan XSS pembaca token"]'::jsonb,null,0,'Skrip apa pun di origin dapat membaca localStorage. Cookie dikirim otomatis oleh browser sehingga perlu perlindungan CSRF.',null,'Siapa yang dapat membaca, dan siapa yang mengirim otomatis?',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 30 detik yang lalu
Cache-Control: max-age=300
(tanpa ETag/Last-Modified)
# resource di server TIDAK berubah; permintaan ulang oleh browser (private cache), navigasi biasa','http','["Unduh penuh (200) dari server","Dilayani dari cache (basi) sekarang, revalidasi di latar belakang","Dilayani dari cache tanpa request ke jaringan"]'::jsonb,null,2,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','output','Apa output kode ini?',null,'const s = new URLSearchParams("a=7&b=2");
s.append("a", "x y");
s.delete("b");
s.set("c", "&");
console.log(s.toString(), s.getAll("a").length);','javascript','["a=7&a=x+y&c=%26 2","a=17&a=x+y&c=%26 2","a=8&a=x+y&c=%26 2"]'::jsonb,null,0,'Hasil: a=7&a=x+y&c=%26 2. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 40) (2, A, 50) (3, B, 10) (4, A, 20) (5, B, 50) (6, A, 20) (7, A, 10)

SELECT id, SUM(nilai) OVER (ORDER BY id) AS s FROM skor ORDER BY id;','sql','["1,40 | 2,90 | 3,100 | 4,120 | 5,170 | 6,190 | 7,200","1,40 | 2,50 | 3,50 | 4,70 | 5,100 | 6,90 | 7,100","1,200 | 2,200 | 3,200 | 4,200 | 5,200 | 6,200 | 7,200"]'::jsonb,null,0,'SUM() OVER (ORDER BY id) adalah jumlah kumulatif (frame default: awal sampai baris saat ini, termasuk seri pada kunci urut). Hasil: 1,40 | 2,90 | 3,100 | 4,120 | 5,170 | 6,190 | 7,200.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','guess','Apakah cookie ini ikut terkirim pada permintaan tersebut?',null,'# dari halaman https://shop.toko.id/akun/profil
Set-Cookie: id=7; Path=/akun/profil

# permintaan berikutnya ke:
https://toko.id/akunku','http','["Tergantung SameSite saja","Ya","Tidak"]'::jsonb,null,2,'Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (/akun). Path cocok pada batas ''/''. Secure butuh https. Hasil: tidak terkirim.',null,'Cek berurutan: host, path (aturan batas ''/''), skema.',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Dedi, Medan) (2, Eka, Medan) (3, Hana, Padang) (4, Fajar, NULL) (5, Citra, NULL) (6, Gita, Medan)
-- pesanan(id, pelanggan_id, total, status)
(1, 3, 20, batal) (2, 1, 50, lunas) (3, 4, 70, lunas) (4, 3, 80, batal) (5, 3, 30, lunas) (6, 2, 20, batal) (7, 1, 30, lunas)

SELECT COUNT(*) FROM (
  SELECT kota FROM pelanggan
  UNION ALL
  SELECT kota FROM pelanggan WHERE kota IS NOT NULL
) x
WHERE kota IS NULL OR kota <> ''Padang'';','sql','["6","8","2"]'::jsonb,null,1,'UNION ALL mempertahankan duplikat, UNION menghapusnya; kota <> ''Padang'' bernilai UNKNOWN untuk NULL sehingga perlu IS NULL eksplisit. Hasil: 8.',null,'UNION vs UNION ALL; perbandingan dengan NULL tidak pernah true.',null),
('fullstack','guess','Kode status HTTP paling tepat untuk situasi ini:
Terjadi pengecualian tak tertangani di kode server',null,'# API REST','http','["500 Internal Server Error","504 Gateway Timeout","503 Service Unavailable"]'::jsonb,null,0,'500 Internal Server Error adalah kode yang sesuai dengan semantik situasi tersebut.',null,'Cari kata kunci: salah klien (4xx) atau server (5xx)? autentikasi atau otorisasi?',null),
('fullstack','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 570, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 570
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 570
T1: UPDATE akun SET saldo = x + 20 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 10 WHERE id = 1; COMMIT;','sql','["Mengganti COMMIT menjadi ROLLBACK","Menambah indeks pada kolom saldo","Gunakan UPDATE atomik"]'::jsonb,null,2,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_A → LOCK tabel_C → LOCK tabel_B → COMMIT
T2: LOCK tabel_A → LOCK tabel_B → COMMIT
T3: LOCK tabel_C → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan","Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan"]'::jsonb,null,0,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src ''unsafe-eval'' ''self'' ''unsafe-inline''

A. <script>inisiasi()</script>
B. <script nonce="r4nd">inisiasi()</script>
C. <script src="/app.js"></script>  <!-- same-origin -->
E. <script src="https://evil.example/x.js"></script>
F. <button onclick="kirim()">OK</button>','http','["A B","B E","E F"]'::jsonb,null,1,'Diblokir: B E. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.allSettled([ok("A", 10), ok("B", 5), ok("C", 15)])
  .then((r) => console.log("ok", JSON.stringify(r.map((x) => x.status[0] + (x.value ?? x.reason.message)))))
  .catch((e) => console.log("err", e.message));','javascript','["ok [\"A\",\"B\",\"C\"]","ok \"B\"","ok [\"fA\",\"fB\",\"fC\"]"]'::jsonb,null,2,'Promise.allSettled menghasilkan: ok ["fA","fB","fC"]. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(7);
  function klik() {
    setN((p) => p * 4);
    setN(n + 4);
    setN(n + 4);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["11","36","15"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=7 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 7 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 11.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 245 → tiba t=245
"ko": kirim t=135, latensi 676 → tiba t=811
"kop": kirim t=187, latensi 337 → tiba t=524

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"kop\" — query yang diketik paling akhir","\"ko\" — respons yang tiba paling akhir","\"k\" — respons yang tiba paling awal"]'::jsonb,null,1,'Urutan tiba: "k" → "kop" → "ko". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','output','Apa output kode ini?',null,'Promise.resolve(2)
  .finally(() => 87)
  .then((v) => console.log("v", v));','javascript','["v 3","undefined","v 2"]'::jsonb,null,2,'Dijalankan: v 2.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~2.0.1" }
// versi yang tersedia di registry:
2.0.1  2.0.2  2.0.3  2.0.4  2.1.0  2.2.1  3.0.1  3.1.4','json','["2.2.1","3.1.4","2.0.4"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 2.0.4.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(JSON.stringify({ a: undefined, b: () => 1, c: NaN, d: [undefined, 21], e: null }));','javascript','["{''c'':null,''d'':[null,21],''e'':null}","{\"c\":null,\"d\":[null,21],\"e\":null}","{\"c\":undefined,\"d\":[null,22],\"e\":null}"]'::jsonb,null,1,'Hasil: {"c":null,"d":[null,21],"e":null}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'setTimeout(() => console.log("E"), 0);
console.log("C");
setTimeout(() => console.log("H"), 0);
setTimeout(() => console.log("A"), 0);
Promise.resolve().then(() => {
  console.log("F");
  queueMicrotask(() => console.log("B"));
});','javascript','["C F B E A H","C F B E H A","E C H A F B"]'::jsonb,null,1,'Urutan nyata: C F B E H A. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','output','Berapa kali saldo pelanggan dipotong?',null,'// klien: timeout 3 detik, retry maksimal 4 kali
// server memproses TIAP request yang tiba (mengurangi saldo), lalu membalas
// jaringan menghilangkan respons 4 percobaan pertama; respons percobaan ke-5 sampai
POST /bayar  { jumlah: 50000 }   // tanpa Idempotency-Key','http','["1","4","5"]'::jsonb,null,2,'Klien hanya tahu ''tidak ada respons'', bukan ''server belum memproses''. Tiap percobaan yang sampai diproses: 4 yang responsnya hilang + 1 yang berhasil = 5. Idempotency-Key membuat server mengembalikan hasil yang sama (dipotong 1 kali).',null,'Apakah server tahu request itu retry dari yang sebelumnya?',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 11; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. B: counter = tmpB + 1
4. A: counter = tmpA + 1
5. B: tmpB = counter
6. A: tmpA = counter
7. A: counter = tmpA + 1
8. B: counter = tmpB + 1','python','["14","15","13"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 13, bukan 15. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, umur, kota);

SELECT * FROM orang
WHERE negara > 30;','sql','["1","0","2"]'::jsonb,null,0,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','guess','Apakah cookie ini ikut dikirim pada permintaan ke toko.com:8080?',null,'halaman        : https://toko.com:3000
form POST top-level
tujuan         : https://toko.com:8080
Set-Cookie     : sid=1; SameSite=Strict; Domain milik tujuan','text','["Tidak, cookie tidak dikirim","Hanya dikirim jika memakai HTTP/2","Ya, cookie dikirim"]'::jsonb,null,2,'Hubungan: cross-origin tetapi same-site. Pada konteks same-site cookie selalu dikirim; pada cross-site: Strict tidak pernah, Lax hanya untuk navigasi top-level dengan metode aman (GET), None dikirim (wajib Secure).',null,'Apakah ini same-site? Jika bukan, cek nilai SameSite dan jenis permintaan.',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 3 f.txt menjadi "fitur"
main: mengubah baris 7 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
const o = { n: 65, get() { return this.n; } };
const g = o.get.bind({ n: 162 });
console.log(g.call({ n: 204 }));','javascript','["162","204","65"]'::jsonb,null,0,'bind menetapkan this secara permanen; call() tidak bisa menimpanya, jadi hasilnya nilai pada objek yang di-bind.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 900px) 50vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 360px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-800.jpg","foto-1024.jpg","foto-480.jpg"]'::jsonb,null,0,'Slot = 100vw × 360 = 360px CSS; × DPR 2 = 720px fisik → kandidat terkecil yang ≥ itu: 800w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("https://api.toko.id:8443/pesanan", {
  method: "POST",
  headers: { "Authorization": "Bearer abc" },
  credentials: "include",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: https://lain.id
Access-Control-Allow-Credentials: true
Access-Control-Allow-Methods: PATCH, DELETE, POST
Access-Control-Allow-Headers: content-type, authorization','javascript','["Preflight gagal: request asli tidak pernah dikirim","Browser mengirim preflight OPTIONS dulu, lalu request asli berhasil","Request langsung dikirim (tanpa preflight) dan respons boleh dibaca JavaScript"]'::jsonb,null,0,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','output','Berapa p95 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [386,270,842,766,324,516,806,267,423,41]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["842","806","464"]'::jsonb,null,0,'N=10, rank=⌈95/100×10⌉=10 → 842 ms. Rata-rata (464) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
luar.addEventListener("click", () => log("A"), true);
tombol.addEventListener("click", (e) => { log("B"); e.stopPropagation(); });
luar.addEventListener("click", () => log("C"), true);
tombol.addEventListener("click", () => log("D"), true);
luar.addEventListener("click", () => log("E"));','javascript','["B D","A B C D","A C D B"]'::jsonb,null,2,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: A C D B.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 60 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1760003600, nbf: 1760000090, iss: "auth.lain.id", aud: "web.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: belum berlaku (nbf)","Diterima","Ditolak: token kedaluwarsa (exp)"]'::jsonb,null,0,'Cek berurutan: Ditolak: belum berlaku (nbf). exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','output','Berapa query SQL yang dijalankan (100 post, 5 penulis berbeda)?',null,'posts = Post.objects.all()[:100]
for p in posts:
    print(p.penulis.nama)        # relasi ForeignKey, lazy','python','["2","1","101"]'::jsonb,null,2,'Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 4 item
halaman 1 → [100, 99, 98, 97]
# lalu 2 item teratas dihapus sebelum halaman 2 diminta
GET /item?limit=4&offset=4','text','["[96, 95, 94, 93]","[94, 93, 92, 91]","[93, 92, 91, 90]"]'::jsonb,null,1,'Offset menghitung dari posisi, bukan dari item terakhir yang dilihat: penghapusan menggeser daftar naik sehingga ada item yang terlewat.',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 7 percobaan ulang
base = 100 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(5000, base * 2**i)   # i = 0, 1, 2, …','python','["11300","12700","16300"]'::jsonb,null,0,'Jeda: 100, 200, 400, 800, 1600, 3200, 5000 ms → total 11300 ms (cap 5000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('fullstack','guess','Manakah kombinasi nomor yang SEMUANYA merupakan tooling/framework CSS?',null,'1. Bulma
2. Bootstrap
3. Remix
4. PostCSS
5. RabbitMQ','text','["1, 4, 5","1, 2, 4","2, 3, 5"]'::jsonb,null,1,'Bootstrap, Bulma, PostCSS adalah tooling/framework CSS; RabbitMQ dan Remix termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 4 item
halaman 1 → [100, 99, 98, 97]
# lalu 2 item baru (id 101…102) ditambahkan sebelum halaman 2 diminta
GET /item?limit=4&offset=4','text','["[96, 95, 94, 93]","[98, 97, 96, 95]","[97, 96, 95, 94]"]'::jsonb,null,1,'Offset menghitung dari posisi, bukan dari item terakhir yang dilihat: item baru menggeser daftar sehingga item akhir halaman 1 muncul lagi (duplikat).',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
const o = { n: 59, get() { return this.n; } };
const g = o.get.bind({ n: 180 });
console.log(g.call({ n: 256 }));','javascript','["59","256","180"]'::jsonb,null,2,'bind menetapkan this secara permanen; call() tidak bisa menimpanya, jadi hasilnya nilai pada objek yang di-bind.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','guess','Apakah cookie ini ikut dikirim pada permintaan ke toko.id?',null,'halaman        : https://shop.toko.id
fetch() dari JavaScript halaman
tujuan         : https://toko.id
Set-Cookie     : sid=1; SameSite=None; Secure; Domain milik tujuan','text','["Hanya dikirim jika memakai HTTP/2","Ya, cookie dikirim","Tidak, cookie tidak dikirim"]'::jsonb,null,1,'Hubungan: cross-origin tetapi same-site. Pada konteks same-site cookie selalu dikirim; pada cross-site: Strict tidak pernah, Lax hanya untuk navigasi top-level dengan metode aman (GET), None dikirim (wajib Secure).',null,'Apakah ini same-site? Jika bukan, cek nilai SameSite dan jenis permintaan.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(new URL("?q=2", "https://toko.id/c/produk?lama=1#h").href, new URL("#baru", "https://toko.id/c?x=1").href);','javascript','["https://toko.id/c/produk?q=0 https://toko.id/c?x=1#baru","https://toko.id/c/produk?q=3 https://toko.id/c?x=1#baru","https://toko.id/c/produk?q=2 https://toko.id/c?x=1#baru"]'::jsonb,null,2,'Hasil: https://toko.id/c/produk?q=2 https://toko.id/c?x=1#baru. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','guess','Manakah kombinasi nomor yang SEMUANYA merupakan tooling/framework CSS?',null,'1. Express
2. Bulma
3. Bootstrap
4. Sass
5. MobX','text','["2, 3, 4","1, 3, 4","3, 4, 5"]'::jsonb,null,0,'Sass, Bootstrap, Bulma adalah tooling/framework CSS; Express dan MobX termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 700px) 40vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1440px, device pixel ratio 1; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-800.jpg","foto-1600.jpg","foto-640.jpg"]'::jsonb,null,2,'Slot = 40vw × 1440 = 576px CSS; × DPR 1 = 576px fisik → kandidat terkecil yang ≥ itu: 640w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("https://app.toko.id/pesanan", {
  method: "PUT",
  headers: { "Content-Type": "application/json" },
  credentials: "omit",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: https://app.toko.id
Access-Control-Allow-Methods: DELETE, POST, GET
Access-Control-Allow-Headers: content-type','javascript','["Preflight gagal: request asli tidak pernah dikirim","Request langsung dikirim (tanpa preflight) dan respons boleh dibaca JavaScript","Same-origin: CORS tidak berlaku, request berhasil"]'::jsonb,null,2,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','output','Apa output kode ini?',null,'Promise.resolve(6)
  .then((v) => { throw new Error("e" + v); })
  .then(() => console.log("A"))
  .catch((e) => e.message)
  .then((m) => console.log("B", m));','javascript','["undefined","B e6","B e7"]'::jsonb,null,1,'Dijalankan: B e6.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Budi, Medan) (2, Gita, Bandung) (3, Fajar, Padang) (4, Eka, Padang) (5, Ayu, Bandung)
-- pesanan(id, pelanggan_id, total, status)
(1, 1, 70, batal) (2, 1, 90, lunas) (3, 3, 20, batal) (4, 2, 60, baru) (5, 3, 80, lunas) (6, 4, 60, lunas) (7, 3, 20, batal)

SELECT COUNT(*) FROM (
  SELECT kota FROM pelanggan
  UNION ALL
  SELECT kota FROM pelanggan WHERE kota IS NOT NULL
) x
WHERE kota IS NULL OR kota <> ''Padang'';','sql','["2","6","7"]'::jsonb,null,1,'UNION ALL mempertahankan duplikat, UNION menghapusnya; kota <> ''Padang'' bernilai UNKNOWN untuk NULL sehingga perlu IS NULL eksplisit. Hasil: 6.',null,'UNION vs UNION ALL; perbandingan dengan NULL tidak pernah true.',null),
('fullstack','output','Berapa query SQL yang dijalankan (20 post, 6 penulis berbeda)?',null,'posts = Post.objects.all()[:20]
for p in posts:
    print(p.penulis.nama)        # relasi ForeignKey, lazy','python','["21","1","2"]'::jsonb,null,0,'Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 7 percobaan ulang
base = 250 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(2000, base * 2**i)   # i = 0, 1, 2, …','python','["11750","9750","31750"]'::jsonb,null,1,'Jeda: 250, 500, 1000, 2000, 2000, 2000, 2000 ms → total 9750 ms (cap 2000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 136 → tiba t=136
"ko": kirim t=97, latensi 523 → tiba t=620
"kop": kirim t=251, latensi 252 → tiba t=503

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"ko\" — respons yang tiba paling akhir","\"k\" — respons yang tiba paling awal","\"kop\" — query yang diketik paling akhir"]'::jsonb,null,0,'Urutan tiba: "k" → "kop" → "ko". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^2.0.3" }
// versi yang tersedia di registry:
2.0.3  2.0.4  2.0.6  2.1.3  2.2.6  3.0.4  3.0.5  3.2.5','json','["2.0.6","3.2.5","2.2.6"]'::jsonb,null,2,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 2.2.6.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','output','Berapa kali saldo pelanggan dipotong?',null,'// klien: timeout 3 detik, retry maksimal 4 kali
// server memproses TIAP request yang tiba (mengurangi saldo), lalu membalas
// jaringan menghilangkan respons 3 percobaan pertama; respons percobaan ke-4 sampai
POST /bayar  { jumlah: 50000 }   // tanpa Idempotency-Key','http','["5","1","4"]'::jsonb,null,2,'Klien hanya tahu ''tidak ada respons'', bukan ''server belum memproses''. Tiap percobaan yang sampai diproses: 3 yang responsnya hilang + 1 yang berhasil = 4. Idempotency-Key membuat server mengembalikan hasil yang sama (dipotong 1 kali).',null,'Apakah server tahu request itu retry dari yang sebelumnya?',null),
('fullstack','output','Berapa p99 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [23,207,320,601,535,622,207,427,359,780,744,410]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["436","780","744"]'::jsonb,null,1,'N=12, rank=⌈99/100×12⌉=12 → 780 ms. Rata-rata (436) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 30) (2, A, 40) (3, A, 50) (4, B, 30) (5, A, 10) (6, A, 50)

SELECT id, RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,1 | 2,3 | 3,1 | 4,1 | 5,4 | 6,1","1,1 | 2,3 | 3,1 | 4,2 | 5,4 | 6,2","1,1 | 2,2 | 3,1 | 4,1 | 5,3 | 6,1"]'::jsonb,null,0,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,1 | 2,3 | 3,1 | 4,1 | 5,4 | 6,1.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
luar.addEventListener("click", () => log("A"), true);
tengah.addEventListener("click", () => log("B"), true);
tombol.addEventListener("click", () => log("C"), true);
tengah.addEventListener("click", () => log("D"));
tombol.addEventListener("click", (e) => { log("E"); e.stopPropagation(); });','javascript','["A B C E D","A B C E","C E"]'::jsonb,null,1,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: A B C E.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (kota, umur, negara);

SELECT * FROM orang
WHERE kota > 30 AND umur = ''x'' AND negara = ''x'';','sql','["2","3","1"]'::jsonb,null,2,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'Promise.resolve().then(() => console.log("A"));
Promise.resolve().then(() => {
  console.log("B");
  queueMicrotask(() => console.log("E"));
});
setTimeout(() => console.log("D"), 0);
setTimeout(() => {
  console.log("H");
  Promise.resolve().then(() => console.log("G"));
}, 0);
Promise.resolve().then(() => {
  console.log("undefined");
  queueMicrotask(() => console.log("undefined"));
});','javascript','["A B undefined E undefined D H G","A B E undefined undefined D H G","A B E D H G"]'::jsonb,null,0,'Urutan nyata: A B undefined E undefined D H G. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src ''self'' ''unsafe-eval'' ''nonce-r4nd''

B. <script nonce="r4nd">inisiasi()</script>
C. <script src="/app.js"></script>  <!-- same-origin -->
D. <script src="https://cdn.toko.id/lib.js"></script>
F. <button onclick="kirim()">OK</button>
G. eval("1 + 1")  // di dalam skrip yang diizinkan','http','["B D","B F","D F"]'::jsonb,null,2,'Diblokir: D F. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','output','Berapa saldo akhir?',null,'-- saldo awal = 520, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 520
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 520
T1: UPDATE akun SET saldo = x + 90 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 40 WHERE id = 1; COMMIT;','sql','["650","560","610"]'::jsonb,null,1,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 520+40, sehingga tambahan 90 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('fullstack','guess','Kode status HTTP paling tepat untuk situasi ini:
Dialihkan sementara dan metode serta body HARUS dipertahankan',null,'# API REST','http','["307 Temporary Redirect","304 Not Modified","301 Moved Permanently"]'::jsonb,null,0,'307 Temporary Redirect adalah kode yang sesuai dengan semantik situasi tersebut.',null,'Cari kata kunci: salah klien (4xx) atau server (5xx)? autentikasi atau otorisasi?',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(1);
  function klik() {
    setN((p) => p + 1);
    setN((p) => p * 2);
    setN(n + 3);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["4","5","7"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=1 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 1 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 4.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 4 f.txt menjadi "fitur"
main: mengubah baris 4 f.txt menjadi "fitur" (isi IDENTIK, commit sendiri)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.all([ok("A", 10), ok("B", 5), bad("C", 15)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["err C","ok \"B\"","ok [\"fA\",\"fB\",\"rC\"]"]'::jsonb,null,0,'Promise.all menghasilkan: err C. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 15; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. A: counter = tmpA + 1
4. B: counter = tmpB + 1
5. A: tmpA = counter
6. B: tmpB = counter
7. B: counter = tmpB + 1
8. A: counter = tmpA + 1','python','["18","17","19"]'::jsonb,null,1,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 17, bukan 19. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','guess','Apakah cookie ini ikut terkirim pada permintaan tersebut?',null,'# dari halaman https://shop.toko.id/keranjang
Set-Cookie: id=7; Path=/; HttpOnly

# permintaan berikutnya ke:
https://shop.toko.id/','http','["Tergantung SameSite saja","Tidak","Ya"]'::jsonb,null,2,'Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (/). Path cocok pada batas ''/''. Secure butuh https. Hasil: terkirim.',null,'Cek berurutan: host, path (aturan batas ''/''), skema.',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_B → LOCK tabel_A → LOCK tabel_C → COMMIT
T2: LOCK tabel_A → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_B → tabel_A"]'::jsonb,null,2,'Graf urutan kunci memuat siklus tabel_A → tabel_B → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 0 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1760000020, nbf: 1760000090, iss: "auth.toko.id", aud: "web.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: belum berlaku (nbf)","Ditolak: issuer tidak sesuai","Diterima"]'::jsonb,null,0,'Cek berurutan: Ditolak: belum berlaku (nbf). exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','guess','Pembaruan optimistis gagal di server (422). Apa yang seharusnya dilakukan klien?',null,'setDaftar([...daftar, itemBaru]);   // optimistis
await api.simpan(itemBaru);        // 422','javascript','["Membiarkan item tetap tampil agar UI terasa cepat dan menyembunyikan galat","Membatalkan (rollback) ke state sebelumnya dan menampilkan galat validasi","Mengulang request tanpa batas sampai server akhirnya menerima data tersebut"]'::jsonb,null,1,'UI optimistis harus bisa dikembalikan bila server menolak; ulang tanpa batas pada galat validasi tak berguna.',null,'Apa kebenaran sumber akhir: UI atau server?',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 30 detik yang lalu
Cache-Control: max-age=300, s-maxage=3600, stale-while-revalidate=600
ETag: "v7"
# resource di server TIDAK berubah; permintaan ulang oleh browser (private cache), navigasi biasa','http','["Dilayani dari cache (basi) sekarang, revalidasi di latar belakang","Unduh penuh (200) dari server","Dilayani dari cache tanpa request ke jaringan"]'::jsonb,null,2,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','output','Apa output kode ini?',null,'console.log(JSON.stringify({ a: undefined, b: () => 1, c: NaN, d: [undefined, 13], e: null }));','javascript','["{''c'':null,''d'':[null,13],''e'':null}","{\"c\":null,\"d\":[null,13],\"e\":null}","{\"c\":undefined,\"d\":[null,14],\"e\":null}"]'::jsonb,null,1,'Hasil: {"c":null,"d":[null,13],"e":null}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','output','Berapa query SQL yang dijalankan (100 post, 6 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:100]
for p in posts:
    print(p.penulis.nama)','python','["1","101","2"]'::jsonb,null,0,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
luar.addEventListener("click", () => log("A"));
tombol.addEventListener("click", () => log("B"), true);
tombol.addEventListener("click", () => log("C"), true);
tengah.addEventListener("click", () => log("D"), true);
tombol.addEventListener("click", () => log("E"), true);','javascript','["A B C D E","D B C E A","B C E D A"]'::jsonb,null,1,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: D B C E A.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'queueMicrotask(() => console.log("C"));
Promise.resolve().then(() => console.log("A"));
setTimeout(() => console.log("G"), 0);
(async () => {
  console.log("H");
  await null;
  console.log("E");
})();','javascript','["C A G H E","H C E A G","H C A E G"]'::jsonb,null,2,'Urutan nyata: H C A E G. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','guess','Hubungan kedua URL ini?',null,'halaman : https://toko.com
permintaan: https://toko.org','text','["same-origin (dan same-site)","cross-origin dan cross-site","cross-origin tetapi same-site"]'::jsonb,null,1,'Origin = skema+host+port; site = eTLD+1 (+ skema). toko.com → toko.com, toko.org → toko.org. github.io dan vercel.app ada di Public Suffix List, jadi subdomainnya berbeda site.',null,'Public Suffix List menentukan batas site.',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
const o = { n: 68, get() { return this.n; } };
const g = o.get.bind({ n: 198 });
console.log(g.call({ n: 295 }));','javascript','["295","68","198"]'::jsonb,null,2,'bind menetapkan this secara permanen; call() tidak bisa menimpanya, jadi hasilnya nilai pada objek yang di-bind.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 700px) 50vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1366px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1600.jpg","foto-2000.jpg","foto-800.jpg"]'::jsonb,null,0,'Slot = 50vw × 1366 = 683px CSS; × DPR 2 = 1366px fisik → kandidat terkecil yang ≥ itu: 1600w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 3600 detik yang lalu
Cache-Control: no-cache, max-age=600
ETag: "v7"
# resource di server TIDAK berubah; permintaan ulang oleh CDN (shared cache)','http','["Dilayani dari cache (basi) sekarang, revalidasi di latar belakang","Dilayani dari cache tanpa request ke jaringan","Request kondisional; server membalas 304 tanpa body"]'::jsonb,null,2,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Eka, Bandung) (2, Dedi, NULL) (3, Fajar, NULL) (4, Gita, Padang) (5, Ayu, Padang) (6, Budi, Medan)
-- pesanan(id, pelanggan_id, total, status)
(1, 1, 80, baru) (2, NULL, 40, lunas) (3, 2, 30, lunas) (4, 3, 90, lunas) (5, 4, 60, baru) (6, 2, 70, lunas) (7, 2, 30, baru) (8, 5, 40, batal)

SELECT kota, COUNT(*) AS n FROM pelanggan
GROUP BY kota
HAVING COUNT(*) >= 2
ORDER BY n DESC, kota;','sql','["(kosong)","NULL,2 | Padang,2","Padang,2"]'::jsonb,null,1,'GROUP BY menganggap semua NULL sebagai satu grup; COUNT(*) menghitungnya, COUNT(kota) tidak. Hasil: NULL,2 | Padang,2.',null,'Apakah NULL membentuk grup sendiri?',null),
('fullstack','guess','Manakah kombinasi nomor yang SEMUANYA merupakan penyimpan key-value/in-memory?',null,'1. Redis
2. Valkey
3. etcd
4. Rollup
5. MobX','text','["1, 2, 3","1, 2, 4","2, 3, 4"]'::jsonb,null,0,'Valkey, etcd, Redis adalah penyimpan key-value/in-memory; MobX dan Rollup termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(2);
  function klik() {
    setN(n + 4);
    setN((p) => p * 2);
    setN(n + 5);
    setN(n + 1);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["18","3","12"]'::jsonb,null,1,'Antrean update diproses berurutan mulai dari n=2 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 2 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 3.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','output','Berapa p95 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [443,402,671,140,592,882,803,549,781,474,522,567]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["803","882","569"]'::jsonb,null,1,'N=12, rank=⌈95/100×12⌉=12 → 882 ms. Rata-rata (569) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','output','Berapa saldo akhir?',null,'-- saldo awal = 790, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 790
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 790
T1: UPDATE akun SET saldo = x + 60 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 40 WHERE id = 1; COMMIT;','sql','["890","830","850"]'::jsonb,null,1,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 790+40, sehingga tambahan 60 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 6 item
halaman 1 → [100, 99, 98, 97, 96, 95]
# lalu 3 item teratas dihapus sebelum halaman 2 diminta
GET /item?limit=6&sebelum_id=95','text','["[91, 90, 89, 88, 87, 86]","[90, 89, 88, 87, 86, 85]","[94, 93, 92, 91, 90, 89]"]'::jsonb,null,2,'Cursor memakai id terakhir yang sudah dilihat sehingga hasil stabil terhadap sisipan/hapus di depan: [94, 93, 92, 91, 90, 89].',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src ''unsafe-inline'' https://cdn.toko.id ''self''

B. <script nonce="r4nd">inisiasi()</script>
C. <script src="/app.js"></script>  <!-- same-origin -->
D. <script src="https://cdn.toko.id/lib.js"></script>
E. <script src="https://evil.example/x.js"></script>
F. <button onclick="kirim()">OK</button>','http','["B E","B F","B D"]'::jsonb,null,0,'Diblokir: B E. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 0 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1760003600, nbf: 1759999980, iss: "auth.toko.id", aud: "api.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: token kedaluwarsa (exp)","Ditolak: audience tidak sesuai","Diterima"]'::jsonb,null,2,'Cek berurutan: Diterima. exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 6 f.txt menjadi "fitur"
main: mengubah baris 1 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(new URL("../produk/x.png?v=9#top", "https://toko.id/c/a/h.html").href);','javascript','["https://toko.id/c/produk/x.png?v=19#top","https://toko.id/c/produk/x.png?v=9#top","https://toko.id/c/produk/x.png?v=8#top"]'::jsonb,null,1,'Hasil: https://toko.id/c/produk/x.png?v=9#top. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(JSON.stringify({ b: 14, a: 2, 1: "x" }, ["a", "b"]), JSON.stringify([new Date(0)]), JSON.stringify("\u00e9\n"));','javascript','["{\"a\":3,\"b\":14} [\"1970-01-01T00:00:00.000Z\"] \"é\\n\"","{''a'':2,''b'':14} [''1970-01-01T00:00:00.000Z''] ''é\\n''","{\"a\":2,\"b\":14} [\"1970-01-01T00:00:00.000Z\"] \"é\\n\""]'::jsonb,null,2,'Hasil: {"a":2,"b":14} ["1970-01-01T00:00:00.000Z"] "é\n". JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (umur, negara, kota);

SELECT * FROM orang
WHERE umur = ''x'' AND negara > 30;','sql','["2","1","3"]'::jsonb,null,0,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 2.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','guess','Skenario: game papan dua pemain, langkah harus saling terkirim dengan latensi rendah. Pilihan yang tepat?',null,'const ws = new WebSocket("wss://game.toko.id/room/1");','javascript','["WebSocket","Server-Sent Events","Long polling"]'::jsonb,null,0,'WebSocket menyediakan kanal dua arah full-duplex berlatensi rendah.',null,'Butuh klien juga mengirim sering.',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~0.0.1" }
// versi yang tersedia di registry:
0.0.1  0.0.2  0.0.4  0.1.0  0.2.2  1.0.1  1.1.0  1.2.1','json','["0.0.1","1.2.1","0.0.4"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 0.0.4.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 433 → tiba t=433
"ko": kirim t=124, latensi 561 → tiba t=685
"kop": kirim t=232, latensi 111 → tiba t=343

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"ko\" — respons yang tiba paling akhir","\"kop\" — respons yang tiba paling awal","\"kop\" — query yang diketik paling akhir"]'::jsonb,null,0,'Urutan tiba: "kop" → "k" → "ko". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_C → LOCK tabel_B → COMMIT
T2: LOCK tabel_A → LOCK tabel_C → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan"]'::jsonb,null,1,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('fullstack','guess','Apakah cookie ini ikut terkirim pada permintaan tersebut?',null,'# dari halaman https://shop.toko.id/akun/profil
Set-Cookie: id=7; HttpOnly

# permintaan berikutnya ke:
http://shop.toko.id/akun/pengaturan','http','["Tidak","Tergantung SameSite saja","Ya"]'::jsonb,null,2,'Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (/akun). Path cocok pada batas ''/''. Secure butuh https. Hasil: terkirim.',null,'Cek berurutan: host, path (aturan batas ''/''), skema.',null),
('fullstack','output','Berapa kali saldo pelanggan dipotong?',null,'// klien: timeout 3 detik, retry maksimal 4 kali
// server memproses TIAP request yang tiba (mengurangi saldo), lalu membalas
// jaringan menghilangkan respons 1 percobaan pertama; respons percobaan ke-2 sampai
POST /bayar  { jumlah: 50000 }   // tanpa Idempotency-Key','http','["1","4","2"]'::jsonb,null,2,'Klien hanya tahu ''tidak ada respons'', bukan ''server belum memproses''. Tiap percobaan yang sampai diproses: 1 yang responsnya hilang + 1 yang berhasil = 2. Idempotency-Key membuat server mengembalikan hasil yang sama (dipotong 1 kali).',null,'Apakah server tahu request itu retry dari yang sebelumnya?',null),
('fullstack','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 6 percobaan ulang
base = 500 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(3000, base * 2**i)   # i = 0, 1, 2, …','python','["15500","31500","12500"]'::jsonb,null,2,'Jeda: 500, 1000, 2000, 3000, 3000, 3000 ms → total 12500 ms (cap 3000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("http://api.toko.id/pesanan", {
  method: "PUT",
  headers: { "Authorization": "Bearer abc" },
  credentials: "include",
});

// header respons server (preflight dan respons asli sama):
(tanpa Access-Control-Allow-Origin)
Access-Control-Allow-Credentials: true
Access-Control-Allow-Methods: PUT, PATCH, POST
Access-Control-Allow-Headers: authorization, content-type','javascript','["Browser mengirim preflight OPTIONS dulu, lalu request asli berhasil","Request asli TERKIRIM ke server, tetapi respons diblokir untuk JavaScript","Preflight gagal: request asli tidak pernah dikirim"]'::jsonb,null,2,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 12; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. A: counter = tmpA + 1
3. B: tmpB = counter
4. A: tmpA = counter
5. A: counter = tmpA + 1
6. B: counter = tmpB + 1
7. B: tmpB = counter
8. B: counter = tmpB + 1','python','["14","16","15"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 15, bukan 16. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 50) (2, B, 40) (3, B, 40) (4, B, 10) (5, B, 20) (6, A, 50) (7, A, 10) (8, A, 30)

SELECT id, SUM(nilai) OVER (ORDER BY id) AS s FROM skor ORDER BY id;','sql','["1,50 | 2,40 | 3,80 | 4,90 | 5,110 | 6,100 | 7,110 | 8,140","1,50 | 2,90 | 3,130 | 4,140 | 5,160 | 6,210 | 7,220 | 8,250","1,250 | 2,250 | 3,250 | 4,250 | 5,250 | 6,250 | 7,250 | 8,250"]'::jsonb,null,1,'SUM() OVER (ORDER BY id) adalah jumlah kumulatif (frame default: awal sampai baris saat ini, termasuk seri pada kunci urut). Hasil: 1,50 | 2,90 | 3,130 | 4,140 | 5,160 | 6,210 | 7,220 | 8,250.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','output','Apa output kode ini?',null,'(async () => {
  try {
    await Promise.reject(new Error("r1"));
  } catch (e) {
    console.log("c", e.message);
  } finally {
    console.log("f");
  }
  console.log("end");
})();
console.log("sync");','javascript','["end | f | c r1 | sync","sync | c r1 | f | end","sync | c r2 | f | end"]'::jsonb,null,1,'Dijalankan: sync | c r1 | f | end.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.race([bad("A", 10), ok("B", 5), ok("C", 15)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["ok [\"rA\",\"fB\",\"fC\"]","err A","ok \"B\""]'::jsonb,null,2,'Promise.race menghasilkan: ok "B". all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tombol.addEventListener("click", () => log("A"));
tengah.addEventListener("click", () => log("B"), true);
tombol.addEventListener("click", () => log("C"), true);
tengah.addEventListener("click", () => log("D"));
tombol.addEventListener("click", () => log("E"), true);','javascript','["A C E B D","B C E A D","A B C D E"]'::jsonb,null,1,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: B C E A D.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 900px) 40vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 768px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-2000.jpg","foto-800.jpg","foto-1600.jpg"]'::jsonb,null,2,'Slot = 100vw × 768 = 768px CSS; × DPR 2 = 1536px fisik → kandidat terkecil yang ≥ itu: 1600w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(JSON.stringify({ a: undefined, b: () => 1, c: NaN, d: [undefined, 43], e: null }));','javascript','["{\"c\":undefined,\"d\":[null,44],\"e\":null}","{''c'':null,''d'':[null,43],''e'':null}","{\"c\":null,\"d\":[null,43],\"e\":null}"]'::jsonb,null,2,'Hasil: {"c":null,"d":[null,43],"e":null}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 810, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 810
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 810
T1: UPDATE akun SET saldo = x + 30 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 50 WHERE id = 1; COMMIT;','sql','["Mengganti COMMIT menjadi ROLLBACK","Menambah indeks pada kolom saldo","Gunakan UPDATE atomik"]'::jsonb,null,2,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('fullstack','output','Berapa query SQL yang dijalankan (100 post, 8 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:100]
for p in posts:
    print(p.penulis.nama)','python','["101","2","1"]'::jsonb,null,2,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 426 → tiba t=426
"ko": kirim t=95, latensi 421 → tiba t=516
"kop": kirim t=217, latensi 172 → tiba t=389

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"ko\" — respons yang tiba paling akhir","\"kop\" — query yang diketik paling akhir","\"kop\" — respons yang tiba paling awal"]'::jsonb,null,0,'Urutan tiba: "kop" → "k" → "ko". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'queueMicrotask(() => console.log("C"));
Promise.resolve().then(() => {
  console.log("D");
  queueMicrotask(() => console.log("G"));
});
queueMicrotask(() => console.log("H"));
queueMicrotask(() => console.log("F"));','javascript','["C D H F G","C D F H G","C D G H F"]'::jsonb,null,0,'Urutan nyata: C D H F G. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
const o = { n: 45, get() { return this.n; } };
const g = o.get.bind({ n: 199 });
console.log(g.call({ n: 249 }));','javascript','["199","45","249"]'::jsonb,null,0,'bind menetapkan this secara permanen; call() tidak bisa menimpanya, jadi hasilnya nilai pada objek yang di-bind.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 7 percobaan ulang
base = 100 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(3000, base * 2**i)   # i = 0, 1, 2, …','python','["9100","12100","12700"]'::jsonb,null,0,'Jeda: 100, 200, 400, 800, 1600, 3000, 3000 ms → total 9100 ms (cap 3000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Eka, Medan) (2, Hana, Bandung) (3, Budi, Padang) (4, Fajar, Padang) (5, Citra, Padang) (6, Ayu, Bandung)
-- pesanan(id, pelanggan_id, total, status)
(1, 3, 20, batal) (2, 3, 80, batal) (3, 5, 20, batal) (4, NULL, 90, lunas) (5, 5, 40, batal) (6, 2, 30, lunas) (7, 5, 30, batal)

SELECT COUNT(*), COUNT(o.id), COUNT(DISTINCT p.id)
FROM pelanggan p LEFT JOIN pesanan o ON o.pelanggan_id = p.id;','sql','["9,9,6","9,6,6","6,9,6"]'::jsonb,null,1,'COUNT(*) menghitung semua baris hasil join (satu pelanggan tampil sebanyak pesanannya, atau sekali bila tak punya), COUNT(kolom) melewati NULL, COUNT(DISTINCT) menghilangkan duplikat. Hasil: 9,6,6.',null,'Mana yang melewati NULL?',null),
('fullstack','guess','Dari daftar ini, nomor mana yang BUKAN pengelola state klien?',null,'1. Zustand
2. Pinia
3. Webpack
4. Playwright
5. Jotai','text','["1 dan 2 dan 4","3 dan 4","2 dan 3 dan 4"]'::jsonb,null,1,'Webpack dan Playwright termasuk kategori lain; Pinia, Zustand, Jotai adalah pengelola state klien.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('fullstack','output','Berapa kali saldo pelanggan dipotong?',null,'// klien: timeout 3 detik, retry maksimal 2 kali
// server memproses TIAP request yang tiba (mengurangi saldo), lalu membalas
// jaringan menghilangkan respons 1 percobaan pertama; respons percobaan ke-2 sampai
POST /bayar  { jumlah: 50000 }   // tanpa Idempotency-Key','http','["2","3","1"]'::jsonb,null,0,'Klien hanya tahu ''tidak ada respons'', bukan ''server belum memproses''. Tiap percobaan yang sampai diproses: 1 yang responsnya hilang + 1 yang berhasil = 2. Idempotency-Key membuat server mengembalikan hasil yang sama (dipotong 1 kali).',null,'Apakah server tahu request itu retry dari yang sebelumnya?',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 6 item
halaman 1 → [100, 99, 98, 97, 96, 95]
# lalu 1 item teratas dihapus sebelum halaman 2 diminta
GET /item?limit=6&offset=6','text','["[92, 91, 90, 89, 88, 87]","[93, 92, 91, 90, 89, 88]","[94, 93, 92, 91, 90, 89]"]'::jsonb,null,1,'Offset menghitung dari posisi, bukan dari item terakhir yang dilihat: penghapusan menggeser daftar naik sehingga ada item yang terlewat.',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','guess','Apakah cookie ini ikut terkirim pada permintaan tersebut?',null,'# dari halaman https://shop.toko.id/keranjang
Set-Cookie: id=7; Secure; HttpOnly

# permintaan berikutnya ke:
https://api.toko.id/akun','http','["Tergantung SameSite saja","Tidak","Ya"]'::jsonb,null,1,'Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (/). Path cocok pada batas ''/''. Secure butuh https. Hasil: tidak terkirim.',null,'Cek berurutan: host, path (aturan batas ''/''), skema.',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 30) (2, A, 40) (3, A, 30) (4, B, 50) (5, B, 20) (6, B, 40)

SELECT id, SUM(nilai) OVER (ORDER BY id) AS s FROM skor ORDER BY id;','sql','["1,30 | 2,70 | 3,100 | 4,50 | 5,70 | 6,110","1,30 | 2,70 | 3,100 | 4,150 | 5,170 | 6,210","1,210 | 2,210 | 3,210 | 4,210 | 5,210 | 6,210"]'::jsonb,null,1,'SUM() OVER (ORDER BY id) adalah jumlah kumulatif (frame default: awal sampai baris saat ini, termasuk seri pada kunci urut). Hasil: 1,30 | 2,70 | 3,100 | 4,150 | 5,170 | 6,210.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (umur, negara, kota);

SELECT * FROM orang
WHERE negara = ''x'' AND kota = ''x'';','sql','["0","2","1"]'::jsonb,null,0,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 0.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 60 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1760003600, nbf: 1760000090, iss: "auth.toko.id", aud: "web.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Diterima","Ditolak: token kedaluwarsa (exp)","Ditolak: belum berlaku (nbf)"]'::jsonb,null,2,'Cek berurutan: Ditolak: belum berlaku (nbf). exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 3600 detik yang lalu
Cache-Control: stale-while-revalidate=600
(tanpa ETag/Last-Modified)
# resource di server TIDAK berubah; permintaan ulang oleh browser (private cache), navigasi biasa','http','["Request kondisional; server membalas 304 tanpa body","Unduh penuh (200) dari server","Dilayani dari cache (basi) sekarang, revalidasi di latar belakang"]'::jsonb,null,1,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 1 f.txt menjadi "fitur"
main: mengubah baris 1 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_C → LOCK tabel_A → LOCK tabel_B → COMMIT
T2: LOCK tabel_A → LOCK tabel_C → COMMIT
T3: LOCK tabel_C → LOCK tabel_A → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_C → tabel_A"]'::jsonb,null,2,'Graf urutan kunci memuat siklus tabel_A → tabel_C → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.allSettled([bad("A", 15), ok("B", 10), ok("C", 5)])
  .then((r) => console.log("ok", JSON.stringify(r.map((x) => x.status[0] + (x.value ?? x.reason.message)))))
  .catch((e) => console.log("err", e.message));','javascript','["err A","ok [\"rA\",\"fB\",\"fC\"]","ok \"C\""]'::jsonb,null,1,'Promise.allSettled menghasilkan: ok ["rA","fB","fC"]. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 20; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. A: tmpA = counter
3. B: counter = tmpB + 1
4. A: counter = tmpA + 1
5. A: tmpA = counter
6. A: counter = tmpA + 1
7. B: tmpB = counter
8. B: counter = tmpB + 1','python','["22","23","24"]'::jsonb,null,1,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 23, bukan 24. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','output','Apa output kode ini?',null,'const u = new URL("https://app.kampus.ac.id:443/cari?tag=a&tag=b&q=kopi+susu&q2=%20x#h");
console.log(u.origin, u.searchParams.getAll("tag").join("|"), u.searchParams.get("q"), u.searchParams.get("q2").length, u.hash);','javascript','["b kopi susu 2 #h|https://app.kampus.ac.id a","https://app.kampus.ac.id a|b kopi susu 2 #h","https://app.kampus.ac.id a|b kopi susu 1 #h"]'::jsonb,null,1,'Hasil: https://app.kampus.ac.id a|b kopi susu 2 #h. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src https://cdn.toko.id ''unsafe-eval'' ''self''

A. <script>inisiasi()</script>
B. <script nonce="r4nd">inisiasi()</script>
C. <script src="/app.js"></script>  <!-- same-origin -->
F. <button onclick="kirim()">OK</button>
G. eval("1 + 1")  // di dalam skrip yang diizinkan','http','["A B F","A B G","A B C"]'::jsonb,null,0,'Diblokir: A B F. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','output','Berapa p50 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [742,782,498,23,407,24,311,29,624,377,846,529,716,352,800]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["529","498","471"]'::jsonb,null,1,'N=15, rank=⌈50/100×15⌉=8 → 498 ms. Rata-rata (471) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','guess','Halaman akun pengguna (berisi Set-Cookie sesi) ikut di-cache CDN. Dampaknya?',null,'HTTP/1.1 200 OK
Set-Cookie: sid=abc123
Cache-Control: public, max-age=300','http','["Hanya memperlambat byte pertama pada kunjungan pertama pengguna","Pengguna lain bisa menerima respons/cookie sesi orang lain","Tidak ada dampak; CDN selalu mengabaikan header Set-Cookie"]'::jsonb,null,1,'Cache bersama menyajikan satu respons yang sama ke banyak pengguna. Respons per pengguna harus private.',null,'Siapa yang menerima salinan cache itu berikutnya?',null),
('fullstack','guess','Apakah cookie ini ikut dikirim pada permintaan ke toko.web.id?',null,'halaman        : https://toko.id
form POST top-level
tujuan         : https://toko.web.id
Set-Cookie     : sid=1; SameSite=None; Secure; Domain milik tujuan','text','["Tidak, cookie tidak dikirim","Ya, cookie dikirim","Hanya dikirim jika memakai HTTP/2"]'::jsonb,null,1,'Hubungan: cross-origin dan cross-site. Pada konteks same-site cookie selalu dikirim; pada cross-site: Strict tidak pernah, Lax hanya untuk navigasi top-level dengan metode aman (GET), None dikirim (wajib Secure).',null,'Apakah ini same-site? Jika bukan, cek nilai SameSite dan jenis permintaan.',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~1.3.2" }
// versi yang tersedia di registry:
1.3.2  1.3.3  1.3.4  1.3.5  1.4.2  1.4.5  2.5.5','json','["2.5.5","1.3.5","1.4.5"]'::jsonb,null,1,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 1.3.5.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("https://app.toko.id/pesanan", {
  method: "GET",
  headers: { "Accept": "application/json", "X-Token": "t1" },
  credentials: "include",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: https://app.toko.id
Access-Control-Allow-Methods: GET, DELETE
Access-Control-Allow-Headers: x-token, authorization, content-type','javascript','["Request langsung dikirim (tanpa preflight) dan respons boleh dibaca JavaScript","Preflight gagal: request asli tidak pernah dikirim","Same-origin: CORS tidak berlaku, request berhasil"]'::jsonb,null,2,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','output','Apa output kode ini?',null,'Promise.resolve(7)
  .finally(() => 99)
  .then((v) => console.log("v", v));','javascript','["v 8","v 7","undefined"]'::jsonb,null,1,'Dijalankan: v 7.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(8);
  function klik() {
    setN((p) => p * 2);
    setN(n + 5);
    setN((p) => p * 4);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["52","13","84"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=8 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 8 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 52.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("https://api.toko.id/pesanan", {
  method: "PATCH",
  credentials: "omit",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: https://app.toko.id
Access-Control-Allow-Credentials: true
Access-Control-Allow-Methods: GET, PUT
Access-Control-Allow-Headers: x-token, authorization','javascript','["Request asli TERKIRIM ke server, tetapi respons diblokir untuk JavaScript","Preflight gagal: request asli tidak pernah dikirim","Browser mengirim preflight OPTIONS dulu, lalu request asli berhasil"]'::jsonb,null,1,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','output','Berapa query SQL yang dijalankan (200 post, 5 penulis berbeda)?',null,'posts = Post.objects.prefetch_related("penulis")[:200]
for p in posts:
    print(p.penulis.nama)','python','["2","201","1"]'::jsonb,null,0,'prefetch_related memakai query kedua dengan WHERE id IN (...): total 2 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tombol.addEventListener("click", () => log("A"), true);
tombol.addEventListener("click", () => log("B"), true);
luar.addEventListener("click", () => log("C"));
tombol.addEventListener("click", () => log("D"));
luar.addEventListener("click", () => log("E"), true);','javascript','["A B C D E","E A B D C","A B D C E"]'::jsonb,null,1,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: E A B D C.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 3600 detik yang lalu
Cache-Control: private, max-age=600, s-maxage=86400
(tanpa ETag/Last-Modified)
# resource di server TIDAK berubah; permintaan ulang oleh CDN (shared cache)','http','["Request kondisional; server membalas 304 tanpa body","Dilayani dari cache (basi) sekarang, revalidasi di latar belakang","Unduh penuh (200) dari server"]'::jsonb,null,2,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','output','Apa output kode ini?',null,'function f() {
  try { throw new Error("x"); } catch { return "c5"; } finally { return "f30"; }
}
console.log(f());','javascript','["f30","undefined","f31"]'::jsonb,null,0,'Dijalankan: f30.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(8);
  function klik() {
    setN(n + 2);
    setN(n + 2);
    setN(11);
    setN((p) => p + 2);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["14","13","10"]'::jsonb,null,1,'Antrean update diproses berurutan mulai dari n=8 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 8 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 13.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 30) (2, A, 10) (3, B, 40) (4, A, 10) (5, B, 20) (6, B, 10) (7, A, 20)

SELECT id, DENSE_RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,2 | 2,2 | 3,1 | 4,2 | 5,3 | 6,4 | 7,1","1,2 | 2,2 | 3,1 | 4,3 | 5,3 | 6,4 | 7,1","1,2 | 2,3 | 2,1 | 4,2 | 5,3 | 6,4 | 7,1"]'::jsonb,null,0,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,2 | 2,2 | 3,1 | 4,2 | 5,3 | 6,4 | 7,1.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','guess','Apakah cookie ini ikut terkirim pada permintaan tersebut?',null,'# dari halaman https://shop.toko.id/keranjang
Set-Cookie: id=7; Path=/akun/profil; Secure

# permintaan berikutnya ke:
https://api.toko.id/akun','http','["Ya","Tergantung SameSite saja","Tidak"]'::jsonb,null,2,'Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (/). Path cocok pada batas ''/''. Secure butuh https. Hasil: tidak terkirim.',null,'Cek berurutan: host, path (aturan batas ''/''), skema.',null),
('fullstack','output','Berapa p95 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [450,764,827,678,236,732,168,735,187,511,389,877,26,804,345,451,732]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["827","524","877"]'::jsonb,null,2,'N=17, rank=⌈95/100×17⌉=17 → 877 ms. Rata-rata (524) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.all([bad("A", 10), ok("B", 15), bad("C", 5)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["ok \"B\"","ok [\"rA\",\"fB\",\"rC\"]","err C"]'::jsonb,null,2,'Promise.all menghasilkan: err C. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 521 → tiba t=521
"ko": kirim t=84, latensi 552 → tiba t=636
"kop": kirim t=240, latensi 258 → tiba t=498

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"kop\" — query yang diketik paling akhir","\"kop\" — respons yang tiba paling awal","\"ko\" — respons yang tiba paling akhir"]'::jsonb,null,2,'Urutan tiba: "kop" → "k" → "ko". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','output','Berapa kali saldo pelanggan dipotong?',null,'// klien: timeout 3 detik, retry maksimal 3 kali
// server memproses TIAP request yang tiba (mengurangi saldo), lalu membalas
// jaringan menghilangkan respons 3 percobaan pertama; respons percobaan ke-4 sampai
POST /bayar  { jumlah: 50000 }   // tanpa Idempotency-Key','http','["3","4","1"]'::jsonb,null,1,'Klien hanya tahu ''tidak ada respons'', bukan ''server belum memproses''. Tiap percobaan yang sampai diproses: 3 yang responsnya hilang + 1 yang berhasil = 4. Idempotency-Key membuat server mengembalikan hasil yang sama (dipotong 1 kali).',null,'Apakah server tahu request itu retry dari yang sebelumnya?',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'setTimeout(() => console.log("C"), 0);
(async () => {
  console.log("G");
  await null;
  console.log("F");
})();
Promise.resolve().then(() => console.log("A"));
setTimeout(() => {
  console.log("E");
  Promise.resolve().then(() => console.log("D"));
}, 0);','javascript','["G F A C E D","G F A E C D","C G F A E D"]'::jsonb,null,0,'Urutan nyata: G F A C E D. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 8; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. A: tmpA = counter
3. B: counter = tmpB + 1
4. B: tmpB = counter
5. B: counter = tmpB + 1
6. A: counter = tmpA + 1
7. A: tmpA = counter
8. A: counter = tmpA + 1','python','["12","10","11"]'::jsonb,null,1,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 10, bukan 12. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Gita, Medan) (2, Fajar, NULL) (3, Hana, Padang) (4, Citra, Medan) (5, Ayu, Padang)
-- pesanan(id, pelanggan_id, total, status)
(1, 1, 30, lunas) (2, 1, 90, baru) (3, NULL, 80, lunas) (4, 2, 70, batal) (5, NULL, 30, lunas) (6, 2, 80, lunas) (7, 4, 50, lunas) (8, 3, 30, lunas)

SELECT COUNT(*) FROM (
  SELECT kota FROM pelanggan
  UNION ALL
  SELECT kota FROM pelanggan WHERE kota IS NOT NULL
) x
WHERE kota IS NULL OR kota <> ''Padang'';','sql','["2","5","4"]'::jsonb,null,1,'UNION ALL mempertahankan duplikat, UNION menghapusnya; kota <> ''Padang'' bernilai UNKNOWN untuk NULL sehingga perlu IS NULL eksplisit. Hasil: 5.',null,'UNION vs UNION ALL; perbandingan dengan NULL tidak pernah true.',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^0.0.2" }
// versi yang tersedia di registry:
0.0.2  0.0.3  0.1.0  0.1.3  0.2.3  0.2.5  1.0.0  1.0.5','json','["1.0.5","0.0.2","0.0.3"]'::jsonb,null,1,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 0.0.2.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','guess','Dari daftar ini, nomor mana yang BUKAN framework web sisi server?',null,'1. PostgreSQL
2. Flask
3. Laravel
4. MySQL
5. FastAPI','text','["1 dan 3 dan 4","1 dan 4","1 dan 2 dan 3"]'::jsonb,null,1,'PostgreSQL dan MySQL termasuk kategori lain; FastAPI, Flask, Laravel adalah framework web sisi server.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(new URL("../a/x.png?v=2#top", "https://toko.id/b/produk/h.html").href);','javascript','["https://toko.id/b/a/x.png?v=2#top","https://toko.id/b/a/x.png?v=0#top","https://toko.id/b/a/x.png?v=3#top"]'::jsonb,null,0,'Hasil: https://toko.id/b/a/x.png?v=2#top. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 60 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1759999990, nbf: 1760000090, iss: "auth.toko.id", aud: "web.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: audience tidak sesuai","Diterima","Ditolak: belum berlaku (nbf)"]'::jsonb,null,2,'Cek berurutan: Ditolak: belum berlaku (nbf). exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 4 percobaan ulang
base = 500 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(1000, base * 2**i)   # i = 0, 1, 2, …','python','["7500","4500","3500"]'::jsonb,null,2,'Jeda: 500, 1000, 1000, 1000 ms → total 3500 ms (cap 1000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('fullstack','guess','Aplikasi SPA/mobile tanpa rahasia klien melakukan login OAuth 2.0. Alur yang dianjurkan?',null,'// client publik','http','["Implicit flow (token langsung di URL fragment)","Resource Owner Password Credentials","Authorization Code + PKCE"]'::jsonb,null,2,'Klien publik memakai code + PKCE (code_verifier/challenge) agar kode yang dicegat tak bisa ditukar. Implicit sudah ditinggalkan.',null,'Apa yang menggantikan client secret pada klien publik?',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 4 item
halaman 1 → [100, 99, 98, 97]
# lalu 3 item baru (id 101…103) ditambahkan sebelum halaman 2 diminta
GET /item?limit=4&offset=4','text','["[98, 97, 96, 95]","[96, 95, 94, 93]","[99, 98, 97, 96]"]'::jsonb,null,2,'Offset menghitung dari posisi, bukan dari item terakhir yang dilihat: item baru menggeser daftar sehingga item akhir halaman 1 muncul lagi (duplikat).',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src https://cdn.toko.id ''nonce-r4nd''

A. <script>inisiasi()</script>
B. <script nonce="r4nd">inisiasi()</script>
C. <script src="/app.js"></script>  <!-- same-origin -->
D. <script src="https://cdn.toko.id/lib.js"></script>
E. <script src="https://evil.example/x.js"></script>','http','["A C E","A D E","C D E"]'::jsonb,null,0,'Diblokir: A C E. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_C → LOCK tabel_B → COMMIT
T2: LOCK tabel_C → LOCK tabel_A → COMMIT
T3: LOCK tabel_A → LOCK tabel_C → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_C → tabel_A"]'::jsonb,null,2,'Graf urutan kunci memuat siklus tabel_A → tabel_C → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
function buat() {
  return { n: 65, get: () => this.n };
}
const o = buat.call({ n: 154 });
console.log(o.get(), o.n);','javascript','["65 undefined","65 TypeError","154 65"]'::jsonb,null,2,'Arrow memakai this dari fungsi pembungkusnya (buat), yaitu objek yang di-call; bukan objek literal yang dikembalikan. o.n tetap nilai propertinya sendiri.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','guess','Hubungan kedua URL ini?',null,'halaman : https://toko.id
permintaan: https://toko.web.id','text','["cross-origin tetapi same-site","same-origin (dan same-site)","cross-origin dan cross-site"]'::jsonb,null,2,'Origin = skema+host+port; site = eTLD+1 (+ skema). toko.id → toko.id, toko.web.id → toko.web.id. github.io dan vercel.app ada di Public Suffix List, jadi subdomainnya berbeda site.',null,'Public Suffix List menentukan batas site.',null),
('fullstack','output','Apa output kode ini?',null,'const o = { n: 43, toJSON() { return { v: this.n * 2 }; } };
console.log(JSON.stringify({ o, a: [o] }));','javascript','["{\"o\":{\"v\":86},\"a\":[{\"v\":86}]}","{\"o\":{\"v\":87},\"a\":[{\"v\":86}]}","{''o'':{''v'':86},''a'':[{''v'':86}]}"]'::jsonb,null,0,'Hasil: {"o":{"v":86},"a":[{"v":86}]}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 260, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 260
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 260
T1: UPDATE akun SET saldo = x + 10 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 40 WHERE id = 1; COMMIT;','sql','["Gunakan UPDATE atomik","Mengganti COMMIT menjadi ROLLBACK","Menambah indeks pada kolom saldo"]'::jsonb,null,0,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, kota, umur);

SELECT * FROM orang
WHERE kota = ''x'' AND umur > 30 AND negara = ''x'';','sql','["2","4","3"]'::jsonb,null,2,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 3.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 2 f.txt menjadi "fitur"
main: mengubah baris 5 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 900px) 60vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 768px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-2000.jpg","foto-800.jpg","foto-1600.jpg"]'::jsonb,null,2,'Slot = 100vw × 768 = 768px CSS; × DPR 2 = 1536px fisik → kandidat terkecil yang ≥ itu: 1600w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','guess','Manakah kombinasi nomor yang SEMUANYA merupakan pustaka/framework UI?',null,'1. SolidJS
2. Svelte
3. Cypress
4. React
5. Eloquent','text','["2, 3, 4","2, 4, 5","1, 2, 4"]'::jsonb,null,2,'React, Svelte, SolidJS adalah pustaka/framework UI; Eloquent dan Cypress termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('fullstack','output','Berapa saldo akhir?',null,'-- saldo awal = 510, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 510
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 510
T1: UPDATE akun SET saldo = x + 90 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 50 WHERE id = 1; COMMIT;','sql','["600","560","650"]'::jsonb,null,1,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 510+50, sehingga tambahan 90 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tombol.addEventListener("click", () => log("A"));
tengah.addEventListener("click", () => log("B"), true);
tombol.addEventListener("click", () => log("C"));
luar.addEventListener("click", () => log("D"));
tombol.addEventListener("click", () => log("E"));
tombol.addEventListener("click", () => log("F"), true);','javascript','["B F A C E D","A B C D E F","A C E F B D"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: B F A C E D.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^2.4.0" }
// versi yang tersedia di registry:
2.4.0  2.4.2  2.4.3  2.5.0  2.5.2  2.6.0  3.4.0  3.5.1','json','["2.4.3","3.5.1","2.6.0"]'::jsonb,null,2,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 2.6.0.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','guess','Bisakah JavaScript di halaman penyetel membaca cookie ini lewat document.cookie?',null,'Set-Cookie: id=7; Secure; HttpOnly
// dari halaman https://shop.toko.id/akun/profil','http','["Ya, bisa dibaca","Tidak: HttpOnly menyembunyikannya dari JavaScript","Hanya jika SameSite=None"]'::jsonb,null,1,'HttpOnly melarang akses skrip (membatasi dampak XSS) tetapi cookie tetap terkirim ke server.',null,'Atribut mana yang mengatur akses dari JavaScript?',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.allSettled([ok("A", 10), bad("B", 15), ok("C", 5)])
  .then((r) => console.log("ok", JSON.stringify(r.map((x) => x.status[0] + (x.value ?? x.reason.message)))))
  .catch((e) => console.log("err", e.message));','javascript','["err B","ok \"C\"","ok [\"fA\",\"rB\",\"fC\"]"]'::jsonb,null,2,'Promise.allSettled menghasilkan: ok ["fA","rB","fC"]. all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'(async () => {
  console.log("B");
  await null;
  console.log("C");
})();
queueMicrotask(() => console.log("D"));
setTimeout(() => console.log("A"), 0);
queueMicrotask(() => console.log("E"));','javascript','["B C E D A","B C D A E","B C D E A"]'::jsonb,null,2,'Urutan nyata: B C D E A. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src ''unsafe-inline'' https://cdn.toko.id

A. <script>inisiasi()</script>
B. <script nonce="r4nd">inisiasi()</script>
D. <script src="https://cdn.toko.id/lib.js"></script>
E. <script src="https://evil.example/x.js"></script>
G. eval("1 + 1")  // di dalam skrip yang diizinkan','http','["A B G","B E G","A B E"]'::jsonb,null,1,'Diblokir: B E G. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','output','Apa output kode ini?',null,'console.log(new URL("../a/x.png?v=1#top", "https://app.kampus.ac.id/c/b/h.html").href);','javascript','["https://app.kampus.ac.id/c/a/x.png?v=1#top","https://app.kampus.ac.id/c/a/x.png?v=3#top","https://app.kampus.ac.id/c/a/x.png?v=11#top"]'::jsonb,null,0,'Hasil: https://app.kampus.ac.id/c/a/x.png?v=1#top. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 393 → tiba t=393
"ko": kirim t=124, latensi 687 → tiba t=811
"kop": kirim t=224, latensi 532 → tiba t=756

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"k\" — respons yang tiba paling awal","\"kop\" — query yang diketik paling akhir","\"ko\" — respons yang tiba paling akhir"]'::jsonb,null,2,'Urutan tiba: "k" → "kop" → "ko". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 900px) 50vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 360px, device pixel ratio 3; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-480.jpg","foto-1280.jpg","foto-1600.jpg"]'::jsonb,null,1,'Slot = 100vw × 360 = 360px CSS; × DPR 3 = 1080px fisik → kandidat terkecil yang ≥ itu: 1280w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','output','Berapa query SQL yang dijalankan (20 post, 5 penulis berbeda)?',null,'posts = Post.objects.prefetch_related("penulis")[:20]
for p in posts:
    print(p.penulis.nama)','python','["2","21","1"]'::jsonb,null,0,'prefetch_related memakai query kedua dengan WHERE id IN (...): total 2 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 5 f.txt menjadi "fitur"
main: mengubah baris 3 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 5 item
halaman 1 → [100, 99, 98, 97, 96]
# lalu 1 item teratas dihapus sebelum halaman 2 diminta
GET /item?limit=5&offset=5','text','["[94, 93, 92, 91, 90]","[95, 94, 93, 92, 91]","[93, 92, 91, 90, 89]"]'::jsonb,null,0,'Offset menghitung dari posisi, bukan dari item terakhir yang dilihat: penghapusan menggeser daftar naik sehingga ada item yang terlewat.',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 5 percobaan ulang
base = 500 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(3000, base * 2**i)   # i = 0, 1, 2, …','python','["9500","12500","15500"]'::jsonb,null,0,'Jeda: 500, 1000, 2000, 3000, 3000 ms → total 9500 ms (cap 3000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('fullstack','output','Berapa p50 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [551,387,60,824,657,849,323,191,440,818,743,243,576,569,301,163,482,755,369]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["490","482","551"]'::jsonb,null,1,'N=19, rank=⌈50/100×19⌉=10 → 482 ms. Rata-rata (490) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Fajar, NULL) (2, Ayu, Bandung) (3, Citra, Medan) (4, Eka, Medan) (5, Gita, NULL) (6, Dedi, NULL)
-- pesanan(id, pelanggan_id, total, status)
(1, 1, 20, lunas) (2, 4, 80, lunas) (3, 2, 50, baru) (4, 3, 40, batal) (5, 3, 20, batal) (6, 3, 90, lunas) (7, 4, 40, baru) (8, 2, 80, lunas)

SELECT kota, COUNT(*) AS n FROM pelanggan
GROUP BY kota
HAVING COUNT(*) >= 1
ORDER BY n DESC, kota;','sql','["Medan,2 | Bandung,1","NULL,3 | Medan,2","NULL,3 | Medan,2 | Bandung,1"]'::jsonb,null,2,'GROUP BY menganggap semua NULL sebagai satu grup; COUNT(*) menghitungnya, COUNT(kota) tidak. Hasil: NULL,3 | Medan,2 | Bandung,1.',null,'Apakah NULL membentuk grup sendiri?',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
const o = { n: 24, get() { return this.n; } };
const g = o.get;
try { console.log(g()); } catch (e) { console.log(e.name); }','javascript','["ReferenceError","object","TypeError"]'::jsonb,null,2,'g() dipanggil tanpa receiver; di strict mode this = undefined sehingga this.n melempar TypeError.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, umur, kota);

SELECT * FROM orang
WHERE kota > 30 AND umur = ''x'';','sql','["2","0","1"]'::jsonb,null,1,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 0.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','guess','Apakah cookie ini ikut dikirim pada permintaan ke api.toko.id?',null,'halaman        : https://app.toko.id
pengguna mengeklik tautan (navigasi top-level GET)
tujuan         : https://api.toko.id
Set-Cookie     : sid=1; SameSite=None; Secure; Domain milik tujuan','text','["Hanya dikirim jika memakai HTTP/2","Tidak, cookie tidak dikirim","Ya, cookie dikirim"]'::jsonb,null,2,'Hubungan: cross-origin tetapi same-site. Pada konteks same-site cookie selalu dikirim; pada cross-site: Strict tidak pernah, Lax hanya untuk navigasi top-level dengan metode aman (GET), None dikirim (wajib Secure).',null,'Apakah ini same-site? Jika bukan, cek nilai SameSite dan jenis permintaan.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 600 detik yang lalu
Cache-Control: no-cache, private, max-age=3600, s-maxage=86400
ETag: "v7"
# resource di server TIDAK berubah; permintaan ulang oleh browser (private cache), navigasi biasa','http','["Dilayani dari cache tanpa request ke jaringan","Request kondisional; server membalas 304 tanpa body","Dilayani dari cache (basi) sekarang, revalidasi di latar belakang"]'::jsonb,null,1,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(7);
  function klik() {
    setN(n + 5);
    setN(n + 3);
    setN((p) => p * 2);
    setN((p) => p + 3);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["23","33","10"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=7 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 7 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 23.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 60 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1759999990, nbf: 1759999980, iss: "auth.toko.id", aud: "web.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: audience tidak sesuai","Ditolak: token kedaluwarsa (exp)","Ditolak: belum berlaku (nbf)"]'::jsonb,null,0,'Cek berurutan: Ditolak: audience tidak sesuai. exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(JSON.stringify({ b: 33, a: 2, 1: "x" }, ["a", "b"]), JSON.stringify([new Date(0)]), JSON.stringify("\u00e9\n"));','javascript','["{\"a\":3,\"b\":33} [\"1970-01-01T00:00:00.000Z\"] \"é\\n\"","{\"a\":2,\"b\":33} [\"1970-01-01T00:00:00.000Z\"] \"é\\n\"","{''a'':2,''b'':33} [''1970-01-01T00:00:00.000Z''] ''é\\n''"]'::jsonb,null,1,'Hasil: {"a":2,"b":33} ["1970-01-01T00:00:00.000Z"] "é\n". JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','output','Berapa kali saldo pelanggan dipotong?',null,'// klien: timeout 3 detik, retry maksimal 2 kali
// server memproses TIAP request yang tiba (mengurangi saldo), lalu membalas
// jaringan menghilangkan respons 2 percobaan pertama; respons percobaan ke-3 sampai
POST /bayar  { jumlah: 50000 }   // tanpa Idempotency-Key','http','["2","1","3"]'::jsonb,null,2,'Klien hanya tahu ''tidak ada respons'', bukan ''server belum memproses''. Tiap percobaan yang sampai diproses: 2 yang responsnya hilang + 1 yang berhasil = 3. Idempotency-Key membuat server mengembalikan hasil yang sama (dipotong 1 kali).',null,'Apakah server tahu request itu retry dari yang sebelumnya?',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 7; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. A: tmpA = counter
3. A: counter = tmpA + 1
4. A: tmpA = counter
5. A: counter = tmpA + 1
6. B: counter = tmpB + 1
7. B: tmpB = counter
8. B: counter = tmpB + 1','python','["11","9","10"]'::jsonb,null,1,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 9, bukan 11. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','output','Apa output kode ini?',null,'function f() {
  try { throw new Error("x"); } catch { return "c3"; } finally { return "f56"; }
}
console.log(f());','javascript','["f57","f56","undefined"]'::jsonb,null,1,'Dijalankan: f56.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("https://api.toko.id:8443/pesanan", {
  method: "POST",
  headers: { "Content-Type": "application/json", "Accept": "application/json" },
  credentials: "include",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: https://lain.id
Access-Control-Allow-Methods: DELETE, GET, PUT
Access-Control-Allow-Headers: x-token, content-type','javascript','["Same-origin: CORS tidak berlaku, request berhasil","Preflight gagal: request asli tidak pernah dikirim","Request asli TERKIRIM ke server, tetapi respons diblokir untuk JavaScript"]'::jsonb,null,1,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','guess','Dasbor pribadi setelah login, data spesifik pengguna, tidak perlu SEO. Strategi render yang paling wajar?',null,'// Next.js','javascript','["Menyimpan HTML dasbor di CDN publik untuk semua pengguna","CSR (atau SSR dinamis berbasis sesi)","SSG tanpa autentikasi"]'::jsonb,null,1,'Konten bergantung pengguna tidak boleh dicache bersama. Render di klien atau server per-permintaan dengan cache private.',null,'Apakah konten sama untuk semua orang?',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_C → LOCK tabel_B → COMMIT
T2: LOCK tabel_C → LOCK tabel_B → COMMIT
T3: LOCK tabel_A → LOCK tabel_B → LOCK tabel_C → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: urutan penguncian membentuk siklus tabel_B → tabel_C → tabel_B","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten"]'::jsonb,null,0,'Graf urutan kunci memuat siklus tabel_B → tabel_C → tabel_B: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 10) (2, B, 20) (3, A, 20) (4, B, 20) (5, A, 20) (6, B, 50)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,10 | 2,0 | 3,0 | 4,30 | 5,0 | 6,0","1,0 | 2,10 | 3,0 | 4,0 | 5,0 | 6,30","1,10 | 2,10 | 3,20 | 4,0 | 5,0 | 6,30"]'::jsonb,null,1,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,10 | 3,0 | 4,0 | 5,0 | 6,30.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 120 detik yang lalu
Cache-Control: no-cache, max-age=3600
ETag: "v7"
# resource di server TIDAK berubah; permintaan ulang oleh browser (private cache), navigasi biasa','http','["Unduh penuh (200) dari server","Dilayani dari cache (basi) sekarang, revalidasi di latar belakang","Request kondisional; server membalas 304 tanpa body"]'::jsonb,null,2,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'Promise.resolve().then(() => {
  console.log("D");
  queueMicrotask(() => console.log("E"));
});
setTimeout(() => console.log("H"), 0);
setTimeout(() => console.log("C"), 0);
setTimeout(() => {
  console.log("A");
  Promise.resolve().then(() => console.log("F"));
}, 0);','javascript','["E D H C A F","D E A F H C","D E H C A F"]'::jsonb,null,2,'Urutan nyata: D E H C A F. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(4);
  function klik() {
    setN((p) => p * 4);
    setN(n + 5);
    setN(n + 2);
    setN(n + 5);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["9","16","28"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=4 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 4 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 9.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(new URL("../c/x.png?v=3#top", "https://toko.id/produk/a/h.html").href);','javascript','["https://toko.id/produk/c/x.png?v=2#top","https://toko.id/produk/c/x.png?v=3#top","https://toko.id/produk/c/x.png?v=5#top"]'::jsonb,null,1,'Hasil: https://toko.id/produk/c/x.png?v=3#top. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Ayu, Padang) (2, Budi, Bandung) (3, Gita, NULL) (4, Hana, Medan) (5, Eka, Bandung)
-- pesanan(id, pelanggan_id, total, status)
(1, 3, 90, baru) (2, NULL, 80, baru) (3, 4, 50, baru) (4, 1, 70, lunas) (5, 3, 80, lunas) (6, 1, 40, lunas) (7, 3, 60, lunas) (8, 1, 60, batal) (9, NULL, 40, lunas)

SELECT COUNT(*) FROM (
  SELECT kota FROM pelanggan
  UNION ALL
  SELECT kota FROM pelanggan WHERE kota IS NOT NULL
) x
WHERE kota IS NULL OR kota <> ''Padang'';','sql','["7","3","6"]'::jsonb,null,0,'UNION ALL mempertahankan duplikat, UNION menghapusnya; kota <> ''Padang'' bernilai UNKNOWN untuk NULL sehingga perlu IS NULL eksplisit. Hasil: 7.',null,'UNION vs UNION ALL; perbandingan dengan NULL tidak pernah true.',null),
('fullstack','output','Berapa p50 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [888,579,548,349,791,243,218,244,106,859,199]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["457","349","548"]'::jsonb,null,1,'N=11, rank=⌈50/100×11⌉=6 → 349 ms. Rata-rata (457) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^0.0.2" }
// versi yang tersedia di registry:
0.0.2  0.0.3  0.1.0  0.1.3  1.1.0  1.1.4  1.2.2','json','["0.0.2","0.0.3","1.2.2"]'::jsonb,null,0,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 0.0.2.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','output','Apa output kode ini?',null,'Promise.resolve(1)
  .finally(() => 50)
  .then((v) => console.log("v", v));','javascript','["v 2","v 1","undefined"]'::jsonb,null,1,'Dijalankan: v 1.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','guess','Bisakah JavaScript di halaman penyetel membaca cookie ini lewat document.cookie?',null,'Set-Cookie: id=7; Domain=toko.id; Secure
// dari halaman https://shop.toko.id/akun/profil','http','["Hanya jika SameSite=None","Ya, bisa dibaca","Tidak: hanya server yang bisa"]'::jsonb,null,1,'Tanpa HttpOnly, skrip pada halaman yang cocok domain/path bisa membacanya (risiko XSS).',null,'Atribut mana yang mengatur akses dari JavaScript?',null),
('fullstack','output','Berapa query SQL yang dijalankan (50 post, 6 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:50]
for p in posts:
    print(p.penulis.nama)','python','["2","51","1"]'::jsonb,null,2,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tengah.addEventListener("click", (e) => { log("A"); e.stopPropagation(); }, true);
tombol.addEventListener("click", () => log("B"));
tengah.addEventListener("click", () => log("C"));
luar.addEventListener("click", () => log("D"), true);
luar.addEventListener("click", () => log("E"), true);
tengah.addEventListener("click", () => log("F"), true);','javascript','["D E A F","A D E F","B A C F"]'::jsonb,null,0,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: D E A F.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("https://api.toko.id/pesanan", {
  method: "PATCH",
  credentials: "omit",
});

// header respons server (preflight dan respons asli sama):
(tanpa Access-Control-Allow-Origin)
Access-Control-Allow-Methods: PATCH, PUT
Access-Control-Allow-Headers: x-token, authorization','javascript','["Request asli TERKIRIM ke server, tetapi respons diblokir untuk JavaScript","Request langsung dikirim (tanpa preflight) dan respons boleh dibaca JavaScript","Preflight gagal: request asli tidak pernah dikirim"]'::jsonb,null,2,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','guess','Hubungan kedua URL ini?',null,'halaman : https://toko.id
permintaan: https://toko.id:8443','text','["cross-origin tetapi same-site","same-origin (dan same-site)","cross-origin dan cross-site"]'::jsonb,null,0,'Origin = skema+host+port; site = eTLD+1 (+ skema). toko.id → toko.id, toko.id → toko.id. github.io dan vercel.app ada di Public Suffix List, jadi subdomainnya berbeda site.',null,'Public Suffix List menentukan batas site.',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 5 f.txt menjadi "fitur"
main: mengubah baris 5 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.race([ok("A", 5), ok("B", 15), ok("C", 10)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["ok [\"fA\",\"fB\",\"fC\"]","ok \"A\"","ok [\"A\",\"B\",\"C\"]"]'::jsonb,null,1,'Promise.race menghasilkan: ok "A". all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','output','Berapa kali saldo pelanggan dipotong?',null,'// klien: timeout 3 detik, retry maksimal 3 kali
// server memproses TIAP request yang tiba (mengurangi saldo), lalu membalas
// jaringan menghilangkan respons 2 percobaan pertama; respons percobaan ke-3 sampai
POST /bayar  { jumlah: 50000 }   // tanpa Idempotency-Key','http','["4","1","3"]'::jsonb,null,2,'Klien hanya tahu ''tidak ada respons'', bukan ''server belum memproses''. Tiap percobaan yang sampai diproses: 2 yang responsnya hilang + 1 yang berhasil = 3. Idempotency-Key membuat server mengembalikan hasil yang sama (dipotong 1 kali).',null,'Apakah server tahu request itu retry dari yang sebelumnya?',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 16; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. B: counter = tmpB + 1
4. B: tmpB = counter
5. A: counter = tmpA + 1
6. B: counter = tmpB + 1
7. A: tmpA = counter
8. A: counter = tmpA + 1','python','["18","20","19"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 19, bukan 20. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 6 percobaan ulang
base = 100 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(3000, base * 2**i)   # i = 0, 1, 2, …','python','["6300","9100","6100"]'::jsonb,null,2,'Jeda: 100, 200, 400, 800, 1600, 3000 ms → total 6100 ms (cap 3000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('fullstack','output','Apa output kode ini?',null,'console.log(JSON.stringify(JSON.parse(''{"a":44,"b":[1,2],"c":{"d":null}}'', (k, v) => (typeof v === "number" ? v + 1 : v))));','javascript','["{\"a\":46,\"b\":[2,3],\"c\":{\"d\":undefined}}","{\"a\":45,\"b\":[2,3],\"c\":{\"d\":null}}","{''a'':45,''b'':[2,3],''c'':{''d'':null}}"]'::jsonb,null,1,'Hasil: {"a":45,"b":[2,3],"c":{"d":null}}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 5 item
halaman 1 → [100, 99, 98, 97, 96]
# lalu 1 item baru (id 101) ditambahkan sebelum halaman 2 diminta
GET /item?limit=5&sebelum_id=96','text','["[95, 94, 93, 92, 91]","[97, 96, 95, 94, 93]","[96, 95, 94, 93, 92]"]'::jsonb,null,0,'Cursor memakai id terakhir yang sudah dilihat sehingga hasil stabil terhadap sisipan/hapus di depan: [95, 94, 93, 92, 91].',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
const o = {
  n: 61,
  list() { return [1].map(() => this.n)[0]; },
};
console.log(o.list());','javascript','["61","252","103"]'::jsonb,null,0,'Arrow function tidak punya this sendiri; ia memakai this dari list() yang dipanggil sebagai o.list().',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','guess','Dari daftar ini, nomor mana yang BUKAN ORM/query builder?',null,'1. Prisma
2. Sequelize
3. Next.js
4. Sass
5. TypeORM','text','["1 dan 4 dan 5","1 dan 3 dan 4","3 dan 4"]'::jsonb,null,2,'Sass dan Next.js termasuk kategori lain; TypeORM, Prisma, Sequelize adalah ORM/query builder.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 621 → tiba t=621
"ko": kirim t=81, latensi 339 → tiba t=420
"kop": kirim t=252, latensi 69 → tiba t=321

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"kop\" — query yang diketik paling akhir","\"kop\" — respons yang tiba paling awal","\"k\" — respons yang tiba paling akhir"]'::jsonb,null,2,'Urutan tiba: "kop" → "ko" → "k". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','guess','Handler scroll berat dipanggil ratusan kali per detik. Teknik yang membatasi eksekusi maksimal sekali per 100 ms?',null,'window.addEventListener("scroll", hitungPosisi);','javascript','["Debounce","Event delegation","Throttle"]'::jsonb,null,2,'Throttle menjamin eksekusi berkala selama pemicu berlangsung.',null,'Tetap berjalan berkala, tetapi lebih jarang.',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src ''nonce-r4nd'' https://cdn.toko.id

A. <script>inisiasi()</script>
B. <script nonce="r4nd">inisiasi()</script>
D. <script src="https://cdn.toko.id/lib.js"></script>
F. <button onclick="kirim()">OK</button>
G. eval("1 + 1")  // di dalam skrip yang diizinkan','http','["A F G","D F G","A B G"]'::jsonb,null,0,'Diblokir: A F G. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 20) (2, A, 30) (3, B, 20) (4, A, 40) (5, B, 40) (6, A, 10) (7, B, 20)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,0 | 2,10 | 3,-10 | 4,20 | 5,0 | 6,-30 | 7,10","1,0 | 2,10 | 3,20 | 4,-30 | 5,-20 | 6,0 | 7,0","1,0 | 2,0 | 3,0 | 4,10 | 5,20 | 6,-30 | 7,-20"]'::jsonb,null,2,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,0 | 3,0 | 4,10 | 5,20 | 6,-30 | 7,-20.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','output','Berapa saldo akhir?',null,'-- saldo awal = 320, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 320
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 320
T1: UPDATE akun SET saldo = x + 80 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 90 WHERE id = 1; COMMIT;','sql','["490","400","410"]'::jsonb,null,2,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 320+90, sehingga tambahan 80 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 1024px) 40vw, 90vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1440px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-1280.jpg","foto-2000.jpg","foto-640.jpg"]'::jsonb,null,0,'Slot = 40vw × 1440 = 576px CSS; × DPR 2 = 1152px fisik → kandidat terkecil yang ≥ itu: 1280w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_B → LOCK tabel_C → LOCK tabel_A → COMMIT
T2: LOCK tabel_C → LOCK tabel_A → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan"]'::jsonb,null,1,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 30 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1760000020, nbf: 1760000010, iss: "auth.toko.id", aud: "web.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: audience tidak sesuai","Ditolak: tanda tangan tidak valid","Diterima"]'::jsonb,null,0,'Cek berurutan: Ditolak: audience tidak sesuai. exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, umur, kota);

SELECT * FROM orang
WHERE negara > 30 AND kota > 30;','sql','["0","2","1"]'::jsonb,null,2,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^2.4.3" }
// versi yang tersedia di registry:
2.4.3  2.4.4  2.4.5  2.5.4  2.6.0  3.4.0  3.6.5','json','["3.6.5","2.4.5","2.6.0"]'::jsonb,null,2,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 2.6.0.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('fullstack','guess','Hubungan kedua URL ini?',null,'halaman : https://a.vercel.app
permintaan: https://b.vercel.app','text','["cross-origin dan cross-site","cross-origin tetapi same-site","same-origin (dan same-site)"]'::jsonb,null,0,'Origin = skema+host+port; site = eTLD+1 (+ skema). a.vercel.app → a.vercel.app, b.vercel.app → b.vercel.app. github.io dan vercel.app ada di Public Suffix List, jadi subdomainnya berbeda site.',null,'Public Suffix List menentukan batas site.',null),
('fullstack','output','Nilai n yang tampil setelah SATU kali klik (React 18, satu batch)?',null,'function Penghitung() {
  const [n, setN] = useState(1);
  function klik() {
    setN(n + 3);
    setN((p) => p + 2);
    setN(27);
    setN(n + 1);
  }
  return <button onClick={klik}>{n}</button>;
}','javascript','["2","7","28"]'::jsonb,null,0,'Antrean update diproses berurutan mulai dari n=1 (snapshot render ini): setN(n + k) selalu menghitung dari snapshot 1 (bukan dari hasil antrean), sedangkan updater (p) => … menerima hasil antrean sebelumnya, dan setN(angka) menimpa. Hasil akhir 2.',null,'Bedakan nilai snapshot n dengan argumen p pada updater. Update dikumpulkan lalu dijalankan berurutan.',null),
('fullstack','output','Urutan output kode ini saat dijalankan di browser/Node?',null,'setTimeout(() => console.log("C"), 0);
(async () => {
  console.log("G");
  await null;
  console.log("F");
})();
console.log("H");
Promise.resolve().then(() => console.log("B"));
setTimeout(() => {
  console.log("E");
  Promise.resolve().then(() => console.log("A"));
}, 0);','javascript','["G H F B C E A","G F H B C E A","C G F H B E A"]'::jsonb,null,0,'Urutan nyata: G H F B C E A. Kode sinkron selesai dulu, lalu seluruh antrean microtask (Promise.then, queueMicrotask, lanjutan await) dikuras habis, baru satu macrotask (setTimeout) dijalankan — microtask yang dibuat di dalam macrotask dikuras sebelum macrotask berikutnya.',null,'Urutan: stack sinkron → semua microtask → satu macrotask → kuras microtask lagi.',null),
('fullstack','guess','Apa yang terjadi pada permintaan ulang?',null,'# respons disimpan 3600 detik yang lalu
Cache-Control: no-store, max-age=3600, stale-while-revalidate=600
ETag: "v7"
# resource di server TIDAK berubah; permintaan ulang oleh browser (private cache), navigasi biasa','http','["Unduh penuh (200) dari server","Dilayani dari cache (basi) sekarang, revalidasi di latar belakang","Dilayani dari cache tanpa request ke jaringan"]'::jsonb,null,0,'no-store: tidak disimpan. no-cache: boleh disimpan tapi WAJIB revalidasi. Kesegaran = max-age (s-maxage hanya untuk shared cache dan menimpa max-age di sana; private melarang CDN menyimpan). Basi + validator → 304; basi tanpa validator → 200 penuh; stale-while-revalidate menyajikan versi basi sementara memperbarui.',null,'Hitung umur vs masa segar; lihat direktif yang menimpa; ada validator tidak?',null),
('fullstack','guess','Sumber mana saja yang DIBLOKIR oleh kebijakan ini?',null,'Content-Security-Policy: default-src ''none''; script-src ''unsafe-eval'' ''unsafe-inline'' https://cdn.toko.id

A. <script>inisiasi()</script>
C. <script src="/app.js"></script>  <!-- same-origin -->
D. <script src="https://cdn.toko.id/lib.js"></script>
E. <script src="https://evil.example/x.js"></script>
F. <button onclick="kirim()">OK</button>','http','["A C","C E","C F"]'::jsonb,null,1,'Diblokir: C E. Aturan: skrip inline hanya jika ''unsafe-inline'' (ABAIKAN bila ada nonce/hash) atau nonce cocok; event handler inline butuh ''unsafe-inline''; eval butuh ''unsafe-eval''; skrip eksternal harus cocok dengan sumber (''self'' atau host). default-src ''none'' menutup sisanya.',null,'Apakah ''unsafe-inline'' masih berlaku bila nonce ada?',null),
('fullstack','output','Apa output kode ini?',null,'console.log(encodeURIComponent("c &=/é"), encodeURI("https://toko.id/produk x?q=a b&r=é"));','javascript','["c%20%26%3D%2F%C3%A9 https://toko.id/produk%20x?q=a%20b&r=%C3%A9","c%21%26%3D%2F%C3%A9 https://toko.id/produk%20x?q=a%20b&r=%C3%A9","c%20%25%3D%2F%C3%A9 https://toko.id/produk%20x?q=a%20b&r=%C3%A9"]'::jsonb,null,0,'Hasil: c%20%26%3D%2F%C3%A9 https://toko.id/produk%20x?q=a%20b&r=%C3%A9. Referensi relatif diselesaikan terhadap base URL; port default dibuang; + dalam query berarti spasi saat di-parse; encodeURIComponent meng-escape lebih banyak karakter daripada encodeURI.',null,'Selesaikan path relatif langkah demi langkah dari base URL.',null),
('fullstack','output','Apa output kode ini?',null,'"use strict";
class A {
  n = 94;
  h = () => this.n;
  m() { return this.n; }
}
const { h, m } = new A();
try { console.log(h(), m()); } catch (e) { console.log(h(), e.name); }','javascript','["94","94 TypeError","94 undefined"]'::jsonb,null,1,'h adalah arrow field yang terikat ke instance; m hasil destructuring kehilangan receiver sehingga this undefined → TypeError.',null,'Siapa yang ada di kiri titik saat fungsi dipanggil? Arrow punya this sendiri?',null),
('fullstack','output','Berapa saldo akhir?',null,'-- saldo awal = 920, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 920
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 920
T1: UPDATE akun SET saldo = x + 70 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 30 WHERE id = 1; COMMIT;','sql','["1020","990","950"]'::jsonb,null,2,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 920+30, sehingga tambahan 70 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('fullstack','guess','Apa yang terjadi?',null,'// halaman: https://app.toko.id
fetch("https://api.toko.id/pesanan", {
  method: "DELETE",
  headers: { "Accept": "application/json" },
  credentials: "omit",
});

// header respons server (preflight dan respons asli sama):
Access-Control-Allow-Origin: *
Access-Control-Allow-Credentials: true
Access-Control-Allow-Methods: DELETE, PATCH
Access-Control-Allow-Headers: x-token, content-type, authorization','javascript','["Request asli TERKIRIM ke server, tetapi respons diblokir untuk JavaScript","Browser mengirim preflight OPTIONS dulu, lalu request asli berhasil","Request langsung dikirim (tanpa preflight) dan respons boleh dibaca JavaScript"]'::jsonb,null,1,'Same-origin = skema+host+port sama. Permintaan ''sederhana'' (GET/HEAD/POST dengan header aman) tidak memakai preflight; yang lain memakai OPTIONS yang harus mengizinkan origin, metode, dan header (Authorization harus disebut eksplisit). Dengan credentials, Allow-Origin tidak boleh ''*'' dan Allow-Credentials harus true. Pada permintaan sederhana, kegagalan CORS hanya memblokir pembacaan respons — server tetap menjalankan request.',null,'Urutkan: same-origin? sederhana atau perlu preflight? origin/credential cocok? metode & header diizinkan?',null),
('fullstack','output','Apa output kode ini?',null,'function f() {
  try { throw new Error("x"); } catch { return "c8"; } finally { return "f76"; }
}
console.log(f());','javascript','["f77","f76","undefined"]'::jsonb,null,1,'Dijalankan: f76.',null,'return di finally menimpa; finally di Promise tidak mengubah nilai kecuali melempar; await melanjutkan sebagai microtask.',null),
('fullstack','output','Berapa query SQL yang dijalankan (50 post, 4 penulis berbeda)?',null,'posts = Post.objects.prefetch_related("penulis")[:50]
for p in posts:
    print(p.penulis.nama)','python','["51","2","1"]'::jsonb,null,1,'prefetch_related memakai query kedua dengan WHERE id IN (...): total 2 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('fullstack','guess','Daftar 100 post memicu 100 query penulis di resolver GraphQL. Solusi umum?',null,'Post.author(post) { return db.user.find(post.authorId) }','javascript','["Menaikkan limit koneksi database","DataLoader: mengelompokkan","Mengganti GraphQL dengan REST saja"]'::jsonb,null,1,'Resolver per-field menyebabkan N+1; batching per tick event loop menyatukan ID menjadi satu query.',null,'Gabungkan ID yang diminta pada tick yang sama.',null),
('fullstack','output','Berapa p99 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [259,579,330,589,390,138,227,744,255,634,76]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["634","744","384"]'::jsonb,null,1,'N=11, rank=⌈99/100×11⌉=11 → 744 ms. Rata-rata (384) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('fullstack','output','Apa output kode ini?',null,'const ok = (v, ms) => new Promise((r) => setTimeout(() => r(v), ms));
const bad = (v, ms) => new Promise((_, j) => setTimeout(() => j(new Error(v)), ms));
Promise.race([ok("A", 15), ok("B", 10), ok("C", 5)])
  .then((r) => console.log("ok", JSON.stringify(r)))
  .catch((e) => console.log("err", e.message));','javascript','["ok \"C\"","ok [\"A\",\"B\",\"C\"]","ok [\"fA\",\"fB\",\"fC\"]"]'::jsonb,null,0,'Promise.race menghasilkan: ok "C". all gagal-cepat pada penolakan pertama; allSettled menunggu semuanya; race mengikuti promise yang pertama selesai (apa pun statusnya); any mengambil yang pertama berhasil.',null,'Siapa yang selesai paling dulu menurut delay, dan combinator mana yang peduli pada status?',null),
('fullstack','guess','Keputusan verifikasi?',null,'// API "api.toko.id" memverifikasi; urutan cek: tanda tangan → exp → nbf → iss → aud
// toleransi selisih jam (clock skew) = 0 detik
waktu_sekarang = 1760000000
tanda_tangan   = VALID
klaim = { exp: 1759999700, nbf: 1759996400, iss: "auth.lain.id", aud: "api.toko.id" }
// issuer yang dipercaya: "auth.toko.id"','javascript','["Ditolak: audience tidak sesuai","Ditolak: issuer tidak sesuai","Ditolak: token kedaluwarsa (exp)"]'::jsonb,null,2,'Cek berurutan: Ditolak: token kedaluwarsa (exp). exp ditolak jika sekarang > exp + skew; nbf ditolak jika sekarang + skew < nbf. Klaim hanya boleh dipercaya SETELAH tanda tangan terverifikasi.',null,'Hitung exp + skew dan nbf − skew terhadap waktu sekarang, berurutan.',null),
('fullstack','guess','Apakah cookie ini ikut terkirim pada permintaan tersebut?',null,'# dari halaman https://shop.toko.id/keranjang
Set-Cookie: id=7; Domain=toko.id

# permintaan berikutnya ke:
https://toko.id/akun/profil/edit','http','["Tergantung SameSite saja","Ya","Tidak"]'::jsonb,null,1,'Tanpa Domain cookie hanya untuk host penyetel (host-only); dengan Domain termasuk subdomain. Tanpa Path, path default = direktori path penyetel (/). Path cocok pada batas ''/''. Secure butuh https. Hasil: terkirim.',null,'Cek berurutan: host, path (aturan batas ''/''), skema.',null),
('fullstack','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, kota, umur);

SELECT * FROM orang
WHERE negara = ''x'' AND umur > 30 AND kota > 30;','sql','["2","1","3"]'::jsonb,null,0,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 2.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('fullstack','guess','Manakah kombinasi nomor yang SEMUANYA merupakan pengelola state klien?',null,'1. Svelte
2. MobX
3. Zustand
4. Jotai
5. FastAPI','text','["1, 4, 5","2, 3, 4","1, 3, 4"]'::jsonb,null,1,'Zustand, Jotai, MobX adalah pengelola state klien; FastAPI dan Svelte termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('fullstack','output','Apa output kode ini?',null,'const o = { n: 34, toJSON() { return { v: this.n * 2 }; } };
console.log(JSON.stringify({ o, a: [o] }));','javascript','["{\"o\":{\"v\":68},\"a\":[{\"v\":68}]}","{''o'':{''v'':68},''a'':[{''v'':68}]}","{\"o\":{\"v\":69},\"a\":[{\"v\":68}]}"]'::jsonb,null,0,'Hasil: {"o":{"v":68},"a":[{"v":68}]}. JSON.stringify membuang undefined/function di properti objek, menjadikannya null di array, mengubah NaN menjadi null, dan memanggil toJSON.',null,'Bedakan perlakuan undefined di objek vs di array.',null),
('fullstack','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Citra, Bandung) (2, Eka, NULL) (3, Ayu, Bandung) (4, Dedi, Medan) (5, Fajar, Bandung)
-- pesanan(id, pelanggan_id, total, status)
(1, 3, 30, lunas) (2, 4, 90, lunas) (3, 4, 30, baru) (4, 3, 60, batal) (5, 4, 60, baru) (6, 1, 90, baru) (7, NULL, 80, lunas) (8, 3, 90, baru) (9, 2, 50, lunas)

SELECT COUNT(*) FROM (
  SELECT kota FROM pelanggan
  UNION ALL
  SELECT kota FROM pelanggan WHERE kota IS NOT NULL
) x
WHERE kota IS NULL OR kota <> ''Padang'';','sql','["3","8","9"]'::jsonb,null,2,'UNION ALL mempertahankan duplikat, UNION menghapusnya; kota <> ''Padang'' bernilai UNKNOWN untuk NULL sehingga perlu IS NULL eksplisit. Hasil: 9.',null,'UNION vs UNION ALL; perbandingan dengan NULL tidak pernah true.',null),
('fullstack','output','Berapa kali saldo pelanggan dipotong?',null,'// klien: timeout 3 detik, retry maksimal 3 kali
// server memproses TIAP request yang tiba (mengurangi saldo), lalu membalas
// jaringan menghilangkan respons 1 percobaan pertama; respons percobaan ke-2 sampai
POST /bayar  { jumlah: 50000 }   // tanpa Idempotency-Key','http','["3","2","1"]'::jsonb,null,1,'Klien hanya tahu ''tidak ada respons'', bukan ''server belum memproses''. Tiap percobaan yang sampai diproses: 1 yang responsnya hilang + 1 yang berhasil = 2. Idempotency-Key membuat server mengembalikan hasil yang sama (dipotong 1 kali).',null,'Apakah server tahu request itu retry dari yang sebelumnya?',null),
('fullstack','guess','Berkas gambar mana yang dipilih browser?',null,'<img
  srcset="foto-320.jpg 320w, foto-480.jpg 480w, foto-640.jpg 640w, foto-800.jpg 800w, foto-1024.jpg 1024w, foto-1280.jpg 1280w, foto-1600.jpg 1600w, foto-2000.jpg 2000w"
  sizes="(min-width: 900px) 40vw, 100vw"
  src="foto-480.jpg" alt="">
<!-- viewport 1366px, device pixel ratio 2; browser memilih kandidat terkecil yang ≥ lebar slot × DPR -->','html','["foto-2000.jpg","foto-640.jpg","foto-1280.jpg"]'::jsonb,null,2,'Slot = 40vw × 1366 = 546px CSS; × DPR 2 = 1093px fisik → kandidat terkecil yang ≥ itu: 1280w.',null,'Hitung lebar slot dari sizes, kalikan DPR, ambil w terkecil yang mencukupi.',null),
('fullstack','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 20) (2, A, 50) (3, A, 30) (4, A, 10) (5, B, 10) (6, A, 40) (7, B, 50) (8, B, 10)

SELECT id, DENSE_RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,2 | 2,1 | 3,3 | 4,4 | 5,3 | 6,2 | 7,1 | 8,3","1,2 | 2,1 | 3,3 | 4,4 | 5,3 | 6,2 | 7,1 | 8,4","1,2 | 2,11 | 3,3 | 4,4 | 5,3 | 6,2 | 7,1 | 8,3"]'::jsonb,null,0,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,2 | 2,1 | 3,3 | 4,4 | 5,3 | 6,2 | 7,1 | 8,3.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('fullstack','output','Item apa yang dikembalikan sebagai halaman 2?',null,'# urut id menurun (terbaru dulu), halaman = 6 item
halaman 1 → [100, 99, 98, 97, 96, 95]
# lalu 3 item baru (id 101…103) ditambahkan sebelum halaman 2 diminta
GET /item?limit=6&sebelum_id=95','text','["[94, 93, 92, 91, 90, 89]","[97, 96, 95, 94, 93, 92]","[96, 95, 94, 93, 92, 91]"]'::jsonb,null,0,'Cursor memakai id terakhir yang sudah dilihat sehingga hasil stabil terhadap sisipan/hapus di depan: [94, 93, 92, 91, 90, 89].',null,'Offset = ''lewati N item dari awal sekarang''; cursor = ''mulai setelah item ini''.',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_A → LOCK tabel_B → COMMIT
T2: LOCK tabel_A → LOCK tabel_B → LOCK tabel_C → COMMIT
T3: LOCK tabel_B → LOCK tabel_A → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_B → tabel_A","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten"]'::jsonb,null,0,'Graf urutan kunci memuat siklus tabel_A → tabel_B → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('fullstack','output','Urutan log setelah tombol diklik?',null,'// DOM: #luar > #tengah > #tombol (pengguna mengklik tombol)
tombol.addEventListener("click", () => log("A"));
luar.addEventListener("click", () => log("B"));
luar.addEventListener("click", () => log("C"));
luar.addEventListener("click", () => log("D"));
tengah.addEventListener("click", () => log("E"), true);','javascript','["A B C D E","E A B C D","A E B C D"]'::jsonb,null,1,'Fase: capture dari luar ke dalam (listener {capture:true}), lalu target (capture dulu, lalu non-capture), lalu bubble dari dalam ke luar. stopPropagation menghentikan node berikutnya tetapi listener lain pada node yang sama tetap jalan; stopImmediatePropagation menghentikan seketika. Hasil: E A B C D.',null,'Tiga fase: capture ↓, target, bubble ↑. Listener capture selalu lebih dulu.',null),
('fullstack','output','Berapa nilai akhir counter?',null,'# counter awal = 1; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. A: counter = tmpA + 1
3. A: tmpA = counter
4. B: tmpB = counter
5. A: counter = tmpA + 1
6. B: counter = tmpB + 1
7. B: tmpB = counter
8. B: counter = tmpB + 1','python','["5","3","4"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 4, bukan 5. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('fullstack','guess','Hasil untuk query mana yang akhirnya tampil di layar (kode di atas, tanpa pengaman)?',null,'// pengguna mengetik "k", "ko", "kop"; tiap ketikan memicu fetch
// waktu kirim & latensi respons (ms):
"k": kirim t=0, latensi 224 → tiba t=224
"ko": kirim t=122, latensi 511 → tiba t=633
"kop": kirim t=221, latensi 225 → tiba t=446

input.oninput = async () => {
  const data = await cari(input.value);
  tampilkan(data);          // dijalankan saat respons tiba
};','javascript','["\"k\" — respons yang tiba paling awal","\"ko\" — respons yang tiba paling akhir","\"kop\" — query yang diketik paling akhir"]'::jsonb,null,1,'Urutan tiba: "k" → "kop" → "ko". Tanpa pengaman, yang tiba terakhir menang meski bukan query terbaru. Gunakan AbortController atau token permintaan untuk membuang respons usang.',null,'Siapa yang memanggil tampilkan() paling akhir, bukan siapa yang dikirim paling akhir?',null),
('fullstack','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 4 f.txt menjadi "fitur"
main: mengubah baris 2 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('fullstack','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_A → LOCK tabel_C → LOCK tabel_B → COMMIT
T2: LOCK tabel_B → LOCK tabel_A → LOCK tabel_C → COMMIT
T3: LOCK tabel_C → LOCK tabel_A → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_C → tabel_B → tabel_A","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten"]'::jsonb,null,1,'Graf urutan kunci memuat siklus tabel_A → tabel_C → tabel_B → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null);
