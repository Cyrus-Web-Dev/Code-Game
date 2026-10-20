-- DIHASILKAN oleh scripts/gen-dev.mjs (backend, bagian 2/4) — 250 soal HARD MODE (v2.4)
insert into questions (difficulty,type,prompt,prompt_en,code,language,options,options_en,correct_index,explanation,explanation_en,hint,hint_en) values
('backend','guess','Jenis kerentanan/serangan apa ini?',null,'Endpoint POST /ambil?url=… membuat server mengunduh URL; penyerang meminta http://169.254.169.254/latest/meta-data/.','text','["DOM-based XSS","CSRF","SSRF"]'::jsonb,null,2,'SSRF: Allowlist tujuan, blokir alamat internal/metadata, dan jangan ikuti redirect ke jaringan privat.',null,'Apa yang dikendalikan penyerang, dan di mana ia dieksekusi?',null),
('backend','output','Berapa kali job ini berjalan pada hari yang cocok (satu hari)?',null,'# menit jam tgl bulan hari-minggu
*/30 6-9 * * 1-3','bash','["6","48","8"]'::jsonb,null,2,'Menit: 2 nilai × jam: 4 nilai = 8. Rentang a-b bersifat inklusif; */n dihitung dari awal rentang.',null,'Hitung nilai menit × nilai jam; rentang inklusif.',null),
('backend','guess','Klien mengganti SELURUH data profil pengguna 7 dan ingin pengulangan request yang sama aman (hasil identik). Metode dan jalur yang tepat?',null,'# representasi lengkap dikirim klien','http','["PUT /users/7","PATCH /users/7 dengan seluruh field wajib","POST /users/7/update"]'::jsonb,null,0,'PUT bersifat idempoten dan menggantikan seluruh representasi; POST tidak idempoten; PATCH ditujukan untuk perubahan parsial.',null,'Idempoten + pengganti penuh.',null),
('backend','guess','Kode status HTTP paling tepat untuk situasi ini:
Klien mengirim If-None-Match yang cocok dan konten tidak berubah',null,'# API REST','http','["301 Moved Permanently","307 Temporary Redirect","304 Not Modified"]'::jsonb,null,2,'304 Not Modified adalah kode yang sesuai dengan semantik situasi tersebut.',null,'Cari kata kunci: salah klien (4xx) atau server (5xx)? autentikasi atau otorisasi?',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Citra, NULL) (2, Hana, Bandung) (3, Ayu, Padang) (4, Eka, Bandung) (5, Dedi, Padang)
-- pesanan(id, pelanggan_id, total, status)
(1, 1, 30, lunas) (2, 1, 40, lunas) (3, 2, 30, lunas) (4, 4, 90, lunas) (5, 2, 80, baru) (6, 2, 80, batal) (7, 3, 80, lunas)

SELECT COUNT(*) FROM pelanggan
WHERE id NOT IN (SELECT pelanggan_id FROM pesanan);','sql','["11","5","1"]'::jsonb,null,2,'NOT IN dengan subquery yang mengandung NULL menghasilkan UNKNOWN untuk setiap baris sehingga tidak ada yang lolos (0). NOT EXISTS atau NOT IN yang menyaring NULL berperilaku sesuai harapan. Hasil: 1.',null,'Apa hasil `x NOT IN (1, NULL)`?',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 20) (2, B, 20) (3, A, 20) (4, B, 40) (5, A, 20) (6, B, 30) (7, B, 20) (8, A, 10)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,0 | 2,20 | 3,0 | 4,-10 | 5,-10 | 6,-10 | 7,0 | 8,0","1,0 | 2,0 | 3,0 | 4,20 | 5,-20 | 6,10 | 7,-10 | 8,-10","1,0 | 2,0 | 3,0 | 4,20 | 5,0 | 6,-10 | 7,-10 | 8,-10"]'::jsonb,null,2,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,0 | 3,0 | 4,20 | 5,0 | 6,-10 | 7,-10 | 8,-10.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','output','Berapa saldo akhir?',null,'-- saldo awal = 660, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 660
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 660
T1: UPDATE akun SET saldo = x + 70 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 70 WHERE id = 1; COMMIT;','sql','["660","730","800"]'::jsonb,null,1,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 660+70, sehingga tambahan 70 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('backend','guess','Hasil kedua pembandingan ini di PHP 8?',null,'var_dump("1e3" == "1000");
var_dump("abc" == 0);','php','["true lalu false","true lalu true","false lalu true"]'::jsonb,null,0,'Dua string numerik dibandingkan sebagai angka (1e3 = 1000). Sejak PHP 8, string non-numerik dibandingkan dengan angka sebagai string, sehingga ''abc'' == 0 false.',null,'String numerik vs non-numerik.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 7 percobaan ulang
base = 200 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(5000, base * 2**i)   # i = 0, 1, 2, …','python','["21200","25400","16200"]'::jsonb,null,2,'Jeda: 200, 400, 800, 1600, 3200, 5000, 5000 ms → total 16200 ms (cap 5000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'for i in range(N):
    for j in range(N):
        total += i * j','python','["O(log n)","O(n·m)","O(n²)"]'::jsonb,null,2,'Kompleksitas: O(n²). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~2.0.1" }
// versi yang tersedia di registry:
2.0.1  2.0.3  2.0.4  2.2.2  2.2.4  3.0.0  3.0.2  3.0.4','json','["3.0.4","2.2.4","2.0.4"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 2.0.4.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','guess','Dari daftar ini, nomor mana yang BUKAN reverse proxy/web server?',null,'1. SOAP
2. Express
3. Apache HTTP Server
4. Nginx
5. Caddy','text','["1 dan 3 dan 4","1 dan 2","1 dan 2 dan 4"]'::jsonb,null,1,'SOAP dan Express termasuk kategori lain; Nginx, Apache HTTP Server, Caddy adalah reverse proxy/web server.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 1 f.txt menjadi "fitur"
main: mengubah baris 8 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Berapa query SQL yang dijalankan (200 post, 7 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:200]
for p in posts:
    print(p.penulis.nama)','python','["201","2","1"]'::jsonb,null,2,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_B → LOCK tabel_C → COMMIT
T2: LOCK tabel_A → LOCK tabel_B → LOCK tabel_C → COMMIT
T3: LOCK tabel_B → LOCK tabel_A → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_B → tabel_A","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh"]'::jsonb,null,0,'Graf urutan kunci memuat siklus tabel_A → tabel_B → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','output','Berapa hasil query penelusuran ke atas dari pegawai 7?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 2) (4, 1) (5, 3) (6, 1) (7, 6)

WITH RECURSIVE naik(id) AS (
  SELECT 7
  UNION ALL
  SELECT s.atasan FROM staf s JOIN naik ON s.id = naik.id WHERE s.atasan IS NOT NULL
)
SELECT COUNT(*) FROM naik;','sql','["3","7","2"]'::jsonb,null,0,'Penelusuran naik menyertakan titik awal dan seluruh atasan hingga akar: 3 baris.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 5; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. B: counter = tmpB + 1
3. A: tmpA = counter
4. B: tmpB = counter
5. B: counter = tmpB + 1
6. A: counter = tmpA + 1
7. A: tmpA = counter
8. A: counter = tmpA + 1','python','["9","7","8"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 8, bukan 9. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','output','Berapa kunci yang PINDAH shard saat shard ditambah dari 3 menjadi 4?',null,'# shard = kunci % jumlah_shard
kunci = 0 .. 199
sebelum: shard = kunci % 3
sesudah: shard = kunci % 4','python','["50","145","149"]'::jsonb,null,2,'Dihitung langsung: 149 dari 200 kunci berpindah. Modulo membuat hampir semua kunci pindah; consistent hashing hanya memindahkan ≈ K/(n+1) = 50.',null,'Hitung berapa kunci yang hasil modulo-nya berubah, jangan menebak 1/n.',null),
('backend','output','Isi cache LRU di akhir, dari yang paling lama dipakai ke yang paling baru?',null,'kapasitas = 4
akses = ["D","D","F","C","F","D","E","C","B","C","E"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["E C B D","F C E B","D B C E"]'::jsonb,null,2,'Simulasi LRU: hit=6, isi akhir (lama→baru) = D B C E. Pada FIFO hit tidak memperbarui urutan (hit=6).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','output','Berapa p99 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [171,469,766,498,534,808,831,553,528,457,124,495,577,474,126,876,337,432,129,411]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["480","831","876"]'::jsonb,null,2,'N=20, rank=⌈99/100×20⌉=20 → 876 ms. Rata-rata (480) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Rata-rata request yang sedang diproses bersamaan (in-flight)?',null,'# hukum Little: L = λ × W
λ = 500 request/detik
W = 80 ms rata-rata per request','python','["6.25","40000","40"]'::jsonb,null,2,'L = 500 × 0.08 s = 40.',null,'Samakan satuan waktu dulu: ms → detik.',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'process.nextTick(() => console.log("D"));
process.nextTick(() => { console.log("C"); Promise.resolve().then(() => console.log("E")); });
process.nextTick(() => { console.log("F"); Promise.resolve().then(() => console.log("undefined")); });
process.nextTick(() => { console.log("undefined"); Promise.resolve().then(() => console.log("undefined")); });
Promise.resolve().then(() => console.log("undefined"));','javascript','["C D E F undefined undefined undefined undefined","D C F undefined undefined E undefined undefined","D C E F"]'::jsonb,null,1,'Urutan: D C F undefined undefined E undefined undefined. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Berapa request yang diterima oleh FIXED WINDOW (jendela [0,5), [5,10), …)?',null,'# batas 3 request per 5 detik
waktu_request = [1,1,4,5,5,8,11,11,12,12,15]  # detik','python','["10","7","11"]'::jsonb,null,0,'Fixed window mereset hitungan pada batas kelipatan 5 detik (menerima 10); sliding window menimbang 5 detik terakhir (menerima 7). Fixed window dapat meloloskan 2×3 request di sekitar batas jendela.',null,'Reset terjadi pada kelipatan tetap, bukan relatif terhadap tiap request.',null),
('backend','output','Apa output kode Python ini?',null,'fs = [lambda: i * 4 for i in range(3)]
gs = [lambda i=i: i * 4 for i in range(3)]
print([f() for f in fs], [g() for g in gs])','python','["[8, 8, 8] [0, 4, 8]","[8, 8, 4, 8] [0, 8]","[8, 8, 8] [0, 4, 10]"]'::jsonb,null,0,'Closure Python mengikat variabel (late binding), bukan nilainya; default argumen menangkap nilai saat definisi. Hasil: [8, 8, 8] [0, 4, 8].',null,'Kapan i dibaca oleh lambda?',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (kota, negara, umur);

SELECT * FROM orang
WHERE kota > 30 AND negara = ''x'' AND umur = ''x'';','sql','["3","1","2"]'::jsonb,null,1,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','guess','Jenis kerentanan/serangan apa ini?',null,'pickle.loads() dipakai pada cookie yang dikirim klien sehingga penyerang bisa menjalankan kode.','text','["Insecure Deserialization","IDOR (Broken Access Control)","Open Redirect"]'::jsonb,null,0,'Insecure Deserialization: Jangan deserialisasi data tak tepercaya dengan format yang bisa menjalankan kode; pakai JSON dan tanda tangan.',null,'Apa yang dikendalikan penyerang, dan di mana ia dieksekusi?',null),
('backend','output','Apa output kode Python ini?',null,'x = 8
def f():
    try:
        print(x)
    except UnboundLocalError:
        print("unbound")
    x = 9
f()
print([x for x in range(2)][-1], x)','python','["unbound | 1 8","1 8 | unbound","unbound | 1 9"]'::jsonb,null,0,'Variabel yang ditugaskan di dalam fungsi bersifat lokal di SELURUH fungsi sehingga membaca sebelum tugas melempar UnboundLocalError; comprehension punya scope sendiri. Hasil: unbound | 1 8.',null,'Satu fungsi, satu scope lokal: kapan Python memutuskan variabel itu lokal?',null),
('backend','output','Berapa p50 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [383,268,646,176,840,804,629,266,316,692,862,569,683,875,437,447]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["629","556","569"]'::jsonb,null,2,'N=16, rank=⌈50/100×16⌉=8 → 569 ms. Rata-rata (556) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Berapa kunci yang PINDAH shard saat shard ditambah dari 6 menjadi 7?',null,'# shard = kunci % jumlah_shard
kunci = 0 .. 199
sebelum: shard = kunci % 6
sesudah: shard = kunci % 7','python','["29","173","170"]'::jsonb,null,2,'Dihitung langsung: 170 dari 200 kunci berpindah. Modulo membuat hampir semua kunci pindah; consistent hashing hanya memindahkan ≈ K/(n+1) = 29.',null,'Hitung berapa kunci yang hasil modulo-nya berubah, jangan menebak 1/n.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'i = 1
while i < n:
    i *= 2','python','["O(n log n)","O(n²)","O(log n)"]'::jsonb,null,2,'Kompleksitas: O(log n). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 800, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 800
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 800
T1: UPDATE akun SET saldo = x + 40 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 50 WHERE id = 1; COMMIT;','sql','["Menambah indeks pada kolom saldo","Mengganti COMMIT menjadi ROLLBACK","Gunakan UPDATE atomik"]'::jsonb,null,2,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 10) (2, B, 30) (3, A, 20) (4, B, 50) (5, A, 50) (6, A, 10)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,0 | 2,20 | 3,-10 | 4,30 | 5,0 | 6,-40","1,0 | 2,0 | 3,10 | 4,20 | 5,30 | 6,-40","1,10 | 2,20 | 3,30 | 4,0 | 5,-40 | 6,0"]'::jsonb,null,1,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,0 | 3,10 | 4,20 | 5,30 | 6,-40.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_B → LOCK tabel_C → LOCK tabel_A → COMMIT
T2: LOCK tabel_A → LOCK tabel_C → COMMIT
T3: LOCK tabel_A → LOCK tabel_C → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_C → tabel_A","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh"]'::jsonb,null,0,'Graf urutan kunci memuat siklus tabel_A → tabel_C → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','guess','Dua thread CPython menghitung loop CPU-bound masing-masing. Speedup yang diharapkan?',null,'t1 = Thread(target=hitung); t2 = Thread(target=hitung)','python','["Sekitar 2x karena dua core","Nyaris tidak ada","Selalu 2x lebih lambat"]'::jsonb,null,1,'GIL membatasi eksekusi bytecode Python paralel. Thread tetap berguna untuk I/O-bound karena GIL dilepas saat menunggu I/O.',null,'Beban CPU-bound atau I/O-bound?',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 17; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. A: counter = tmpA + 1
3. A: tmpA = counter
4. B: tmpB = counter
5. A: counter = tmpA + 1
6. B: counter = tmpB + 1
7. B: tmpB = counter
8. B: counter = tmpB + 1','python','["19","21","20"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 20, bukan 21. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','output','Berapa hasil query hierarki ini?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 1) (4, 3) (5, 4) (6, 1) (7, 4)

WITH RECURSIVE r(id, d) AS (
  SELECT id, 0 FROM staf WHERE atasan IS NULL
  UNION ALL
  SELECT s.id, r.d + 1 FROM staf s JOIN r ON s.atasan = r.id
)
SELECT MAX(d) FROM r;','sql','["4","3","7"]'::jsonb,null,1,'Kedalaman pohon (akar = 0) dihitung rekursif; hasil maksimum 3.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Berapa kali job ini berjalan dalam satu minggu penuh (Senin–Minggu)?',null,'# menit jam tgl bulan hari-minggu
*/20 8-18/2 * * 1-5','bash','["126","18","90"]'::jsonb,null,2,'18 kali sehari × 5 hari yang cocok (0=Minggu … 6=Sabtu) = 90.',null,'Kalikan jumlah eksekusi per hari dengan jumlah hari yang cocok.',null),
('backend','guess','Kode status HTTP paling tepat untuk situasi ini:
Header If-Match tidak cocok dengan ETag saat memperbarui (kontrol konkurensi optimis)',null,'# API REST','http','["412 Precondition Failed","410 Gone","422 Unprocessable Content"]'::jsonb,null,0,'412 Precondition Failed adalah kode yang sesuai dengan semantik situasi tersebut.',null,'Cari kata kunci: salah klien (4xx) atau server (5xx)? autentikasi atau otorisasi?',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 6 f.txt menjadi "fitur"
main: mengubah baris 3 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Throughput maksimum (query/detik) yang bisa dilayani kolam ini?',null,'kolam_koneksi = 50
rata-rata_query = 5 ms, satu koneksi menangani satu query pada satu waktu','python','["250","1000","10000"]'::jsonb,null,2,'Tiap koneksi menyelesaikan 200 query/detik × 50 koneksi = 10000 q/s.',null,'Satu koneksi menyelesaikan 1000/ms query per detik.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~0.0.2" }
// versi yang tersedia di registry:
0.0.2  0.0.3  0.1.3  0.2.4  1.0.2  1.0.3  1.1.2','json','["0.0.2","1.1.2","0.0.3"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 0.0.3.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Eka, Medan) (2, Citra, Bandung) (3, Fajar, Padang) (4, Ayu, Bandung) (5, Hana, Padang)
-- pesanan(id, pelanggan_id, total, status)
(1, 4, 60, lunas) (2, 1, 70, lunas) (3, 2, 80, baru) (4, 2, 50, lunas) (5, 1, 40, batal) (6, NULL, 90, baru) (7, 3, 70, batal)

SELECT p.nama, SUM(o.total)
FROM pelanggan p JOIN pesanan o ON o.pelanggan_id = p.id
WHERE o.status <> ''batal''
GROUP BY p.nama
HAVING SUM(o.total) > 50
ORDER BY p.nama;','sql','["Ayu,60 | Citra,130 | Eka,70","Ayu,60 | Citra,130 | Eka,110 | Fajar,70","Ayu,1 | Citra,2 | Eka,1"]'::jsonb,null,0,'WHERE menyaring baris SEBELUM pengelompokan; HAVING menyaring grup SESUDAH agregasi. Perhatikan status NULL tidak lolos <> ''batal''. Hasil: Ayu,60 | Citra,130 | Eka,70.',null,'Urutan eksekusi: FROM → WHERE → GROUP BY → HAVING.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 6 percobaan ulang
base = 250 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(2000, base * 2**i)   # i = 0, 1, 2, …','python','["15750","9750","7750"]'::jsonb,null,2,'Jeda: 250, 500, 1000, 2000, 2000, 2000 ms → total 7750 ms (cap 2000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (umur, kota, negara);

SELECT * FROM orang
WHERE umur = ''x'' AND kota > 30;','sql','["2","1","3"]'::jsonb,null,0,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 2.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','output','Berapa request yang diterima oleh FIXED WINDOW (jendela [0,10), [10,20), …)?',null,'# batas 5 request per 10 detik
waktu_request = [2,4,7,8,10,13,14,16,19,20,21]  # detik','python','["12","11","10"]'::jsonb,null,1,'Fixed window mereset hitungan pada batas kelipatan 10 detik (menerima 11); sliding window menimbang 10 detik terakhir (menerima 10). Fixed window dapat meloloskan 2×5 request di sekitar batas jendela.',null,'Reset terjadi pada kelipatan tetap, bukan relatif terhadap tiap request.',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'process.nextTick(() => { console.log("F"); Promise.resolve().then(() => console.log("B")); });
queueMicrotask(() => console.log("E"));
Promise.resolve().then(() => console.log("D"));
Promise.resolve().then(() => console.log("undefined"));
queueMicrotask(() => console.log("undefined"));','javascript','["B D E F undefined undefined","F E D undefined undefined B","F B E D"]'::jsonb,null,1,'Urutan: F E D undefined undefined B. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Berapa query SQL yang dijalankan (50 post, 6 penulis berbeda)?',null,'posts = Post.objects.all()[:50]
for p in posts:
    print(p.penulis.nama)        # relasi ForeignKey, lazy','python','["2","1","51"]'::jsonb,null,2,'Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','guess','Dari daftar ini, nomor mana yang BUKAN reverse proxy/web server?',null,'1. HAProxy
2. Testing Library
3. Apache HTTP Server
4. Traefik
5. Firestore','text','["2 dan 5","1 dan 2 dan 5","2 dan 3 dan 5"]'::jsonb,null,0,'Firestore dan Testing Library termasuk kategori lain; Apache HTTP Server, HAProxy, Traefik adalah reverse proxy/web server.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('backend','output','Berapa jumlah cache HIT pada cache LRU ini?',null,'kapasitas = 3
akses = ["D","F","D","D","A","E","A","E","F","C","C","A"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["5","7","6"]'::jsonb,null,0,'Simulasi LRU: hit=5, isi akhir (lama→baru) = F C A. Pada FIFO hit tidak memperbarui urutan (hit=7).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','output','Berapa kunci yang PINDAH shard saat shard ditambah dari 3 menjadi 4?',null,'# shard = kunci % jumlah_shard
kunci = 0 .. 119
sebelum: shard = kunci % 3
sesudah: shard = kunci % 4','python','["30","90","85"]'::jsonb,null,1,'Dihitung langsung: 90 dari 120 kunci berpindah. Modulo membuat hampir semua kunci pindah; consistent hashing hanya memindahkan ≈ K/(n+1) = 30.',null,'Hitung berapa kunci yang hasil modulo-nya berubah, jangan menebak 1/n.',null),
('backend','output','Apa output kode Python ini?',null,'def tambah(x, tas=[]):
    tas.append(x)
    return len(tas)

print(tambah(3), tambah(4), tambah(5, []), tambah(6))','python','["1 2 -1 3","1 4 1 3","1 2 1 3"]'::jsonb,null,2,'Nilai default dievaluasi SEKALI saat fungsi didefinisikan, jadi list default dipakai bersama antar panggilan; list yang dikirim eksplisit tidak ikut. Hasil: 1 2 1 3.',null,'Kapan nilai default dievaluasi?',null),
('backend','output','Berapa query SQL yang dijalankan (200 post, 5 penulis berbeda)?',null,'posts = Post.objects.all()[:200]
for p in posts:
    print(p.penulis.nama)        # relasi ForeignKey, lazy','python','["1","201","2"]'::jsonb,null,1,'Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Berapa request yang DITERIMA?',null,'# Token bucket: kapasitas 3 token, mulai penuh pada detik 0
# isi ulang 1 token/detik (kontinu, maksimum 3); tiap request memakai 1 token
waktu_request = [0,1,1,3,4,4,5,8,10,13]  # detik','python','["3","9","10"]'::jsonb,null,2,'Simulasi: token = min(3, token + Δt×1); request diterima jika token ≥ 1. Diterima 10 dari 10.',null,'Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 1 f.txt menjadi "fitur"
main: mengubah g.txt (commit baru)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 10) (2, A, 40) (3, A, 30) (4, B, 20) (5, B, 50) (6, A, 30)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,10 | 2,-10 | 3,0 | 4,30 | 5,0 | 6,0","1,0 | 2,0 | 3,-10 | 4,10 | 5,30 | 6,0","1,0 | 2,30 | 3,-10 | 4,-10 | 5,30 | 6,-20"]'::jsonb,null,1,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,0 | 3,-10 | 4,10 | 5,30 | 6,0.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^2.4.0" }
// versi yang tersedia di registry:
2.4.0  2.4.3  2.5.2  2.6.0  3.4.1  3.4.2','json','["2.4.3","2.6.0","3.4.2"]'::jsonb,null,1,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 2.6.0.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','guess','Dari daftar ini, nomor mana yang BUKAN penyimpan key-value/in-memory?',null,'1. Amazon SQS
2. Valkey
3. RabbitMQ
4. Memcached
5. Redis','text','["1 dan 3","1 dan 4 dan 5","1 dan 3 dan 4"]'::jsonb,null,0,'Amazon SQS dan RabbitMQ termasuk kategori lain; Valkey, Redis, Memcached adalah penyimpan key-value/in-memory.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('backend','output','Berapa kali job ini berjalan pada hari yang cocok (satu hari)?',null,'# menit jam tgl bulan hari-minggu
5 4 * * 1,3,5','bash','["1","2","24"]'::jsonb,null,0,'Menit: 1 nilai × jam: 1 nilai = 1. Rentang a-b bersifat inklusif; */n dihitung dari awal rentang.',null,'Hitung nilai menit × nilai jam; rentang inklusif.',null),
('backend','output','Rata-rata request yang sedang diproses bersamaan (in-flight)?',null,'# hukum Little: L = λ × W
λ = 500 request/detik
W = 120 ms rata-rata per request','python','["60","60000","4.17"]'::jsonb,null,0,'L = 500 × 0.12 s = 60.',null,'Samakan satuan waktu dulu: ms → detik.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, umur, kota);

SELECT * FROM orang
WHERE umur > 30 AND kota > 30 AND negara = ''x'';','sql','["3","1","2"]'::jsonb,null,2,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 2.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','output','Berapa p90 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [846,117,651,44,478,101,671,672,667,836,334,526,861,809,748,360,211,111,564,546]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["846","508","836"]'::jsonb,null,2,'N=20, rank=⌈90/100×20⌉=18 → 836 ms. Rata-rata (508) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Hana, Bandung) (2, Ayu, Padang) (3, Eka, Medan) (4, Budi, Bandung) (5, Fajar, Padang) (6, Citra, Medan)
-- pesanan(id, pelanggan_id, total, status)
(1, 5, 90, lunas) (2, NULL, 30, lunas) (3, 3, 80, lunas) (4, NULL, 50, lunas) (5, NULL, 20, batal) (6, 1, 80, lunas) (7, 3, 70, batal) (8, 2, 90, batal)

SELECT p.nama, SUM(o.total)
FROM pelanggan p JOIN pesanan o ON o.pelanggan_id = p.id
WHERE o.status <> ''batal''
GROUP BY p.nama
HAVING SUM(o.total) > 40
ORDER BY p.nama;','sql','["Eka,1 | Fajar,1 | Hana,1","Eka,80 | Fajar,90 | Hana,80","Ayu,90 | Eka,150 | Fajar,90 | Hana,80"]'::jsonb,null,1,'WHERE menyaring baris SEBELUM pengelompokan; HAVING menyaring grup SESUDAH agregasi. Perhatikan status NULL tidak lolos <> ''batal''. Hasil: Eka,80 | Fajar,90 | Hana,80.',null,'Urutan eksekusi: FROM → WHERE → GROUP BY → HAVING.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 7 percobaan ulang
base = 500 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(3000, base * 2**i)   # i = 0, 1, 2, …','python','["18500","15500","63500"]'::jsonb,null,1,'Jeda: 500, 1000, 2000, 3000, 3000, 3000, 3000 ms → total 15500 ms (cap 3000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','output','Berapa saldo akhir?',null,'-- saldo awal = 250, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 250
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 250
T1: UPDATE akun SET saldo = x + 70 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 70 WHERE id = 1; COMMIT;','sql','["250","390","320"]'::jsonb,null,2,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 250+70, sehingga tambahan 70 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_C → LOCK tabel_B → COMMIT
T2: LOCK tabel_B → LOCK tabel_A → LOCK tabel_C → COMMIT
T3: LOCK tabel_C → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_C → tabel_B → tabel_A","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh"]'::jsonb,null,0,'Graf urutan kunci memuat siklus tabel_A → tabel_C → tabel_B → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','guess','Latensi melonjak dengan galat ''timeout acquiring connection'', padahal CPU database rendah. Penyebab paling mungkin?',null,'pool = ConnectionPool(max=20)','python','["Kolam koneksi aplikasi habis karena koneksi/transaksi tertahan lama","Terlalu banyak indeks pada tabel sehingga penulisan membuat optimizer berhenti bekerja","Disk database penuh sehingga setiap koneksi baru ditolak oleh sistem berkas"]'::jsonb,null,0,'Antrean ada di kolam koneksi, bukan di CPU DB. Lepas koneksi sebelum I/O eksternal, perpendek transaksi, atur ukuran kolam.',null,'Di mana antrean menunggu — aplikasi atau database?',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'set_b = set(daftar_b)    # m elemen
for a in daftar_a:       # n elemen
    if a in set_b:
        hit += 1','python','["O(2ⁿ)","O(log n)","O(n + m)"]'::jsonb,null,2,'Kompleksitas: O(n + m). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'process.nextTick(() => { console.log("B"); Promise.resolve().then(() => console.log("A")); });
process.nextTick(() => console.log("G"));
process.nextTick(() => console.log("C"));
process.nextTick(() => console.log("undefined"));','javascript','["B G C undefined A","A B C G undefined","B A G C"]'::jsonb,null,0,'Urutan: B G C undefined A. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Berapa jumlah cache HIT pada cache LRU ini?',null,'kapasitas = 3
akses = ["D","A","A","D","A","D","B","B","A","D","A","A"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["8","9","10"]'::jsonb,null,1,'Simulasi LRU: hit=9, isi akhir (lama→baru) = B D A. Pada FIFO hit tidak memperbarui urutan (hit=9).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 4; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. A: counter = tmpA + 1
3. B: tmpB = counter
4. B: counter = tmpB + 1
5. B: tmpB = counter
6. A: tmpA = counter
7. A: counter = tmpA + 1
8. B: counter = tmpB + 1','python','["6","8","7"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 7, bukan 8. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','guess','Kode status HTTP paling tepat untuk situasi ini:
JSON valid secara sintaks tetapi field ''umur'' berisi teks (gagal validasi semantik)',null,'# API REST','http','["404 Not Found","422 Unprocessable Content","403 Forbidden"]'::jsonb,null,1,'422 Unprocessable Content adalah kode yang sesuai dengan semantik situasi tersebut.',null,'Cari kata kunci: salah klien (4xx) atau server (5xx)? autentikasi atau otorisasi?',null),
('backend','guess','Jenis kerentanan/serangan apa ini?',null,'Pengguna yang sedang login membuka situs jahat; form tersembunyi di sana mengirim POST /transfer ke bank dengan cookie sesinya.','text','["CSRF","Clickjacking","Reflected XSS"]'::jsonb,null,0,'CSRF: SameSite pada cookie sesi dan token CSRF anti-pemalsuan.',null,'Apa yang dikendalikan penyerang, dan di mana ia dieksekusi?',null),
('backend','output','Berapa hasil query penelusuran ke atas dari pegawai 4?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 2) (4, 1) (5, 1) (6, 3)

WITH RECURSIVE naik(id) AS (
  SELECT 4
  UNION ALL
  SELECT s.atasan FROM staf s JOIN naik ON s.id = naik.id WHERE s.atasan IS NOT NULL
)
SELECT COUNT(*) FROM naik;','sql','["1","4","2"]'::jsonb,null,2,'Penelusuran naik menyertakan titik awal dan seluruh atasan hingga akar: 2 baris.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','guess','Apa output kode Java ini?',null,'Integer a = 127, b = 127, c = 128, d = 128;
System.out.println((a == b) + " " + (c == d));','java','["true true","true false","false false"]'::jsonb,null,1,'Autoboxing memakai cache Integer untuk -128..127, sehingga == membandingkan objek yang sama hanya di rentang itu. Pakai equals().',null,'Cache Integer.',null),
('backend','output','Apa output kode Python ini?',null,'fs = [lambda: i * 1 for i in range(2)]
gs = [lambda i=i: i * 1 for i in range(2)]
print([f() for f in fs], [g() for g in gs])','python','["[1, 0] [0, 1]","[1, 1] [0, 1]","[1, 1] [0, 0]"]'::jsonb,null,1,'Closure Python mengikat variabel (late binding), bukan nilainya; default argumen menangkap nilai saat definisi. Hasil: [1, 1] [0, 1].',null,'Kapan i dibaca oleh lambda?',null),
('backend','output','Berapa p50 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [581,454,799,587,647,701,417,754,440,195]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["558","581","587"]'::jsonb,null,1,'N=10, rank=⌈50/100×10⌉=5 → 581 ms. Rata-rata (558) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (umur, kota, negara);

SELECT * FROM orang
WHERE kota > 30 AND umur > 30 AND negara > 30;','sql','["0","1","3"]'::jsonb,null,1,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 20) (2, B, 20) (3, A, 40) (4, B, 10) (5, A, 50) (6, A, 30)

SELECT id, SUM(nilai) OVER (ORDER BY id) AS s FROM skor ORDER BY id;','sql','["1,170 | 2,170 | 3,170 | 4,170 | 5,170 | 6,170","1,20 | 2,40 | 3,80 | 4,90 | 5,140 | 6,170","1,20 | 2,20 | 3,60 | 4,30 | 5,110 | 6,140"]'::jsonb,null,1,'SUM() OVER (ORDER BY id) adalah jumlah kumulatif (frame default: awal sampai baris saat ini, termasuk seri pada kunci urut). Hasil: 1,20 | 2,40 | 3,80 | 4,90 | 5,140 | 6,170.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_A → LOCK tabel_C → COMMIT
T2: LOCK tabel_B → LOCK tabel_A → COMMIT
T3: LOCK tabel_A → LOCK tabel_B → LOCK tabel_C → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_B → tabel_A","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh"]'::jsonb,null,1,'Graf urutan kunci memuat siklus tabel_A → tabel_B → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Eka, Padang) (2, Fajar, Padang) (3, Citra, NULL) (4, Ayu, Bandung) (5, Dedi, NULL) (6, Budi, NULL)
-- pesanan(id, pelanggan_id, total, status)
(1, 1, 70, baru) (2, 5, 60, batal) (3, 3, 50, baru) (4, 3, 80, lunas) (5, 1, 40, batal) (6, 5, 50, batal) (7, 3, 40, lunas)

SELECT COUNT(*) FROM pelanggan p
LEFT JOIN pesanan o ON o.pelanggan_id = p.id
WHERE o.status = ''baru'';','sql','["6","7","2"]'::jsonb,null,2,'Kondisi pada tabel kanan di WHERE membuang baris NULL hasil LEFT JOIN sehingga ia berperilaku seperti INNER JOIN; bila kondisi ada di ON, pelanggan tanpa pesanan tetap muncul. Hasil: 2.',null,'WHERE atau ON — mana yang menyaring SETELAH join?',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 3 f.txt menjadi "fitur"
main: tidak ada commit baru sejak fitur dibuat

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Fast-forward: tidak ada merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Berapa query SQL yang dijalankan (50 post, 6 penulis berbeda)?',null,'posts = Post.objects.prefetch_related("penulis")[:50]
for p in posts:
    print(p.penulis.nama)','python','["1","51","2"]'::jsonb,null,2,'prefetch_related memakai query kedua dengan WHERE id IN (...): total 2 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'console.log("B");
process.nextTick(() => { console.log("A"); Promise.resolve().then(() => console.log("D")); });
console.log("C");
process.nextTick(() => console.log("undefined"));
console.log("undefined");','javascript','["B A D C","A B C D undefined undefined","B C undefined A undefined D"]'::jsonb,null,2,'Urutan: B C undefined A undefined D. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~0.0.1" }
// versi yang tersedia di registry:
0.0.1  0.0.3  0.2.4  1.0.1  1.0.2  1.1.3  1.2.3  1.2.4','json','["1.2.4","0.0.1","0.0.3"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 0.0.3.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','output','Throughput maksimum (query/detik) yang bisa dilayani kolam ini?',null,'kolam_koneksi = 10
rata-rata_query = 5 ms, satu koneksi menangani satu query pada satu waktu','python','["2000","200","50"]'::jsonb,null,0,'Tiap koneksi menyelesaikan 200 query/detik × 10 koneksi = 2000 q/s.',null,'Satu koneksi menyelesaikan 1000/ms query per detik.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 6 percobaan ulang
base = 200 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(2000, base * 2**i)   # i = 0, 1, 2, …','python','["9000","7000","12600"]'::jsonb,null,1,'Jeda: 200, 400, 800, 1600, 2000, 2000 ms → total 7000 ms (cap 2000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','output','Berapa kunci yang PINDAH shard saat shard ditambah dari 6 menjadi 7?',null,'# shard = kunci % jumlah_shard
kunci = 0 .. 59
sebelum: shard = kunci % 6
sesudah: shard = kunci % 7','python','["9","48","43"]'::jsonb,null,1,'Dihitung langsung: 48 dari 60 kunci berpindah. Modulo membuat hampir semua kunci pindah; consistent hashing hanya memindahkan ≈ K/(n+1) = 9.',null,'Hitung berapa kunci yang hasil modulo-nya berubah, jangan menebak 1/n.',null),
('backend','output','Berapa hasil query hierarki ini?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 1) (4, 1) (5, 3)

WITH RECURSIVE r(id, d) AS (
  SELECT id, 0 FROM staf WHERE atasan IS NULL
  UNION ALL
  SELECT s.id, r.d + 1 FROM staf s JOIN r ON s.atasan = r.id
)
SELECT MAX(d) FROM r;','sql','["5","2","3"]'::jsonb,null,1,'Kedalaman pohon (akar = 0) dihitung rekursif; hasil maksimum 2.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','guess','Kode status HTTP paling tepat untuk situasi ini:
Token akses kedaluwarsa atau tidak ada',null,'# API REST','http','["401 Unauthorized","429 Too Many Requests","422 Unprocessable Content"]'::jsonb,null,0,'401 Unauthorized adalah kode yang sesuai dengan semantik situasi tersebut.',null,'Cari kata kunci: salah klien (4xx) atau server (5xx)? autentikasi atau otorisasi?',null),
('backend','output','Berapa request yang DITERIMA?',null,'# Token bucket: kapasitas 3 token, mulai penuh pada detik 0
# isi ulang 2 token/detik (kontinu, maksimum 3); tiap request memakai 1 token
waktu_request = [3,4,5,5,5,5,6,6,8,8]  # detik','python','["10","9","3"]'::jsonb,null,1,'Simulasi: token = min(3, token + Δt×2); request diterima jika token ≥ 1. Diterima 9 dari 10.',null,'Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.',null),
('backend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan reverse proxy/web server?',null,'1. Apache HTTP Server
2. Webpack
3. Nginx
4. Caddy
5. PostCSS','text','["3, 4, 5","1, 3, 4","2, 3, 4"]'::jsonb,null,1,'Apache HTTP Server, Nginx, Caddy adalah reverse proxy/web server; Webpack dan PostCSS termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('backend','output','Berapa jumlah cache HIT pada cache LRU ini?',null,'kapasitas = 3
akses = ["F","F","D","F","C","F","A","A","B","A","C"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["6","5","4"]'::jsonb,null,1,'Simulasi LRU: hit=5, isi akhir (lama→baru) = B A C. Pada FIFO hit tidak memperbarui urutan (hit=6).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 20; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. A: tmpA = counter
3. A: counter = tmpA + 1
4. A: tmpA = counter
5. B: counter = tmpB + 1
6. A: counter = tmpA + 1
7. B: tmpB = counter
8. B: counter = tmpB + 1','python','["22","23","24"]'::jsonb,null,1,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 23, bukan 24. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'def f(panjang):
    if panjang <= 1: return 1
    return f(panjang - 1) + f(panjang - 1)','python','["O(2ⁿ)","O(n + m)","O(log n)"]'::jsonb,null,0,'Kompleksitas: O(2ⁿ). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','guess','Mitigasi UTAMA untuk kasus ini?
GET /unduh?berkas=../../etc/passwd mengembalikan isi berkas sistem.',null,'# keamanan aplikasi web','text','["CSP frame-ancestors atau X-Frame-Options agar halaman tidak bisa dibingkai situs lain","Normalisasi path, batasi ke direktori dasar, dan jangan pakai input langsung sebagai nama berkas","Rate limiting, MFA, pemantauan login anomali, dan pengecekan kata sandi bocor"]'::jsonb,null,1,'Mitigasi yang tepat untuk Path Traversal: Normalisasi path, batasi ke direktori dasar, dan jangan pakai input langsung sebagai nama berkas.',null,'Akar masalahnya: Path Traversal.',null),
('backend','output','Berapa kali job ini berjalan dalam satu minggu penuh (Senin–Minggu)?',null,'# menit jam tgl bulan hari-minggu
*/15 9-17 * * 1-5','bash','["36","252","180"]'::jsonb,null,2,'36 kali sehari × 5 hari yang cocok (0=Minggu … 6=Sabtu) = 180.',null,'Kalikan jumlah eksekusi per hari dengan jumlah hari yang cocok.',null),
('backend','guess','Anomali konkurensi apa yang terjadi pada jadwal ini?',null,'T1: SELECT jaga FROM dokter WHERE aktif;   -- 2 orang
T2: SELECT jaga FROM dokter WHERE aktif;   -- 2 orang
T1: UPDATE dokter SET aktif = false WHERE nama = ''A''; COMMIT;
T2: UPDATE dokter SET aktif = false WHERE nama = ''B''; COMMIT;  -- 0 dokter jaga','sql','["phantom read","write skew","dirty read"]'::jsonb,null,1,'Dua transaksi membaca kondisi yang sama lalu menulis baris berbeda sehingga invarian rusak; hanya SERIALIZABLE (atau penguncian eksplisit) yang mencegahnya.',null,'Apa yang berubah di antara dua langkah baca, atau apa yang dibaca sebelum commit?',null),
('backend','output','Berapa saldo akhir?',null,'-- saldo awal = 430, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 430
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 430
T1: UPDATE akun SET saldo = x + 70 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 60 WHERE id = 1; COMMIT;','sql','["500","560","490"]'::jsonb,null,2,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 430+60, sehingga tambahan 70 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (umur, kota, negara);

SELECT * FROM orang
WHERE kota = ''x'' AND negara > 30;','sql','["1","0","2"]'::jsonb,null,1,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 0.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'def f(N):
    if N <= 1: return 0
    return 1 + f(N // 2)','python','["O(log n)","O(1)","O(n·m)"]'::jsonb,null,0,'Kompleksitas: O(log n). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 5 percobaan ulang
base = 200 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(3000, base * 2**i)   # i = 0, 1, 2, …','python','["6000","9000","6200"]'::jsonb,null,0,'Jeda: 200, 400, 800, 1600, 3000 ms → total 6000 ms (cap 3000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~0.0.2" }
// versi yang tersedia di registry:
0.0.2  0.0.3  0.0.4  0.1.4  0.1.5  0.2.0  1.0.2  1.0.4','json','["1.0.4","0.0.4","0.0.2"]'::jsonb,null,1,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 0.0.4.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','output','Berapa query SQL yang dijalankan (100 post, 7 penulis berbeda)?',null,'posts = Post.objects.all()[:100]
for p in posts:
    print(p.penulis.nama)        # relasi ForeignKey, lazy','python','["2","101","1"]'::jsonb,null,1,'Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 3 f.txt menjadi "fitur"
main: mengubah baris 8 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Berapa kunci yang PINDAH shard saat shard ditambah dari 4 menjadi 5?',null,'# shard = kunci % jumlah_shard
kunci = 0 .. 99
sebelum: shard = kunci % 4
sesudah: shard = kunci % 5','python','["20","80","76"]'::jsonb,null,1,'Dihitung langsung: 80 dari 100 kunci berpindah. Modulo membuat hampir semua kunci pindah; consistent hashing hanya memindahkan ≈ K/(n+1) = 20.',null,'Hitung berapa kunci yang hasil modulo-nya berubah, jangan menebak 1/n.',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Ayu, Padang) (2, Eka, NULL) (3, Budi, Padang) (4, Citra, Bandung) (5, Dedi, Padang)
-- pesanan(id, pelanggan_id, total, status)
(1, 1, 30, lunas) (2, NULL, 20, lunas) (3, NULL, 40, lunas) (4, 2, 30, lunas) (5, 4, 90, batal) (6, 4, 50, lunas) (7, 2, 80, baru) (8, 1, 60, baru)

SELECT COUNT(*) FROM pelanggan p
LEFT JOIN pesanan o ON o.pelanggan_id = p.id
WHERE o.status = ''baru'';','sql','["2","5","6"]'::jsonb,null,0,'Kondisi pada tabel kanan di WHERE membuang baris NULL hasil LEFT JOIN sehingga ia berperilaku seperti INNER JOIN; bila kondisi ada di ON, pelanggan tanpa pesanan tetap muncul. Hasil: 2.',null,'WHERE atau ON — mana yang menyaring SETELAH join?',null),
('backend','output','Berapa kali job ini berjalan dalam satu minggu penuh (Senin–Minggu)?',null,'# menit jam tgl bulan hari-minggu
0 0 * * 0','bash','["1","2","7"]'::jsonb,null,0,'1 kali sehari × 1 hari yang cocok (0=Minggu … 6=Sabtu) = 1.',null,'Kalikan jumlah eksekusi per hari dengan jumlah hari yang cocok.',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'process.nextTick(() => { console.log("E"); Promise.resolve().then(() => console.log("D")); });
process.nextTick(() => { console.log("A"); Promise.resolve().then(() => console.log("B")); });
queueMicrotask(() => console.log("F"));
Promise.resolve().then(() => console.log("undefined"));
queueMicrotask(() => console.log("undefined"));','javascript','["A B D E F undefined undefined","E A F undefined undefined D B","E D A B F"]'::jsonb,null,1,'Urutan: E A F undefined undefined D B. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Berapa p95 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [134,843,34,532,834,158,494,799,889,532,645]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["889","536","843"]'::jsonb,null,0,'N=11, rank=⌈95/100×11⌉=11 → 889 ms. Rata-rata (536) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Berapa request yang DITERIMA?',null,'# Token bucket: kapasitas 5 token, mulai penuh pada detik 0
# isi ulang 1 token/detik (kontinu, maksimum 5); tiap request memakai 1 token
waktu_request = [2,3,4,4,5,6,6,7,8,8,10]  # detik','python','["10","11","5"]'::jsonb,null,1,'Simulasi: token = min(5, token + Δt×1); request diterima jika token ≥ 1. Diterima 11 dari 11.',null,'Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_C → LOCK tabel_A → LOCK tabel_B → COMMIT
T2: LOCK tabel_B → LOCK tabel_C → LOCK tabel_A → COMMIT
T3: LOCK tabel_B → LOCK tabel_C → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_B → tabel_C → tabel_A","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten"]'::jsonb,null,0,'Graf urutan kunci memuat siklus tabel_A → tabel_B → tabel_C → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','guess','Mitigasi UTAMA untuk kasus ini?
Pengguna yang sedang login membuka situs jahat; form tersembunyi di sana mengirim POST /transfer ke bank dengan cookie sesinya.',null,'# keamanan aplikasi web','text','["SameSite pada cookie sesi dan token CSRF anti-pemalsuan","Periksa kepemilikan/otorisasi di server pada setiap akses objek","Escape output sesuai konteks + sanitasi HTML + Content-Security-Policy"]'::jsonb,null,0,'Mitigasi yang tepat untuk CSRF: SameSite pada cookie sesi dan token CSRF anti-pemalsuan.',null,'Akar masalahnya: CSRF.',null),
('backend','output','Berapa hasil query penelusuran ke atas dari pegawai 7?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 2) (4, 3) (5, 1) (6, 3) (7, 3) (8, 5)

WITH RECURSIVE naik(id) AS (
  SELECT 7
  UNION ALL
  SELECT s.atasan FROM staf s JOIN naik ON s.id = naik.id WHERE s.atasan IS NOT NULL
)
SELECT COUNT(*) FROM naik;','sql','["3","4","7"]'::jsonb,null,1,'Penelusuran naik menyertakan titik awal dan seluruh atasan hingga akar: 4 baris.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 13; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. B: counter = tmpB + 1
3. A: tmpA = counter
4. B: tmpB = counter
5. A: counter = tmpA + 1
6. B: counter = tmpB + 1
7. A: tmpA = counter
8. A: counter = tmpA + 1','python','["15","16","17"]'::jsonb,null,1,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 16, bukan 17. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','guess','Kode status HTTP paling tepat untuk situasi ini:
Pengguna sudah login tetapi bukan admin dan mengakses endpoint admin',null,'# API REST','http','["403 Forbidden","401 Unauthorized","429 Too Many Requests"]'::jsonb,null,0,'403 Forbidden adalah kode yang sesuai dengan semantik situasi tersebut.',null,'Cari kata kunci: salah klien (4xx) atau server (5xx)? autentikasi atau otorisasi?',null),
('backend','guess','Manakah metode HTTP yang idempoten tetapi TIDAK aman (safe)?',null,'GET, HEAD, PUT, DELETE, POST, PATCH','http','["GET dan HEAD","POST dan PATCH (selalu)","PUT dan DELETE"]'::jsonb,null,2,'Idempoten: efek N kali sama dengan 1 kali. PUT/DELETE idempoten tetapi mengubah state (tidak safe). GET/HEAD safe. POST tidak idempoten; PATCH tidak dijamin.',null,'Safe berarti tidak mengubah state; idempoten berarti mengulang tidak menambah efek.',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 40) (2, B, 50) (3, B, 50) (4, A, 20) (5, B, 10) (6, B, 10) (7, B, 30) (8, A, 10)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,0 | 2,10 | 3,0 | 4,-30 | 5,-10 | 6,0 | 7,20 | 8,-20","1,0 | 2,10 | 3,0 | 4,0 | 5,-40 | 6,0 | 7,20 | 8,-10","1,10 | 2,0 | 3,-40 | 4,-10 | 5,0 | 6,20 | 7,0 | 8,0"]'::jsonb,null,1,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,10 | 3,0 | 4,0 | 5,-40 | 6,0 | 7,20 | 8,-10.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','output','Isi cache LRU di akhir, dari yang paling lama dipakai ke yang paling baru?',null,'kapasitas = 4
akses = ["D","D","F","D","A","D","C","F","C","A"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["A C F D","D F C A","D F A C"]'::jsonb,null,1,'Simulasi LRU: hit=6, isi akhir (lama→baru) = D F C A. Pada FIFO hit tidak memperbarui urutan (hit=6).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan reverse proxy/web server?',null,'1. Kafka
2. Eloquent
3. HAProxy
4. Nginx
5. Traefik','text','["3, 4, 5","1, 2, 3","1, 3, 5"]'::jsonb,null,0,'Nginx, Traefik, HAProxy adalah reverse proxy/web server; Kafka dan Eloquent termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('backend','output','Rata-rata request yang sedang diproses bersamaan (in-flight)?',null,'# hukum Little: L = λ × W
λ = 2000 request/detik
W = 80 ms rata-rata per request','python','["160","25","160000"]'::jsonb,null,0,'L = 2000 × 0.08 s = 160.',null,'Samakan satuan waktu dulu: ms → detik.',null),
('backend','output','Apa output kode Python ini?',null,'g = (x * 6 for x in range(4))
print(sum(g), list(g), sum(g) == 0)','python','["34 [] True","36 [] True","46 [] True"]'::jsonb,null,1,'Generator hanya bisa dilalui sekali; setelah habis, iterasi berikutnya kosong. Hasil: 36 [] True.',null,'Apakah generator bisa diulang?',null),
('backend','guess','Mitigasi UTAMA untuk kasus ini?
Endpoint POST /ambil?url=… membuat server mengunduh URL; penyerang meminta http://169.254.169.254/latest/meta-data/.',null,'# keamanan aplikasi web','text','["Allowlist tujuan, blokir alamat internal/metadata, dan jangan ikuti redirect ke jaringan privat","Daftar atribut yang diizinkan ($fillable/validated) — jangan bind seluruh input","Normalisasi path, batasi ke direktori dasar, dan jangan pakai input langsung sebagai nama berkas"]'::jsonb,null,0,'Mitigasi yang tepat untuk SSRF: Allowlist tujuan, blokir alamat internal/metadata, dan jangan ikuti redirect ke jaringan privat.',null,'Akar masalahnya: SSRF.',null),
('backend','output','Berapa query SQL yang dijalankan (50 post, 8 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:50]
for p in posts:
    print(p.penulis.nama)','python','["51","1","2"]'::jsonb,null,1,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Fajar, Bandung) (2, Ayu, Medan) (3, Dedi, Bandung) (4, Hana, Bandung) (5, Budi, Padang)
-- pesanan(id, pelanggan_id, total, status)
(1, 3, 50, baru) (2, 1, 90, lunas) (3, 2, 80, baru) (4, 3, 90, lunas) (5, 3, 50, lunas) (6, NULL, 40, batal) (7, 4, 90, batal) (8, 3, 70, batal)

SELECT COUNT(*) FROM (
  SELECT kota FROM pelanggan
  UNION ALL
  SELECT kota FROM pelanggan WHERE kota IS NOT NULL
) x
WHERE kota IS NULL OR kota <> ''Padang'';','sql','["18","8","2"]'::jsonb,null,1,'UNION ALL mempertahankan duplikat, UNION menghapusnya; kota <> ''Padang'' bernilai UNKNOWN untuk NULL sehingga perlu IS NULL eksplisit. Hasil: 8.',null,'UNION vs UNION ALL; perbandingan dengan NULL tidak pernah true.',null),
('backend','output','Rata-rata request yang sedang diproses bersamaan (in-flight)?',null,'# hukum Little: L = λ × W
λ = 1200 request/detik
W = 40 ms rata-rata per request','python','["30","48","48000"]'::jsonb,null,1,'L = 1200 × 0.04 s = 48.',null,'Samakan satuan waktu dulu: ms → detik.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_A → LOCK tabel_B → LOCK tabel_C → COMMIT
T2: LOCK tabel_A → LOCK tabel_B → LOCK tabel_C → COMMIT
T3: LOCK tabel_C → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mungkin: urutan penguncian membentuk siklus tabel_B → tabel_C → tabel_B","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten"]'::jsonb,null,1,'Graf urutan kunci memuat siklus tabel_B → tabel_C → tabel_B: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 30) (2, A, 40) (3, A, 10) (4, B, 50) (5, B, 50) (6, B, 40) (7, A, 50) (8, B, 10)

SELECT id, DENSE_RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,3 | 2,2 | 3,3 | 4,1 | 5,1 | 6,2 | 7,1 | 8,4","1,4 | 2,2 | 3,3 | 4,1 | 5,1 | 6,3 | 7,1 | 8,5","1,4 | 2,2 | 3,3 | 4,1 | 5,2 | 6,3 | 7,1 | 8,5"]'::jsonb,null,0,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,3 | 2,2 | 3,3 | 4,1 | 5,1 | 6,2 | 7,1 | 8,4.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','guess','Kode status HTTP paling tepat untuk situasi ini:
Gateway menunggu upstream terlalu lama hingga timeout',null,'# API REST','http','["502 Bad Gateway","503 Service Unavailable","504 Gateway Timeout"]'::jsonb,null,2,'504 Gateway Timeout adalah kode yang sesuai dengan semantik situasi tersebut.',null,'Cari kata kunci: salah klien (4xx) atau server (5xx)? autentikasi atau otorisasi?',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~1.2.0" }
// versi yang tersedia di registry:
1.2.0  1.2.1  1.2.2  1.3.3  1.4.3  2.2.1  2.4.0  2.4.1','json','["1.4.3","1.2.2","2.4.1"]'::jsonb,null,1,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 1.2.2.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, kota, umur);

SELECT * FROM orang
WHERE negara = ''x'' AND kota = ''x'' AND umur > 30;','sql','["4","2","3"]'::jsonb,null,2,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 3.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','guess','Apa isi a setelah baris terakhir?',null,'a := []int{1, 2, 3}
b := a[:2]
b = append(b, 99)
fmt.Println(a)','go','["[1 2 3 99]","[1 2 3]","[1 2 99]"]'::jsonb,null,2,'b berbagi array dasar dengan a dan kapasitasnya masih 3, sehingga append menimpa a[2].',null,'Apakah kapasitas b cukup sehingga append tanpa alokasi baru?',null),
('backend','output','Berapa kunci yang PINDAH shard saat shard ditambah dari 3 menjadi 4?',null,'# shard = kunci % jumlah_shard
kunci = 0 .. 59
sebelum: shard = kunci % 3
sesudah: shard = kunci % 4','python','["15","49","45"]'::jsonb,null,2,'Dihitung langsung: 45 dari 60 kunci berpindah. Modulo membuat hampir semua kunci pindah; consistent hashing hanya memindahkan ≈ K/(n+1) = 15.',null,'Hitung berapa kunci yang hasil modulo-nya berubah, jangan menebak 1/n.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 5 percobaan ulang
base = 200 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(1000, base * 2**i)   # i = 0, 1, 2, …','python','["4400","6200","3400"]'::jsonb,null,2,'Jeda: 200, 400, 800, 1000, 1000 ms → total 3400 ms (cap 1000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 560, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 560
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 560
T1: UPDATE akun SET saldo = x + 90 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 90 WHERE id = 1; COMMIT;','sql','["Mengganti COMMIT menjadi ROLLBACK","Gunakan UPDATE atomik","Menambah indeks pada kolom saldo"]'::jsonb,null,1,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'console.log("F");
process.nextTick(() => console.log("B"));
process.nextTick(() => console.log("C"));
process.nextTick(() => { console.log("undefined"); Promise.resolve().then(() => console.log("undefined")); });','javascript','["F B C","B C F undefined undefined","F B C undefined undefined"]'::jsonb,null,2,'Urutan: F B C undefined undefined. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Berapa p50 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [788,392,327,528,394,467,121,336,245,803,512,96,135,858,613,92,143]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["392","394","403"]'::jsonb,null,0,'N=17, rank=⌈50/100×17⌉=9 → 392 ms. Rata-rata (403) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Berapa kali job ini berjalan pada hari yang cocok (satu hari)?',null,'# menit jam tgl bulan hari-minggu
30 2 * * 0','bash','["1","24","2"]'::jsonb,null,0,'Menit: 1 nilai × jam: 1 nilai = 1. Rentang a-b bersifat inklusif; */n dihitung dari awal rentang.',null,'Hitung nilai menit × nilai jam; rentang inklusif.',null),
('backend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan reverse proxy/web server?',null,'1. Spring Boot
2. Nginx
3. Apache HTTP Server
4. Preact
5. Traefik','text','["1, 2, 3","2, 4, 5","2, 3, 5"]'::jsonb,null,2,'Nginx, Traefik, Apache HTTP Server adalah reverse proxy/web server; Preact dan Spring Boot termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('backend','output','Berapa request yang DITERIMA?',null,'# Token bucket: kapasitas 4 token, mulai penuh pada detik 0
# isi ulang 2 token/detik (kontinu, maksimum 4); tiap request memakai 1 token
waktu_request = [0,1,1,2,2,3,3,5,6,9]  # detik','python','["10","9","4"]'::jsonb,null,0,'Simulasi: token = min(4, token + Δt×2); request diterima jika token ≥ 1. Diterima 10 dari 10.',null,'Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'memo = {}
def fib(N):
    if N < 2: return N
    if N not in memo:
        memo[N] = fib(N - 1) + fib(N - 2)
    return memo[N]','python','["O(2ⁿ)","O(log n)","O(n)"]'::jsonb,null,2,'Kompleksitas: O(n). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Apa output kode Python ini?',null,'fs = [lambda: i * 4 for i in range(4)]
gs = [lambda i=i: i * 4 for i in range(4)]
print([f() for f in fs], [g() for g in gs])','python','["[12, 12, 12, 12] [0, 4, 12], 8","[12, 12, 12, 12] [0, 4, 8, 12]","[12, 12, 12, 12] [0, 4, 8, 22]"]'::jsonb,null,1,'Closure Python mengikat variabel (late binding), bukan nilainya; default argumen menangkap nilai saat definisi. Hasil: [12, 12, 12, 12] [0, 4, 8, 12].',null,'Kapan i dibaca oleh lambda?',null),
('backend','output','Isi cache LRU di akhir, dari yang paling lama dipakai ke yang paling baru?',null,'kapasitas = 4
akses = ["C","A","D","C","E","A","B","C","C","D","E"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["B C D E","D E B C","E D C B"]'::jsonb,null,0,'Simulasi LRU: hit=4, isi akhir (lama→baru) = B C D E. Pada FIFO hit tidak memperbarui urutan (hit=5).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 0; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. A: tmpA = counter
3. A: counter = tmpA + 1
4. B: counter = tmpB + 1
5. B: tmpB = counter
6. A: tmpA = counter
7. A: counter = tmpA + 1
8. B: counter = tmpB + 1','python','["3","4","2"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 2, bukan 4. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 7 f.txt menjadi "fitur"
main: mengubah baris 9 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Berapa hasil query hierarki ini?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 2) (4, 3) (5, 2) (6, 3) (7, 1) (8, 4)

WITH RECURSIVE r(id, d) AS (
  SELECT id, 0 FROM staf WHERE atasan IS NULL
  UNION ALL
  SELECT s.id, r.d + 1 FROM staf s JOIN r ON s.atasan = r.id
)
SELECT MAX(d) FROM r;','sql','["8","4","5"]'::jsonb,null,1,'Kedalaman pohon (akar = 0) dihitung rekursif; hasil maksimum 4.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Berapa p95 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [203,550,463,856,841,827,772,852,319,488,474,551,277,754,882]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["882","856","607"]'::jsonb,null,0,'N=15, rank=⌈95/100×15⌉=15 → 882 ms. Rata-rata (607) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Berapa query SQL yang dijalankan (50 post, 8 penulis berbeda)?',null,'posts = Post.objects.prefetch_related("penulis")[:50]
for p in posts:
    print(p.penulis.nama)','python','["51","2","1"]'::jsonb,null,1,'prefetch_related memakai query kedua dengan WHERE id IN (...): total 2 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Berapa kali job ini berjalan dalam satu minggu penuh (Senin–Minggu)?',null,'# menit jam tgl bulan hari-minggu
0 */6 * * *','bash','["4","35","28"]'::jsonb,null,2,'4 kali sehari × 7 hari yang cocok (0=Minggu … 6=Sabtu) = 28.',null,'Kalikan jumlah eksekusi per hari dengan jumlah hari yang cocok.',null),
('backend','output','Apa output kode Python ini?',null,'def a(f):
    def w(*x):
        print("a"); return f(*x)
    return w
def b(f):
    def w(*x):
        print("b"); return f(*x)
    return w
@a
@b
def hitung(v):
    return v * 9
print(hitung(4))','python','["a | b | 35","a | b | 36","a | b | 46"]'::jsonb,null,1,'Dekorator ditumpuk dari bawah ke atas saat dibungkus, tetapi saat dipanggil lapisan paling luar (a) berjalan lebih dulu. Hasil: a | b | 36.',null,'Siapa pembungkus terluar?',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Budi, Medan) (2, Eka, Medan) (3, Dedi, NULL) (4, Gita, Bandung) (5, Fajar, Bandung) (6, Citra, Medan)
-- pesanan(id, pelanggan_id, total, status)
(1, 1, 20, lunas) (2, 3, 60, baru) (3, NULL, 80, lunas) (4, 1, 30, batal) (5, 4, 80, batal) (6, 1, 60, lunas) (7, 4, 80, lunas)

SELECT kota, COUNT(*) AS n FROM pelanggan
GROUP BY kota
HAVING COUNT(*) >= 2
ORDER BY n DESC, kota;','sql','["Medan,3","Medan,3 | Bandung,2","Medan,3 | 2,Bandung"]'::jsonb,null,1,'GROUP BY menganggap semua NULL sebagai satu grup; COUNT(*) menghitungnya, COUNT(kota) tidak. Hasil: Medan,3 | Bandung,2.',null,'Apakah NULL membentuk grup sendiri?',null),
('backend','guess','Dari daftar ini, nomor mana yang BUKAN basis data relasional?',null,'1. MySQL
2. RabbitMQ
3. PostgreSQL
4. Memcached
5. SQLite','text','["1 dan 2 dan 5","1 dan 2 dan 4","2 dan 4"]'::jsonb,null,2,'Memcached dan RabbitMQ termasuk kategori lain; SQLite, PostgreSQL, MySQL adalah basis data relasional.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 50) (2, B, 40) (3, B, 50) (4, B, 20) (5, B, 40) (6, B, 10) (7, B, 50)

SELECT id, SUM(nilai) OVER (ORDER BY id) AS s FROM skor ORDER BY id;','sql','["1,50 | 2,90 | 3,140 | 4,160 | 5,200 | 6,210 | 7,260","1,50 | 2,40 | 3,90 | 4,110 | 5,150 | 6,160 | 7,210","1,260 | 2,260 | 3,260 | 4,260 | 5,260 | 6,260 | 7,260"]'::jsonb,null,0,'SUM() OVER (ORDER BY id) adalah jumlah kumulatif (frame default: awal sampai baris saat ini, termasuk seri pada kunci urut). Hasil: 1,50 | 2,90 | 3,140 | 4,160 | 5,200 | 6,210 | 7,260.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 7 percobaan ulang
base = 100 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(2000, base * 2**i)   # i = 0, 1, 2, …','python','["9100","7100","12700"]'::jsonb,null,1,'Jeda: 100, 200, 400, 800, 1600, 2000, 2000 ms → total 7100 ms (cap 2000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (kota, negara, umur);

SELECT * FROM orang
WHERE umur > 30 AND kota = ''x'' AND negara = ''x'';','sql','["3","2","4"]'::jsonb,null,0,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 3.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_B → LOCK tabel_C → LOCK tabel_A → COMMIT
T2: LOCK tabel_B → LOCK tabel_C → LOCK tabel_A → COMMIT
T3: LOCK tabel_B → LOCK tabel_C → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan","Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan"]'::jsonb,null,0,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('backend','output','Rata-rata request yang sedang diproses bersamaan (in-flight)?',null,'# hukum Little: L = λ × W
λ = 1200 request/detik
W = 20 ms rata-rata per request','python','["24000","60","24"]'::jsonb,null,2,'L = 1200 × 0.02 s = 24.',null,'Samakan satuan waktu dulu: ms → detik.',null),
('backend','guess','Kode status HTTP paling tepat untuk situasi ini:
Mengirim DELETE ke endpoint yang hanya menerima GET dan POST',null,'# API REST','http','["405 Method Not Allowed","410 Gone","415 Unsupported Media Type"]'::jsonb,null,0,'405 Method Not Allowed adalah kode yang sesuai dengan semantik situasi tersebut.',null,'Cari kata kunci: salah klien (4xx) atau server (5xx)? autentikasi atau otorisasi?',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 8; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. A: counter = tmpA + 1
3. A: tmpA = counter
4. B: tmpB = counter
5. B: counter = tmpB + 1
6. B: tmpB = counter
7. B: counter = tmpB + 1
8. A: counter = tmpA + 1','python','["11","12","10"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 10, bukan 12. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','output','Berapa hasil query penelusuran ke atas dari pegawai 4?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 2) (4, 3) (5, 2) (6, 1) (7, 3)

WITH RECURSIVE naik(id) AS (
  SELECT 4
  UNION ALL
  SELECT s.atasan FROM staf s JOIN naik ON s.id = naik.id WHERE s.atasan IS NOT NULL
)
SELECT COUNT(*) FROM naik;','sql','["3","5","4"]'::jsonb,null,2,'Penelusuran naik menyertakan titik awal dan seluruh atasan hingga akar: 4 baris.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Berapa saldo akhir?',null,'-- saldo awal = 950, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 950
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 950
T1: UPDATE akun SET saldo = x + 90 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 30 WHERE id = 1; COMMIT;','sql','["1070","1040","980"]'::jsonb,null,2,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 950+30, sehingga tambahan 90 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('backend','guess','Mitigasi UTAMA untuk kasus ini?
User::create($request->all()) menerima is_admin=1 dari klien sehingga pengguna biasa jadi admin.',null,'# keamanan aplikasi web','text','["Daftar atribut yang diizinkan ($fillable/validated) — jangan bind seluruh input","Gunakan textContent, hindari innerHTML dengan data tak tepercaya; Trusted Types","Hindari shell: pakai API/argumen terpisah (subprocess dengan list) dan validasi input"]'::jsonb,null,0,'Mitigasi yang tepat untuk Mass Assignment: Daftar atribut yang diizinkan ($fillable/validated) — jangan bind seluruh input.',null,'Akar masalahnya: Mass Assignment.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 7 f.txt menjadi "fitur"
main: tidak ada commit baru sejak fitur dibuat

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Fast-forward: tidak ada merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Berapa request yang diterima oleh FIXED WINDOW (jendela [0,10), [10,20), …)?',null,'# batas 3 request per 10 detik
waktu_request = [3,6,7,10,11,12,13,15,17,20,20]  # detik','python','["11","6","8"]'::jsonb,null,2,'Fixed window mereset hitungan pada batas kelipatan 10 detik (menerima 8); sliding window menimbang 10 detik terakhir (menerima 6). Fixed window dapat meloloskan 2×3 request di sekitar batas jendela.',null,'Reset terjadi pada kelipatan tetap, bukan relatif terhadap tiap request.',null),
('backend','guess','Saat partisi jaringan, sistem memilih tetap menjawab dengan data yang mungkin basi. Pilihan CAP-nya?',null,'# replika terpisah oleh partisi','text','["CP (mengutamakan Consistency di atas Availability)","AP (mengutamakan Availability di atas Consistency)","CA (tanpa toleransi terhadap partisi jaringan)"]'::jsonb,null,1,'Saat partisi, sistem harus memilih: tetap tersedia (AP) atau menolak untuk menjaga konsistensi (CP). CA tidak realistis di sistem terdistribusi.',null,'Menjawab dengan data lama = mengorbankan apa?',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^3.1.2" }
// versi yang tersedia di registry:
3.1.2  3.2.0  3.2.3  3.3.4  4.1.0  4.1.2  4.1.5  4.2.3','json','["4.2.3","3.1.2","3.3.4"]'::jsonb,null,2,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 3.3.4.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','output','Isi cache LRU di akhir, dari yang paling lama dipakai ke yang paling baru?',null,'kapasitas = 4
akses = ["F","E","D","B","B","C","E","E","D","D","F"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["D B C F","F D E C","C E D F"]'::jsonb,null,2,'Simulasi LRU: hit=5, isi akhir (lama→baru) = C E D F. Pada FIFO hit tidak memperbarui urutan (hit=5).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'for i in range(jumlah):
    if jumlah > 0 and i in hasil_list:   # list
        hasil_list.remove(i)','python','["O(n log n)","O(1)","O(n²)"]'::jsonb,null,2,'Kompleksitas: O(n²). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'process.nextTick(() => console.log("C"));
queueMicrotask(() => console.log("A"));
console.log("D");
process.nextTick(() => { console.log("undefined"); Promise.resolve().then(() => console.log("undefined")); });','javascript','["C A D","A C D undefined undefined","D C undefined A undefined"]'::jsonb,null,2,'Urutan: D C undefined A undefined. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Apa output kode Python ini?',null,'a = [[0] * 5] * 2
a[0][4] = 1
b = [[0] * 5 for _ in range(2)]
b[0][4] = 1
print(a == b, a, b)','python','["False [[0, 0, 0, 0, 1], [0, 0, 0, 0, 1]] [[-2, 0, 0, 0, 1], [0, 0, 0, 0, 0]]","False [[0, 0, 0, 0, 1], [0, 0, 0, 0, 1]] [[0, 0, 0, 0, 1], [0, 0, 0, 0, 0]]","False [[0, 0, 0, 0, 1], [0, 0, 0, 0, 1]] [[0, 0, 0, 0, 1], [0, 0, 0, 0]], 0"]'::jsonb,null,1,'[[0]*n]*2 menggandakan referensi ke SATU list yang sama; comprehension membuat list baru tiap iterasi. Hasil: False [[0, 0, 0, 0, 1], [0, 0, 0, 0, 1]] [[0, 0, 0, 0, 1], [0, 0, 0, 0, 0]].',null,'Berapa objek list yang sebenarnya dibuat?',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 4 f.txt menjadi "fitur"
main: mengubah baris 5 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Berapa jumlah cache HIT pada cache LRU ini?',null,'kapasitas = 3
akses = ["B","C","D","D","E","D","D","E","B","C","F","E"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["4","3","5"]'::jsonb,null,0,'Simulasi LRU: hit=4, isi akhir (lama→baru) = C F E. Pada FIFO hit tidak memperbarui urutan (hit=4).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','guess','Mitigasi UTAMA untuk kasus ini?
Penyerang mencoba jutaan pasangan email-password hasil kebocoran situs lain secara otomatis di halaman login.',null,'# keamanan aplikasi web','text','["Rate limiting, MFA, pemantauan login anomali, dan pengecekan kata sandi bocor","Jangan deserialisasi data tak tepercaya dengan format yang bisa menjalankan kode; pakai JSON dan tanda tangan","Daftar atribut yang diizinkan ($fillable/validated) — jangan bind seluruh input"]'::jsonb,null,0,'Mitigasi yang tepat untuk Credential Stuffing: Rate limiting, MFA, pemantauan login anomali, dan pengecekan kata sandi bocor.',null,'Akar masalahnya: Credential Stuffing.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^1.4.1" }
// versi yang tersedia di registry:
1.4.1  1.5.0  1.5.1  1.6.0  1.6.3  2.4.0  2.4.2','json','["2.4.2","1.4.1","1.6.3"]'::jsonb,null,2,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 1.6.3.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, umur, kota);

SELECT * FROM orang
WHERE negara = ''x'' AND umur > 30;','sql','["1","3","2"]'::jsonb,null,2,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 2.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'process.nextTick(() => console.log("E"));
process.nextTick(() => { console.log("D"); Promise.resolve().then(() => console.log("B")); });
process.nextTick(() => { console.log("F"); Promise.resolve().then(() => console.log("undefined")); });
Promise.resolve().then(() => console.log("undefined"));
Promise.resolve().then(() => console.log("undefined"));','javascript','["B D E F undefined undefined undefined","E D B F","E D F undefined undefined B undefined"]'::jsonb,null,2,'Urutan: E D F undefined undefined B undefined. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Berapa request yang DITERIMA?',null,'# Token bucket: kapasitas 4 token, mulai penuh pada detik 0
# isi ulang 1 token/detik (kontinu, maksimum 4); tiap request memakai 1 token
waktu_request = [0,1,4,5,5,8,11,11,12]  # detik','python','["4","9","8"]'::jsonb,null,1,'Simulasi: token = min(4, token + Δt×1); request diterima jika token ≥ 1. Diterima 9 dari 9.',null,'Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.',null),
('backend','guess','Kode status HTTP paling tepat untuk situasi ini:
Mendaftar dengan email yang sudah dipakai (konflik dengan keadaan resource)',null,'# API REST','http','["410 Gone","409 Conflict","400 Bad Request"]'::jsonb,null,1,'409 Conflict adalah kode yang sesuai dengan semantik situasi tersebut.',null,'Cari kata kunci: salah klien (4xx) atau server (5xx)? autentikasi atau otorisasi?',null),
('backend','output','Berapa hasil query penelusuran ke atas dari pegawai 5?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 2) (4, 1) (5, 4)

WITH RECURSIVE naik(id) AS (
  SELECT 5
  UNION ALL
  SELECT s.atasan FROM staf s JOIN naik ON s.id = naik.id WHERE s.atasan IS NOT NULL
)
SELECT COUNT(*) FROM naik;','sql','["2","3","5"]'::jsonb,null,1,'Penelusuran naik menyertakan titik awal dan seluruh atasan hingga akar: 3 baris.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Throughput maksimum (query/detik) yang bisa dilayani kolam ini?',null,'kolam_koneksi = 40
rata-rata_query = 10 ms, satu koneksi menangani satu query pada satu waktu','python','["4","400","4000"]'::jsonb,null,2,'Tiap koneksi menyelesaikan 100 query/detik × 40 koneksi = 4000 q/s.',null,'Satu koneksi menyelesaikan 1000/ms query per detik.',null),
('backend','guess','Apa dampak indeks ini pada query tersebut?',null,'CREATE INDEX idx_aktif ON user(aktif);   -- 95% baris aktif = true
SELECT * FROM user WHERE aktif = true;','sql','["Hampir tidak membantu","Mengubah hasil query menjadi lebih sedikit","Mempercepat 20 kali lipat karena ada indeks"]'::jsonb,null,0,'Indeks efektif untuk predikat selektif. Mengambil 95% baris lewat indeks justru lebih mahal daripada scan berurutan.',null,'Seberapa sedikit baris yang dipilih predikat?',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'for i in range(panjang):
    if panjang > 0 and i in hasil_list:   # list
        hasil_list.remove(i)','python','["O(2ⁿ)","O(n²)","O(log n)"]'::jsonb,null,1,'Kompleksitas: O(n²). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Berapa p50 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [899,814,779,429,677,393,442,802,60,283,352,24,839,91,628,165,86,613]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["442","465","429"]'::jsonb,null,2,'N=18, rank=⌈50/100×18⌉=9 → 429 ms. Rata-rata (465) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Berapa kali job ini berjalan dalam satu minggu penuh (Senin–Minggu)?',null,'# menit jam tgl bulan hari-minggu
15,45 * * * 1-5','bash','["48","240","336"]'::jsonb,null,1,'48 kali sehari × 5 hari yang cocok (0=Minggu … 6=Sabtu) = 240.',null,'Kalikan jumlah eksekusi per hari dengan jumlah hari yang cocok.',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 40) (2, B, 50) (3, A, 20) (4, B, 50) (5, B, 10) (6, B, 40) (7, A, 50)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,0 | 2,10 | 3,-30 | 4,30 | 5,-40 | 6,30 | 7,10","1,-20 | 2,0 | 3,30 | 4,-40 | 5,30 | 6,0 | 7,0","1,0 | 2,0 | 3,-20 | 4,0 | 5,-40 | 6,30 | 7,30"]'::jsonb,null,2,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,0 | 3,-20 | 4,0 | 5,-40 | 6,30 | 7,30.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Gita, Padang) (2, Ayu, Bandung) (3, Fajar, Bandung) (4, Dedi, Padang) (5, Budi, Padang)
-- pesanan(id, pelanggan_id, total, status)
(1, 2, 70, lunas) (2, 3, 30, batal) (3, 2, 40, baru) (4, 4, 50, baru) (5, 4, 90, lunas) (6, 4, 50, baru) (7, 3, 60, lunas) (8, 1, 20, baru)

SELECT COUNT(*) FROM (
  SELECT kota FROM pelanggan
  UNION ALL
  SELECT kota FROM pelanggan WHERE kota IS NOT NULL
) x
WHERE kota IS NULL OR kota <> ''Padang'';','sql','["4","2","1"]'::jsonb,null,0,'UNION ALL mempertahankan duplikat, UNION menghapusnya; kota <> ''Padang'' bernilai UNKNOWN untuk NULL sehingga perlu IS NULL eksplisit. Hasil: 4.',null,'UNION vs UNION ALL; perbandingan dengan NULL tidak pernah true.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_B → LOCK tabel_C → LOCK tabel_A → COMMIT
T2: LOCK tabel_A → LOCK tabel_C → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_C → tabel_A","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh"]'::jsonb,null,1,'Graf urutan kunci memuat siklus tabel_A → tabel_C → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 5 percobaan ulang
base = 250 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(1000, base * 2**i)   # i = 0, 1, 2, …','python','["4750","7750","3750"]'::jsonb,null,2,'Jeda: 250, 500, 1000, 1000, 1000 ms → total 3750 ms (cap 1000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','guess','Dari daftar ini, nomor mana yang BUKAN basis data dokumen NoSQL?',null,'1. Playwright
2. CouchDB
3. Vite
4. RavenDB
5. Firestore','text','["1 dan 3","1 dan 4 dan 5","1 dan 2 dan 5"]'::jsonb,null,0,'Vite dan Playwright termasuk kategori lain; Firestore, CouchDB, RavenDB adalah basis data dokumen NoSQL.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 11; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. B: counter = tmpB + 1
3. A: tmpA = counter
4. A: counter = tmpA + 1
5. A: tmpA = counter
6. B: tmpB = counter
7. A: counter = tmpA + 1
8. B: counter = tmpB + 1','python','["14","13","15"]'::jsonb,null,0,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 14, bukan 15. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 160, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 160
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 160
T1: UPDATE akun SET saldo = x + 80 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 40 WHERE id = 1; COMMIT;','sql','["Gunakan UPDATE atomik","Mengganti COMMIT menjadi ROLLBACK","Menambah indeks pada kolom saldo"]'::jsonb,null,0,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('backend','output','Berapa query SQL yang dijalankan (100 post, 7 penulis berbeda)?',null,'posts = Post.objects.prefetch_related("penulis")[:100]
for p in posts:
    print(p.penulis.nama)','python','["2","1","101"]'::jsonb,null,0,'prefetch_related memakai query kedua dengan WHERE id IN (...): total 2 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','guess','Dari daftar ini, nomor mana yang BUKAN basis data relasional?',null,'1. Laravel
2. MariaDB
3. PostgreSQL
4. SQLite
5. Next.js','text','["1 dan 5","1 dan 4 dan 5","1 dan 3 dan 5"]'::jsonb,null,0,'Laravel dan Next.js termasuk kategori lain; SQLite, PostgreSQL, MariaDB adalah basis data relasional.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^0.0.2" }
// versi yang tersedia di registry:
0.0.2  0.0.3  0.0.4  0.0.5  0.1.2  0.1.5  0.2.0  1.0.2','json','["0.0.5","0.0.2","1.0.2"]'::jsonb,null,1,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 0.0.2.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Ayu, Padang) (2, Budi, Padang) (3, Gita, Medan) (4, Dedi, Padang) (5, Eka, Bandung)
-- pesanan(id, pelanggan_id, total, status)
(1, 4, 20, lunas) (2, 1, 80, batal) (3, 1, 90, batal) (4, 4, 30, batal) (5, 3, 40, batal) (6, 1, 40, baru) (7, 2, 80, baru)

SELECT COUNT(*), COUNT(o.id), COUNT(DISTINCT p.id)
FROM pelanggan p LEFT JOIN pesanan o ON o.pelanggan_id = p.id;','sql','["8,8,7","8,7,5","7,8,5"]'::jsonb,null,1,'COUNT(*) menghitung semua baris hasil join (satu pelanggan tampil sebanyak pesanannya, atau sekali bila tak punya), COUNT(kolom) melewati NULL, COUNT(DISTINCT) menghilangkan duplikat. Hasil: 8,7,5.',null,'Mana yang melewati NULL?',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'console.log("F");
console.log("C");
process.nextTick(() => console.log("A"));
console.log("undefined");','javascript','["A C F undefined","F C A","F C undefined A"]'::jsonb,null,2,'Urutan: F C undefined A. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, kota, umur);

SELECT * FROM orang
WHERE kota = ''x'' AND negara > 30 AND umur = ''x'';','sql','["2","1","3"]'::jsonb,null,1,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','guess','Mengapa query ini makin lambat pada halaman jauh, dan apa solusinya?',null,'SELECT * FROM log ORDER BY id LIMIT 20 OFFSET 1000000;','sql','["OFFSET tidak boleh melebihi 1000 pada standar SQL","ORDER BY harus dihapus","Database tetap membaca lalu membuang satu juta baris"]'::jsonb,null,2,'OFFSET N memaksa pemindaian N baris. Keyset memakai indeks langsung dari posisi terakhir.',null,'Apakah OFFSET ''melompat'' atau ''menghitung''?',null),
('backend','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 820, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 820
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 820
T1: UPDATE akun SET saldo = x + 40 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 10 WHERE id = 1; COMMIT;','sql','["Gunakan UPDATE atomik","Mengganti COMMIT menjadi ROLLBACK","Menambah indeks pada kolom saldo"]'::jsonb,null,0,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('backend','output','Throughput maksimum (query/detik) yang bisa dilayani kolam ini?',null,'kolam_koneksi = 50
rata-rata_query = 10 ms, satu koneksi menangani satu query pada satu waktu','python','["5","500","5000"]'::jsonb,null,2,'Tiap koneksi menyelesaikan 100 query/detik × 50 koneksi = 5000 q/s.',null,'Satu koneksi menyelesaikan 1000/ms query per detik.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 8 f.txt menjadi "fitur"
main: mengubah baris 9 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Berapa p90 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [860,27,894,377,292,36,432,535,859,314,441,176,165,394,274,228,277,638,760,28]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["859","400","860"]'::jsonb,null,0,'N=20, rank=⌈90/100×20⌉=18 → 859 ms. Rata-rata (400) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Berapa query SQL yang dijalankan (20 post, 6 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:20]
for p in posts:
    print(p.penulis.nama)','python','["1","2","21"]'::jsonb,null,0,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Apa output kode Python ini?',null,'g = (x * 1 for x in range(4))
print(sum(g), list(g), sum(g) == 0)','python','["7 [] True","6 [] True","8 [] True"]'::jsonb,null,1,'Generator hanya bisa dilalui sekali; setelah habis, iterasi berikutnya kosong. Hasil: 6 [] True.',null,'Apakah generator bisa diulang?',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 20) (2, B, 20) (3, B, 50) (4, A, 20) (5, B, 30) (6, B, 50) (7, A, 30)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,0 | 2,0 | 3,30 | 4,0 | 5,-20 | 6,20 | 7,10","1,0 | 2,0 | 3,30 | 4,-30 | 5,10 | 6,20 | 7,-20","1,0 | 2,30 | 3,-20 | 4,10 | 5,20 | 6,0 | 7,0"]'::jsonb,null,0,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,0 | 3,30 | 4,0 | 5,-20 | 6,20 | 7,10.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 7 percobaan ulang
base = 200 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(1000, base * 2**i)   # i = 0, 1, 2, …','python','["5400","25400","6400"]'::jsonb,null,0,'Jeda: 200, 400, 800, 1000, 1000, 1000, 1000 ms → total 5400 ms (cap 1000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 19; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. A: counter = tmpA + 1
3. A: tmpA = counter
4. B: tmpB = counter
5. A: counter = tmpA + 1
6. B: counter = tmpB + 1
7. B: tmpB = counter
8. B: counter = tmpB + 1','python','["21","23","22"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 22, bukan 23. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_B → LOCK tabel_A → LOCK tabel_C → COMMIT
T2: LOCK tabel_A → LOCK tabel_B → COMMIT
T3: LOCK tabel_C → LOCK tabel_A → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_C → tabel_A","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten"]'::jsonb,null,0,'Graf urutan kunci memuat siklus tabel_A → tabel_C → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'def f(jumlah):
    if jumlah <= 1: return 0
    return 1 + f(jumlah // 2)','python','["O(log n)","O(n log n)","O(1)"]'::jsonb,null,0,'Kompleksitas: O(log n). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','guess','Jenis kerentanan/serangan apa ini?',null,'User::create($request->all()) menerima is_admin=1 dari klien sehingga pengguna biasa jadi admin.','text','["SSRF","Mass Assignment","IDOR (Broken Access Control)"]'::jsonb,null,1,'Mass Assignment: Daftar atribut yang diizinkan ($fillable/validated) — jangan bind seluruh input.',null,'Apa yang dikendalikan penyerang, dan di mana ia dieksekusi?',null),
('backend','output','Isi cache LRU di akhir, dari yang paling lama dipakai ke yang paling baru?',null,'kapasitas = 4
akses = ["F","A","A","B","B","C","B","B","C","F"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["A B C F","F A B C","F C B A"]'::jsonb,null,0,'Simulasi LRU: hit=6, isi akhir (lama→baru) = A B C F. Pada FIFO hit tidak memperbarui urutan (hit=6).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','guess','Kode status HTTP paling tepat untuk situasi ini:
Body unggahan melebihi batas ukuran server',null,'# API REST','http','["413 Content Too Large","403 Forbidden","429 Too Many Requests"]'::jsonb,null,0,'413 Content Too Large adalah kode yang sesuai dengan semantik situasi tersebut.',null,'Cari kata kunci: salah klien (4xx) atau server (5xx)? autentikasi atau otorisasi?',null),
('backend','output','Berapa kali job ini berjalan pada hari yang cocok (satu hari)?',null,'# menit jam tgl bulan hari-minggu
*/7 22-23 * * *','bash','["18","216","9"]'::jsonb,null,0,'Menit: 9 nilai × jam: 2 nilai = 18. Rentang a-b bersifat inklusif; */n dihitung dari awal rentang.',null,'Hitung nilai menit × nilai jam; rentang inklusif.',null),
('backend','output','Berapa hasil query hierarki ini?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 2) (4, 3) (5, 1) (6, 1)

WITH RECURSIVE r(id, d) AS (
  SELECT id, 0 FROM staf WHERE atasan IS NULL
  UNION ALL
  SELECT s.id, r.d + 1 FROM staf s JOIN r ON s.atasan = r.id
)
SELECT MAX(d) FROM r;','sql','["3","4","6"]'::jsonb,null,0,'Kedalaman pohon (akar = 0) dihitung rekursif; hasil maksimum 3.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Berapa request yang diterima oleh FIXED WINDOW (jendela [0,10), [10,20), …)?',null,'# batas 5 request per 10 detik
waktu_request = [1,2,3,4,7,8,10,12,12]  # detik','python','["8","7","9"]'::jsonb,null,0,'Fixed window mereset hitungan pada batas kelipatan 10 detik (menerima 8); sliding window menimbang 10 detik terakhir (menerima 7). Fixed window dapat meloloskan 2×5 request di sekitar batas jendela.',null,'Reset terjadi pada kelipatan tetap, bukan relatif terhadap tiap request.',null),
('backend','output','Berapa hasil query penelusuran ke atas dari pegawai 3?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 2) (4, 2) (5, 4)

WITH RECURSIVE naik(id) AS (
  SELECT 3
  UNION ALL
  SELECT s.atasan FROM staf s JOIN naik ON s.id = naik.id WHERE s.atasan IS NOT NULL
)
SELECT COUNT(*) FROM naik;','sql','["3","2","5"]'::jsonb,null,0,'Penelusuran naik menyertakan titik awal dan seluruh atasan hingga akar: 3 baris.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan basis data dokumen NoSQL?',null,'1. MongoDB
2. Svelte
3. CouchDB
4. Laravel
5. Firestore','text','["3, 4, 5","1, 2, 5","1, 3, 5"]'::jsonb,null,2,'MongoDB, Firestore, CouchDB adalah basis data dokumen NoSQL; Svelte dan Laravel termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('backend','output','Isi cache LRU di akhir, dari yang paling lama dipakai ke yang paling baru?',null,'kapasitas = 4
akses = ["C","C","B","B","F","D","C","B","B","E","E"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["D C B E","E B C D","B F D E"]'::jsonb,null,0,'Simulasi LRU: hit=6, isi akhir (lama→baru) = D C B E. Pada FIFO hit tidak memperbarui urutan (hit=6).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Dedi, NULL) (2, Gita, NULL) (3, Fajar, Bandung) (4, Eka, Bandung) (5, Ayu, Bandung) (6, Budi, Bandung)
-- pesanan(id, pelanggan_id, total, status)
(1, 2, 20, lunas) (2, NULL, 60, batal) (3, 4, 60, lunas) (4, 3, 80, batal) (5, 5, 90, baru) (6, 5, 50, batal) (7, 3, 90, baru) (8, 3, 20, lunas)

SELECT p.nama FROM pelanggan p
WHERE (SELECT SUM(total) FROM pesanan o WHERE o.pelanggan_id = p.id)
  > (SELECT AVG(total) FROM pesanan)
ORDER BY p.nama;','sql','["Ayu | Eka | Fajar","(kosong)","Ayu | Fajar"]'::jsonb,null,0,'Subquery berkorelasi dihitung per pelanggan; pelanggan tanpa pesanan menghasilkan NULL sehingga perbandingan tidak lolos. Hasil: Ayu | Eka | Fajar.',null,'Bandingkan SUM per pelanggan dengan AVG seluruh pesanan (termasuk yang pelanggan_id-nya NULL).',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 30) (2, B, 10) (3, A, 20) (4, A, 50) (5, A, 10) (6, B, 20)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,0 | 2,-20 | 3,10 | 4,30 | 5,-40 | 6,10","1,-10 | 2,10 | 3,30 | 4,-40 | 5,0 | 6,0","1,0 | 2,0 | 3,-10 | 4,30 | 5,-40 | 6,10"]'::jsonb,null,2,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,0 | 3,-10 | 4,30 | 5,-40 | 6,10.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','output','Rata-rata request yang sedang diproses bersamaan (in-flight)?',null,'# hukum Little: L = λ × W
λ = 800 request/detik
W = 250 ms rata-rata per request','python','["200","200000","3.2"]'::jsonb,null,0,'L = 800 × 0.25 s = 200.',null,'Samakan satuan waktu dulu: ms → detik.',null),
('backend','output','Apa output kode Python ini?',null,'g = (x * 7 for x in range(2))
print(sum(g), list(g), sum(g) == 0)','python','["9 [] True","8 [] True","7 [] True"]'::jsonb,null,2,'Generator hanya bisa dilalui sekali; setelah habis, iterasi berikutnya kosong. Hasil: 7 [] True.',null,'Apakah generator bisa diulang?',null),
('backend','guess','Apa hasil map.get(k) di akhir?',null,'Map<Kunci, String> map = new HashMap<>();
Kunci k = new Kunci(1);        // hashCode memakai id
map.put(k, "nilai");
k.setId(2);
System.out.println(map.get(k));','java','["Melempar ConcurrentModificationException","nilai","null (kemungkinan besar)"]'::jsonb,null,2,'Mengubah field yang dipakai hashCode setelah dimasukkan ''menghilangkan'' entri. Kunci peta harus immutable.',null,'Di bucket mana entri disimpan dan di bucket mana ia dicari?',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (kota, negara, umur);

SELECT * FROM orang
WHERE umur > 30 AND negara > 30;','sql','["0","1","2"]'::jsonb,null,0,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 0.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','output','Berapa p90 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [719,263,536,767,276,352,82,126,202,792,375,535,858,139,802,725,565,101,452,567]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["462","802","792"]'::jsonb,null,2,'N=20, rank=⌈90/100×20⌉=18 → 792 ms. Rata-rata (462) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 1 f.txt menjadi "fitur"
main: mengubah baris 2 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Berapa kali job ini berjalan dalam satu minggu penuh (Senin–Minggu)?',null,'# menit jam tgl bulan hari-minggu
10 */4 * * 6,0','bash','["6","12","42"]'::jsonb,null,1,'6 kali sehari × 2 hari yang cocok (0=Minggu … 6=Sabtu) = 12.',null,'Kalikan jumlah eksekusi per hari dengan jumlah hari yang cocok.',null),
('backend','output','Berapa query SQL yang dijalankan (50 post, 8 penulis berbeda)?',null,'posts = Post.objects.all()[:50]
for p in posts:
    print(p.penulis.nama)        # relasi ForeignKey, lazy','python','["2","51","1"]'::jsonb,null,1,'Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'Promise.resolve().then(() => console.log("G"));
console.log("F");
console.log("A");
process.nextTick(() => { console.log("undefined"); Promise.resolve().then(() => console.log("undefined")); });','javascript','["F A undefined G undefined","A F G undefined undefined","G F A"]'::jsonb,null,0,'Urutan: F A undefined G undefined. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_C → LOCK tabel_B → COMMIT
T2: LOCK tabel_B → LOCK tabel_A → LOCK tabel_C → COMMIT
T3: LOCK tabel_C → LOCK tabel_A → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_C → tabel_B → tabel_A","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh"]'::jsonb,null,1,'Graf urutan kunci memuat siklus tabel_A → tabel_C → tabel_B → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','output','Berapa request yang DITERIMA?',null,'# Token bucket: kapasitas 5 token, mulai penuh pada detik 0
# isi ulang 1 token/detik (kontinu, maksimum 5); tiap request memakai 1 token
waktu_request = [1,2,3,6,8,8,11,12,12]  # detik','python','["5","9","8"]'::jsonb,null,1,'Simulasi: token = min(5, token + Δt×1); request diterima jika token ≥ 1. Diterima 9 dari 9.',null,'Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 4; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. B: counter = tmpB + 1
4. A: counter = tmpA + 1
5. B: tmpB = counter
6. B: counter = tmpB + 1
7. A: tmpA = counter
8. A: counter = tmpA + 1','python','["8","7","6"]'::jsonb,null,1,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 7, bukan 8. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 7 percobaan ulang
base = 250 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(5000, base * 2**i)   # i = 0, 1, 2, …','python','["17750","31750","22750"]'::jsonb,null,0,'Jeda: 250, 500, 1000, 2000, 4000, 5000, 5000 ms → total 17750 ms (cap 5000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^0.0.4" }
// versi yang tersedia di registry:
0.0.4  0.0.7  0.1.5  0.2.5  1.0.0  1.0.4  1.0.7  1.1.0','json','["1.1.0","0.0.7","0.0.4"]'::jsonb,null,2,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 0.0.4.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 910, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 910
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 910
T1: UPDATE akun SET saldo = x + 20 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 50 WHERE id = 1; COMMIT;','sql','["Menambah indeks pada kolom saldo","Gunakan UPDATE atomik","Mengganti COMMIT menjadi ROLLBACK"]'::jsonb,null,1,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('backend','guess','Mitigasi UTAMA untuk kasus ini?
Server memantulkan header Origin apa pun ke Access-Control-Allow-Origin dan mengaktifkan Allow-Credentials: true.',null,'# keamanan aplikasi web','text','["Allowlist origin eksplisit","Hapus catatan DNS yang menggantung saat layanan dinonaktifkan","Query berparameter (prepared statement) dan hak akses DB minimum"]'::jsonb,null,0,'Mitigasi yang tepat untuk CORS salah konfigurasi: Allowlist origin eksplisit; jangan memantulkan origin sembarang bersama credentials.',null,'Akar masalahnya: CORS salah konfigurasi.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'for a in daftar_a:   # n
    proses(a)
for b in daftar_b:   # m
    proses(b)','python','["O(n·m)","O(1)","O(n + m)"]'::jsonb,null,2,'Kompleksitas: O(n + m). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Berapa saldo akhir?',null,'-- saldo awal = 800, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 800
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 800
T1: UPDATE akun SET saldo = x + 60 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 40 WHERE id = 1; COMMIT;','sql','["840","900","860"]'::jsonb,null,0,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 800+40, sehingga tambahan 60 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 30) (2, B, 10) (3, A, 30) (4, A, 40) (5, A, 50) (6, A, 10) (7, A, 40) (8, A, 40)

SELECT id, RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,5 | 2,1 | 3,5 | 4,2 | 5,1 | 6,7 | 7,2 | 8,2","1,5 | 2,1 | 3,6 | 4,2 | 5,1 | 6,7 | 7,3 | 8,4","1,3 | 2,1 | 3,3 | 4,2 | 5,1 | 6,4 | 7,2 | 8,2"]'::jsonb,null,0,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,5 | 2,1 | 3,5 | 4,2 | 5,1 | 6,7 | 7,2 | 8,2.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','output','Berapa request yang DITERIMA?',null,'# Token bucket: kapasitas 3 token, mulai penuh pada detik 0
# isi ulang 1 token/detik (kontinu, maksimum 3); tiap request memakai 1 token
waktu_request = [2,2,3,3,3,4,4,4,7,10]  # detik','python','["7","9","3"]'::jsonb,null,0,'Simulasi: token = min(3, token + Δt×1); request diterima jika token ≥ 1. Diterima 7 dari 10.',null,'Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.',null),
('backend','output','Berapa jumlah cache HIT pada cache LRU ini?',null,'kapasitas = 4
akses = ["F","F","B","F","D","A","E","F","D","D","A"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["5","6","7"]'::jsonb,null,1,'Simulasi LRU: hit=6, isi akhir (lama→baru) = E F D A. Pada FIFO hit tidak memperbarui urutan (hit=5).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 9 f.txt menjadi "fitur"
main: mengubah g.txt (commit baru)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Rata-rata request yang sedang diproses bersamaan (in-flight)?',null,'# hukum Little: L = λ × W
λ = 200 request/detik
W = 50 ms rata-rata per request','python','["4","10","10000"]'::jsonb,null,1,'L = 200 × 0.05 s = 10.',null,'Samakan satuan waktu dulu: ms → detik.',null),
('backend','guess','Dari daftar ini, nomor mana yang BUKAN penyimpan key-value/in-memory?',null,'1. etcd
2. Memcached
3. RabbitMQ
4. Valkey
5. PostgreSQL','text','["1 dan 4 dan 5","3 dan 5","2 dan 3 dan 5"]'::jsonb,null,1,'PostgreSQL dan RabbitMQ termasuk kategori lain; Valkey, etcd, Memcached adalah penyimpan key-value/in-memory.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, umur, kota);

SELECT * FROM orang
WHERE kota > 30 AND negara > 30 AND umur > 30;','sql','["0","1","3"]'::jsonb,null,1,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 16; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. B: counter = tmpB + 1
3. A: tmpA = counter
4. A: counter = tmpA + 1
5. B: tmpB = counter
6. A: tmpA = counter
7. A: counter = tmpA + 1
8. B: counter = tmpB + 1','python','["19","18","20"]'::jsonb,null,0,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 19, bukan 20. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','output','Berapa p99 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [149,576,608,498,144,272,430,350,141,665,578,359]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["608","398","665"]'::jsonb,null,2,'N=12, rank=⌈99/100×12⌉=12 → 665 ms. Rata-rata (398) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','guess','Kunci cache populer kedaluwarsa dan ribuan request serentak menembus ke database. Apa namanya dan mitigasinya?',null,'cache.get(''beranda'') → miss → query berat','python','["Cache penetration; mitigasi: memperbesar RAM saja","Cache stampede; mitigasi","Cache poisoning; mitigasi: HTTPS"]'::jsonb,null,1,'Stampede terjadi saat banyak request mengisi ulang kunci yang sama bersamaan. Gabungkan request atau sebar kedaluwarsa.',null,'Banyak pihak mengisi ulang hal yang sama pada saat yang sama.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 6 percobaan ulang
base = 200 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(3000, base * 2**i)   # i = 0, 1, 2, …','python','["12600","12000","9000"]'::jsonb,null,2,'Jeda: 200, 400, 800, 1600, 3000, 3000 ms → total 9000 ms (cap 3000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','output','Berapa query SQL yang dijalankan (200 post, 8 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:200]
for p in posts:
    print(p.penulis.nama)','python','["1","2","201"]'::jsonb,null,0,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_A → LOCK tabel_B → LOCK tabel_C → COMMIT
T2: LOCK tabel_B → LOCK tabel_C → LOCK tabel_A → COMMIT
T3: LOCK tabel_B → LOCK tabel_C → LOCK tabel_A → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_B → tabel_C → tabel_A"]'::jsonb,null,2,'Graf urutan kunci memuat siklus tabel_A → tabel_B → tabel_C → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null);
