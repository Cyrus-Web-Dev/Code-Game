-- DIHASILKAN oleh scripts/gen-dev.mjs (backend, bagian 1/4) — 250 soal HARD MODE (v2.4)
-- Bagian 1 menonaktifkan soal Developer Mode lama (v2.1–v2.3) untuk peran ini; jalankan SEMUA bagian.
update questions set active = false where difficulty = 'backend';
insert into questions (difficulty,type,prompt,prompt_en,code,language,options,options_en,correct_index,explanation,explanation_en,hint,hint_en) values
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'for i in range(jumlah):
    for j in range(i):
        work()','python','["O(1)","O(log n)","O(n²)"]'::jsonb,null,2,'Kompleksitas: O(n²). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 630, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 630
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 630
T1: UPDATE akun SET saldo = x + 60 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 40 WHERE id = 1; COMMIT;','sql','["Gunakan UPDATE atomik","Menambah indeks pada kolom saldo","Mengganti COMMIT menjadi ROLLBACK"]'::jsonb,null,0,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^1.1.0" }
// versi yang tersedia di registry:
1.1.0  1.1.1  1.1.2  1.2.0  1.2.2  1.2.3  1.3.0  2.1.0','json','["1.1.2","1.3.0","2.1.0"]'::jsonb,null,1,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 1.3.0.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 20) (2, A, 50) (3, B, 30) (4, B, 30) (5, A, 50) (6, B, 10)

SELECT id, RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,2 | 2,1 | 3,1 | 4,1 | 5,1 | 6,2","1,3 | 2,1 | 3,1 | 4,1 | 5,1 | 6,3","1,3 | 2,1 | 3,1 | 4,2 | 5,2 | 6,3"]'::jsonb,null,1,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,3 | 2,1 | 3,1 | 4,1 | 5,1 | 6,3.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','guess','SLI, SLO, dan SLA — pernyataan yang benar?',null,'# keandalan layanan','text','["SLA adalah pengukuran, SLI adalah kontrak","SLI = pengukuran","Ketiganya sinonim"]'::jsonb,null,1,'Indikator (SLI) diukur; tujuan (SLO) ditargetkan; perjanjian (SLA) mengikat secara kontrak.',null,'Ukuran, target, kontrak.',null),
('backend','output','Apa output kode Python ini?',null,'x = 1
def f():
    try:
        print(x)
    except UnboundLocalError:
        print("unbound")
    x = 2
f()
print([x for x in range(3)][-1], x)','python','["unbound | 2 1","2 1 | unbound","unbound | 2 11"]'::jsonb,null,0,'Variabel yang ditugaskan di dalam fungsi bersifat lokal di SELURUH fungsi sehingga membaca sebelum tugas melempar UnboundLocalError; comprehension punya scope sendiri. Hasil: unbound | 2 1.',null,'Satu fungsi, satu scope lokal: kapan Python memutuskan variabel itu lokal?',null),
('backend','guess','Kode status HTTP paling tepat untuk situasi ini:
Klien mengirim body JSON yang tidak bisa di-parse',null,'# API REST','http','["401 Unauthorized","400 Bad Request","404 Not Found"]'::jsonb,null,1,'400 Bad Request adalah kode yang sesuai dengan semantik situasi tersebut.',null,'Cari kata kunci: salah klien (4xx) atau server (5xx)? autentikasi atau otorisasi?',null),
('backend','output','Berapa kali job ini berjalan pada hari yang cocok (satu hari)?',null,'# menit jam tgl bulan hari-minggu
0,30 8-12 * * *','bash','["10","48","8"]'::jsonb,null,0,'Menit: 2 nilai × jam: 5 nilai = 10. Rentang a-b bersifat inklusif; */n dihitung dari awal rentang.',null,'Hitung nilai menit × nilai jam; rentang inklusif.',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 1; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. B: counter = tmpB + 1
4. B: tmpB = counter
5. B: counter = tmpB + 1
6. A: counter = tmpA + 1
7. A: tmpA = counter
8. A: counter = tmpA + 1','python','["3","5","4"]'::jsonb,null,0,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 3, bukan 5. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','output','Throughput maksimum (query/detik) yang bisa dilayani kolam ini?',null,'kolam_koneksi = 20
rata-rata_query = 10 ms, satu koneksi menangani satu query pada satu waktu','python','["2000","200","2"]'::jsonb,null,0,'Tiap koneksi menyelesaikan 100 query/detik × 20 koneksi = 2000 q/s.',null,'Satu koneksi menyelesaikan 1000/ms query per detik.',null),
('backend','output','Berapa jumlah cache HIT pada cache LRU ini?',null,'kapasitas = 3
akses = ["E","A","F","C","A","A","E","E","F","D"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["3","4","2"]'::jsonb,null,0,'Simulasi LRU: hit=3, isi akhir (lama→baru) = E F D. Pada FIFO hit tidak memperbarui urutan (hit=4).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','output','Berapa request yang DITERIMA?',null,'# Token bucket: kapasitas 3 token, mulai penuh pada detik 0
# isi ulang 2 token/detik (kontinu, maksimum 3); tiap request memakai 1 token
waktu_request = [1,2,2,2,5,7,8,10,11,13]  # detik','python','["3","10","9"]'::jsonb,null,1,'Simulasi: token = min(3, token + Δt×2); request diterima jika token ≥ 1. Diterima 10 dari 10.',null,'Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Ayu, NULL) (2, Budi, Medan) (3, Hana, Medan) (4, Gita, Medan) (5, Dedi, Medan)
-- pesanan(id, pelanggan_id, total, status)
(1, NULL, 90, batal) (2, NULL, 70, lunas) (3, 3, 60, baru) (4, 2, 90, lunas) (5, 2, 40, lunas) (6, 3, 60, lunas) (7, 3, 20, baru)

SELECT p.nama, SUM(o.total)
FROM pelanggan p JOIN pesanan o ON o.pelanggan_id = p.id
WHERE o.status <> ''batal''
GROUP BY p.nama
HAVING SUM(o.total) > 30
ORDER BY p.nama;','sql','["Budi,130 | Hana,140","Budi,2 | Hana,3","Ayu,NULL | Budi,130 | Dedi,NULL | Gita,NULL | Hana,140"]'::jsonb,null,0,'WHERE menyaring baris SEBELUM pengelompokan; HAVING menyaring grup SESUDAH agregasi. Perhatikan status NULL tidak lolos <> ''batal''. Hasil: Budi,130 | Hana,140.',null,'Urutan eksekusi: FROM → WHERE → GROUP BY → HAVING.',null),
('backend','output','Berapa hasil query hierarki ini?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 1) (4, 2) (5, 1) (6, 1) (7, 6) (8, 2)

WITH RECURSIVE r(id, d) AS (
  SELECT id, 0 FROM staf WHERE atasan IS NULL
  UNION ALL
  SELECT s.id, r.d + 1 FROM staf s JOIN r ON s.atasan = r.id
)
SELECT MAX(d) FROM r;','sql','["2","8","3"]'::jsonb,null,0,'Kedalaman pohon (akar = 0) dihitung rekursif; hasil maksimum 2.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_C → LOCK tabel_A → LOCK tabel_B → COMMIT
T2: LOCK tabel_B → LOCK tabel_C → LOCK tabel_A → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_B → tabel_C → tabel_A","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten"]'::jsonb,null,0,'Graf urutan kunci memuat siklus tabel_A → tabel_B → tabel_C → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','output','Berapa kunci yang PINDAH shard saat shard ditambah dari 5 menjadi 6?',null,'# shard = kunci % jumlah_shard
kunci = 0 .. 99
sebelum: shard = kunci % 5
sesudah: shard = kunci % 6','python','["17","80","75"]'::jsonb,null,1,'Dihitung langsung: 80 dari 100 kunci berpindah. Modulo membuat hampir semua kunci pindah; consistent hashing hanya memindahkan ≈ K/(n+1) = 17.',null,'Hitung berapa kunci yang hasil modulo-nya berubah, jangan menebak 1/n.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 6 percobaan ulang
base = 500 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(1000, base * 2**i)   # i = 0, 1, 2, …','python','["5500","6500","31500"]'::jsonb,null,0,'Jeda: 500, 1000, 1000, 1000, 1000, 1000 ms → total 5500 ms (cap 1000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','guess','Dari daftar ini, nomor mana yang BUKAN framework web sisi server?',null,'1. Rails
2. Amazon SQS
3. Express
4. Flask
5. Kafka','text','["2 dan 4 dan 5","1 dan 2 dan 3","2 dan 5"]'::jsonb,null,2,'Amazon SQS dan Kafka termasuk kategori lain; Flask, Rails, Express adalah framework web sisi server.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('backend','guess','Pada kolom yang diberi indeks B-tree biasa, query mana yang BISA memanfaatkan indeks (sargable)?',null,'-- indeks B-tree pada email, kode, dan tgl
SELECT * FROM t
(pilih salah satu klausa WHERE)','sql','["WHERE kode >= 100 AND kode < 200","WHERE CAST(kode AS TEXT) = ''150''","WHERE email LIKE ''%budi''"]'::jsonb,null,0,'WHERE kode >= 100 AND kode < 200 membandingkan kolom apa adanya atau dengan prefiks/rentang sehingga B-tree bisa di-seek. Membungkus kolom dengan fungsi/aritmetika, LIKE berawalan wildcard, atau <> memaksa pemindaian.',null,'Apakah kolom dibiarkan ''telanjang'' di sisi perbandingan?',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 5 f.txt menjadi "fitur"
main: mengubah baris 5 f.txt menjadi "fitur" (isi IDENTIK, commit sendiri)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Berapa query SQL yang dijalankan (20 post, 7 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:20]
for p in posts:
    print(p.penulis.nama)','python','["2","21","1"]'::jsonb,null,2,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','guess','Jenis kerentanan/serangan apa ini?',null,'CNAME blog.toko.id masih menunjuk ke layanan hosting yang sudah dihapus; pihak lain mendaftarkan nama itu dan menayangkan konten di subdomain Anda.','text','["SQL Injection","Subdomain takeover","CSRF"]'::jsonb,null,1,'Subdomain takeover: Hapus catatan DNS yang menggantung saat layanan dinonaktifkan.',null,'Apa yang dikendalikan penyerang, dan di mana ia dieksekusi?',null),
('backend','guess','Apa risiko kode Laravel ini?',null,'User::create($request->all());   // tabel punya kolom is_admin','php','["Mass assignment: pengguna bisa mengirim is_admin=1","Tidak ada risiko; Eloquent mengabaikan kolom tak dikenal","Hanya risiko performa karena all() lambat"]'::jsonb,null,0,'all() menyertakan semua input. Tanpa daftar fillable/validated, atribut sensitif bisa disetel penyerang.',null,'Siapa menentukan field mana yang boleh diisi?',null),
('backend','output','Berapa p99 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [523,65,790,425,409,39,157,282,767,719,706,334,80,443,310]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["767","790","403"]'::jsonb,null,1,'N=15, rank=⌈99/100×15⌉=15 → 790 ms. Rata-rata (403) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'queueMicrotask(() => console.log("A"));
console.log("D");
process.nextTick(() => { console.log("F"); Promise.resolve().then(() => console.log("undefined")); });
process.nextTick(() => { console.log("undefined"); Promise.resolve().then(() => console.log("undefined")); });
console.log("undefined");','javascript','["A D F","A D F undefined undefined undefined undefined","D undefined F undefined A undefined undefined"]'::jsonb,null,2,'Urutan: D undefined F undefined A undefined undefined. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 4 percobaan ulang
base = 200 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(1000, base * 2**i)   # i = 0, 1, 2, …','python','["2400","3000","3400"]'::jsonb,null,0,'Jeda: 200, 400, 800, 1000 ms → total 2400 ms (cap 1000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','guess','Menurut standar SQL, anomali apa yang MASIH mungkin terjadi pada level READ UNCOMMITTED?',null,'SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;','sql','["phantom read","non-repeatable read, phantom read","dirty read, non-repeatable read, phantom read"]'::jsonb,null,2,'Standar SQL: READ UNCOMMITTED mengizinkan ketiganya; READ COMMITTED mencegah dirty read; REPEATABLE READ juga mencegah non-repeatable read; SERIALIZABLE mencegah semuanya. (Implementasi nyata, mis. PostgreSQL, bisa lebih ketat.)',null,'Semakin tinggi level, semakin sedikit anomali yang tersisa.',null),
('backend','output','Apa output kode Python ini?',null,'kata = ["kopi", "teh", "susu", "air", "jus", "kola"]
print(sorted(kata, key=len), sorted(kata, key=lambda s: (-len(s), s))[:2])','python','["[''teh'', ''jus'', ''air'', ''kopi'', ''susu'', ''kola''] [''kola'', ''kopi'']","[''teh'', ''air'', ''jus'', ''kopi'', ''susu'', ''kola''] [''kola'', ''kopi'']","[''teh'', ''air'', ''jus'', ''kopi'', ''susu'', ''kopi''], ''kola''] [''kola''"]'::jsonb,null,1,'sorted() stabil: elemen dengan kunci sama mempertahankan urutan semula. Hasil: [''teh'', ''air'', ''jus'', ''kopi'', ''susu'', ''kola''] [''kola'', ''kopi''].',null,'Apa arti sort stabil?',null),
('backend','output','Berapa request yang diterima oleh FIXED WINDOW (jendela [0,10), [10,20), …)?',null,'# batas 5 request per 10 detik
waktu_request = [1,1,2,5,7,10,11,11,12,12,13]  # detik','python','["10","8","11"]'::jsonb,null,0,'Fixed window mereset hitungan pada batas kelipatan 10 detik (menerima 10); sliding window menimbang 10 detik terakhir (menerima 8). Fixed window dapat meloloskan 2×5 request di sekitar batas jendela.',null,'Reset terjadi pada kelipatan tetap, bukan relatif terhadap tiap request.',null),
('backend','output','Berapa jumlah cache HIT pada cache LRU ini?',null,'kapasitas = 3
akses = ["A","E","D","E","B","B","E","B","D","B","B","D"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["8","9","7"]'::jsonb,null,0,'Simulasi LRU: hit=8, isi akhir (lama→baru) = E B D. Pada FIFO hit tidak memperbarui urutan (hit=8).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 8 f.txt menjadi "fitur"
main: mengubah baris 5 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Berapa kunci yang PINDAH shard saat shard ditambah dari 5 menjadi 6?',null,'# shard = kunci % jumlah_shard
kunci = 0 .. 59
sebelum: shard = kunci % 5
sesudah: shard = kunci % 6','python','["54","50","10"]'::jsonb,null,1,'Dihitung langsung: 50 dari 60 kunci berpindah. Modulo membuat hampir semua kunci pindah; consistent hashing hanya memindahkan ≈ K/(n+1) = 10.',null,'Hitung berapa kunci yang hasil modulo-nya berubah, jangan menebak 1/n.',null),
('backend','output','Berapa kali job ini berjalan pada hari yang cocok (satu hari)?',null,'# menit jam tgl bulan hari-minggu
*/20 8-18/2 * * 1-5','bash','["72","18","15"]'::jsonb,null,1,'Menit: 3 nilai × jam: 6 nilai = 18. Rentang a-b bersifat inklusif; */n dihitung dari awal rentang.',null,'Hitung nilai menit × nilai jam; rentang inklusif.',null),
('backend','fill','Lengkapi middleware penanganan galat Express (empat parameter):',null,'app.use((____, req, res, next) => {
  res.status(500).json({ pesan: "galat" });
});','javascript','["next","err","done"]'::jsonb,null,1,'Express mengenali penanganan galat dari tanda tangan 4 parameter dengan galat sebagai yang pertama.',null,'Parameter pertama pada middleware galat.',null),
('backend','output','Berapa hasil query hierarki ini?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 1) (4, 1) (5, 4) (6, 1)

WITH RECURSIVE r(id, d) AS (
  SELECT id, 0 FROM staf WHERE atasan IS NULL
  UNION ALL
  SELECT s.id, r.d + 1 FROM staf s JOIN r ON s.atasan = r.id
)
SELECT MAX(d) FROM r;','sql','["6","2","3"]'::jsonb,null,1,'Kedalaman pohon (akar = 0) dihitung rekursif; hasil maksimum 2.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Rata-rata request yang sedang diproses bersamaan (in-flight)?',null,'# hukum Little: L = λ × W
λ = 2000 request/detik
W = 40 ms rata-rata per request','python','["80000","80","50"]'::jsonb,null,1,'L = 2000 × 0.04 s = 80.',null,'Samakan satuan waktu dulu: ms → detik.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (kota, umur, negara);

SELECT * FROM orang
WHERE kota = ''x'' AND umur > 30;','sql','["1","2","3"]'::jsonb,null,1,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 2.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Gita, NULL) (2, Budi, NULL) (3, Citra, Padang) (4, Ayu, Medan) (5, Fajar, Bandung) (6, Eka, Padang)
-- pesanan(id, pelanggan_id, total, status)
(1, NULL, 90, batal) (2, NULL, 90, lunas) (3, 5, 40, batal) (4, 3, 70, batal) (5, 3, 70, lunas) (6, 3, 20, baru) (7, 1, 60, lunas) (8, 3, 60, batal) (9, NULL, 50, batal)

SELECT kota, COUNT(*) AS n FROM pelanggan
GROUP BY kota
HAVING COUNT(*) >= 1
ORDER BY n DESC, kota;','sql','["NULL,2 | Padang,2","NULL,2 | Padang,2 | Bandung,1 | Medan,1","Padang,2 | Bandung,1 | Medan,1"]'::jsonb,null,1,'GROUP BY menganggap semua NULL sebagai satu grup; COUNT(*) menghitungnya, COUNT(kota) tidak. Hasil: NULL,2 | Padang,2 | Bandung,1 | Medan,1.',null,'Apakah NULL membentuk grup sendiri?',null),
('backend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan framework web sisi server?',null,'1. FastAPI
2. Rails
3. ActiveMQ
4. Spring Boot
5. Firestore','text','["1, 3, 4","1, 2, 4","2, 3, 4"]'::jsonb,null,1,'Rails, FastAPI, Spring Boot adalah framework web sisi server; Firestore dan ActiveMQ termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_A → LOCK tabel_C → LOCK tabel_B → COMMIT
T2: LOCK tabel_A → LOCK tabel_C → COMMIT
T3: LOCK tabel_C → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan"]'::jsonb,null,1,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 20; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. B: counter = tmpB + 1
4. B: tmpB = counter
5. B: counter = tmpB + 1
6. A: counter = tmpA + 1
7. A: tmpA = counter
8. A: counter = tmpA + 1','python','["23","24","22"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 22, bukan 24. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^2.4.0" }
// versi yang tersedia di registry:
2.4.0  2.4.1  2.4.2  2.4.3  2.6.0  3.4.3  3.5.3','json','["2.6.0","3.5.3","2.4.3"]'::jsonb,null,0,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 2.6.0.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'console.log("E");
Promise.resolve().then(() => console.log("B"));
console.log("C");
queueMicrotask(() => console.log("undefined"));
Promise.resolve().then(() => console.log("undefined"));','javascript','["E B C","E C B undefined undefined","B C E undefined undefined"]'::jsonb,null,1,'Urutan: E C B undefined undefined. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','guess','Kode status HTTP paling tepat untuk situasi ini:
Gateway menerima respons rusak dari server upstream',null,'# API REST','http','["500 Internal Server Error","503 Service Unavailable","502 Bad Gateway"]'::jsonb,null,2,'502 Bad Gateway adalah kode yang sesuai dengan semantik situasi tersebut.',null,'Cari kata kunci: salah klien (4xx) atau server (5xx)? autentikasi atau otorisasi?',null),
('backend','output','Berapa p95 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [441,166,270,825,256,696,224,150,896,90,488]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["825","896","409"]'::jsonb,null,1,'N=11, rank=⌈95/100×11⌉=11 → 896 ms. Rata-rata (409) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'hasil = []
for i in range(N):
    hasil.insert(0, i)','python','["O(log n)","O(n²)","O(1)"]'::jsonb,null,1,'Kompleksitas: O(n²). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Berapa query SQL yang dijalankan (50 post, 4 penulis berbeda)?',null,'posts = Post.objects.all()[:50]
for p in posts:
    print(p.penulis.nama)        # relasi ForeignKey, lazy','python','["2","1","51"]'::jsonb,null,2,'Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 10) (2, A, 50) (3, A, 20) (4, B, 50) (5, A, 20) (6, A, 40) (7, A, 30) (8, B, 30)

SELECT id, RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,3 | 2,1 | 3,4 | 4,1 | 5,5 | 6,2 | 7,3 | 8,2","1,3 | 2,3 | 1,4 | 4,1 | 5,4 | 6,2 | 7,3 | 8,2","1,3 | 2,1 | 3,4 | 4,1 | 5,4 | 6,2 | 7,3 | 8,2"]'::jsonb,null,2,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,3 | 2,1 | 3,4 | 4,1 | 5,4 | 6,2 | 7,3 | 8,2.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','guess','Jenis kerentanan/serangan apa ini?',null,'GET /unduh?berkas=../../etc/passwd mengembalikan isi berkas sistem.','text','["SQL Injection","CSRF","Path Traversal"]'::jsonb,null,2,'Path Traversal: Normalisasi path, batasi ke direktori dasar, dan jangan pakai input langsung sebagai nama berkas.',null,'Apa yang dikendalikan penyerang, dan di mana ia dieksekusi?',null),
('backend','guess','Apa yang terjadi saat kode Go ini dijalankan?',null,'var m map[string]int
fmt.Println(m["a"])
m["a"] = 1','go','["Mencetak 0 lalu panic","Mencetak 0 dan menyimpan a=1","Panic pada baris pembacaan"]'::jsonb,null,0,'Membaca dari nil map aman (nilai nol); menulis ke nil map menyebabkan panic. Inisialisasi dengan make.',null,'Bedakan membaca dan menulis pada nil map.',null),
('backend','guess','Mitigasi UTAMA untuk kasus ini?
CNAME blog.toko.id masih menunjuk ke layanan hosting yang sudah dihapus; pihak lain mendaftarkan nama itu dan menayangkan konten di subdomain Anda.',null,'# keamanan aplikasi web','text','["Hapus catatan DNS yang menggantung saat layanan dinonaktifkan","Rate limiting, MFA, pemantauan login anomali, dan pengecekan kata sandi bocor","Jangan deserialisasi data tak tepercaya dengan format yang bisa menjalankan kode; pakai JSON dan tanda tangan"]'::jsonb,null,0,'Mitigasi yang tepat untuk Subdomain takeover: Hapus catatan DNS yang menggantung saat layanan dinonaktifkan.',null,'Akar masalahnya: Subdomain takeover.',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Gita, Bandung) (2, Eka, Medan) (3, Dedi, Bandung) (4, Citra, NULL) (5, Budi, NULL) (6, Fajar, NULL)
-- pesanan(id, pelanggan_id, total, status)
(1, 1, 60, lunas) (2, NULL, 30, baru) (3, 2, 50, baru) (4, 4, 40, lunas) (5, NULL, 20, lunas) (6, 4, 90, lunas) (7, 3, 70, batal) (8, 5, 90, baru)

SELECT kota, COUNT(*) AS n FROM pelanggan
GROUP BY kota
HAVING COUNT(*) >= 2
ORDER BY n DESC, kota;','sql','["NULL,3 | Bandung,2","NULL,3","Bandung,2"]'::jsonb,null,0,'GROUP BY menganggap semua NULL sebagai satu grup; COUNT(*) menghitungnya, COUNT(kota) tidak. Hasil: NULL,3 | Bandung,2.',null,'Apakah NULL membentuk grup sendiri?',null),
('backend','output','Berapa jumlah cache HIT pada cache LRU ini?',null,'kapasitas = 4
akses = ["E","C","A","D","D","F","C","E","F","C","F","C"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["7","6","5"]'::jsonb,null,1,'Simulasi LRU: hit=6, isi akhir (lama→baru) = D E F C. Pada FIFO hit tidak memperbarui urutan (hit=5).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 4 percobaan ulang
base = 250 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(1000, base * 2**i)   # i = 0, 1, 2, …','python','["2500","2750","3750"]'::jsonb,null,1,'Jeda: 250, 500, 1000, 1000 ms → total 2750 ms (cap 1000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_B → LOCK tabel_A → COMMIT
T2: LOCK tabel_A → LOCK tabel_C → COMMIT
T3: LOCK tabel_B → LOCK tabel_C → LOCK tabel_A → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_C → tabel_A"]'::jsonb,null,2,'Graf urutan kunci memuat siklus tabel_A → tabel_C → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^0.0.4" }
// versi yang tersedia di registry:
0.0.4  0.0.5  0.1.0  0.1.7  0.2.0  0.2.5  1.0.7  1.1.6','json','["0.0.5","0.0.4","1.1.6"]'::jsonb,null,1,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 0.0.4.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 40) (2, A, 10) (3, A, 40) (4, A, 10) (5, B, 30) (6, A, 20) (7, A, 50)

SELECT id, SUM(nilai) OVER (ORDER BY id) AS s FROM skor ORDER BY id;','sql','["1,40 | 2,50 | 3,90 | 4,100 | 5,130 | 6,150 | 7,200","1,200 | 2,200 | 3,200 | 4,200 | 5,200 | 6,200 | 7,200","1,40 | 2,50 | 3,90 | 4,100 | 5,30 | 6,120 | 7,170"]'::jsonb,null,0,'SUM() OVER (ORDER BY id) adalah jumlah kumulatif (frame default: awal sampai baris saat ini, termasuk seri pada kunci urut). Hasil: 1,40 | 2,50 | 3,90 | 4,100 | 5,130 | 6,150 | 7,200.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'memo = {}
def fib(n):
    if n < 2: return n
    if n not in memo:
        memo[n] = fib(n - 1) + fib(n - 2)
    return memo[n]','python','["O(n)","O(n log n)","O(n + m)"]'::jsonb,null,0,'Kompleksitas: O(n). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Berapa query SQL yang dijalankan (100 post, 4 penulis berbeda)?',null,'posts = Post.objects.prefetch_related("penulis")[:100]
for p in posts:
    print(p.penulis.nama)','python','["2","1","101"]'::jsonb,null,0,'prefetch_related memakai query kedua dengan WHERE id IN (...): total 2 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Berapa p95 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [466,334,884,339,638,685,95,455,140,792,752,367,321]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["482","792","884"]'::jsonb,null,2,'N=13, rank=⌈95/100×13⌉=13 → 884 ms. Rata-rata (482) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Berapa hasil query penelusuran ke atas dari pegawai 3?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 1) (4, 2) (5, 4) (6, 2)

WITH RECURSIVE naik(id) AS (
  SELECT 3
  UNION ALL
  SELECT s.atasan FROM staf s JOIN naik ON s.id = naik.id WHERE s.atasan IS NOT NULL
)
SELECT COUNT(*) FROM naik;','sql','["3","2","1"]'::jsonb,null,1,'Penelusuran naik menyertakan titik awal dan seluruh atasan hingga akar: 2 baris.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','fill','Lengkapi keyset pagination agar halaman berikutnya urut naik:',null,'SELECT * FROM log
WHERE id > :terakhir
ORDER BY id ____
LIMIT 20;','sql','["DESC","RANDOM()","ASC"]'::jsonb,null,2,'Dengan id > :terakhir, urutan naik (ASC) menjamin halaman berikutnya kontigu dan memakai indeks.',null,'Arah perbandingan menentukan arah urutan.',null),
('backend','output','Berapa kali job ini berjalan dalam satu minggu penuh (Senin–Minggu)?',null,'# menit jam tgl bulan hari-minggu
*/7 22-23 * * *','bash','["126","63","18"]'::jsonb,null,0,'18 kali sehari × 7 hari yang cocok (0=Minggu … 6=Sabtu) = 126.',null,'Kalikan jumlah eksekusi per hari dengan jumlah hari yang cocok.',null),
('backend','guess','Setelah COMMIT sukses, listrik padam dan data hilang. Properti ACID mana yang dilanggar?',null,'COMMIT;  -- sukses
-- server mati','sql','["Atomicity","Isolation","Durability"]'::jsonb,null,2,'Durability menjamin data yang sudah di-commit bertahan meski crash (lewat WAL/fsync).',null,'Properti mana yang berbicara tentang bertahan setelah crash?',null),
('backend','output','Throughput maksimum (query/detik) yang bisa dilayani kolam ini?',null,'kolam_koneksi = 20
rata-rata_query = 20 ms, satu koneksi menangani satu query pada satu waktu','python','["100","1000","400"]'::jsonb,null,1,'Tiap koneksi menyelesaikan 50 query/detik × 20 koneksi = 1000 q/s.',null,'Satu koneksi menyelesaikan 1000/ms query per detik.',null),
('backend','output','Berapa kunci yang PINDAH shard saat shard ditambah dari 4 menjadi 5?',null,'# shard = kunci % jumlah_shard
kunci = 0 .. 119
sebelum: shard = kunci % 4
sesudah: shard = kunci % 5','python','["96","93","24"]'::jsonb,null,0,'Dihitung langsung: 96 dari 120 kunci berpindah. Modulo membuat hampir semua kunci pindah; consistent hashing hanya memindahkan ≈ K/(n+1) = 24.',null,'Hitung berapa kunci yang hasil modulo-nya berubah, jangan menebak 1/n.',null),
('backend','guess','Dari daftar ini, nomor mana yang BUKAN message broker/antrean?',null,'1. NATS
2. Kafka
3. RabbitMQ
4. Testing Library
5. SolidJS','text','["4 dan 5","2 dan 4 dan 5","1 dan 4 dan 5"]'::jsonb,null,0,'SolidJS dan Testing Library termasuk kategori lain; Kafka, NATS, RabbitMQ adalah message broker/antrean.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 7 f.txt menjadi "fitur"
main: mengubah g.txt (commit baru)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (kota, negara, umur);

SELECT * FROM orang
WHERE negara = ''x'' AND umur > 30;','sql','["0","1","2"]'::jsonb,null,0,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 0.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','output','Berapa request yang DITERIMA?',null,'# Token bucket: kapasitas 4 token, mulai penuh pada detik 0
# isi ulang 2 token/detik (kontinu, maksimum 4); tiap request memakai 1 token
waktu_request = [0,0,2,2,3,6,9,9,9,9]  # detik','python','["9","10","4"]'::jsonb,null,1,'Simulasi: token = min(4, token + Δt×2); request diterima jika token ≥ 1. Diterima 10 dari 10.',null,'Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'queueMicrotask(() => console.log("E"));
Promise.resolve().then(() => console.log("C"));
Promise.resolve().then(() => console.log("F"));
queueMicrotask(() => console.log("undefined"));
queueMicrotask(() => console.log("undefined"));','javascript','["C E F undefined undefined","E C F","E C F undefined undefined"]'::jsonb,null,2,'Urutan: E C F undefined undefined. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','guess','Anomali konkurensi apa yang terjadi pada jadwal ini?',null,'T1: UPDATE akun SET saldo = saldo - 50 WHERE id = 1;  -- belum commit
T2: SELECT saldo FROM akun WHERE id = 1;  -- melihat nilai baru
T1: ROLLBACK;','sql','["phantom read","non-repeatable read","dirty read"]'::jsonb,null,2,'T2 membaca data yang belum di-commit lalu dibatalkan.',null,'Apa yang berubah di antara dua langkah baca, atau apa yang dibaca sebelum commit?',null),
('backend','output','Apa output kode Python ini?',null,'kata = ["kopi", "teh", "susu", "air", "jus", "kola"]
print(sorted(kata, key=len), sorted(kata, key=lambda s: (-len(s), s))[:4])','python','["[''teh'', ''air'', ''jus'', ''susu'', ''kopi'', ''kola''] [''kola'', ''kopi'', ''susu'', ''air'']","[''teh'', ''air'', ''jus'', ''kopi'', ''susu'', ''kola''] [''kola'', ''kopi'', ''susu'', ''air'']","[''teh'', ''air'', ''jus'', ''kopi'', ''kola''] [''kola'', ''susu'', ''kopi'', ''susu'', ''air'']"]'::jsonb,null,1,'sorted() stabil: elemen dengan kunci sama mempertahankan urutan semula. Hasil: [''teh'', ''air'', ''jus'', ''kopi'', ''susu'', ''kola''] [''kola'', ''kopi'', ''susu'', ''air''].',null,'Apa arti sort stabil?',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 2; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. A: counter = tmpA + 1
3. A: tmpA = counter
4. B: tmpB = counter
5. B: counter = tmpB + 1
6. A: counter = tmpA + 1
7. B: tmpB = counter
8. B: counter = tmpB + 1','python','["5","4","6"]'::jsonb,null,0,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 5, bukan 6. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','guess','Kode status HTTP paling tepat untuk situasi ini:
Klien melampaui kuota 100 request/menit',null,'# API REST','http','["422 Unprocessable Content","429 Too Many Requests","401 Unauthorized"]'::jsonb,null,1,'429 Too Many Requests adalah kode yang sesuai dengan semantik situasi tersebut.',null,'Cari kata kunci: salah klien (4xx) atau server (5xx)? autentikasi atau otorisasi?',null),
('backend','output','Berapa p90 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [184,220,778,740,595,200,198,660,345,730,746,143,515,109,830,482,700]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["778","481","830"]'::jsonb,null,0,'N=17, rank=⌈90/100×17⌉=16 → 778 ms. Rata-rata (481) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Apa output kode Python ini?',null,'a = [[0] * 4] * 2
a[0][3] = 4
b = [[0] * 4 for _ in range(2)]
b[0][3] = 4
print(a == b, a, b)','python','["False [[0, 0, 0, 4], [0, 0, 0, 4]] [[0, 0, 0, 4], [0, 0, 0, 0]]","False [[0, 0, 0, 4], [0, 0, 0, 4]] [[0, 0, -1, 4], [0, 0, 0, 0]]","False [[0, 0, 0, 4], [0, 0, 0, 4]] [[0, 0, 0, 4], [2, 0, 0, 0]]"]'::jsonb,null,0,'[[0]*n]*2 menggandakan referensi ke SATU list yang sama; comprehension membuat list baru tiap iterasi. Hasil: False [[0, 0, 0, 4], [0, 0, 0, 4]] [[0, 0, 0, 4], [0, 0, 0, 0]].',null,'Berapa objek list yang sebenarnya dibuat?',null),
('backend','output','Berapa kunci yang PINDAH shard saat shard ditambah dari 5 menjadi 6?',null,'# shard = kunci % jumlah_shard
kunci = 0 .. 199
sebelum: shard = kunci % 5
sesudah: shard = kunci % 6','python','["33","165","170"]'::jsonb,null,1,'Dihitung langsung: 165 dari 200 kunci berpindah. Modulo membuat hampir semua kunci pindah; consistent hashing hanya memindahkan ≈ K/(n+1) = 33.',null,'Hitung berapa kunci yang hasil modulo-nya berubah, jangan menebak 1/n.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~3.3.1" }
// versi yang tersedia di registry:
3.3.1  3.4.1  3.4.2  3.4.4  4.3.0  4.3.2  4.4.0  4.5.1','json','["4.5.1","3.4.4","3.3.1"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 3.3.1.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 5 percobaan ulang
base = 200 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(2000, base * 2**i)   # i = 0, 1, 2, …','python','["5000","6200","7000"]'::jsonb,null,0,'Jeda: 200, 400, 800, 1600, 2000 ms → total 5000 ms (cap 2000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','guess','Mitigasi UTAMA untuk kasus ini?
pickle.loads() dipakai pada cookie yang dikirim klien sehingga penyerang bisa menjalankan kode.',null,'# keamanan aplikasi web','text','["Gunakan textContent, hindari innerHTML dengan data tak tepercaya; Trusted Types","Allowlist origin eksplisit; jangan memantulkan origin sembarang bersama credentials","Jangan deserialisasi data tak tepercaya dengan format yang bisa menjalankan kode"]'::jsonb,null,2,'Mitigasi yang tepat untuk Insecure Deserialization: Jangan deserialisasi data tak tepercaya dengan format yang bisa menjalankan kode; pakai JSON dan tanda tangan.',null,'Akar masalahnya: Insecure Deserialization.',null),
('backend','guess','Kode status HTTP paling tepat untuk situasi ini:
POST berhasil membuat resource baru dan Location menunjuk ke resource itu',null,'# API REST','http','["204 No Content","202 Accepted","201 Created"]'::jsonb,null,2,'201 Created adalah kode yang sesuai dengan semantik situasi tersebut.',null,'Cari kata kunci: salah klien (4xx) atau server (5xx)? autentikasi atau otorisasi?',null),
('backend','output','Berapa hasil query penelusuran ke atas dari pegawai 2?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 2) (4, 1) (5, 1) (6, 3)

WITH RECURSIVE naik(id) AS (
  SELECT 2
  UNION ALL
  SELECT s.atasan FROM staf s JOIN naik ON s.id = naik.id WHERE s.atasan IS NOT NULL
)
SELECT COUNT(*) FROM naik;','sql','["1","0","2"]'::jsonb,null,2,'Penelusuran naik menyertakan titik awal dan seluruh atasan hingga akar: 2 baris.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','guess','Perbaikan paling tepat untuk kerentanan ini?',null,'db.query("SELECT * FROM user WHERE nama = ''" + nama + "''")','javascript','["Mengganti tanda kutip tunggal dengan dua kutip secara manual di semua input","Query berparameter","Membatasi panjang input maksimal 20 karakter"]'::jsonb,null,1,'Parameter dikirim terpisah dari struktur query. Escape manual rawan terlewat; batas panjang tidak menutup injeksi.',null,'Pisahkan data dari struktur perintah.',null),
('backend','output','Rata-rata request yang sedang diproses bersamaan (in-flight)?',null,'# hukum Little: L = λ × W
λ = 200 request/detik
W = 20 ms rata-rata per request','python','["4000","4","10"]'::jsonb,null,1,'L = 200 × 0.02 s = 4.',null,'Samakan satuan waktu dulu: ms → detik.',null),
('backend','fill','Lengkapi agar hanya pelanggan TANPA pesanan yang muncul:',null,'SELECT p.nama FROM pelanggan p
LEFT JOIN pesanan o ON o.pelanggan_id = p.id
WHERE o.id IS ____;','sql','["EMPTY","NULL","FALSE"]'::jsonb,null,1,'Pada LEFT JOIN, baris tanpa pasangan memiliki kolom kanan NULL; perbandingan memakai IS NULL, bukan = NULL.',null,'Bagaimana kolom kanan terlihat saat tak ada pasangan?',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'for a in daftar_a:      # n elemen
    if a in daftar_b:   # list dengan m elemen
        hit += 1','python','["O(n log n)","O(n·m)","O(n + m)"]'::jsonb,null,1,'Kompleksitas: O(n·m). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Berapa request yang DITERIMA?',null,'# Token bucket: kapasitas 3 token, mulai penuh pada detik 0
# isi ulang 1 token/detik (kontinu, maksimum 3); tiap request memakai 1 token
waktu_request = [1,1,1,2,3,4,6,7,10,10]  # detik','python','["9","10","3"]'::jsonb,null,1,'Simulasi: token = min(3, token + Δt×1); request diterima jika token ≥ 1. Diterima 10 dari 10.',null,'Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Eka, Bandung) (2, Dedi, Bandung) (3, Ayu, Bandung) (4, Hana, Medan) (5, Citra, Medan)
-- pesanan(id, pelanggan_id, total, status)
(1, 1, 40, lunas) (2, NULL, 20, lunas) (3, 2, 70, baru) (4, 1, 70, batal) (5, 2, 40, lunas) (6, 2, 80, lunas) (7, 2, 50, batal)

SELECT COUNT(*) FROM (
  SELECT kota FROM pelanggan
  UNION ALL
  SELECT kota FROM pelanggan WHERE kota IS NOT NULL
) x
WHERE kota IS NULL OR kota <> ''Padang'';','sql','["10","2","8"]'::jsonb,null,0,'UNION ALL mempertahankan duplikat, UNION menghapusnya; kota <> ''Padang'' bernilai UNKNOWN untuk NULL sehingga perlu IS NULL eksplisit. Hasil: 10.',null,'UNION vs UNION ALL; perbandingan dengan NULL tidak pernah true.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_B → LOCK tabel_A → LOCK tabel_C → COMMIT
T2: LOCK tabel_A → LOCK tabel_C → LOCK tabel_B → COMMIT
T3: LOCK tabel_A → LOCK tabel_C → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_C → tabel_B → tabel_A"]'::jsonb,null,2,'Graf urutan kunci memuat siklus tabel_A → tabel_C → tabel_B → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','guess','Anomali konkurensi apa yang terjadi pada jadwal ini?',null,'T1: SELECT COUNT(*) FROM pesanan WHERE total > 50;   -- 3
T2: INSERT INTO pesanan(total) VALUES (70); COMMIT;
T1: SELECT COUNT(*) FROM pesanan WHERE total > 50;   -- 4','sql','["lost update","dirty read","phantom read"]'::jsonb,null,2,'Kumpulan baris yang memenuhi predikat berubah di antara dua pembacaan.',null,'Apa yang berubah di antara dua langkah baca, atau apa yang dibaca sebelum commit?',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 9 f.txt menjadi "fitur"
main: mengubah baris 1 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 10) (2, B, 10) (3, B, 50) (4, B, 10) (5, A, 20) (6, A, 20) (7, B, 20)

SELECT id, DENSE_RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,3 | 2,3 | 3,1 | 4,3 | 5,1 | 6,1 | 7,2","1,2 | 2,3 | 3,1 | 4,3 | 5,1 | 6,1 | 7,2","1,3 | 2,3 | 3,1 | 4,4 | 5,1 | 6,2 | 7,2"]'::jsonb,null,1,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,2 | 2,3 | 3,1 | 4,3 | 5,1 | 6,1 | 7,2.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan message broker/antrean?',null,'1. NATS
2. Amazon SQS
3. Flask
4. ActiveMQ
5. Testing Library','text','["2, 4, 5","1, 2, 4","3, 4, 5"]'::jsonb,null,1,'Amazon SQS, NATS, ActiveMQ adalah message broker/antrean; Testing Library dan Flask termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 2; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. A: counter = tmpA + 1
4. B: counter = tmpB + 1
5. B: tmpB = counter
6. A: tmpA = counter
7. A: counter = tmpA + 1
8. B: counter = tmpB + 1','python','["4","6","5"]'::jsonb,null,0,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 4, bukan 6. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','output','Berapa kali job ini berjalan dalam satu minggu penuh (Senin–Minggu)?',null,'# menit jam tgl bulan hari-minggu
0,30 8-12 * * *','bash','["70","56","10"]'::jsonb,null,0,'10 kali sehari × 7 hari yang cocok (0=Minggu … 6=Sabtu) = 70.',null,'Kalikan jumlah eksekusi per hari dengan jumlah hari yang cocok.',null),
('backend','output','Berapa query SQL yang dijalankan (100 post, 5 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:100]
for p in posts:
    print(p.penulis.nama)','python','["101","2","1"]'::jsonb,null,2,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'Promise.resolve().then(() => console.log("F"));
Promise.resolve().then(() => console.log("A"));
queueMicrotask(() => console.log("E"));
process.nextTick(() => { console.log("undefined"); Promise.resolve().then(() => console.log("undefined")); });
queueMicrotask(() => console.log("undefined"));','javascript','["undefined F A E undefined undefined","F A E","A E F undefined undefined undefined"]'::jsonb,null,0,'Urutan: undefined F A E undefined undefined. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Berapa jumlah cache HIT pada cache LRU ini?',null,'kapasitas = 4
akses = ["C","C","A","F","F","B","A","B","E","C","A","A"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["6","5","7"]'::jsonb,null,0,'Simulasi LRU: hit=6, isi akhir (lama→baru) = B E C A. Pada FIFO hit tidak memperbarui urutan (hit=5).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (umur, kota, negara);

SELECT * FROM orang
WHERE kota = ''x'' AND negara = ''x'' AND umur > 30;','sql','["2","1","3"]'::jsonb,null,1,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','output','Berapa kunci yang PINDAH shard saat shard ditambah dari 6 menjadi 7?',null,'# shard = kunci % jumlah_shard
kunci = 0 .. 119
sebelum: shard = kunci % 6
sesudah: shard = kunci % 7','python','["102","17","99"]'::jsonb,null,0,'Dihitung langsung: 102 dari 120 kunci berpindah. Modulo membuat hampir semua kunci pindah; consistent hashing hanya memindahkan ≈ K/(n+1) = 17.',null,'Hitung berapa kunci yang hasil modulo-nya berubah, jangan menebak 1/n.',null),
('backend','output','Berapa query SQL yang dijalankan (100 post, 4 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:100]
for p in posts:
    print(p.penulis.nama)','python','["2","101","1"]'::jsonb,null,2,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','guess','Dari daftar ini, nomor mana yang BUKAN reverse proxy/web server?',null,'1. Bulma
2. Apache HTTP Server
3. HAProxy
4. Flask
5. Nginx','text','["1 dan 3 dan 4","2 dan 4 dan 5","1 dan 4"]'::jsonb,null,2,'Flask dan Bulma termasuk kategori lain; Nginx, HAProxy, Apache HTTP Server adalah reverse proxy/web server.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('backend','output','Berapa kali job ini berjalan pada hari yang cocok (satu hari)?',null,'# menit jam tgl bulan hari-minggu
0 0 * * 0','bash','["1","24","2"]'::jsonb,null,0,'Menit: 1 nilai × jam: 1 nilai = 1. Rentang a-b bersifat inklusif; */n dihitung dari awal rentang.',null,'Hitung nilai menit × nilai jam; rentang inklusif.',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 30) (2, A, 20) (3, A, 20) (4, A, 30) (5, A, 40) (6, B, 20)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,-10 | 2,0 | 3,10 | 4,10 | 5,0 | 6,0","1,0 | 2,-10 | 3,0 | 4,10 | 5,10 | 6,-20","1,0 | 2,0 | 3,0 | 4,10 | 5,10 | 6,-10"]'::jsonb,null,2,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,0 | 3,0 | 4,10 | 5,10 | 6,-10.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, kota, umur);

SELECT * FROM orang
WHERE negara > 30 AND umur = ''x'' AND kota > 30;','sql','["1","3","2"]'::jsonb,null,0,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','output','Isi cache LRU di akhir, dari yang paling lama dipakai ke yang paling baru?',null,'kapasitas = 3
akses = ["D","E","E","F","D","F","D","F","F","B","B","B"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["B F D","D F B","E F B"]'::jsonb,null,1,'Simulasi LRU: hit=8, isi akhir (lama→baru) = D F B. Pada FIFO hit tidak memperbarui urutan (hit=8).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~0.0.4" }
// versi yang tersedia di registry:
0.0.4  0.0.5  0.1.0  0.2.5  1.0.0  1.0.6  1.1.4  1.2.7','json','["0.0.5","0.0.4","1.2.7"]'::jsonb,null,0,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 0.0.5.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','guess','Kode status HTTP paling tepat untuk situasi ini:
Resource dengan ID tersebut tidak ada',null,'# API REST','http','["404 Not Found","405 Method Not Allowed","401 Unauthorized"]'::jsonb,null,0,'404 Not Found adalah kode yang sesuai dengan semantik situasi tersebut.',null,'Cari kata kunci: salah klien (4xx) atau server (5xx)? autentikasi atau otorisasi?',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'while N > 0:
    N //= 10','python','["O(n log n)","O(log n)","O(n)"]'::jsonb,null,1,'Kompleksitas: O(log n). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','guess','''Eventual consistency'' berarti?',null,'# basis data terdistribusi','text','["Data tidak pernah konsisten","Tanpa penulisan baru, semua replika akhirnya konvergen ke nilai yang sama","Semua replika selalu identik pada setiap saat"]'::jsonb,null,1,'Konsistensi ''akhirnya'' menukar kesegaran seketika dengan ketersediaan dan latensi.',null,'Kapan replika sama: selalu atau akhirnya?',null),
('backend','output','Berapa hasil query penelusuran ke atas dari pegawai 4?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 2) (4, 2) (5, 3)

WITH RECURSIVE naik(id) AS (
  SELECT 4
  UNION ALL
  SELECT s.atasan FROM staf s JOIN naik ON s.id = naik.id WHERE s.atasan IS NOT NULL
)
SELECT COUNT(*) FROM naik;','sql','["2","4","3"]'::jsonb,null,2,'Penelusuran naik menyertakan titik awal dan seluruh atasan hingga akar: 3 baris.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Berapa saldo akhir?',null,'-- saldo awal = 200, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 200
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 200
T1: UPDATE akun SET saldo = x + 50 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 10 WHERE id = 1; COMMIT;','sql','["260","250","210"]'::jsonb,null,2,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 200+10, sehingga tambahan 50 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'queueMicrotask(() => console.log("B"));
queueMicrotask(() => console.log("C"));
console.log("G");
console.log("undefined");','javascript','["B C G","G undefined B C","B C G undefined"]'::jsonb,null,1,'Urutan: G undefined B C. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Throughput maksimum (query/detik) yang bisa dilayani kolam ini?',null,'kolam_koneksi = 100
rata-rata_query = 5 ms, satu koneksi menangani satu query pada satu waktu','python','["20000","500","2000"]'::jsonb,null,0,'Tiap koneksi menyelesaikan 200 query/detik × 100 koneksi = 20000 q/s.',null,'Satu koneksi menyelesaikan 1000/ms query per detik.',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Ayu, Bandung) (2, Gita, NULL) (3, Eka, Bandung) (4, Fajar, Bandung) (5, Citra, Padang)
-- pesanan(id, pelanggan_id, total, status)
(1, 2, 90, lunas) (2, 3, 60, batal) (3, NULL, 20, lunas) (4, 3, 20, batal) (5, 2, 70, lunas) (6, 4, 60, baru) (7, NULL, 20, lunas)

SELECT kota, COUNT(*) AS n FROM pelanggan
GROUP BY kota
HAVING COUNT(*) >= 2
ORDER BY n DESC, kota;','sql','["3,Bandung","Bandung,3","Bandung,2"]'::jsonb,null,1,'GROUP BY menganggap semua NULL sebagai satu grup; COUNT(*) menghitungnya, COUNT(kota) tidak. Hasil: Bandung,3.',null,'Apakah NULL membentuk grup sendiri?',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 6 percobaan ulang
base = 200 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(1000, base * 2**i)   # i = 0, 1, 2, …','python','["5400","12600","4400"]'::jsonb,null,2,'Jeda: 200, 400, 800, 1000, 1000, 1000 ms → total 4400 ms (cap 1000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','output','Apa output kode Python ini?',null,'d = {"a": 8, "b": 9}
d.pop("a"); d["a"] = 10
x = {**d, "b": 0, "c": 1}
print(list(d), x, d.setdefault("z", 5), d.get("q", -1))','python','["[''b'', ''a''] {''b'': -1, ''a'': 10, ''c'': 1} 5 -1","[''b'', ''a''] {''b'': 0, ''a'': 9, ''c'': 1} 5 -1","[''b'', ''a''] {''b'': 0, ''a'': 10, ''c'': 1} 5 -1"]'::jsonb,null,2,'Dict menjaga urutan penyisipan; kunci yang dihapus lalu dimasukkan lagi pindah ke akhir; {**d, ...} menimpa dengan nilai belakangan. Hasil: [''b'', ''a''] {''b'': 0, ''a'': 10, ''c'': 1} 5 -1.',null,'Urutan dict = urutan penyisipan.',null),
('backend','guess','Jenis kerentanan/serangan apa ini?',null,'Pengguna mengganti /invoice/1042 menjadi /invoice/1043 dan melihat faktur milik orang lain.','text','["IDOR (Broken Access Control)","Credential Stuffing","Mass Assignment"]'::jsonb,null,0,'IDOR (Broken Access Control): Periksa kepemilikan/otorisasi di server pada setiap akses objek.',null,'Apa yang dikendalikan penyerang, dan di mana ia dieksekusi?',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 14; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. A: counter = tmpA + 1
3. B: tmpB = counter
4. A: tmpA = counter
5. A: counter = tmpA + 1
6. B: counter = tmpB + 1
7. B: tmpB = counter
8. B: counter = tmpB + 1','python','["17","16","18"]'::jsonb,null,0,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 17, bukan 18. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','output','Berapa request yang DITERIMA?',null,'# Token bucket: kapasitas 4 token, mulai penuh pada detik 0
# isi ulang 2 token/detik (kontinu, maksimum 4); tiap request memakai 1 token
waktu_request = [0,2,3,4,5,6,7,7,9]  # detik','python','["8","4","9"]'::jsonb,null,2,'Simulasi: token = min(4, token + Δt×2); request diterima jika token ≥ 1. Diterima 9 dari 9.',null,'Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_B → LOCK tabel_C → COMMIT
T2: LOCK tabel_C → LOCK tabel_A → LOCK tabel_B → COMMIT
T3: LOCK tabel_B → LOCK tabel_C → LOCK tabel_A → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_B → tabel_C → tabel_A"]'::jsonb,null,2,'Graf urutan kunci memuat siklus tabel_A → tabel_B → tabel_C → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','output','Berapa p90 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [842,574,860,351,661,197,290,68,604,251,847,472,355,330,363,324,413]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["459","860","847"]'::jsonb,null,2,'N=17, rank=⌈90/100×17⌉=16 → 847 ms. Rata-rata (459) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 9 f.txt menjadi "fitur"
main: mengubah baris 2 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','guess','Apa output program Go ini?',null,'for i := 0; i < 3; i++ {
    defer fmt.Print(i, " ")
}','go','["2 1 0","3 3 3","0 1 2"]'::jsonb,null,0,'defer berjalan LIFO saat fungsi selesai, dan argumen dievaluasi saat defer dideklarasikan.',null,'Urutan tumpukan (LIFO).',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Hana, Medan) (2, Fajar, Padang) (3, Dedi, Medan) (4, Ayu, Medan) (5, Budi, Bandung)
-- pesanan(id, pelanggan_id, total, status)
(1, 2, 70, lunas) (2, NULL, 60, lunas) (3, NULL, 60, lunas) (4, 4, 90, batal) (5, 4, 50, lunas) (6, 1, 60, batal) (7, 2, 30, batal) (8, 1, 40, lunas)

SELECT COUNT(*) FROM (
  SELECT kota FROM pelanggan
  UNION ALL
  SELECT kota FROM pelanggan WHERE kota IS NOT NULL
) x
WHERE kota IS NULL OR kota <> ''Padang'';','sql','["9","8","2"]'::jsonb,null,1,'UNION ALL mempertahankan duplikat, UNION menghapusnya; kota <> ''Padang'' bernilai UNKNOWN untuk NULL sehingga perlu IS NULL eksplisit. Hasil: 8.',null,'UNION vs UNION ALL; perbandingan dengan NULL tidak pernah true.',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'console.log("A");
process.nextTick(() => { console.log("D"); Promise.resolve().then(() => console.log("C")); });
process.nextTick(() => console.log("F"));
Promise.resolve().then(() => console.log("undefined"));
process.nextTick(() => console.log("undefined"));','javascript','["A D F undefined undefined C","A C D F undefined undefined","A D C F"]'::jsonb,null,0,'Urutan: A D F undefined undefined C. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Berapa kunci yang PINDAH shard saat shard ditambah dari 3 menjadi 4?',null,'# shard = kunci % jumlah_shard
kunci = 0 .. 99
sebelum: shard = kunci % 3
sesudah: shard = kunci % 4','python','["25","73","76"]'::jsonb,null,1,'Dihitung langsung: 73 dari 100 kunci berpindah. Modulo membuat hampir semua kunci pindah; consistent hashing hanya memindahkan ≈ K/(n+1) = 25.',null,'Hitung berapa kunci yang hasil modulo-nya berubah, jangan menebak 1/n.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^0.0.3" }
// versi yang tersedia di registry:
0.0.3  0.0.4  0.2.4  0.2.5  1.0.3  1.2.5','json','["0.0.4","0.0.3","1.2.5"]'::jsonb,null,1,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 0.0.3.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','guess','Kode status HTTP paling tepat untuk situasi ini:
Klien mengirim Content-Type yang tidak didukung endpoint',null,'# API REST','http','["413 Content Too Large","415 Unsupported Media Type","429 Too Many Requests"]'::jsonb,null,1,'415 Unsupported Media Type adalah kode yang sesuai dengan semantik situasi tersebut.',null,'Cari kata kunci: salah klien (4xx) atau server (5xx)? autentikasi atau otorisasi?',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 7; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. A: counter = tmpA + 1
4. B: counter = tmpB + 1
5. A: tmpA = counter
6. A: counter = tmpA + 1
7. B: tmpB = counter
8. B: counter = tmpB + 1','python','["9","11","10"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 10, bukan 11. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'for i in range(n):
    for j in range(10):
        work()','python','["O(n·m)","O(n log n)","O(n)"]'::jsonb,null,2,'Kompleksitas: O(n). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','guess','Menurut standar SQL, anomali apa yang MASIH mungkin terjadi pada level SERIALIZABLE?',null,'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;','sql','["non-repeatable read, phantom read","tidak ada","dirty read, non-repeatable read, phantom read"]'::jsonb,null,1,'Standar SQL: READ UNCOMMITTED mengizinkan ketiganya; READ COMMITTED mencegah dirty read; REPEATABLE READ juga mencegah non-repeatable read; SERIALIZABLE mencegah semuanya. (Implementasi nyata, mis. PostgreSQL, bisa lebih ketat.)',null,'Semakin tinggi level, semakin sedikit anomali yang tersisa.',null),
('backend','output','Berapa hasil query hierarki ini?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 2) (4, 3) (5, 4) (6, 1)

WITH RECURSIVE r(id, d) AS (
  SELECT id, 0 FROM staf WHERE atasan IS NULL
  UNION ALL
  SELECT s.id, r.d + 1 FROM staf s JOIN r ON s.atasan = r.id
)
SELECT MAX(d) FROM r;','sql','["5","6","4"]'::jsonb,null,2,'Kedalaman pohon (akar = 0) dihitung rekursif; hasil maksimum 4.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','guess','Mitigasi UTAMA untuk kasus ini?
os.system("ping " + host) dengan host berisi ''x; rm -rf /''.',null,'# keamanan aplikasi web','text','["Hindari shell: pakai API/argumen terpisah (subprocess dengan list) dan validasi input","Allowlist tujuan, blokir alamat internal/metadata, dan jangan ikuti redirect ke jaringan privat","Gunakan textContent, hindari innerHTML dengan data tak tepercaya; Trusted Types"]'::jsonb,null,0,'Mitigasi yang tepat untuk Command Injection: Hindari shell: pakai API/argumen terpisah (subprocess dengan list) dan validasi input.',null,'Akar masalahnya: Command Injection.',null),
('backend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan reverse proxy/web server?',null,'1. SolidJS
2. HAProxy
3. Redis
4. Apache HTTP Server
5. Caddy','text','["3, 4, 5","2, 4, 5","1, 2, 3"]'::jsonb,null,1,'Caddy, HAProxy, Apache HTTP Server adalah reverse proxy/web server; SolidJS dan Redis termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_C → LOCK tabel_A → LOCK tabel_B → COMMIT
T2: LOCK tabel_A → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan","Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten"]'::jsonb,null,2,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 10) (2, A, 20) (3, B, 50) (4, A, 40) (5, A, 50) (6, A, 40)

SELECT id, DENSE_RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,5 | 2,4 | 3,1 | 4,2 | 5,1 | 6,3","1,5 | 2,4 | 3,1 | 4,2 | 5,1 | 6,2","1,4 | 2,3 | 3,1 | 4,2 | 5,1 | 6,2"]'::jsonb,null,2,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,4 | 2,3 | 3,1 | 4,2 | 5,1 | 6,2.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','guess','Apa masalah handler async ini?',null,'async def handler():
    time.sleep(2)
    return "ok"','python','["Tidak ada masalah; handler async selalu non-blokir sehingga time.sleep aman dipakai","await wajib dipasang sebelum return agar handler tidak melempar pengecualian","time.sleep memblokir event loop sehingga semua coroutine lain tertahan"]'::jsonb,null,2,'Kode sinkron yang memblokir di dalam coroutine menahan satu-satunya thread event loop.',null,'Siapa yang menjalankan semua coroutine?',null),
('backend','output','Berapa p50 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [136,208,305,617,522,873,766,653,235,46,824,474,821,181,407,100,497,766,396,372]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["474","460","407"]'::jsonb,null,2,'N=20, rank=⌈50/100×20⌉=10 → 407 ms. Rata-rata (460) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','guess','Tim kecil (2 orang) membangun aplikasi internal CRUD dengan autentikasi, admin, dan laporan. Tidak ada kebutuhan UI sangat interaktif; ingin cepat selesai. Pilihan paling efisien?',null,'# kendala: tim kecil, tenggat singkat','text','["Membangun semuanya dari nol dengan HTTP server mentah","Framework monolit ''baterai-lengkap''","Mikroservis terpisah untuk tiap tabel plus SPA"]'::jsonb,null,1,'Untuk CRUD internal, monolit full-featured memangkas biaya koordinasi. Mikroservis menambah kompleksitas operasional tanpa kebutuhan skala yang jelas.',null,'Biaya koordinasi vs kebutuhan skala.',null),
('backend','output','Apa output kode Python ini?',null,'class Keranjang:
    isi = []
    def __init__(self, n):
        self.n = n
    def tambah(self, x):
        self.isi.append(x)
        self.n += 1
a, b = Keranjang(4), Keranjang(5)
a.tambah("x"); b.tambah("y"); b.tambah("z")
print(a.isi, a.n, b.n, Keranjang.n if hasattr(Keranjang, "n") else "tak ada")','python','["[''x'', ''y'', ''z''] 5 8 tak ada","[''x'', ''y'', ''z''] 5 7 tak ada","[''x'', ''y'', ''z''] 3 7 tak ada"]'::jsonb,null,1,'isi adalah atribut kelas yang dipakai bersama; self.n += 1 membuat atribut instance baru, tidak mengubah kelas. Hasil: [''x'', ''y'', ''z''] 5 7 tak ada.',null,'Atribut kelas vs atribut instance.',null),
('backend','output','Throughput maksimum (query/detik) yang bisa dilayani kolam ini?',null,'kolam_koneksi = 20
rata-rata_query = 50 ms, satu koneksi menangani satu query pada satu waktu','python','["1000","400","40"]'::jsonb,null,1,'Tiap koneksi menyelesaikan 20 query/detik × 20 koneksi = 400 q/s.',null,'Satu koneksi menyelesaikan 1000/ms query per detik.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (umur, kota, negara);

SELECT * FROM orang
WHERE umur > 30 AND negara = ''x'' AND kota = ''x'';','sql','["2","3","1"]'::jsonb,null,2,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 5 percobaan ulang
base = 500 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(5000, base * 2**i)   # i = 0, 1, 2, …','python','["15500","17500","12500"]'::jsonb,null,2,'Jeda: 500, 1000, 2000, 4000, 5000 ms → total 12500 ms (cap 5000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','output','Berapa query SQL yang dijalankan (20 post, 8 penulis berbeda)?',null,'posts = Post.objects.all()[:20]
for p in posts:
    print(p.penulis.nama)        # relasi ForeignKey, lazy','python','["2","21","1"]'::jsonb,null,1,'Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Berapa kali job ini berjalan dalam satu minggu penuh (Senin–Minggu)?',null,'# menit jam tgl bulan hari-minggu
*/10 * * * *','bash','["1050","1008","144"]'::jsonb,null,1,'144 kali sehari × 7 hari yang cocok (0=Minggu … 6=Sabtu) = 1008.',null,'Kalikan jumlah eksekusi per hari dengan jumlah hari yang cocok.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 7 f.txt menjadi "fitur"
main: mengubah baris 5 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Berapa request yang diterima oleh FIXED WINDOW (jendela [0,10), [10,20), …)?',null,'# batas 4 request per 10 detik
waktu_request = [3,4,4,7,8,9,10,11,14]  # detik','python','["5","7","9"]'::jsonb,null,1,'Fixed window mereset hitungan pada batas kelipatan 10 detik (menerima 7); sliding window menimbang 10 detik terakhir (menerima 5). Fixed window dapat meloloskan 2×4 request di sekitar batas jendela.',null,'Reset terjadi pada kelipatan tetap, bukan relatif terhadap tiap request.',null),
('backend','output','Isi cache LRU di akhir, dari yang paling lama dipakai ke yang paling baru?',null,'kapasitas = 3
akses = ["C","D","C","C","E","E","C","B","A","A","B","E"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["B E A","A B E","E B A"]'::jsonb,null,1,'Simulasi LRU: hit=6, isi akhir (lama→baru) = A B E. Pada FIFO hit tidak memperbarui urutan (hit=7).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','guess','Dari daftar ini, nomor mana yang BUKAN ORM/query builder?',null,'1. WebdriverIO
2. Zustand
3. SQLAlchemy
4. Prisma
5. Hibernate','text','["1 dan 3 dan 5","1 dan 4 dan 5","1 dan 2"]'::jsonb,null,2,'Zustand dan WebdriverIO termasuk kategori lain; SQLAlchemy, Prisma, Hibernate adalah ORM/query builder.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('backend','output','Berapa saldo akhir?',null,'-- saldo awal = 290, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 290
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 290
T1: UPDATE akun SET saldo = x + 60 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 90 WHERE id = 1; COMMIT;','sql','["380","350","440"]'::jsonb,null,0,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 290+90, sehingga tambahan 60 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('backend','output','Berapa kali job ini berjalan dalam satu minggu penuh (Senin–Minggu)?',null,'# menit jam tgl bulan hari-minggu
30 2 * * 0','bash','["7","2","1"]'::jsonb,null,2,'1 kali sehari × 1 hari yang cocok (0=Minggu … 6=Sabtu) = 1.',null,'Kalikan jumlah eksekusi per hari dengan jumlah hari yang cocok.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~1.2.3" }
// versi yang tersedia di registry:
1.2.3  1.3.3  1.3.4  1.3.6  1.4.6  2.2.6','json','["1.4.6","2.2.6","1.2.3"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 1.2.3.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 7 percobaan ulang
base = 500 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(1000, base * 2**i)   # i = 0, 1, 2, …','python','["7500","6500","63500"]'::jsonb,null,1,'Jeda: 500, 1000, 1000, 1000, 1000, 1000, 1000 ms → total 6500 ms (cap 1000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 3 f.txt menjadi "fitur"
main: mengubah g.txt (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Throughput maksimum (query/detik) yang bisa dilayani kolam ini?',null,'kolam_koneksi = 50
rata-rata_query = 25 ms, satu koneksi menangani satu query pada satu waktu','python','["200","1250","2000"]'::jsonb,null,2,'Tiap koneksi menyelesaikan 40 query/detik × 50 koneksi = 2000 q/s.',null,'Satu koneksi menyelesaikan 1000/ms query per detik.',null),
('backend','output','Berapa query SQL yang dijalankan (20 post, 8 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:20]
for p in posts:
    print(p.penulis.nama)','python','["1","2","21"]'::jsonb,null,0,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Berapa p99 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [568,223,722,869,306,897,146,258,501,706,84,28,359,618,834]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["869","897","475"]'::jsonb,null,1,'N=15, rank=⌈99/100×15⌉=15 → 897 ms. Rata-rata (475) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Berapa hasil query penelusuran ke atas dari pegawai 4?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 2) (4, 3) (5, 4)

WITH RECURSIVE naik(id) AS (
  SELECT 4
  UNION ALL
  SELECT s.atasan FROM staf s JOIN naik ON s.id = naik.id WHERE s.atasan IS NOT NULL
)
SELECT COUNT(*) FROM naik;','sql','["4","6","3"]'::jsonb,null,0,'Penelusuran naik menyertakan titik awal dan seluruh atasan hingga akar: 4 baris.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','guess','Konsumen memproses pesan lalu crash SEBELUM mengirim ack. Apa yang terjadi?',null,'# antrean dengan jaminan at-least-once','python','["Pesan hilang selamanya dan tidak pernah diproses","Pesan diproses tepat sekali oleh broker apa pun kondisinya","Pesan dikirim ulang dan bisa diproses dua kali"]'::jsonb,null,2,'At-least-once menjamin tidak hilang tetapi dapat duplikat. Pakai kunci idempotensi atau deduplikasi.',null,'Broker tahu pesan sudah beres dari apa?',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_B → LOCK tabel_C → LOCK tabel_A → COMMIT
T2: LOCK tabel_A → LOCK tabel_B → LOCK tabel_C → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_B → tabel_C → tabel_A","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten"]'::jsonb,null,0,'Graf urutan kunci memuat siklus tabel_A → tabel_B → tabel_C → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'process.nextTick(() => console.log("C"));
process.nextTick(() => console.log("A"));
console.log("F");
console.log("undefined");','javascript','["C A F","F undefined C A","A C F undefined"]'::jsonb,null,1,'Urutan: F undefined C A. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'memo = {}
def fib(jumlah):
    if jumlah < 2: return jumlah
    if jumlah not in memo:
        memo[jumlah] = fib(jumlah - 1) + fib(jumlah - 2)
    return memo[jumlah]','python','["O(n)","O(log n)","O(1)"]'::jsonb,null,0,'Kompleksitas: O(n). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Dedi, NULL) (2, Ayu, Medan) (3, Hana, Medan) (4, Gita, Padang) (5, Eka, Bandung) (6, Citra, Medan)
-- pesanan(id, pelanggan_id, total, status)
(1, 1, 40, lunas) (2, 2, 40, batal) (3, 3, 20, lunas) (4, 2, 80, lunas) (5, 2, 40, baru) (6, 5, 40, baru) (7, 5, 30, batal) (8, 1, 90, lunas)

SELECT kota, COUNT(*) AS n FROM pelanggan
GROUP BY kota
HAVING COUNT(*) >= 1
ORDER BY n DESC, kota;','sql','["Medan,3 | NULL,1 | Bandung,1 | Padang,1","Medan,3 | Bandung,1 | Padang,1","Medan,3"]'::jsonb,null,0,'GROUP BY menganggap semua NULL sebagai satu grup; COUNT(*) menghitungnya, COUNT(kota) tidak. Hasil: Medan,3 | NULL,1 | Bandung,1 | Padang,1.',null,'Apakah NULL membentuk grup sendiri?',null),
('backend','output','Berapa request yang DITERIMA?',null,'# Token bucket: kapasitas 3 token, mulai penuh pada detik 0
# isi ulang 2 token/detik (kontinu, maksimum 3); tiap request memakai 1 token
waktu_request = [0,1,2,2,2,3,3,3,6,8]  # detik','python','["10","3","9"]'::jsonb,null,2,'Simulasi: token = min(3, token + Δt×2); request diterima jika token ≥ 1. Diterima 9 dari 10.',null,'Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.',null),
('backend','guess','Kode status HTTP paling tepat untuk situasi ini:
DELETE berhasil dan tidak ada isi respons',null,'# API REST','http','["201 Created","202 Accepted","204 No Content"]'::jsonb,null,2,'204 No Content adalah kode yang sesuai dengan semantik situasi tersebut.',null,'Cari kata kunci: salah klien (4xx) atau server (5xx)? autentikasi atau otorisasi?',null),
('backend','output','Berapa kunci yang PINDAH shard saat shard ditambah dari 5 menjadi 6?',null,'# shard = kunci % jumlah_shard
kunci = 0 .. 119
sebelum: shard = kunci % 5
sesudah: shard = kunci % 6','python','["95","100","20"]'::jsonb,null,1,'Dihitung langsung: 100 dari 120 kunci berpindah. Modulo membuat hampir semua kunci pindah; consistent hashing hanya memindahkan ≈ K/(n+1) = 20.',null,'Hitung berapa kunci yang hasil modulo-nya berubah, jangan menebak 1/n.',null),
('backend','output','Apa output kode Python ini?',null,'print(round(6.5), round(6.5), round(-0.5), 9.0 // 2, -9 // 2, -9 % 3, divmod(-9, 3))','python','["6 6 0 2.0 -5 0 (-3, 0)","6 6 0 4.0 -5 0 (-3, 0)","6 6 0 4.0 -7 0 (-3, 0)"]'::jsonb,null,1,'round() memakai pembulatan bankir (setengah ke genap); // adalah floor division sehingga hasil negatif dibulatkan ke bawah; % mengikuti tanda pembagi. Hasil: 6 6 0 4.0 -5 0 (-3, 0).',null,'Pembulatan .5 ke genap; // membulatkan ke -∞.',null),
('backend','output','Isi cache LRU di akhir, dari yang paling lama dipakai ke yang paling baru?',null,'kapasitas = 4
akses = ["E","F","E","A","F","E","F","A","B","F","D"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["A B F D","D F B A","F A B D"]'::jsonb,null,0,'Simulasi LRU: hit=6, isi akhir (lama→baru) = A B F D. Pada FIFO hit tidak memperbarui urutan (hit=6).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 19; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. B: counter = tmpB + 1
4. B: tmpB = counter
5. A: counter = tmpA + 1
6. B: counter = tmpB + 1
7. A: tmpA = counter
8. A: counter = tmpA + 1','python','["21","23","22"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 22, bukan 23. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','guess','Mitigasi UTAMA untuk kasus ini?
Pengguna mengganti /invoice/1042 menjadi /invoice/1043 dan melihat faktur milik orang lain.',null,'# keamanan aplikasi web','text','["Rate limiting, MFA, pemantauan login anomali, dan pengecekan kata sandi bocor","Allowlist tujuan, blokir alamat internal/metadata, dan jangan ikuti redirect ke jaringan privat","Periksa kepemilikan/otorisasi di server pada setiap akses objek"]'::jsonb,null,2,'Mitigasi yang tepat untuk IDOR (Broken Access Control): Periksa kepemilikan/otorisasi di server pada setiap akses objek.',null,'Akar masalahnya: IDOR (Broken Access Control).',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, umur, kota);

SELECT * FROM orang
WHERE negara > 30 AND umur > 30 AND kota = ''x'';','sql','["3","1","2"]'::jsonb,null,1,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','guess','Server baru saja membuat pesanan lewat POST /orders. Respons yang paling sesuai standar?',null,'POST /orders  { ... }','http','["200 OK dengan body kosong tanpa petunjuk alamat resource","201 Created dengan header Location: /orders/{id}","302 Found ke /orders"]'::jsonb,null,1,'201 menyatakan resource baru dibuat dan Location menunjuk alamat kanoniknya.',null,'Kode yang menandakan pembuatan.',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 20) (2, A, 30) (3, A, 50) (4, B, 30) (5, B, 20) (6, B, 10) (7, B, 40)

SELECT id, SUM(nilai) OVER (ORDER BY id) AS s FROM skor ORDER BY id;','sql','["1,200 | 2,200 | 3,200 | 4,200 | 5,200 | 6,200 | 7,200","1,20 | 2,30 | 3,80 | 4,50 | 5,70 | 6,80 | 7,120","1,20 | 2,50 | 3,100 | 4,130 | 5,150 | 6,160 | 7,200"]'::jsonb,null,2,'SUM() OVER (ORDER BY id) adalah jumlah kumulatif (frame default: awal sampai baris saat ini, termasuk seri pada kunci urut). Hasil: 1,20 | 2,50 | 3,100 | 4,130 | 5,150 | 6,160 | 7,200.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 10) (2, A, 40) (3, B, 10) (4, B, 30) (5, A, 50) (6, B, 50)

SELECT id, SUM(nilai) OVER (ORDER BY id) AS s FROM skor ORDER BY id;','sql','["1,190 | 2,190 | 3,190 | 4,190 | 5,190 | 6,190","1,10 | 2,50 | 3,60 | 4,90 | 5,140 | 6,190","1,10 | 2,40 | 3,20 | 4,50 | 5,90 | 6,100"]'::jsonb,null,1,'SUM() OVER (ORDER BY id) adalah jumlah kumulatif (frame default: awal sampai baris saat ini, termasuk seri pada kunci urut). Hasil: 1,10 | 2,50 | 3,60 | 4,90 | 5,140 | 6,190.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','guess','Dari daftar ini, nomor mana yang BUKAN penyimpan key-value/in-memory?',null,'1. Redis
2. Playwright
3. Memcached
4. etcd
5. Jotai','text','["2 dan 5","2 dan 4 dan 5","1 dan 4 dan 5"]'::jsonb,null,0,'Jotai dan Playwright termasuk kategori lain; etcd, Redis, Memcached adalah penyimpan key-value/in-memory.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, kota, umur);

SELECT * FROM orang
WHERE umur > 30 AND kota = ''x'' AND negara = ''x'';','sql','["3","2","4"]'::jsonb,null,0,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 3.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_A → LOCK tabel_B → LOCK tabel_C → COMMIT
T2: LOCK tabel_A → LOCK tabel_B → LOCK tabel_C → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan","Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan"]'::jsonb,null,0,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 4 percobaan ulang
base = 500 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(3000, base * 2**i)   # i = 0, 1, 2, …','python','["9500","7500","6500"]'::jsonb,null,2,'Jeda: 500, 1000, 2000, 3000 ms → total 6500 ms (cap 3000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','guess','Jenis kerentanan/serangan apa ini?',null,'Server memantulkan header Origin apa pun ke Access-Control-Allow-Origin dan mengaktifkan Allow-Credentials: true.','text','["Insecure Deserialization","CORS salah konfigurasi","Credential Stuffing"]'::jsonb,null,1,'CORS salah konfigurasi: Allowlist origin eksplisit; jangan memantulkan origin sembarang bersama credentials.',null,'Apa yang dikendalikan penyerang, dan di mana ia dieksekusi?',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Gita, Bandung) (2, Hana, Medan) (3, Dedi, Padang) (4, Citra, Medan) (5, Ayu, Padang)
-- pesanan(id, pelanggan_id, total, status)
(1, NULL, 80, lunas) (2, NULL, 80, baru) (3, 2, 70, lunas) (4, 3, 90, batal) (5, 4, 30, lunas) (6, NULL, 20, batal) (7, 4, 80, lunas)

SELECT p.nama FROM pelanggan p
WHERE (SELECT SUM(total) FROM pesanan o WHERE o.pelanggan_id = p.id)
  > (SELECT AVG(total) FROM pesanan)
ORDER BY p.nama;','sql','["Citra | Dedi | Hana","Citra | Dedi","(kosong)"]'::jsonb,null,0,'Subquery berkorelasi dihitung per pelanggan; pelanggan tanpa pesanan menghasilkan NULL sehingga perbandingan tidak lolos. Hasil: Citra | Dedi | Hana.',null,'Bandingkan SUM per pelanggan dengan AVG seluruh pesanan (termasuk yang pelanggan_id-nya NULL).',null),
('backend','output','Isi cache LRU di akhir, dari yang paling lama dipakai ke yang paling baru?',null,'kapasitas = 3
akses = ["E","B","C","E","B","F","E","A","C","B"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["A C B","A B C","B C A"]'::jsonb,null,0,'Simulasi LRU: hit=3, isi akhir (lama→baru) = A C B. Pada FIFO hit tidak memperbarui urutan (hit=2).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','output','Berapa p99 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [747,375,617,499,359,306,827,813,131,845,317,80,772]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["845","827","514"]'::jsonb,null,0,'N=13, rank=⌈99/100×13⌉=13 → 845 ms. Rata-rata (514) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Berapa saldo akhir?',null,'-- saldo awal = 860, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 860
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 860
T1: UPDATE akun SET saldo = x + 30 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 40 WHERE id = 1; COMMIT;','sql','["900","930","890"]'::jsonb,null,0,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 860+40, sehingga tambahan 30 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~1.0.2" }
// versi yang tersedia di registry:
1.0.2  1.0.5  1.1.2  1.1.3  1.2.2  1.2.3  1.2.5  2.0.4','json','["2.0.4","1.0.5","1.2.5"]'::jsonb,null,1,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 1.0.5.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','guess','Rilis ''blue-green'' berbeda dari ''canary'' dalam hal?',null,'# strategi deploy','text','["Keduanya identik; hanya beda nama vendor","Blue-green memindahkan SELURUH lalu lintas sekaligus ke lingkungan baru yang identik","Blue-green hanya untuk frontend, canary untuk backend"]'::jsonb,null,1,'Blue-green: dua lingkungan penuh dan saklar lalu lintas (rollback cepat). Canary: paparan bertahap untuk mendeteksi masalah dini.',null,'Seberapa banyak lalu lintas yang dialihkan pada tahap awal?',null),
('backend','output','Throughput maksimum (query/detik) yang bisa dilayani kolam ini?',null,'kolam_koneksi = 20
rata-rata_query = 5 ms, satu koneksi menangani satu query pada satu waktu','python','["4000","400","100"]'::jsonb,null,0,'Tiap koneksi menyelesaikan 200 query/detik × 20 koneksi = 4000 q/s.',null,'Satu koneksi menyelesaikan 1000/ms query per detik.',null),
('backend','guess','Kode status HTTP paling tepat untuk situasi ini:
Permintaan diterima tetapi akan diproses asinkron nanti',null,'# API REST','http','["204 No Content","202 Accepted","201 Created"]'::jsonb,null,1,'202 Accepted adalah kode yang sesuai dengan semantik situasi tersebut.',null,'Cari kata kunci: salah klien (4xx) atau server (5xx)? autentikasi atau otorisasi?',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'for i in range(panjang):
    for j in range(10):
        work()','python','["O(n)","O(2ⁿ)","O(1)"]'::jsonb,null,0,'Kompleksitas: O(n). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 20; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. A: counter = tmpA + 1
3. A: tmpA = counter
4. B: tmpB = counter
5. A: counter = tmpA + 1
6. B: counter = tmpB + 1
7. B: tmpB = counter
8. B: counter = tmpB + 1','python','["24","22","23"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 23, bukan 24. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 2 f.txt menjadi "fitur"
main: mengubah baris 2 f.txt menjadi "fitur" (isi IDENTIK, commit sendiri)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Berapa query SQL yang dijalankan (20 post, 7 penulis berbeda)?',null,'posts = Post.objects.prefetch_related("penulis")[:20]
for p in posts:
    print(p.penulis.nama)','python','["21","1","2"]'::jsonb,null,2,'prefetch_related memakai query kedua dengan WHERE id IN (...): total 2 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Berapa hasil query penelusuran ke atas dari pegawai 6?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 1) (4, 1) (5, 2) (6, 1) (7, 1)

WITH RECURSIVE naik(id) AS (
  SELECT 6
  UNION ALL
  SELECT s.atasan FROM staf s JOIN naik ON s.id = naik.id WHERE s.atasan IS NOT NULL
)
SELECT COUNT(*) FROM naik;','sql','["1","6","2"]'::jsonb,null,2,'Penelusuran naik menyertakan titik awal dan seluruh atasan hingga akar: 2 baris.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Berapa kali job ini berjalan pada hari yang cocok (satu hari)?',null,'# menit jam tgl bulan hari-minggu
*/15 9-17 * * 1-5','bash','["96","36","32"]'::jsonb,null,1,'Menit: 4 nilai × jam: 9 nilai = 36. Rentang a-b bersifat inklusif; */n dihitung dari awal rentang.',null,'Hitung nilai menit × nilai jam; rentang inklusif.',null),
('backend','output','Apa output kode Python ini?',null,'print(round(5.5), round(6.5), round(-0.5), 7.0 // 2, -7 // 2, -7 % 3, divmod(-7, 3))','python','["6 6 0 3.0 -4 2 (-3, 2)","6 6 0 3.0 -4 2 (-4, 2)","6 6 0 3.-2 -4 2 (-3, 2)"]'::jsonb,null,0,'round() memakai pembulatan bankir (setengah ke genap); // adalah floor division sehingga hasil negatif dibulatkan ke bawah; % mengikuti tanda pembagi. Hasil: 6 6 0 3.0 -4 2 (-3, 2).',null,'Pembulatan .5 ke genap; // membulatkan ke -∞.',null),
('backend','output','Berapa kunci yang PINDAH shard saat shard ditambah dari 4 menjadi 5?',null,'# shard = kunci % jumlah_shard
kunci = 0 .. 199
sebelum: shard = kunci % 4
sesudah: shard = kunci % 5','python','["160","40","155"]'::jsonb,null,0,'Dihitung langsung: 160 dari 200 kunci berpindah. Modulo membuat hampir semua kunci pindah; consistent hashing hanya memindahkan ≈ K/(n+1) = 40.',null,'Hitung berapa kunci yang hasil modulo-nya berubah, jangan menebak 1/n.',null),
('backend','output','Berapa request yang DITERIMA?',null,'# Token bucket: kapasitas 3 token, mulai penuh pada detik 0
# isi ulang 2 token/detik (kontinu, maksimum 3); tiap request memakai 1 token
waktu_request = [0,3,6,9,12,12,15,16,17]  # detik','python','["8","9","3"]'::jsonb,null,1,'Simulasi: token = min(3, token + Δt×2); request diterima jika token ≥ 1. Diterima 9 dari 9.',null,'Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'console.log("F");
process.nextTick(() => console.log("G"));
process.nextTick(() => { console.log("B"); Promise.resolve().then(() => console.log("undefined")); });
process.nextTick(() => console.log("undefined"));
process.nextTick(() => console.log("undefined"));','javascript','["F G B undefined undefined undefined","F G B","B F G undefined undefined undefined"]'::jsonb,null,0,'Urutan: F G B undefined undefined undefined. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','guess','Server menerima token ini sebagai valid. Apa kelemahannya?',null,'{"alg":"none","typ":"JWT"}.{"sub":"1","admin":true}.','json','["Verifikasi tidak memaksa algoritma yang diharapkan sehingga token tanpa tanda tangan diterima","Token harus selalu dienkripsi dengan Base64 agar isinya tidak bisa dibaca penyerang","JWT tidak boleh memuat klaim peran seperti admin karena klaim hanya untuk identitas pengguna"]'::jsonb,null,0,'Verifier harus menetapkan daftar algoritma yang diizinkan dan menolak ''none''. Base64 bukan enkripsi.',null,'Siapa yang menentukan algoritma verifikasi: header token atau server?',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 50) (2, B, 10) (3, B, 20) (4, B, 30) (5, A, 40) (6, B, 50)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,-10 | 2,10 | 3,10 | 4,20 | 5,0 | 6,0","1,0 | 2,-40 | 3,10 | 4,10 | 5,10 | 6,10","1,0 | 2,0 | 3,10 | 4,10 | 5,-10 | 6,20"]'::jsonb,null,2,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,0 | 3,10 | 4,10 | 5,-10 | 6,20.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','output','Berapa p90 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [34,61,844,137,764,742,381,238,85,613,374,839,667,797,302,319,638,529,71,208]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["432","797","839"]'::jsonb,null,1,'N=20, rank=⌈90/100×20⌉=18 → 797 ms. Rata-rata (432) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Berapa hasil query hierarki ini?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 2) (4, 3) (5, 3) (6, 1) (7, 5)

WITH RECURSIVE r(id, d) AS (
  SELECT id, 0 FROM staf WHERE atasan IS NULL
  UNION ALL
  SELECT s.id, r.d + 1 FROM staf s JOIN r ON s.atasan = r.id
)
SELECT MAX(d) FROM r;','sql','["5","4","7"]'::jsonb,null,1,'Kedalaman pohon (akar = 0) dihitung rekursif; hasil maksimum 4.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Berapa kali job ini berjalan pada hari yang cocok (satu hari)?',null,'# menit jam tgl bulan hari-minggu
0 */6 * * *','bash','["5","24","4"]'::jsonb,null,2,'Menit: 1 nilai × jam: 4 nilai = 4. Rentang a-b bersifat inklusif; */n dihitung dari awal rentang.',null,'Hitung nilai menit × nilai jam; rentang inklusif.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 4 f.txt menjadi "fitur"
main: mengubah baris 7 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','guess','Jenis kerentanan/serangan apa ini?',null,'os.system("ping " + host) dengan host berisi ''x; rm -rf /''.','text','["Subdomain takeover","Path Traversal","Command Injection"]'::jsonb,null,2,'Command Injection: Hindari shell: pakai API/argumen terpisah (subprocess dengan list) dan validasi input.',null,'Apa yang dikendalikan penyerang, dan di mana ia dieksekusi?',null),
('backend','output','Berapa request yang diterima oleh FIXED WINDOW (jendela [0,10), [10,20), …)?',null,'# batas 5 request per 10 detik
waktu_request = [1,1,4,4,6,6,9,10,10,12]  # detik','python','["8","6","10"]'::jsonb,null,0,'Fixed window mereset hitungan pada batas kelipatan 10 detik (menerima 8); sliding window menimbang 10 detik terakhir (menerima 6). Fixed window dapat meloloskan 2×5 request di sekitar batas jendela.',null,'Reset terjadi pada kelipatan tetap, bukan relatif terhadap tiap request.',null),
('backend','guess','Efek UUIDv4 acak sebagai primary key pada B-tree dibanding kunci berurutan?',null,'id UUID PRIMARY KEY DEFAULT gen_random_uuid()','sql','["Selalu lebih cepat karena tidak ada kontensi pada halaman indeks yang sama","Penyisipan tersebar acak sehingga page split dan cache miss meningkat","Tidak ada bedanya sebab indeks B-tree memperlakukan semua kunci sama saja"]'::jsonb,null,1,'Kunci acak menyisip di sembarang halaman indeks, memperbesar fragmentasi dan I/O.',null,'Di halaman indeks mana baris baru disisipkan?',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Citra, NULL) (2, Gita, Padang) (3, Hana, Padang) (4, Ayu, NULL) (5, Budi, Medan) (6, Eka, Padang)
-- pesanan(id, pelanggan_id, total, status)
(1, 2, 70, lunas) (2, 2, 20, batal) (3, 2, 50, batal) (4, 4, 40, baru) (5, 4, 80, batal) (6, 5, 90, batal) (7, 3, 20, lunas)

SELECT COUNT(*) FROM pelanggan p
LEFT JOIN pesanan o ON o.pelanggan_id = p.id
WHERE o.status = ''lunas'';','sql','["7","2","6"]'::jsonb,null,1,'Kondisi pada tabel kanan di WHERE membuang baris NULL hasil LEFT JOIN sehingga ia berperilaku seperti INNER JOIN; bila kondisi ada di ON, pelanggan tanpa pesanan tetap muncul. Hasil: 2.',null,'WHERE atau ON — mana yang menyaring SETELAH join?',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_C → LOCK tabel_A → COMMIT
T2: LOCK tabel_B → LOCK tabel_C → LOCK tabel_A → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan","Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten"]'::jsonb,null,2,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('backend','output','Berapa query SQL yang dijalankan (20 post, 6 penulis berbeda)?',null,'posts = Post.objects.prefetch_related("penulis")[:20]
for p in posts:
    print(p.penulis.nama)','python','["2","21","1"]'::jsonb,null,0,'prefetch_related memakai query kedua dengan WHERE id IN (...): total 2 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Isi cache LRU di akhir, dari yang paling lama dipakai ke yang paling baru?',null,'kapasitas = 3
akses = ["C","D","F","B","B","D","C","B","B","A","C","D"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["A C D","D C A","C A D"]'::jsonb,null,0,'Simulasi LRU: hit=5, isi akhir (lama→baru) = A C D. Pada FIFO hit tidak memperbarui urutan (hit=5).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','output','Throughput maksimum (query/detik) yang bisa dilayani kolam ini?',null,'kolam_koneksi = 10
rata-rata_query = 20 ms, satu koneksi menangani satu query pada satu waktu','python','["200","50","500"]'::jsonb,null,2,'Tiap koneksi menyelesaikan 50 query/detik × 10 koneksi = 500 q/s.',null,'Satu koneksi menyelesaikan 1000/ms query per detik.',null),
('backend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan penyimpan key-value/in-memory?',null,'1. Valkey
2. Express
3. Bulma
4. Redis
5. Memcached','text','["1, 3, 5","1, 4, 5","2, 3, 4"]'::jsonb,null,1,'Valkey, Redis, Memcached adalah penyimpan key-value/in-memory; Bulma dan Express termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 10; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. A: tmpA = counter
3. A: counter = tmpA + 1
4. B: counter = tmpB + 1
5. A: tmpA = counter
6. B: tmpB = counter
7. A: counter = tmpA + 1
8. B: counter = tmpB + 1','python','["14","12","13"]'::jsonb,null,1,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 12, bukan 14. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','output','Apa output kode Python ini?',null,'a = [[0] * 4] * 2
a[0][3] = 7
b = [[0] * 4 for _ in range(2)]
b[0][3] = 7
print(a == b, a, b)','python','["False [[0, 0, 0, 7], [0, 0, 0, 7]] [[0, 0, 0, 7], [0, 0, 0, 0]]","False [[0, 0, 2, 7], [0, 0, 0, 7]] [[0, 0, 0, 7], [0, 0, 0, 0]]","False [[0, 0, 0, 7], [0, 0, 0, 17]] [[0, 0, 0, 7], [0, 0, 0, 0]]"]'::jsonb,null,0,'[[0]*n]*2 menggandakan referensi ke SATU list yang sama; comprehension membuat list baru tiap iterasi. Hasil: False [[0, 0, 0, 7], [0, 0, 0, 7]] [[0, 0, 0, 7], [0, 0, 0, 0]].',null,'Berapa objek list yang sebenarnya dibuat?',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 5 percobaan ulang
base = 500 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(1000, base * 2**i)   # i = 0, 1, 2, …','python','["5500","4500","15500"]'::jsonb,null,1,'Jeda: 500, 1000, 1000, 1000, 1000 ms → total 4500 ms (cap 1000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'hasil = []
for i in range(panjang):
    hasil.insert(0, i)','python','["O(1)","O(2ⁿ)","O(n²)"]'::jsonb,null,2,'Kompleksitas: O(n²). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (kota, negara, umur);

SELECT * FROM orang
WHERE umur = ''x'' AND kota > 30 AND negara = ''x'';','sql','["3","2","1"]'::jsonb,null,2,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'process.nextTick(() => { console.log("D"); Promise.resolve().then(() => console.log("A")); });
process.nextTick(() => console.log("E"));
process.nextTick(() => { console.log("C"); Promise.resolve().then(() => console.log("undefined")); });
process.nextTick(() => { console.log("undefined"); Promise.resolve().then(() => console.log("undefined")); });
console.log("undefined");','javascript','["undefined D E C undefined A undefined undefined","D A E C","A C D E undefined undefined undefined undefined"]'::jsonb,null,0,'Urutan: undefined D E C undefined A undefined undefined. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','guess','Kode status HTTP paling tepat untuk situasi ini:
Resource sudah dihapus permanen dan tidak akan kembali',null,'# API REST','http','["410 Gone","413 Content Too Large","405 Method Not Allowed"]'::jsonb,null,0,'410 Gone adalah kode yang sesuai dengan semantik situasi tersebut.',null,'Cari kata kunci: salah klien (4xx) atau server (5xx)? autentikasi atau otorisasi?',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^2.0.0" }
// versi yang tersedia di registry:
2.0.0  2.0.3  2.1.0  2.2.2  3.0.2  3.1.0  3.2.0  3.2.1','json','["3.2.1","2.2.2","2.0.3"]'::jsonb,null,1,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 2.2.2.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','output','Berapa saldo akhir?',null,'-- saldo awal = 510, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 510
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 510
T1: UPDATE akun SET saldo = x + 50 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 40 WHERE id = 1; COMMIT;','sql','["550","560","600"]'::jsonb,null,0,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 510+40, sehingga tambahan 50 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('backend','output','Berapa kunci yang PINDAH shard saat shard ditambah dari 6 menjadi 7?',null,'# shard = kunci % jumlah_shard
kunci = 0 .. 99
sebelum: shard = kunci % 6
sesudah: shard = kunci % 7','python','["77","14","82"]'::jsonb,null,2,'Dihitung langsung: 82 dari 100 kunci berpindah. Modulo membuat hampir semua kunci pindah; consistent hashing hanya memindahkan ≈ K/(n+1) = 14.',null,'Hitung berapa kunci yang hasil modulo-nya berubah, jangan menebak 1/n.',null),
('backend','guess','Daftar produk perlu filter kategori dan harga maksimum serta pagination. Desain URL yang paling tepat?',null,'# GET koleksi produk','http','["GET /products?kategori=kopi&harga_maks=50000&limit=20&cursor=abc","POST /products/search dengan filter di URL path","GET /products/kategori/kopi/harga/50000/halaman/3/hapus-cache"]'::jsonb,null,0,'Filter, urutan, dan pagination adalah parameter query pada koleksi; path mengidentifikasi resource.',null,'Path = identitas resource; query = penyaring.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_B → LOCK tabel_A → COMMIT
T2: LOCK tabel_A → LOCK tabel_C → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan","Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan"]'::jsonb,null,0,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('backend','output','Berapa kali job ini berjalan pada hari yang cocok (satu hari)?',null,'# menit jam tgl bulan hari-minggu
10 */4 * * 6,0','bash','["7","6","24"]'::jsonb,null,1,'Menit: 1 nilai × jam: 6 nilai = 6. Rentang a-b bersifat inklusif; */n dihitung dari awal rentang.',null,'Hitung nilai menit × nilai jam; rentang inklusif.',null),
('backend','guess','Jenis kerentanan/serangan apa ini?',null,'Penyerang mencoba jutaan pasangan email-password hasil kebocoran situs lain secara otomatis di halaman login.','text','["SSRF","Credential Stuffing","IDOR (Broken Access Control)"]'::jsonb,null,1,'Credential Stuffing: Rate limiting, MFA, pemantauan login anomali, dan pengecekan kata sandi bocor.',null,'Apa yang dikendalikan penyerang, dan di mana ia dieksekusi?',null),
('backend','guess','Dari daftar ini, nomor mana yang BUKAN penyimpan key-value/in-memory?',null,'1. Redis
2. Memcached
3. Valkey
4. Apache HTTP Server
5. Jotai','text','["4 dan 5","2 dan 4 dan 5","1 dan 3 dan 5"]'::jsonb,null,0,'Apache HTTP Server dan Jotai termasuk kategori lain; Redis, Memcached, Valkey adalah penyimpan key-value/in-memory.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~3.1.0" }
// versi yang tersedia di registry:
3.1.0  3.2.1  3.3.0  3.3.2  4.1.2  4.1.3','json','["3.3.2","4.1.3","3.1.0"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 3.1.0.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 20) (2, B, 20) (3, B, 50) (4, B, 20) (5, A, 20) (6, A, 10)

SELECT id, DENSE_RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,2 | 2,2 | 3,1 | 4,2 | 5,1 | 6,2","1,2 | 2,2 | 3,1 | 14,2 | 5,1 | 6,2","1,2 | 2,3 | 3,1 | 4,4 | 5,1 | 6,2"]'::jsonb,null,0,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,2 | 2,2 | 3,1 | 4,2 | 5,1 | 6,2.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','guess','Layanan A memanggil B tanpa timeout dan B melambat. Dampak paling mungkin?',null,'resp = http.get(url_b)   # tanpa timeout','python','["A otomatis menyerah setelah 1 detik dan mengembalikan galat ke klien","Tidak ada dampak karena yang melambat hanya layanan B saja","Thread/koneksi di A menumpuk menunggu sehingga A ikut lumpuh"]'::jsonb,null,2,'Tanpa batas waktu, sumber daya A terkunci menunggu B. Timeout, bulkhead, dan circuit breaker membatasi dampak.',null,'Siapa yang menanggung biaya menunggu?',null),
('backend','output','Apa output kode Python ini?',null,'x = 5
def f():
    try:
        print(x)
    except UnboundLocalError:
        print("unbound")
    x = 6
f()
print([x for x in range(4)][-1], x)','python','["unbound | 3 5","3 5 | unbound","unbound | 3 4"]'::jsonb,null,0,'Variabel yang ditugaskan di dalam fungsi bersifat lokal di SELURUH fungsi sehingga membaca sebelum tugas melempar UnboundLocalError; comprehension punya scope sendiri. Hasil: unbound | 3 5.',null,'Satu fungsi, satu scope lokal: kapan Python memutuskan variabel itu lokal?',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 6 percobaan ulang
base = 250 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(3000, base * 2**i)   # i = 0, 1, 2, …','python','["15750","12750","9750"]'::jsonb,null,2,'Jeda: 250, 500, 1000, 2000, 3000, 3000 ms → total 9750 ms (cap 3000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','output','Berapa kunci yang PINDAH shard saat shard ditambah dari 4 menjadi 5?',null,'# shard = kunci % jumlah_shard
kunci = 0 .. 59
sebelum: shard = kunci % 4
sesudah: shard = kunci % 5','python','["48","51","12"]'::jsonb,null,0,'Dihitung langsung: 48 dari 60 kunci berpindah. Modulo membuat hampir semua kunci pindah; consistent hashing hanya memindahkan ≈ K/(n+1) = 12.',null,'Hitung berapa kunci yang hasil modulo-nya berubah, jangan menebak 1/n.',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Budi, Bandung) (2, Fajar, Medan) (3, Hana, Bandung) (4, Dedi, NULL) (5, Gita, Medan) (6, Eka, NULL)
-- pesanan(id, pelanggan_id, total, status)
(1, 2, 80, batal) (2, 2, 60, baru) (3, 4, 90, batal) (4, 1, 50, batal) (5, 1, 40, batal) (6, 3, 90, lunas) (7, 1, 90, lunas) (8, 3, 50, lunas) (9, 4, 70, batal)

SELECT COUNT(*) FROM (
  SELECT kota FROM pelanggan
  UNION ALL
  SELECT kota FROM pelanggan WHERE kota IS NOT NULL
) x
WHERE kota IS NULL OR kota <> ''Padang'';','sql','["3","8","10"]'::jsonb,null,2,'UNION ALL mempertahankan duplikat, UNION menghapusnya; kota <> ''Padang'' bernilai UNKNOWN untuk NULL sehingga perlu IS NULL eksplisit. Hasil: 10.',null,'UNION vs UNION ALL; perbandingan dengan NULL tidak pernah true.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'def f(n):
    if n <= 1: return 0
    return 1 + f(n // 2)','python','["O(n)","O(n²)","O(log n)"]'::jsonb,null,2,'Kompleksitas: O(log n). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Berapa query SQL yang dijalankan (50 post, 7 penulis berbeda)?',null,'posts = Post.objects.all()[:50]
for p in posts:
    print(p.penulis.nama)        # relasi ForeignKey, lazy','python','["51","2","1"]'::jsonb,null,0,'Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Berapa hasil query hierarki ini?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 1) (4, 2) (5, 3) (6, 5)

WITH RECURSIVE r(id, d) AS (
  SELECT id, 0 FROM staf WHERE atasan IS NULL
  UNION ALL
  SELECT s.id, r.d + 1 FROM staf s JOIN r ON s.atasan = r.id
)
SELECT MAX(d) FROM r;','sql','["4","6","3"]'::jsonb,null,2,'Kedalaman pohon (akar = 0) dihitung rekursif; hasil maksimum 3.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (kota, negara, umur);

SELECT * FROM orang
WHERE negara = ''x'' AND umur = ''x'' AND kota > 30;','sql','["3","1","2"]'::jsonb,null,1,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 1 f.txt menjadi "fitur"
main: mengubah baris 6 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 310, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 310
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 310
T1: UPDATE akun SET saldo = x + 70 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 60 WHERE id = 1; COMMIT;','sql','["Mengganti COMMIT menjadi ROLLBACK","Gunakan UPDATE atomik","Menambah indeks pada kolom saldo"]'::jsonb,null,1,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('backend','output','Rata-rata request yang sedang diproses bersamaan (in-flight)?',null,'# hukum Little: L = λ × W
λ = 500 request/detik
W = 20 ms rata-rata per request','python','["25","10","10000"]'::jsonb,null,1,'L = 500 × 0.02 s = 10.',null,'Samakan satuan waktu dulu: ms → detik.',null),
('backend','output','Isi cache LRU di akhir, dari yang paling lama dipakai ke yang paling baru?',null,'kapasitas = 4
akses = ["B","B","A","B","C","E","E","C","C","A","A"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["B E C A","B A C E","A C E B"]'::jsonb,null,0,'Simulasi LRU: hit=7, isi akhir (lama→baru) = B E C A. Pada FIFO hit tidak memperbarui urutan (hit=7).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','output','Berapa request yang diterima oleh FIXED WINDOW (jendela [0,10), [10,20), …)?',null,'# batas 4 request per 10 detik
waktu_request = [2,3,5,6,7,10,12,13,13,14]  # detik','python','["10","8","6"]'::jsonb,null,1,'Fixed window mereset hitungan pada batas kelipatan 10 detik (menerima 8); sliding window menimbang 10 detik terakhir (menerima 6). Fixed window dapat meloloskan 2×4 request di sekitar batas jendela.',null,'Reset terjadi pada kelipatan tetap, bukan relatif terhadap tiap request.',null),
('backend','guess','Pembatalan pesanan #45 (pesanan tetap tersimpan dengan status ''dibatalkan'' untuk audit). Desain endpoint REST yang paling tepat?',null,'# resource: orders','http','["DELETE /orders/45 (menghapus resource)","GET /orders/45/cancel (mengubah status lewat metode aman)","POST /orders/45/cancel"]'::jsonb,null,2,'DELETE menyiratkan resource hilang; GET harus aman (tidak boleh mengubah state). Aksi domain non-CRUD cocok sebagai sub-aksi dengan POST.',null,'Apakah data tetap ada setelah aksi? Apakah GET boleh mengubah state?',null),
('backend','guess','Kode status HTTP paling tepat untuk situasi ini:
URL dipindahkan PERMANEN ke alamat baru',null,'# API REST','http','["301 Moved Permanently","304 Not Modified","307 Temporary Redirect"]'::jsonb,null,0,'301 Moved Permanently adalah kode yang sesuai dengan semantik situasi tersebut.',null,'Cari kata kunci: salah klien (4xx) atau server (5xx)? autentikasi atau otorisasi?',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 7; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. A: counter = tmpA + 1
4. A: tmpA = counter
5. B: counter = tmpB + 1
6. A: counter = tmpA + 1
7. B: tmpB = counter
8. B: counter = tmpB + 1','python','["9","11","10"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 10, bukan 11. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','output','Berapa p90 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [469,296,497,712,267,232,502,754,352,654,788,545,606]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["754","513","788"]'::jsonb,null,0,'N=13, rank=⌈90/100×13⌉=12 → 754 ms. Rata-rata (513) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'process.nextTick(() => { console.log("G"); Promise.resolve().then(() => console.log("A")); });
console.log("E");
process.nextTick(() => { console.log("C"); Promise.resolve().then(() => console.log("undefined")); });
queueMicrotask(() => console.log("undefined"));','javascript','["G A E C","E G C undefined A undefined","A C E G undefined undefined"]'::jsonb,null,1,'Urutan: E G C undefined A undefined. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null);
