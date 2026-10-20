-- DIHASILKAN oleh scripts/gen-dev.mjs (backend, bagian 4/4) — 50 soal HARD MODE (v2.4)
insert into questions (difficulty,type,prompt,prompt_en,code,language,options,options_en,correct_index,explanation,explanation_en,hint,hint_en) values
('backend','output','Berapa p90 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [334,156,263,450,684,683,617,593,473,699]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["495","684","699"]'::jsonb,null,1,'N=10, rank=⌈90/100×10⌉=9 → 684 ms. Rata-rata (495) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Berapa request yang diterima oleh FIXED WINDOW (jendela [0,10), [10,20), …)?',null,'# batas 4 request per 10 detik
waktu_request = [0,1,4,7,8,11,12,12,12]  # detik','python','["8","6","9"]'::jsonb,null,0,'Fixed window mereset hitungan pada batas kelipatan 10 detik (menerima 8); sliding window menimbang 10 detik terakhir (menerima 6). Fixed window dapat meloloskan 2×4 request di sekitar batas jendela.',null,'Reset terjadi pada kelipatan tetap, bukan relatif terhadap tiap request.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'data = sorted(jumlah_item)
for x in data:
    proses(x)','python','["O(1)","O(n log n)","O(n·m)"]'::jsonb,null,1,'Kompleksitas: O(n log n). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 5 percobaan ulang
base = 100 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(1000, base * 2**i)   # i = 0, 1, 2, …','python','["3500","2500","3100"]'::jsonb,null,1,'Jeda: 100, 200, 400, 800, 1000 ms → total 2500 ms (cap 1000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Ayu, Padang) (2, Fajar, Bandung) (3, Dedi, Bandung) (4, Eka, Medan) (5, Hana, Padang)
-- pesanan(id, pelanggan_id, total, status)
(1, 1, 90, batal) (2, 1, 20, lunas) (3, 3, 70, lunas) (4, 1, 20, baru) (5, 2, 50, baru) (6, 4, 80, lunas) (7, NULL, 90, baru) (8, 1, 90, lunas)

SELECT kota, COUNT(*) AS n FROM pelanggan
GROUP BY kota
HAVING COUNT(*) >= 2
ORDER BY n DESC, kota;','sql','["Bandung,0 | Padang,2","Bandung,2 | Padang,2","(kosong)"]'::jsonb,null,1,'GROUP BY menganggap semua NULL sebagai satu grup; COUNT(*) menghitungnya, COUNT(kota) tidak. Hasil: Bandung,2 | Padang,2.',null,'Apakah NULL membentuk grup sendiri?',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 0; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. A: tmpA = counter
3. A: counter = tmpA + 1
4. B: counter = tmpB + 1
5. B: tmpB = counter
6. A: tmpA = counter
7. B: counter = tmpB + 1
8. A: counter = tmpA + 1','python','["2","3","4"]'::jsonb,null,0,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 2, bukan 4. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'process.nextTick(() => { console.log("A"); Promise.resolve().then(() => console.log("C")); });
Promise.resolve().then(() => console.log("E"));
queueMicrotask(() => console.log("F"));
queueMicrotask(() => console.log("undefined"));','javascript','["A E F undefined C","A C E F","A C E F undefined"]'::jsonb,null,0,'Urutan: A E F undefined C. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan message broker/antrean?',null,'1. Astro
2. RabbitMQ
3. Kafka
4. RavenDB
5. Amazon SQS','text','["2, 3, 5","1, 2, 4","3, 4, 5"]'::jsonb,null,0,'Kafka, Amazon SQS, RabbitMQ adalah message broker/antrean; Astro dan RavenDB termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('backend','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 820, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 820
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 820
T1: UPDATE akun SET saldo = x + 20 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 30 WHERE id = 1; COMMIT;','sql','["Mengganti COMMIT menjadi ROLLBACK","Menambah indeks pada kolom saldo","Gunakan UPDATE atomik"]'::jsonb,null,2,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, kota, umur);

SELECT * FROM orang
WHERE kota = ''x'' AND umur > 30 AND negara > 30;','sql','["3","2","1"]'::jsonb,null,2,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','output','Rata-rata request yang sedang diproses bersamaan (in-flight)?',null,'# hukum Little: L = λ × W
λ = 500 request/detik
W = 50 ms rata-rata per request','python','["25000","25","10"]'::jsonb,null,1,'L = 500 × 0.05 s = 25.',null,'Samakan satuan waktu dulu: ms → detik.',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Dedi, Bandung) (2, Ayu, Padang) (3, Hana, Medan) (4, Gita, Bandung) (5, Citra, Padang) (6, Budi, Padang)
-- pesanan(id, pelanggan_id, total, status)
(1, 3, 50, lunas) (2, 5, 60, lunas) (3, 1, 30, baru) (4, 4, 90, baru) (5, 4, 30, lunas) (6, 1, 50, lunas) (7, 3, 50, lunas) (8, 4, 60, baru)

SELECT p.nama FROM pelanggan p
WHERE (SELECT SUM(total) FROM pesanan o WHERE o.pelanggan_id = p.id)
  > (SELECT AVG(total) FROM pesanan)
ORDER BY p.nama;','sql','["Gita | Hana","Citra | Gita","Citra | Dedi | Gita | Hana"]'::jsonb,null,2,'Subquery berkorelasi dihitung per pelanggan; pelanggan tanpa pesanan menghasilkan NULL sehingga perbandingan tidak lolos. Hasil: Citra | Dedi | Gita | Hana.',null,'Bandingkan SUM per pelanggan dengan AVG seluruh pesanan (termasuk yang pelanggan_id-nya NULL).',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'Promise.resolve().then(() => console.log("B"));
Promise.resolve().then(() => console.log("A"));
console.log("C");
console.log("undefined");
console.log("undefined");','javascript','["A B C undefined undefined","C undefined undefined B A","B A C"]'::jsonb,null,1,'Urutan: C undefined undefined B A. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Berapa jumlah cache HIT pada cache LRU ini?',null,'kapasitas = 4
akses = ["B","F","B","D","A","F","F","C","D","A"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["6","5","4"]'::jsonb,null,1,'Simulasi LRU: hit=5, isi akhir (lama→baru) = F C D A. Pada FIFO hit tidak memperbarui urutan (hit=5).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 6 percobaan ulang
base = 100 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(2000, base * 2**i)   # i = 0, 1, 2, …','python','["5100","6300","7100"]'::jsonb,null,0,'Jeda: 100, 200, 400, 800, 1600, 2000 ms → total 5100 ms (cap 2000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','output','Berapa request yang DITERIMA?',null,'# Token bucket: kapasitas 4 token, mulai penuh pada detik 0
# isi ulang 1 token/detik (kontinu, maksimum 4); tiap request memakai 1 token
waktu_request = [0,2,4,6,7,10,12,15,17]  # detik','python','["9","4","8"]'::jsonb,null,0,'Simulasi: token = min(4, token + Δt×1); request diterima jika token ≥ 1. Diterima 9 dari 9.',null,'Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.',null),
('backend','output','Berapa query SQL yang dijalankan (100 post, 7 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:100]
for p in posts:
    print(p.penulis.nama)','python','["101","1","2"]'::jsonb,null,1,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_C → LOCK tabel_B → COMMIT
T2: LOCK tabel_A → LOCK tabel_B → LOCK tabel_C → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mungkin: urutan penguncian membentuk siklus tabel_B → tabel_C → tabel_B"]'::jsonb,null,2,'Graf urutan kunci memuat siklus tabel_B → tabel_C → tabel_B: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 30) (2, B, 10) (3, A, 30) (4, A, 50) (5, A, 20) (6, B, 50) (7, B, 50) (8, A, 20)

SELECT id, DENSE_RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,2 | 2,3 | 3,2 | 4,1 | 5,4 | 6,1 | 7,1 | 8,4","1,2 | 2,3 | 3,3 | 4,1 | 5,4 | 6,1 | 7,2 | 8,5","1,2 | 2,2 | 3,2 | 4,1 | 5,3 | 6,1 | 7,1 | 8,3"]'::jsonb,null,2,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,2 | 2,2 | 3,2 | 4,1 | 5,3 | 6,1 | 7,1 | 8,3.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'hasil = []
for i in range(n):
    hasil.insert(0, i)','python','["O(n²)","O(log n)","O(n + m)"]'::jsonb,null,0,'Kompleksitas: O(n²). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Berapa p50 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [432,790,357,475,847,505,475,628,260,244,888,256,700,461,477,155,558,652,508,360]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["475","501","477"]'::jsonb,null,0,'N=20, rank=⌈50/100×20⌉=10 → 475 ms. Rata-rata (501) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Apa output kode Python ini?',null,'print(round(2.5), round(4.5), round(-0.5), 7.0 // 2, -7 // 2, -7 % 3, divmod(-7, 3))','python','["2), 2 4 0 3.0 -4 2 (-3","2 4 0 3.0 -3 2 (-3, 2)","2 4 0 3.0 -4 2 (-3, 2)"]'::jsonb,null,2,'round() memakai pembulatan bankir (setengah ke genap); // adalah floor division sehingga hasil negatif dibulatkan ke bawah; % mengikuti tanda pembagi. Hasil: 2 4 0 3.0 -4 2 (-3, 2).',null,'Pembulatan .5 ke genap; // membulatkan ke -∞.',null),
('backend','output','Berapa hasil query penelusuran ke atas dari pegawai 6?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 1) (4, 2) (5, 2) (6, 2) (7, 1) (8, 2)

WITH RECURSIVE naik(id) AS (
  SELECT 6
  UNION ALL
  SELECT s.atasan FROM staf s JOIN naik ON s.id = naik.id WHERE s.atasan IS NOT NULL
)
SELECT COUNT(*) FROM naik;','sql','["2","6","3"]'::jsonb,null,2,'Penelusuran naik menyertakan titik awal dan seluruh atasan hingga akar: 3 baris.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^2.3.1" }
// versi yang tersedia di registry:
2.3.1  2.4.0  3.3.0  3.4.3  3.5.1  3.5.2','json','["2.3.1","3.5.2","2.4.0"]'::jsonb,null,2,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 2.4.0.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 2; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. A: counter = tmpA + 1
3. A: tmpA = counter
4. B: tmpB = counter
5. B: counter = tmpB + 1
6. B: tmpB = counter
7. B: counter = tmpB + 1
8. A: counter = tmpA + 1','python','["5","4","6"]'::jsonb,null,1,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 4, bukan 6. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 2 f.txt menjadi "fitur"
main: mengubah baris 2 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_C → LOCK tabel_A → LOCK tabel_B → COMMIT
T2: LOCK tabel_A → LOCK tabel_C → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_C → tabel_A","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh"]'::jsonb,null,1,'Graf urutan kunci memuat siklus tabel_A → tabel_C → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','output','Apa output kode Python ini?',null,'d = {"a": 5, "b": 6}
d.pop("a"); d["a"] = 7
x = {**d, "b": 0, "c": 1}
print(list(d), x, d.setdefault("z", 2), d.get("q", -1))','python','["[''b'', ''a''] {''b'': 0, ''a'': 7, ''c'': 1} 2 -1","[''b'', ''a''] {''b'': -1, ''a'': 7, ''c'': 1} 2 -1","[''b'', ''a''] {''b'': 1, ''a'': 7, ''c'': 1} 2 -1"]'::jsonb,null,0,'Dict menjaga urutan penyisipan; kunci yang dihapus lalu dimasukkan lagi pindah ke akhir; {**d, ...} menimpa dengan nilai belakangan. Hasil: [''b'', ''a''] {''b'': 0, ''a'': 7, ''c'': 1} 2 -1.',null,'Urutan dict = urutan penyisipan.',null),
('backend','output','Berapa hasil query penelusuran ke atas dari pegawai 3?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 1) (4, 3) (5, 2)

WITH RECURSIVE naik(id) AS (
  SELECT 3
  UNION ALL
  SELECT s.atasan FROM staf s JOIN naik ON s.id = naik.id WHERE s.atasan IS NOT NULL
)
SELECT COUNT(*) FROM naik;','sql','["1","3","2"]'::jsonb,null,2,'Penelusuran naik menyertakan titik awal dan seluruh atasan hingga akar: 2 baris.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'process.nextTick(() => { console.log("F"); Promise.resolve().then(() => console.log("B")); });
process.nextTick(() => console.log("C"));
Promise.resolve().then(() => console.log("D"));
queueMicrotask(() => console.log("undefined"));','javascript','["F B C D","F C D undefined B","B C D F undefined"]'::jsonb,null,1,'Urutan: F C D undefined B. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Gita, Padang) (2, Dedi, Medan) (3, Citra, Padang) (4, Fajar, Medan) (5, Budi, Padang)
-- pesanan(id, pelanggan_id, total, status)
(1, 3, 40, lunas) (2, NULL, 60, lunas) (3, 1, 20, lunas) (4, NULL, 50, lunas) (5, 3, 80, batal) (6, 1, 50, batal) (7, NULL, 70, lunas) (8, 3, 80, batal) (9, 3, 40, lunas)

SELECT COUNT(*) FROM pelanggan p
LEFT JOIN pesanan o ON o.pelanggan_id = p.id
WHERE o.status = ''baru'';','sql','["0","5","6"]'::jsonb,null,0,'Kondisi pada tabel kanan di WHERE membuang baris NULL hasil LEFT JOIN sehingga ia berperilaku seperti INNER JOIN; bila kondisi ada di ON, pelanggan tanpa pesanan tetap muncul. Hasil: 0.',null,'WHERE atau ON — mana yang menyaring SETELAH join?',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 6 percobaan ulang
base = 200 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(5000, base * 2**i)   # i = 0, 1, 2, …','python','["11200","12600","16200"]'::jsonb,null,0,'Jeda: 200, 400, 800, 1600, 3200, 5000 ms → total 11200 ms (cap 5000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','output','Throughput maksimum (query/detik) yang bisa dilayani kolam ini?',null,'kolam_koneksi = 20
rata-rata_query = 25 ms, satu koneksi menangani satu query pada satu waktu','python','["800","500","80"]'::jsonb,null,0,'Tiap koneksi menyelesaikan 40 query/detik × 20 koneksi = 800 q/s.',null,'Satu koneksi menyelesaikan 1000/ms query per detik.',null),
('backend','output','Berapa jumlah cache HIT pada cache LRU ini?',null,'kapasitas = 3
akses = ["C","C","C","E","F","E","C","A","A","A","D"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["6","5","7"]'::jsonb,null,0,'Simulasi LRU: hit=6, isi akhir (lama→baru) = C A D. Pada FIFO hit tidak memperbarui urutan (hit=6).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^1.2.4" }
// versi yang tersedia di registry:
1.2.4  1.2.6  1.4.5  2.2.0  2.2.4  2.2.5  2.2.6  2.3.0','json','["2.3.0","1.2.6","1.4.5"]'::jsonb,null,2,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 1.4.5.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, kota, umur);

SELECT * FROM orang
WHERE umur > 30 AND kota = ''x'';','sql','["1","2","0"]'::jsonb,null,2,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 0.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','output','Berapa query SQL yang dijalankan (100 post, 3 penulis berbeda)?',null,'posts = Post.objects.prefetch_related("penulis")[:100]
for p in posts:
    print(p.penulis.nama)','python','["1","101","2"]'::jsonb,null,2,'prefetch_related memakai query kedua dengan WHERE id IN (...): total 2 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 1; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. B: counter = tmpB + 1
4. A: counter = tmpA + 1
5. B: tmpB = counter
6. A: tmpA = counter
7. A: counter = tmpA + 1
8. B: counter = tmpB + 1','python','["4","5","3"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 3, bukan 5. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','output','Berapa saldo akhir?',null,'-- saldo awal = 930, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 930
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 930
T1: UPDATE akun SET saldo = x + 60 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 50 WHERE id = 1; COMMIT;','sql','["980","990","1040"]'::jsonb,null,0,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 930+50, sehingga tambahan 60 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'data = sorted(panjang_item)
for x in data:
    proses(x)','python','["O(log n)","O(n)","O(n log n)"]'::jsonb,null,2,'Kompleksitas: O(n log n). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 9 f.txt menjadi "fitur"
main: mengubah baris 7 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Berapa request yang DITERIMA?',null,'# Token bucket: kapasitas 3 token, mulai penuh pada detik 0
# isi ulang 2 token/detik (kontinu, maksimum 3); tiap request memakai 1 token
waktu_request = [2,2,2,2,3,4,4,4,5]  # detik','python','["9","8","3"]'::jsonb,null,1,'Simulasi: token = min(3, token + Δt×2); request diterima jika token ≥ 1. Diterima 8 dari 9.',null,'Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 30) (2, A, 20) (3, B, 50) (4, A, 40) (5, B, 20) (6, A, 10) (7, A, 40) (8, B, 40)

SELECT id, RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,3 | 2,3 | 3,1 | 4,1 | 5,4 | 6,4 | 7,2 | 8,2","1,3 | 2,2 | 3,1 | 4,1 | 5,4 | 6,3 | 7,1 | 8,2","1,3 | 2,3 | 3,1 | 4,1 | 5,4 | 6,4 | 7,1 | 8,2"]'::jsonb,null,2,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,3 | 2,3 | 3,1 | 4,1 | 5,4 | 6,4 | 7,1 | 8,2.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','guess','Dari daftar ini, nomor mana yang BUKAN framework web sisi server?',null,'1. Express
2. Django
3. Hibernate
4. Laravel
5. PostgreSQL','text','["1 dan 2 dan 3","1 dan 3 dan 4","3 dan 5"]'::jsonb,null,2,'PostgreSQL dan Hibernate termasuk kategori lain; Django, Express, Laravel adalah framework web sisi server.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('backend','output','Berapa p99 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [227,842,649,156,399,339,712,663,343,743,256]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["842","484","743"]'::jsonb,null,0,'N=11, rank=⌈99/100×11⌉=11 → 842 ms. Rata-rata (484) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Berapa query SQL yang dijalankan (20 post, 4 penulis berbeda)?',null,'posts = Post.objects.all()[:20]
for p in posts:
    print(p.penulis.nama)        # relasi ForeignKey, lazy','python','["1","21","2"]'::jsonb,null,1,'Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Berapa jumlah cache HIT pada cache LRU ini?',null,'kapasitas = 4
akses = ["D","D","A","B","E","E","F","F","D","E"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["3","4","5"]'::jsonb,null,1,'Simulasi LRU: hit=4, isi akhir (lama→baru) = B F D E. Pada FIFO hit tidak memperbarui urutan (hit=4).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','output','Berapa request yang diterima oleh FIXED WINDOW (jendela [0,10), [10,20), …)?',null,'# batas 5 request per 10 detik
waktu_request = [3,3,5,6,7,7,9,12,15,16]  # detik','python','["10","8","7"]'::jsonb,null,1,'Fixed window mereset hitungan pada batas kelipatan 10 detik (menerima 8); sliding window menimbang 10 detik terakhir (menerima 7). Fixed window dapat meloloskan 2×5 request di sekitar batas jendela.',null,'Reset terjadi pada kelipatan tetap, bukan relatif terhadap tiap request.',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 10) (2, A, 50) (3, A, 50) (4, A, 30) (5, B, 50) (6, A, 50) (7, B, 30)

SELECT id, RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,5 | 2,1 | 3,1 | 4,4 | 5,1 | 6,1 | 7,2","1,5 | 2,1 | 3,2 | 4,4 | 5,1 | 6,3 | 7,2","1,3 | 2,1 | 3,1 | 4,2 | 5,1 | 6,1 | 7,2"]'::jsonb,null,0,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,5 | 2,1 | 3,1 | 4,4 | 5,1 | 6,1 | 7,2.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','output','Throughput maksimum (query/detik) yang bisa dilayani kolam ini?',null,'kolam_koneksi = 100
rata-rata_query = 20 ms, satu koneksi menangani satu query pada satu waktu','python','["500","2000","5000"]'::jsonb,null,2,'Tiap koneksi menyelesaikan 50 query/detik × 100 koneksi = 5000 q/s.',null,'Satu koneksi menyelesaikan 1000/ms query per detik.',null);
