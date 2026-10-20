-- DIHASILKAN oleh scripts/gen-dev.mjs (backend, bagian 3/4) — 250 soal HARD MODE (v2.4)
insert into questions (difficulty,type,prompt,prompt_en,code,language,options,options_en,correct_index,explanation,explanation_en,hint,hint_en) values
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Gita, NULL) (2, Hana, Bandung) (3, Eka, Bandung) (4, Ayu, NULL) (5, Fajar, Medan)
-- pesanan(id, pelanggan_id, total, status)
(1, 4, 50, batal) (2, 4, 80, baru) (3, NULL, 60, batal) (4, 3, 40, baru) (5, 4, 90, lunas) (6, NULL, 40, lunas) (7, NULL, 20, batal)

SELECT COUNT(*), COUNT(o.id), COUNT(DISTINCT p.id)
FROM pelanggan p LEFT JOIN pesanan o ON o.pelanggan_id = p.id;','sql','["7,4,5","4,7,5","7,7,4"]'::jsonb,null,0,'COUNT(*) menghitung semua baris hasil join (satu pelanggan tampil sebanyak pesanannya, atau sekali bila tak punya), COUNT(kolom) melewati NULL, COUNT(DISTINCT) menghilangkan duplikat. Hasil: 7,4,5.',null,'Mana yang melewati NULL?',null),
('backend','output','Berapa kali job ini berjalan dalam satu minggu penuh (Senin–Minggu)?',null,'# menit jam tgl bulan hari-minggu
5 4 * * 1,3,5','bash','["7","1","3"]'::jsonb,null,2,'1 kali sehari × 3 hari yang cocok (0=Minggu … 6=Sabtu) = 3.',null,'Kalikan jumlah eksekusi per hari dengan jumlah hari yang cocok.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'while n > 0:
    n //= 10','python','["O(n)","O(log n)","O(1)"]'::jsonb,null,1,'Kompleksitas: O(log n). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'queueMicrotask(() => console.log("A"));
console.log("G");
console.log("E");
process.nextTick(() => console.log("undefined"));
process.nextTick(() => console.log("undefined"));','javascript','["G E undefined undefined A","A E G undefined undefined","A G E"]'::jsonb,null,0,'Urutan: G E undefined undefined A. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Apa output kode Python ini?',null,'class Keranjang:
    isi = []
    def __init__(self, n):
        self.n = n
    def tambah(self, x):
        self.isi.append(x)
        self.n += 1
a, b = Keranjang(7), Keranjang(8)
a.tambah("x"); b.tambah("y"); b.tambah("z")
print(a.isi, a.n, b.n, Keranjang.n if hasattr(Keranjang, "n") else "tak ada")','python','["[''x'', ''y'', ''z''] 9 10 tak ada","[''x'', ''z''] 8 10 tak ada, ''y''","[''x'', ''y'', ''z''] 8 10 tak ada"]'::jsonb,null,2,'isi adalah atribut kelas yang dipakai bersama; self.n += 1 membuat atribut instance baru, tidak mengubah kelas. Hasil: [''x'', ''y'', ''z''] 8 10 tak ada.',null,'Atribut kelas vs atribut instance.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^1.4.3" }
// versi yang tersedia di registry:
1.4.3  1.4.4  1.4.6  1.6.4  2.4.0  2.4.3','json','["1.4.6","2.4.3","1.6.4"]'::jsonb,null,2,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 1.6.4.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','output','Berapa hasil query hierarki ini?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 1) (4, 1) (5, 1) (6, 2) (7, 5) (8, 6)

WITH RECURSIVE r(id, d) AS (
  SELECT id, 0 FROM staf WHERE atasan IS NULL
  UNION ALL
  SELECT s.id, r.d + 1 FROM staf s JOIN r ON s.atasan = r.id
)
SELECT MAX(d) FROM r;','sql','["8","3","4"]'::jsonb,null,1,'Kedalaman pohon (akar = 0) dihitung rekursif; hasil maksimum 3.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 0; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. A: tmpA = counter
3. B: counter = tmpB + 1
4. A: counter = tmpA + 1
5. B: tmpB = counter
6. B: counter = tmpB + 1
7. A: tmpA = counter
8. A: counter = tmpA + 1','python','["2","4","3"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 3, bukan 4. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~2.4.1" }
// versi yang tersedia di registry:
2.4.1  2.4.2  2.4.4  2.6.4  3.5.4  3.6.2  3.6.4','json','["2.4.4","3.6.4","2.6.4"]'::jsonb,null,0,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 2.4.4.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_C → LOCK tabel_A → LOCK tabel_B → COMMIT
T2: LOCK tabel_C → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan"]'::jsonb,null,1,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'process.nextTick(() => console.log("D"));
process.nextTick(() => console.log("B"));
console.log("E");
console.log("undefined");','javascript','["D B E","B D E undefined","E undefined D B"]'::jsonb,null,2,'Urutan: E undefined D B. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 1 f.txt menjadi "fitur"
main: tidak ada commit baru sejak fitur dibuat

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Fast-forward: tidak ada merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 30) (2, A, 10) (3, A, 40) (4, A, 20) (5, A, 40) (6, B, 20)

SELECT id, DENSE_RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,1 | 2,4 | 3,1 | 4,3 | 5,1 | 6,2","1,1 | 2,4 | 3,1 | 4,3 | 5,2 | 6,2","1,1 | 2,3 | 3,1 | 4,2 | 5,1 | 6,2"]'::jsonb,null,2,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,1 | 2,3 | 3,1 | 4,2 | 5,1 | 6,2.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','guess','Kapan SELECT ... FOR UPDATE dipakai?',null,'BEGIN;
SELECT saldo FROM akun WHERE id = 1 FOR UPDATE;
-- hitung di aplikasi
UPDATE akun SET saldo = ? WHERE id = 1;
COMMIT;','sql','["Mengunci baris yang dibaca sampai transaksi selesai agar baca-hitung-tulis tidak diselingi transaksi lain","Membuat baris menjadi read-only selamanya bagi semua transaksi, bahkan setelah COMMIT berjalan","Mempercepat pembacaan dengan melewati cache dan membaca langsung dari baris terbaru di disk"]'::jsonb,null,0,'FOR UPDATE memberi kunci eksklusif pada baris terpilih hingga COMMIT/ROLLBACK, mencegah lost update pada pola read-modify-write.',null,'Apa yang ditahan, dan sampai kapan?',null),
('backend','output','Isi cache LRU di akhir, dari yang paling lama dipakai ke yang paling baru?',null,'kapasitas = 3
akses = ["B","E","F","F","D","B","B","D","F","F","B"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["D F B","B F D","F D B"]'::jsonb,null,0,'Simulasi LRU: hit=6, isi akhir (lama→baru) = D F B. Pada FIFO hit tidak memperbarui urutan (hit=6).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','output','Berapa hasil query hierarki ini?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 1) (4, 3) (5, 3) (6, 4) (7, 5)

WITH RECURSIVE r(id, d) AS (
  SELECT id, 0 FROM staf WHERE atasan IS NULL
  UNION ALL
  SELECT s.id, r.d + 1 FROM staf s JOIN r ON s.atasan = r.id
)
SELECT MAX(d) FROM r;','sql','["4","3","7"]'::jsonb,null,1,'Kedalaman pohon (akar = 0) dihitung rekursif; hasil maksimum 3.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'for i in range(panjang):
    j = 1
    while j < panjang:
        j *= 2','python','["O(n)","O(n log n)","O(n²)"]'::jsonb,null,1,'Kompleksitas: O(n log n). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Throughput maksimum (query/detik) yang bisa dilayani kolam ini?',null,'kolam_koneksi = 40
rata-rata_query = 20 ms, satu koneksi menangani satu query pada satu waktu','python','["200","2000","800"]'::jsonb,null,1,'Tiap koneksi menyelesaikan 50 query/detik × 40 koneksi = 2000 q/s.',null,'Satu koneksi menyelesaikan 1000/ms query per detik.',null),
('backend','output','Berapa query SQL yang dijalankan (50 post, 3 penulis berbeda)?',null,'posts = Post.objects.prefetch_related("penulis")[:50]
for p in posts:
    print(p.penulis.nama)','python','["2","1","51"]'::jsonb,null,0,'prefetch_related memakai query kedua dengan WHERE id IN (...): total 2 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Berapa p50 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [239,800,122,413,578,276,844,532,388,305,40,151,60,517,37,70]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["336","305","276"]'::jsonb,null,2,'N=16, rank=⌈50/100×16⌉=8 → 276 ms. Rata-rata (336) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Gita, NULL) (2, Dedi, Padang) (3, Ayu, Padang) (4, Budi, Padang) (5, Hana, Padang) (6, Citra, Padang)
-- pesanan(id, pelanggan_id, total, status)
(1, 1, 60, lunas) (2, 5, 70, batal) (3, 1, 90, lunas) (4, 5, 40, batal) (5, 3, 90, baru) (6, 5, 80, batal) (7, 5, 60, baru) (8, 2, 30, baru) (9, 1, 50, baru)

SELECT COUNT(*), COUNT(o.id), COUNT(DISTINCT p.id)
FROM pelanggan p LEFT JOIN pesanan o ON o.pelanggan_id = p.id;','sql','["9,11,6","11,11,9","11,9,6"]'::jsonb,null,2,'COUNT(*) menghitung semua baris hasil join (satu pelanggan tampil sebanyak pesanannya, atau sekali bila tak punya), COUNT(kolom) melewati NULL, COUNT(DISTINCT) menghilangkan duplikat. Hasil: 11,9,6.',null,'Mana yang melewati NULL?',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, kota, umur);

SELECT * FROM orang
WHERE kota > 30 AND negara > 30 AND umur = ''x'';','sql','["1","2","3"]'::jsonb,null,0,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','output','Berapa request yang DITERIMA?',null,'# Token bucket: kapasitas 3 token, mulai penuh pada detik 0
# isi ulang 1 token/detik (kontinu, maksimum 3); tiap request memakai 1 token
waktu_request = [1,1,2,4,6,9,9,10,11]  # detik','python','["8","9","3"]'::jsonb,null,1,'Simulasi: token = min(3, token + Δt×1); request diterima jika token ≥ 1. Diterima 9 dari 9.',null,'Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 6 percobaan ulang
base = 100 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(1000, base * 2**i)   # i = 0, 1, 2, …','python','["3500","6300","4500"]'::jsonb,null,0,'Jeda: 100, 200, 400, 800, 1000, 1000 ms → total 3500 ms (cap 1000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','output','Apa output kode Python ini?',null,'x = 2
def f():
    try:
        print(x)
    except UnboundLocalError:
        print("unbound")
    x = 3
f()
print([x for x in range(3)][-1], x)','python','["unbound | 2 0","2 2 | unbound","unbound | 2 2"]'::jsonb,null,2,'Variabel yang ditugaskan di dalam fungsi bersifat lokal di SELURUH fungsi sehingga membaca sebelum tugas melempar UnboundLocalError; comprehension punya scope sendiri. Hasil: unbound | 2 2.',null,'Satu fungsi, satu scope lokal: kapan Python memutuskan variabel itu lokal?',null),
('backend','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 470, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 470
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 470
T1: UPDATE akun SET saldo = x + 60 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 40 WHERE id = 1; COMMIT;','sql','["Gunakan UPDATE atomik","Mengganti COMMIT menjadi ROLLBACK","Menambah indeks pada kolom saldo"]'::jsonb,null,0,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('backend','guess','Dari daftar ini, nomor mana yang BUKAN framework web sisi server?',null,'1. Tailwind CSS
2. Express
3. Flask
4. Kafka
5. Spring Boot','text','["1 dan 4 dan 5","1 dan 4","2 dan 3 dan 4"]'::jsonb,null,1,'Kafka dan Tailwind CSS termasuk kategori lain; Express, Flask, Spring Boot adalah framework web sisi server.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('backend','output','Berapa kali job ini berjalan dalam satu minggu penuh (Senin–Minggu)?',null,'# menit jam tgl bulan hari-minggu
*/30 6-9 * * 1-3','bash','["56","24","8"]'::jsonb,null,1,'8 kali sehari × 3 hari yang cocok (0=Minggu … 6=Sabtu) = 24.',null,'Kalikan jumlah eksekusi per hari dengan jumlah hari yang cocok.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~3.4.4" }
// versi yang tersedia di registry:
3.4.4  3.4.5  3.4.7  3.5.0  3.5.6  3.6.7  4.5.7','json','["3.6.7","4.5.7","3.4.7"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 3.4.7.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','output','Berapa jumlah cache HIT pada cache LRU ini?',null,'kapasitas = 3
akses = ["D","F","F","E","E","E","C","C","D","F"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["3","5","4"]'::jsonb,null,2,'Simulasi LRU: hit=4, isi akhir (lama→baru) = C D F. Pada FIFO hit tidak memperbarui urutan (hit=4).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan message broker/antrean?',null,'1. ActiveMQ
2. RabbitMQ
3. SolidJS
4. NATS
5. Vite','text','["1, 3, 5","1, 2, 4","2, 3, 4"]'::jsonb,null,1,'RabbitMQ, NATS, ActiveMQ adalah message broker/antrean; SolidJS dan Vite termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('backend','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 250, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 250
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 250
T1: UPDATE akun SET saldo = x + 80 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 60 WHERE id = 1; COMMIT;','sql','["Gunakan UPDATE atomik","Mengganti COMMIT menjadi ROLLBACK","Menambah indeks pada kolom saldo"]'::jsonb,null,0,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 10) (2, A, 10) (3, A, 30) (4, B, 30) (5, A, 40) (6, A, 30) (7, B, 20) (8, A, 50)

SELECT id, DENSE_RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,3 | 2,4 | 3,3 | 4,1 | 5,2 | 6,3 | 7,2 | 8,1","1,3 | 2,5 | 3,3 | 4,1 | 5,2 | 6,3 | 7,2 | 8,1","1,3 | 2,5 | 3,3 | 4,1 | 5,2 | 6,4 | 7,2 | 8,1"]'::jsonb,null,0,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,3 | 2,4 | 3,3 | 4,1 | 5,2 | 6,3 | 7,2 | 8,1.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'process.nextTick(() => { console.log("F"); Promise.resolve().then(() => console.log("C")); });
console.log("D");
queueMicrotask(() => console.log("G"));
Promise.resolve().then(() => console.log("undefined"));','javascript','["D F G undefined C","F C D G","C D F G undefined"]'::jsonb,null,0,'Urutan: D F G undefined C. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 7 percobaan ulang
base = 200 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(2000, base * 2**i)   # i = 0, 1, 2, …','python','["9000","25400","11000"]'::jsonb,null,0,'Jeda: 200, 400, 800, 1600, 2000, 2000, 2000 ms → total 9000 ms (cap 2000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 3 f.txt menjadi "fitur"
main: mengubah baris 5 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'for i in range(N):
    for j in range(10):
        work()','python','["O(n)","O(n log n)","O(n + m)"]'::jsonb,null,0,'Kompleksitas: O(n). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Berapa p95 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [318,400,67,256,231,879,659,470,805,864,807,438,748,91,816]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["523","864","879"]'::jsonb,null,2,'N=15, rank=⌈95/100×15⌉=15 → 879 ms. Rata-rata (523) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Apa output kode Python ini?',null,'fs = [lambda: i * 3 for i in range(5)]
gs = [lambda i=i: i * 3 for i in range(5)]
print([f() for f in fs], [g() for g in gs])','python','["[12, 12, 12, 12, 12] [0, 3, 6, 9, 22]","[12, 12, 12, 12, 12] [0, 1, 6, 9, 12]","[12, 12, 12, 12, 12] [0, 3, 6, 9, 12]"]'::jsonb,null,2,'Closure Python mengikat variabel (late binding), bukan nilainya; default argumen menangkap nilai saat definisi. Hasil: [12, 12, 12, 12, 12] [0, 3, 6, 9, 12].',null,'Kapan i dibaca oleh lambda?',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 20; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. B: counter = tmpB + 1
4. A: counter = tmpA + 1
5. B: tmpB = counter
6. B: counter = tmpB + 1
7. A: tmpA = counter
8. A: counter = tmpA + 1','python','["22","24","23"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 23, bukan 24. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','output','Berapa request yang diterima oleh FIXED WINDOW (jendela [0,10), [10,20), …)?',null,'# batas 3 request per 10 detik
waktu_request = [2,3,5,6,7,9,9,10,13]  # detik','python','["9","5","4"]'::jsonb,null,1,'Fixed window mereset hitungan pada batas kelipatan 10 detik (menerima 5); sliding window menimbang 10 detik terakhir (menerima 4). Fixed window dapat meloloskan 2×3 request di sekitar batas jendela.',null,'Reset terjadi pada kelipatan tetap, bukan relatif terhadap tiap request.',null),
('backend','guess','Cara penyimpanan password pengguna yang benar?',null,'# register
simpan(user, ???(password))','python','["SHA-256 tanpa salt supaya pencarian cepat","Enkripsi AES dengan satu kunci aplikasi agar password bisa dipulihkan","Hash lambat berparameter dengan salt unik per pengguna"]'::jsonb,null,2,'Password harus di-hash dengan fungsi yang sengaja lambat dan bersalt agar brute force/rainbow table mahal. Enkripsi dua arah dan hash cepat tanpa salt keliru.',null,'Ingin bisa membaca kembali password, atau cukup memverifikasinya?',null),
('backend','output','Berapa hasil query penelusuran ke atas dari pegawai 2?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 1) (4, 3) (5, 2) (6, 5) (7, 1) (8, 6)

WITH RECURSIVE naik(id) AS (
  SELECT 2
  UNION ALL
  SELECT s.atasan FROM staf s JOIN naik ON s.id = naik.id WHERE s.atasan IS NOT NULL
)
SELECT COUNT(*) FROM naik;','sql','["4","1","2"]'::jsonb,null,2,'Penelusuran naik menyertakan titik awal dan seluruh atasan hingga akar: 2 baris.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Rata-rata request yang sedang diproses bersamaan (in-flight)?',null,'# hukum Little: L = λ × W
λ = 1200 request/detik
W = 250 ms rata-rata per request','python','["4.8","300000","300"]'::jsonb,null,2,'L = 1200 × 0.25 s = 300.',null,'Samakan satuan waktu dulu: ms → detik.',null),
('backend','output','Berapa query SQL yang dijalankan (20 post, 5 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:20]
for p in posts:
    print(p.penulis.nama)','python','["21","2","1"]'::jsonb,null,2,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Hana, Medan) (2, Gita, Medan) (3, Fajar, Medan) (4, Ayu, Padang) (5, Eka, Medan)
-- pesanan(id, pelanggan_id, total, status)
(1, NULL, 60, lunas) (2, 2, 70, batal) (3, 2, 90, lunas) (4, 2, 20, baru) (5, NULL, 30, baru) (6, NULL, 30, lunas) (7, 2, 90, baru) (8, 3, 90, lunas) (9, 4, 70, lunas)

SELECT kota, COUNT(*) AS n FROM pelanggan
GROUP BY kota
HAVING COUNT(*) >= 1
ORDER BY n DESC, kota;','sql','["Medan,4","Medan,3 | Padang,1","Medan,4 | Padang,1"]'::jsonb,null,2,'GROUP BY menganggap semua NULL sebagai satu grup; COUNT(*) menghitungnya, COUNT(kota) tidak. Hasil: Medan,4 | Padang,1.',null,'Apakah NULL membentuk grup sendiri?',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (kota, negara, umur);

SELECT * FROM orang
WHERE kota > 30;','sql','["0","1","2"]'::jsonb,null,1,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_B → LOCK tabel_A → COMMIT
T2: LOCK tabel_C → LOCK tabel_B → LOCK tabel_A → COMMIT
T3: LOCK tabel_B → LOCK tabel_C → LOCK tabel_A → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: urutan penguncian membentuk siklus tabel_B → tabel_C → tabel_B","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh"]'::jsonb,null,0,'Graf urutan kunci memuat siklus tabel_B → tabel_C → tabel_B: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan framework web sisi server?',null,'1. Spring Boot
2. FastAPI
3. Rollup
4. MongoDB
5. Django','text','["1, 2, 5","1, 3, 5","2, 4, 5"]'::jsonb,null,0,'Spring Boot, Django, FastAPI adalah framework web sisi server; Rollup dan MongoDB termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('backend','output','Rata-rata request yang sedang diproses bersamaan (in-flight)?',null,'# hukum Little: L = λ × W
λ = 500 request/detik
W = 40 ms rata-rata per request','python','["20000","20","12.5"]'::jsonb,null,1,'L = 500 × 0.04 s = 20.',null,'Samakan satuan waktu dulu: ms → detik.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_A → LOCK tabel_C → LOCK tabel_B → COMMIT
T2: LOCK tabel_A → LOCK tabel_C → LOCK tabel_B → COMMIT
T3: LOCK tabel_B → LOCK tabel_A → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_C → tabel_B → tabel_A","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh"]'::jsonb,null,1,'Graf urutan kunci memuat siklus tabel_A → tabel_C → tabel_B → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (umur, kota, negara);

SELECT * FROM orang
WHERE negara = ''x'' AND kota = ''x'';','sql','["1","0","2"]'::jsonb,null,1,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 0.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 11; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. B: counter = tmpB + 1
4. B: tmpB = counter
5. B: counter = tmpB + 1
6. A: counter = tmpA + 1
7. A: tmpA = counter
8. A: counter = tmpA + 1','python','["15","14","13"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 13, bukan 15. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','output','Isi cache LRU di akhir, dari yang paling lama dipakai ke yang paling baru?',null,'kapasitas = 4
akses = ["E","E","B","B","D","A","C","A","D","A","B","D"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["B D A C","C A B D","D B A C"]'::jsonb,null,1,'Simulasi LRU: hit=7, isi akhir (lama→baru) = C A B D. Pada FIFO hit tidak memperbarui urutan (hit=7).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','output','Berapa request yang DITERIMA?',null,'# Token bucket: kapasitas 5 token, mulai penuh pada detik 0
# isi ulang 1 token/detik (kontinu, maksimum 5); tiap request memakai 1 token
waktu_request = [2,4,5,5,5,8,8,11,11,14]  # detik','python','["5","10","9"]'::jsonb,null,1,'Simulasi: token = min(5, token + Δt×1); request diterima jika token ≥ 1. Diterima 10 dari 10.',null,'Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Eka, Medan) (2, Citra, Bandung) (3, Budi, Medan) (4, Gita, Bandung) (5, Fajar, Bandung)
-- pesanan(id, pelanggan_id, total, status)
(1, 3, 60, lunas) (2, 4, 60, baru) (3, NULL, 40, lunas) (4, 4, 20, lunas) (5, 1, 20, baru) (6, 3, 40, batal) (7, 4, 30, lunas)

SELECT kota, COUNT(*) AS n FROM pelanggan
GROUP BY kota
HAVING COUNT(*) >= 2
ORDER BY n DESC, kota;','sql','["Bandung,3","Bandung,3 | Medan,2","Bandung,3 | Medan,1"]'::jsonb,null,1,'GROUP BY menganggap semua NULL sebagai satu grup; COUNT(*) menghitungnya, COUNT(kota) tidak. Hasil: Bandung,3 | Medan,2.',null,'Apakah NULL membentuk grup sendiri?',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~2.3.0" }
// versi yang tersedia di registry:
2.3.0  2.3.1  2.4.1  2.4.3  2.5.1  3.3.0  3.3.2','json','["2.5.1","2.3.1","3.3.2"]'::jsonb,null,1,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 2.3.1.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 40) (2, A, 30) (3, A, 30) (4, A, 10) (5, B, 20) (6, B, 50) (7, B, 10) (8, B, 20)

SELECT id, SUM(nilai) OVER (ORDER BY id) AS s FROM skor ORDER BY id;','sql','["1,210 | 2,210 | 3,210 | 4,210 | 5,210 | 6,210 | 7,210 | 8,210","1,40 | 2,70 | 3,100 | 4,110 | 5,130 | 6,180 | 7,190 | 8,210","1,40 | 2,70 | 3,100 | 4,110 | 5,20 | 6,70 | 7,80 | 8,100"]'::jsonb,null,1,'SUM() OVER (ORDER BY id) adalah jumlah kumulatif (frame default: awal sampai baris saat ini, termasuk seri pada kunci urut). Hasil: 1,40 | 2,70 | 3,100 | 4,110 | 5,130 | 6,180 | 7,190 | 8,210.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'for i in range(N):
    for j in range(i):
        work()','python','["O(1)","O(n log n)","O(n²)"]'::jsonb,null,2,'Kompleksitas: O(n²). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Apa output kode Python ini?',null,'a = list(range(15))
print(a[::-3], a[-5:-1], a[5:100][:2], a[::5])','python','["[14, 11, 8, 5, 2] [10, 11, 12, 13] [5, 6] [0, 5, 10]","[14, 11, 8, 5, 2] [10, 11, 12, 13] [5, 6] [0, 5, 9]","[14, 11, 8, 5, 2] [10, 21, 12, 13] [5, 6] [0, 5, 10]"]'::jsonb,null,0,'Slicing aman terhadap batas; langkah negatif menelusuri dari belakang dan indeks negatif dihitung dari akhir. Hasil: [14, 11, 8, 5, 2] [10, 11, 12, 13] [5, 6] [0, 5, 10].',null,'Hitung indeks negatif dari akhir list.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 5 f.txt menjadi "fitur"
main: mengubah baris 2 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 6 percobaan ulang
base = 250 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(5000, base * 2**i)   # i = 0, 1, 2, …','python','["15750","17750","12750"]'::jsonb,null,2,'Jeda: 250, 500, 1000, 2000, 4000, 5000 ms → total 12750 ms (cap 5000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','output','Berapa hasil query hierarki ini?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 2) (4, 1) (5, 3) (6, 1) (7, 3)

WITH RECURSIVE r(id, d) AS (
  SELECT id, 0 FROM staf WHERE atasan IS NULL
  UNION ALL
  SELECT s.id, r.d + 1 FROM staf s JOIN r ON s.atasan = r.id
)
SELECT MAX(d) FROM r;','sql','["3","7","4"]'::jsonb,null,0,'Kedalaman pohon (akar = 0) dihitung rekursif; hasil maksimum 3.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Berapa query SQL yang dijalankan (100 post, 6 penulis berbeda)?',null,'posts = Post.objects.all()[:100]
for p in posts:
    print(p.penulis.nama)        # relasi ForeignKey, lazy','python','["1","2","101"]'::jsonb,null,2,'Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Berapa saldo akhir?',null,'-- saldo awal = 990, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 990
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 990
T1: UPDATE akun SET saldo = x + 10 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 90 WHERE id = 1; COMMIT;','sql','["1000","1090","1080"]'::jsonb,null,2,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 990+90, sehingga tambahan 10 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'Promise.resolve().then(() => console.log("E"));
Promise.resolve().then(() => console.log("B"));
console.log("A");
process.nextTick(() => console.log("undefined"));','javascript','["A undefined E B","A B E undefined","E B A"]'::jsonb,null,0,'Urutan: A undefined E B. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Berapa p99 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [317,20,403,626,200,356,284,112,127,799,368,554,278,100,73,578,445,342,887,300]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["358","887","799"]'::jsonb,null,1,'N=20, rank=⌈99/100×20⌉=20 → 887 ms. Rata-rata (358) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 9 f.txt menjadi "fitur"
main: mengubah baris 3 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Berapa jumlah cache HIT pada cache LRU ini?',null,'kapasitas = 3
akses = ["F","E","C","C","C","D","C","D","D","D"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["7","5","6"]'::jsonb,null,2,'Simulasi LRU: hit=6, isi akhir (lama→baru) = E C D. Pada FIFO hit tidak memperbarui urutan (hit=6).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~0.0.4" }
// versi yang tersedia di registry:
0.0.4  0.0.5  0.0.6  0.2.7  1.0.6','json','["1.0.6","0.0.4","0.0.6"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 0.0.6.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Gita, Padang) (2, Eka, Medan) (3, Budi, Bandung) (4, Dedi, Padang) (5, Hana, Padang) (6, Citra, Bandung)
-- pesanan(id, pelanggan_id, total, status)
(1, 2, 90, lunas) (2, NULL, 90, lunas) (3, 4, 20, lunas) (4, 1, 20, lunas) (5, 5, 80, batal) (6, 3, 40, lunas) (7, 3, 70, batal) (8, 2, 90, lunas)

SELECT p.nama, SUM(o.total)
FROM pelanggan p JOIN pesanan o ON o.pelanggan_id = p.id
WHERE o.status <> ''batal''
GROUP BY p.nama
HAVING SUM(o.total) > 30
ORDER BY p.nama;','sql','["Budi,110 | Eka,180 | Hana,80","Budi,40 | Eka,180","Budi,1 | Dedi,1 | Eka,2 | Gita,1"]'::jsonb,null,1,'WHERE menyaring baris SEBELUM pengelompokan; HAVING menyaring grup SESUDAH agregasi. Perhatikan status NULL tidak lolos <> ''batal''. Hasil: Budi,40 | Eka,180.',null,'Urutan eksekusi: FROM → WHERE → GROUP BY → HAVING.',null),
('backend','output','Apa output kode Python ini?',null,'print(round(5.5), round(1.5), round(-0.5), 2.0 // 2, -2 // 2, -2 % 3, divmod(-2, 3))','python','["1), 6 2 0 1.0 -1 1 (-1","6 2 0 1.0 -1 1 (-1, 0)","6 2 0 1.0 -1 1 (-1, 1)"]'::jsonb,null,2,'round() memakai pembulatan bankir (setengah ke genap); // adalah floor division sehingga hasil negatif dibulatkan ke bawah; % mengikuti tanda pembagi. Hasil: 6 2 0 1.0 -1 1 (-1, 1).',null,'Pembulatan .5 ke genap; // membulatkan ke -∞.',null),
('backend','output','Berapa hasil query hierarki ini?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 2) (4, 3) (5, 1)

WITH RECURSIVE r(id, d) AS (
  SELECT id, 0 FROM staf WHERE atasan IS NULL
  UNION ALL
  SELECT s.id, r.d + 1 FROM staf s JOIN r ON s.atasan = r.id
)
SELECT MAX(d) FROM r;','sql','["5","4","3"]'::jsonb,null,2,'Kedalaman pohon (akar = 0) dihitung rekursif; hasil maksimum 3.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Berapa p95 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [475,393,497,547,480,633,98,399,647,533,47,803]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["463","803","647"]'::jsonb,null,1,'N=12, rank=⌈95/100×12⌉=12 → 803 ms. Rata-rata (463) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','guess','Dari daftar ini, nomor mana yang BUKAN penyimpan key-value/in-memory?',null,'1. Rollup
2. etcd
3. Redis
4. Memcached
5. Vue','text','["1 dan 4 dan 5","3 dan 4 dan 5","1 dan 5"]'::jsonb,null,2,'Rollup dan Vue termasuk kategori lain; Memcached, Redis, etcd adalah penyimpan key-value/in-memory.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 7 percobaan ulang
base = 500 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(5000, base * 2**i)   # i = 0, 1, 2, …','python','["63500","22500","27500"]'::jsonb,null,1,'Jeda: 500, 1000, 2000, 4000, 5000, 5000, 5000 ms → total 22500 ms (cap 5000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (kota, umur, negara);

SELECT * FROM orang
WHERE negara > 30 AND umur = ''x'';','sql','["1","2","0"]'::jsonb,null,2,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 0.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','output','Rata-rata request yang sedang diproses bersamaan (in-flight)?',null,'# hukum Little: L = λ × W
λ = 800 request/detik
W = 50 ms rata-rata per request','python','["40","16","40000"]'::jsonb,null,0,'L = 800 × 0.05 s = 40.',null,'Samakan satuan waktu dulu: ms → detik.',null),
('backend','output','Berapa request yang DITERIMA?',null,'# Token bucket: kapasitas 3 token, mulai penuh pada detik 0
# isi ulang 1 token/detik (kontinu, maksimum 3); tiap request memakai 1 token
waktu_request = [1,2,5,5,5,5,7,7,9,12]  # detik','python','["10","3","9"]'::jsonb,null,2,'Simulasi: token = min(3, token + Δt×1); request diterima jika token ≥ 1. Diterima 9 dari 10.',null,'Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'memo = {}
def fib(panjang):
    if panjang < 2: return panjang
    if panjang not in memo:
        memo[panjang] = fib(panjang - 1) + fib(panjang - 2)
    return memo[panjang]','python','["O(n log n)","O(n)","O(log n)"]'::jsonb,null,1,'Kompleksitas: O(n). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'Promise.resolve().then(() => console.log("D"));
console.log("C");
console.log("F");
process.nextTick(() => console.log("undefined"));','javascript','["C D F undefined","C F undefined D","D C F"]'::jsonb,null,1,'Urutan: C F undefined D. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Berapa query SQL yang dijalankan (200 post, 4 penulis berbeda)?',null,'posts = Post.objects.all()[:200]
for p in posts:
    print(p.penulis.nama)        # relasi ForeignKey, lazy','python','["1","2","201"]'::jsonb,null,2,'Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 16; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. B: counter = tmpB + 1
3. A: tmpA = counter
4. B: tmpB = counter
5. B: counter = tmpB + 1
6. A: counter = tmpA + 1
7. A: tmpA = counter
8. A: counter = tmpA + 1','python','["19","18","20"]'::jsonb,null,0,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 19, bukan 20. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 20) (2, B, 40) (3, A, 40) (4, B, 40) (5, B, 30) (6, B, 10) (7, A, 10)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,0 | 2,20 | 3,0 | 4,0 | 5,-10 | 6,-20 | 7,0","1,0 | 2,20 | 3,0 | 4,0 | 5,-10 | 6,-20 | 7,-30","1,20 | 2,0 | 3,-30 | 4,-10 | 5,-20 | 6,0 | 7,0"]'::jsonb,null,1,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,20 | 3,0 | 4,0 | 5,-10 | 6,-20 | 7,-30.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 840, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 840
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 840
T1: UPDATE akun SET saldo = x + 30 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 40 WHERE id = 1; COMMIT;','sql','["Mengganti COMMIT menjadi ROLLBACK","Menambah indeks pada kolom saldo","Gunakan UPDATE atomik"]'::jsonb,null,2,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_C → LOCK tabel_A → COMMIT
T2: LOCK tabel_C → LOCK tabel_A → COMMIT
T3: LOCK tabel_A → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan"]'::jsonb,null,1,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('backend','output','Isi cache LRU di akhir, dari yang paling lama dipakai ke yang paling baru?',null,'kapasitas = 3
akses = ["A","F","F","D","D","E","E","A","E","E"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["E A D","D A E","D E A"]'::jsonb,null,1,'Simulasi LRU: hit=5, isi akhir (lama→baru) = D A E. Pada FIFO hit tidak memperbarui urutan (hit=5).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Citra, Medan) (2, Gita, Medan) (3, Fajar, NULL) (4, Budi, Padang) (5, Ayu, NULL)
-- pesanan(id, pelanggan_id, total, status)
(1, 4, 90, baru) (2, 4, 50, batal) (3, 3, 70, baru) (4, 1, 60, baru) (5, 2, 60, lunas) (6, 2, 70, lunas) (7, 2, 30, baru)

SELECT COUNT(*) FROM (
  SELECT kota FROM pelanggan
  UNION ALL
  SELECT kota FROM pelanggan WHERE kota IS NOT NULL
) x
WHERE kota IS NULL OR kota <> ''Padang'';','sql','["2","4","6"]'::jsonb,null,2,'UNION ALL mempertahankan duplikat, UNION menghapusnya; kota <> ''Padang'' bernilai UNKNOWN untuk NULL sehingga perlu IS NULL eksplisit. Hasil: 6.',null,'UNION vs UNION ALL; perbandingan dengan NULL tidak pernah true.',null),
('backend','output','Rata-rata request yang sedang diproses bersamaan (in-flight)?',null,'# hukum Little: L = λ × W
λ = 500 request/detik
W = 250 ms rata-rata per request','python','["125000","125","2"]'::jsonb,null,1,'L = 500 × 0.25 s = 125.',null,'Samakan satuan waktu dulu: ms → detik.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 3 f.txt menjadi "fitur"
main: mengubah baris 6 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'for i in range(n):
    for j in range(n):
        total += i * j','python','["O(n·m)","O(log n)","O(n²)"]'::jsonb,null,2,'Kompleksitas: O(n²). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Berapa p95 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [88,295,571,643,621,209,401,696,334,326,77,745,797,316,77,806]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["806","438","797"]'::jsonb,null,0,'N=16, rank=⌈95/100×16⌉=16 → 806 ms. Rata-rata (438) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Berapa hasil query hierarki ini?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 2) (4, 2) (5, 4) (6, 5) (7, 5)

WITH RECURSIVE r(id, d) AS (
  SELECT id, 0 FROM staf WHERE atasan IS NULL
  UNION ALL
  SELECT s.id, r.d + 1 FROM staf s JOIN r ON s.atasan = r.id
)
SELECT MAX(d) FROM r;','sql','["7","4","5"]'::jsonb,null,1,'Kedalaman pohon (akar = 0) dihitung rekursif; hasil maksimum 4.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_A → LOCK tabel_C → LOCK tabel_B → COMMIT
T2: LOCK tabel_B → LOCK tabel_C → LOCK tabel_A → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock mungkin: urutan penguncian membentuk siklus tabel_C → tabel_B → tabel_C","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh"]'::jsonb,null,1,'Graf urutan kunci memuat siklus tabel_C → tabel_B → tabel_C: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','output','Berapa query SQL yang dijalankan (50 post, 3 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:50]
for p in posts:
    print(p.penulis.nama)','python','["1","51","2"]'::jsonb,null,0,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 600, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 600
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 600
T1: UPDATE akun SET saldo = x + 80 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 30 WHERE id = 1; COMMIT;','sql','["Mengganti COMMIT menjadi ROLLBACK","Gunakan UPDATE atomik","Menambah indeks pada kolom saldo"]'::jsonb,null,1,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 6; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. B: counter = tmpB + 1
4. A: counter = tmpA + 1
5. A: tmpA = counter
6. B: tmpB = counter
7. A: counter = tmpA + 1
8. B: counter = tmpB + 1','python','["9","10","8"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 8, bukan 10. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (kota, umur, negara);

SELECT * FROM orang
WHERE umur > 30 AND negara = ''x'';','sql','["1","0","2"]'::jsonb,null,1,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 0.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','guess','Dari daftar ini, nomor mana yang BUKAN penyimpan key-value/in-memory?',null,'1. Memcached
2. RabbitMQ
3. Redis
4. etcd
5. Astro','text','["2 dan 5","3 dan 4 dan 5","1 dan 3 dan 5"]'::jsonb,null,0,'Astro dan RabbitMQ termasuk kategori lain; etcd, Memcached, Redis adalah penyimpan key-value/in-memory.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 5 percobaan ulang
base = 250 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(3000, base * 2**i)   # i = 0, 1, 2, …','python','["7750","6750","9750"]'::jsonb,null,1,'Jeda: 250, 500, 1000, 2000, 3000 ms → total 6750 ms (cap 3000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'queueMicrotask(() => console.log("B"));
process.nextTick(() => console.log("A"));
process.nextTick(() => { console.log("E"); Promise.resolve().then(() => console.log("undefined")); });
console.log("undefined");','javascript','["A B E undefined undefined","undefined A E B undefined","B A E"]'::jsonb,null,1,'Urutan: undefined A E B undefined. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Apa output kode Python ini?',null,'fs = [lambda: i * 1 for i in range(4)]
gs = [lambda i=i: i * 1 for i in range(4)]
print([f() for f in fs], [g() for g in gs])','python','["[3, 3, 3, 3] [0, 1, 12, 3]","[3, 3, 3, 3] [0, 1, 2, 3]","[3, 3, 3, 3] [-1, 1, 2, 3]"]'::jsonb,null,1,'Closure Python mengikat variabel (late binding), bukan nilainya; default argumen menangkap nilai saat definisi. Hasil: [3, 3, 3, 3] [0, 1, 2, 3].',null,'Kapan i dibaca oleh lambda?',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~2.4.1" }
// versi yang tersedia di registry:
2.4.1  2.4.3  2.6.2  3.4.4  3.6.0  3.6.3','json','["2.4.3","3.6.3","2.6.2"]'::jsonb,null,0,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 2.4.3.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 50) (2, B, 30) (3, B, 20) (4, B, 40) (5, B, 30) (6, A, 40) (7, B, 30)

SELECT id, DENSE_RANK() OVER (PARTITION BY grup ORDER BY nilai DESC) AS r FROM skor ORDER BY id;','sql','["1,1 | 2,2 | 3,3 | 4,1 | 5,2 | 6,2 | 7,2","1,1 | 2,2 | 3,5 | 4,1 | 5,3 | 6,2 | 7,4","1,1 | 2,2 | 3,5 | 4,1 | 5,2 | 6,2 | 7,2"]'::jsonb,null,0,'RANK() memberi nomor sama pada seri lalu melompat; DENSE_RANK() tanpa lompatan; ROW_NUMBER() selalu unik. Hasil: 1,1 | 2,2 | 3,3 | 4,1 | 5,2 | 6,2 | 7,2.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','output','Berapa request yang diterima oleh FIXED WINDOW (jendela [0,10), [10,20), …)?',null,'# batas 3 request per 10 detik
waktu_request = [3,4,4,4,5,7,7,8,11,12]  # detik','python','["3","5","10"]'::jsonb,null,1,'Fixed window mereset hitungan pada batas kelipatan 10 detik (menerima 5); sliding window menimbang 10 detik terakhir (menerima 3). Fixed window dapat meloloskan 2×3 request di sekitar batas jendela.',null,'Reset terjadi pada kelipatan tetap, bukan relatif terhadap tiap request.',null),
('backend','output','Rata-rata request yang sedang diproses bersamaan (in-flight)?',null,'# hukum Little: L = λ × W
λ = 800 request/detik
W = 20 ms rata-rata per request','python','["40","16000","16"]'::jsonb,null,2,'L = 800 × 0.02 s = 16.',null,'Samakan satuan waktu dulu: ms → detik.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 5 percobaan ulang
base = 500 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(2000, base * 2**i)   # i = 0, 1, 2, …','python','["15500","7500","9500"]'::jsonb,null,1,'Jeda: 500, 1000, 2000, 2000, 2000 ms → total 7500 ms (cap 2000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','output','Berapa query SQL yang dijalankan (200 post, 3 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:200]
for p in posts:
    print(p.penulis.nama)','python','["1","2","201"]'::jsonb,null,0,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 40) (2, B, 20) (3, B, 10) (4, B, 50) (5, A, 30) (6, A, 20) (7, B, 20) (8, A, 30)

SELECT id, SUM(nilai) OVER (ORDER BY id) AS s FROM skor ORDER BY id;','sql','["1,40 | 2,60 | 3,70 | 4,120 | 5,150 | 6,170 | 7,190 | 8,220","1,220 | 2,220 | 3,220 | 4,220 | 5,220 | 6,220 | 7,220 | 8,220","1,40 | 2,60 | 3,70 | 4,120 | 5,30 | 6,50 | 7,140 | 8,80"]'::jsonb,null,0,'SUM() OVER (ORDER BY id) adalah jumlah kumulatif (frame default: awal sampai baris saat ini, termasuk seri pada kunci urut). Hasil: 1,40 | 2,60 | 3,70 | 4,120 | 5,150 | 6,170 | 7,190 | 8,220.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','output','Berapa p90 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [46,106,530,705,379,867,286,512,882,203,831,428,794,748,851,803,640]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["867","565","882"]'::jsonb,null,0,'N=17, rank=⌈90/100×17⌉=16 → 867 ms. Rata-rata (565) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_A → LOCK tabel_C → LOCK tabel_B → COMMIT
T2: LOCK tabel_C → LOCK tabel_B → LOCK tabel_A → COMMIT
T3: LOCK tabel_C → LOCK tabel_A → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_C → tabel_B → tabel_A","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh"]'::jsonb,null,0,'Graf urutan kunci memuat siklus tabel_A → tabel_C → tabel_B → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 13; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. A: tmpA = counter
3. B: counter = tmpB + 1
4. B: tmpB = counter
5. B: counter = tmpB + 1
6. A: counter = tmpA + 1
7. A: tmpA = counter
8. A: counter = tmpA + 1','python','["16","17","15"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 15, bukan 17. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','output','Berapa hasil query hierarki ini?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 2) (4, 1) (5, 3) (6, 5)

WITH RECURSIVE r(id, d) AS (
  SELECT id, 0 FROM staf WHERE atasan IS NULL
  UNION ALL
  SELECT s.id, r.d + 1 FROM staf s JOIN r ON s.atasan = r.id
)
SELECT MAX(d) FROM r;','sql','["5","6","4"]'::jsonb,null,2,'Kedalaman pohon (akar = 0) dihitung rekursif; hasil maksimum 4.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'process.nextTick(() => { console.log("E"); Promise.resolve().then(() => console.log("B")); });
process.nextTick(() => console.log("F"));
console.log("A");
queueMicrotask(() => console.log("undefined"));
process.nextTick(() => { console.log("undefined"); Promise.resolve().then(() => console.log("undefined")); });','javascript','["A E F undefined undefined B undefined","A B E F undefined undefined undefined","E B F A"]'::jsonb,null,0,'Urutan: A E F undefined undefined B undefined. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 6 f.txt menjadi "fitur"
main: mengubah baris 7 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Berapa request yang DITERIMA?',null,'# Token bucket: kapasitas 3 token, mulai penuh pada detik 0
# isi ulang 1 token/detik (kontinu, maksimum 3); tiap request memakai 1 token
waktu_request = [0,1,2,2,2,2,5,5,5,6,8]  # detik','python','["10","11","3"]'::jsonb,null,0,'Simulasi: token = min(3, token + Δt×1); request diterima jika token ≥ 1. Diterima 10 dari 11.',null,'Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.',null),
('backend','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 490, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 490
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 490
T1: UPDATE akun SET saldo = x + 70 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 30 WHERE id = 1; COMMIT;','sql','["Mengganti COMMIT menjadi ROLLBACK","Gunakan UPDATE atomik","Menambah indeks pada kolom saldo"]'::jsonb,null,1,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
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
    return v * 2
print(hitung(3))','python','["a | 6 | b","a | b | 8","a | b | 6"]'::jsonb,null,2,'Dekorator ditumpuk dari bawah ke atas saat dibungkus, tetapi saat dipanggil lapisan paling luar (a) berjalan lebih dulu. Hasil: a | b | 6.',null,'Siapa pembungkus terluar?',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Ayu, Medan) (2, Gita, Padang) (3, Citra, Bandung) (4, Budi, NULL) (5, Hana, Padang)
-- pesanan(id, pelanggan_id, total, status)
(1, 4, 70, lunas) (2, 2, 40, lunas) (3, 4, 40, batal) (4, 1, 20, batal) (5, 2, 40, lunas) (6, 1, 30, lunas) (7, 4, 70, lunas)

SELECT p.nama FROM pelanggan p
WHERE (SELECT SUM(total) FROM pesanan o WHERE o.pelanggan_id = p.id)
  > (SELECT AVG(total) FROM pesanan)
ORDER BY p.nama;','sql','["Budi | Gita","Budi","Ayu | Budi | Gita"]'::jsonb,null,2,'Subquery berkorelasi dihitung per pelanggan; pelanggan tanpa pesanan menghasilkan NULL sehingga perbandingan tidak lolos. Hasil: Ayu | Budi | Gita.',null,'Bandingkan SUM per pelanggan dengan AVG seluruh pesanan (termasuk yang pelanggan_id-nya NULL).',null),
('backend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan reverse proxy/web server?',null,'1. Apache HTTP Server
2. Prisma
3. Traefik
4. GraphQL
5. Nginx','text','["1, 2, 5","1, 3, 5","3, 4, 5"]'::jsonb,null,1,'Nginx, Apache HTTP Server, Traefik adalah reverse proxy/web server; Prisma dan GraphQL termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (kota, umur, negara);

SELECT * FROM orang
WHERE negara = ''x'' AND umur > 30;','sql','["1","2","0"]'::jsonb,null,2,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 0.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','output','Isi cache LRU di akhir, dari yang paling lama dipakai ke yang paling baru?',null,'kapasitas = 3
akses = ["E","E","C","C","E","D","E","E","B","B","B"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["D E B","C D B","B E D"]'::jsonb,null,0,'Simulasi LRU: hit=7, isi akhir (lama→baru) = D E B. Pada FIFO hit tidak memperbarui urutan (hit=7).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~2.1.3" }
// versi yang tersedia di registry:
2.1.3  2.1.5  2.1.6  2.2.4  2.3.3  3.1.4  3.3.4','json','["2.3.3","3.3.4","2.1.6"]'::jsonb,null,2,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 2.1.6.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'for i in range(panjang):
    for j in range(i):
        work()','python','["O(n²)","O(2ⁿ)","O(log n)"]'::jsonb,null,0,'Kompleksitas: O(n²). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 6; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. A: tmpA = counter
3. B: counter = tmpB + 1
4. B: tmpB = counter
5. A: counter = tmpA + 1
6. B: counter = tmpB + 1
7. A: tmpA = counter
8. A: counter = tmpA + 1','python','["8","10","9"]'::jsonb,null,2,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 9, bukan 10. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','output','Berapa p50 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [433,329,857,167,368,731,272,34,703,340,730,400,60,291,716,633,324]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["400","368","435"]'::jsonb,null,1,'N=17, rank=⌈50/100×17⌉=9 → 368 ms. Rata-rata (435) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'def f(panjang):
    if panjang <= 1: return 0
    return 1 + f(panjang // 2)','python','["O(log n)","O(n²)","O(n + m)"]'::jsonb,null,0,'Kompleksitas: O(log n). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_A → LOCK tabel_C → LOCK tabel_B → COMMIT
T2: LOCK tabel_A → LOCK tabel_B → LOCK tabel_C → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mungkin: urutan penguncian membentuk siklus tabel_C → tabel_B → tabel_C","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten"]'::jsonb,null,1,'Graf urutan kunci memuat siklus tabel_C → tabel_B → tabel_C: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','guess','Dari daftar ini, nomor mana yang BUKAN framework web sisi server?',null,'1. Rails
2. Amazon SQS
3. FastAPI
4. SolidJS
5. Flask','text','["2 dan 4","2 dan 3 dan 4","1 dan 3 dan 4"]'::jsonb,null,0,'SolidJS dan Amazon SQS termasuk kategori lain; Rails, Flask, FastAPI adalah framework web sisi server.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^1.2.3" }
// versi yang tersedia di registry:
1.2.3  1.2.4  1.2.6  1.3.5  1.3.6  1.4.4  2.2.0  2.2.3','json','["1.2.6","1.4.4","2.2.3"]'::jsonb,null,1,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 1.4.4.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, kota, umur);

SELECT * FROM orang
WHERE kota > 30 AND umur > 30;','sql','["0","2","1"]'::jsonb,null,0,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 0.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 40) (2, B, 10) (3, A, 30) (4, A, 40) (5, B, 50) (6, B, 10) (7, A, 50) (8, B, 20)

SELECT id, SUM(nilai) OVER (ORDER BY id) AS s FROM skor ORDER BY id;','sql','["1,250 | 2,250 | 3,250 | 4,250 | 5,250 | 6,250 | 7,250 | 8,250","1,40 | 2,50 | 3,80 | 4,120 | 5,170 | 6,180 | 7,230 | 8,250","1,40 | 2,10 | 3,70 | 4,110 | 5,60 | 6,70 | 7,160 | 8,90"]'::jsonb,null,1,'SUM() OVER (ORDER BY id) adalah jumlah kumulatif (frame default: awal sampai baris saat ini, termasuk seri pada kunci urut). Hasil: 1,40 | 2,50 | 3,80 | 4,120 | 5,170 | 6,180 | 7,230 | 8,250.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 2 f.txt menjadi "fitur"
main: mengubah baris 7 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Apa output kode Python ini?',null,'a = [[0] * 5] * 2
a[0][4] = 7
b = [[0] * 5 for _ in range(2)]
b[0][4] = 7
print(a == b, a, b)','python','["False [[0, 10, 0, 0, 7], [0, 0, 0, 0, 7]] [[0, 0, 0, 0, 7], [0, 0, 0, 0, 0]]","False [[0, 0, 0, 0, 7], [0, 0, 0, 0, 7]] [[0, 0, 0, 0, 7], [0, 0, 0, 0, 0]]","0, False [[0, 0, 0, 7], [0, 0, 0, 0, 7]] [[0, 0, 0, 0, 7], [0, 0, 0, 0, 0]]"]'::jsonb,null,1,'[[0]*n]*2 menggandakan referensi ke SATU list yang sama; comprehension membuat list baru tiap iterasi. Hasil: False [[0, 0, 0, 0, 7], [0, 0, 0, 0, 7]] [[0, 0, 0, 0, 7], [0, 0, 0, 0, 0]].',null,'Berapa objek list yang sebenarnya dibuat?',null),
('backend','output','Berapa hasil query penelusuran ke atas dari pegawai 6?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 1) (4, 1) (5, 4) (6, 5)

WITH RECURSIVE naik(id) AS (
  SELECT 6
  UNION ALL
  SELECT s.atasan FROM staf s JOIN naik ON s.id = naik.id WHERE s.atasan IS NOT NULL
)
SELECT COUNT(*) FROM naik;','sql','["3","6","4"]'::jsonb,null,2,'Penelusuran naik menyertakan titik awal dan seluruh atasan hingga akar: 4 baris.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Rata-rata request yang sedang diproses bersamaan (in-flight)?',null,'# hukum Little: L = λ × W
λ = 800 request/detik
W = 80 ms rata-rata per request','python','["64000","10","64"]'::jsonb,null,2,'L = 800 × 0.08 s = 64.',null,'Samakan satuan waktu dulu: ms → detik.',null),
('backend','output','Berapa request yang diterima oleh FIXED WINDOW (jendela [0,10), [10,20), …)?',null,'# batas 4 request per 10 detik
waktu_request = [3,4,5,8,9,9,10,11,12,13,15]  # detik','python','["6","11","8"]'::jsonb,null,2,'Fixed window mereset hitungan pada batas kelipatan 10 detik (menerima 8); sliding window menimbang 10 detik terakhir (menerima 6). Fixed window dapat meloloskan 2×4 request di sekitar batas jendela.',null,'Reset terjadi pada kelipatan tetap, bukan relatif terhadap tiap request.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 7 percobaan ulang
base = 500 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(2000, base * 2**i)   # i = 0, 1, 2, …','python','["63500","13500","11500"]'::jsonb,null,2,'Jeda: 500, 1000, 2000, 2000, 2000, 2000, 2000 ms → total 11500 ms (cap 2000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Fajar, Medan) (2, Hana, NULL) (3, Ayu, Bandung) (4, Dedi, NULL) (5, Citra, Padang) (6, Budi, Medan)
-- pesanan(id, pelanggan_id, total, status)
(1, 5, 70, baru) (2, NULL, 80, batal) (3, 2, 70, batal) (4, 1, 50, batal) (5, 1, 20, lunas) (6, NULL, 30, batal) (7, 3, 80, baru) (8, 2, 20, batal) (9, 2, 70, batal)

SELECT kota, COUNT(*) AS n FROM pelanggan
GROUP BY kota
HAVING COUNT(*) >= 1
ORDER BY n DESC, kota;','sql','["Medan,2 | Bandung,1 | Padang,1","NULL,2 | Medan,2 | Bandung,1 | Padang,1","NULL,2 | Medan,2"]'::jsonb,null,1,'GROUP BY menganggap semua NULL sebagai satu grup; COUNT(*) menghitungnya, COUNT(kota) tidak. Hasil: NULL,2 | Medan,2 | Bandung,1 | Padang,1.',null,'Apakah NULL membentuk grup sendiri?',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'process.nextTick(() => { console.log("E"); Promise.resolve().then(() => console.log("B")); });
process.nextTick(() => { console.log("G"); Promise.resolve().then(() => console.log("D")); });
console.log("C");
console.log("undefined");
Promise.resolve().then(() => console.log("undefined"));','javascript','["B C D E G undefined undefined","E B G D C","C undefined E G undefined B D"]'::jsonb,null,2,'Urutan: C undefined E G undefined B D. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Berapa query SQL yang dijalankan (50 post, 5 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:50]
for p in posts:
    print(p.penulis.nama)','python','["1","51","2"]'::jsonb,null,0,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Isi cache LRU di akhir, dari yang paling lama dipakai ke yang paling baru?',null,'kapasitas = 3
akses = ["A","C","B","B","C","D","D","D","C","A","C","A"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["D A C","D C A","A C D"]'::jsonb,null,1,'Simulasi LRU: hit=7, isi akhir (lama→baru) = D C A. Pada FIFO hit tidak memperbarui urutan (hit=6).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','guess','Cara yang paling tepat mencegah anomali pada jadwal di atas tanpa menaikkan level isolasi?',null,'-- saldo awal = 860, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 860
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 860
T1: UPDATE akun SET saldo = x + 20 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 20 WHERE id = 1; COMMIT;','sql','["Menambah indeks pada kolom saldo","Gunakan UPDATE atomik","Mengganti COMMIT menjadi ROLLBACK"]'::jsonb,null,1,'Operasi baca-hitung-tulis harus atomik di database atau dilindungi kunci baris agar penulisan T2 memakai nilai terbaru.',null,'Siapa yang menghitung penjumlahannya: aplikasi atau database?',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_C → LOCK tabel_A → COMMIT
T2: LOCK tabel_C → LOCK tabel_A → COMMIT
T3: LOCK tabel_C → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan","Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten"]'::jsonb,null,2,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('backend','output','Berapa saldo akhir?',null,'-- saldo awal = 310, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 310
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 310
T1: UPDATE akun SET saldo = x + 50 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 10 WHERE id = 1; COMMIT;','sql','["360","370","320"]'::jsonb,null,2,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 310+10, sehingga tambahan 50 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('backend','output','Throughput maksimum (query/detik) yang bisa dilayani kolam ini?',null,'kolam_koneksi = 10
rata-rata_query = 10 ms, satu koneksi menangani satu query pada satu waktu','python','["100","1","1000"]'::jsonb,null,2,'Tiap koneksi menyelesaikan 100 query/detik × 10 koneksi = 1000 q/s.',null,'Satu koneksi menyelesaikan 1000/ms query per detik.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 8 f.txt menjadi "fitur"
main: mengubah baris 8 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Berapa request yang diterima oleh FIXED WINDOW (jendela [0,10), [10,20), …)?',null,'# batas 4 request per 10 detik
waktu_request = [3,4,6,7,10,13,14,15,16,19,22]  # detik','python','["9","8","11"]'::jsonb,null,0,'Fixed window mereset hitungan pada batas kelipatan 10 detik (menerima 9); sliding window menimbang 10 detik terakhir (menerima 8). Fixed window dapat meloloskan 2×4 request di sekitar batas jendela.',null,'Reset terjadi pada kelipatan tetap, bukan relatif terhadap tiap request.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 7 percobaan ulang
base = 200 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(3000, base * 2**i)   # i = 0, 1, 2, …','python','["15000","25400","12000"]'::jsonb,null,2,'Jeda: 200, 400, 800, 1600, 3000, 3000, 3000 ms → total 12000 ms (cap 3000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','output','Berapa query SQL yang dijalankan (50 post, 7 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:50]
for p in posts:
    print(p.penulis.nama)','python','["2","1","51"]'::jsonb,null,1,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Apa output kode Python ini?',null,'d = {"a": 4, "b": 5}
d.pop("a"); d["a"] = 6
x = {**d, "b": 0, "c": 1}
print(list(d), x, d.setdefault("z", 2), d.get("q", -1))','python','["[''b'', ''a''] {''b'': 0, ''a'': 6, ''c'': 1} 2 -1","[''b'', ''a''] {''b'': 0, ''a'': 6, ''c'': 11} 2 -1","''a''] {''b'': 0, [''b'', ''a'': 6, ''c'': 1} 2 -1"]'::jsonb,null,0,'Dict menjaga urutan penyisipan; kunci yang dihapus lalu dimasukkan lagi pindah ke akhir; {**d, ...} menimpa dengan nilai belakangan. Hasil: [''b'', ''a''] {''b'': 0, ''a'': 6, ''c'': 1} 2 -1.',null,'Urutan dict = urutan penyisipan.',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 40) (2, B, 30) (3, B, 40) (4, A, 50) (5, B, 30) (6, B, 30) (7, B, 10) (8, B, 50)

SELECT id, SUM(nilai) OVER (ORDER BY id) AS s FROM skor ORDER BY id;','sql','["1,40 | 2,30 | 3,70 | 4,90 | 5,100 | 6,130 | 7,140 | 8,190","1,280 | 2,280 | 3,280 | 4,280 | 5,280 | 6,280 | 7,280 | 8,280","1,40 | 2,70 | 3,110 | 4,160 | 5,190 | 6,220 | 7,230 | 8,280"]'::jsonb,null,2,'SUM() OVER (ORDER BY id) adalah jumlah kumulatif (frame default: awal sampai baris saat ini, termasuk seri pada kunci urut). Hasil: 1,40 | 2,70 | 3,110 | 4,160 | 5,190 | 6,220 | 7,230 | 8,280.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~1.1.3" }
// versi yang tersedia di registry:
1.1.3  1.1.5  1.2.5  1.2.6  1.3.0  2.1.0  2.1.4','json','["2.1.4","1.1.5","1.3.0"]'::jsonb,null,1,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 1.1.5.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan basis data dokumen NoSQL?',null,'1. CouchDB
2. RavenDB
3. Firestore
4. Sequelize
5. Hibernate','text','["2, 4, 5","1, 2, 3","1, 3, 4"]'::jsonb,null,1,'Firestore, CouchDB, RavenDB adalah basis data dokumen NoSQL; Sequelize dan Hibernate termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('backend','output','Berapa p50 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [55,615,545,170,362,422,53,302,235,107,475]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["302","304","362"]'::jsonb,null,0,'N=11, rank=⌈50/100×11⌉=6 → 302 ms. Rata-rata (304) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Berapa hasil query penelusuran ke atas dari pegawai 5?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 1) (4, 1) (5, 2) (6, 3) (7, 5) (8, 5)

WITH RECURSIVE naik(id) AS (
  SELECT 5
  UNION ALL
  SELECT s.atasan FROM staf s JOIN naik ON s.id = naik.id WHERE s.atasan IS NOT NULL
)
SELECT COUNT(*) FROM naik;','sql','["3","2","5"]'::jsonb,null,0,'Penelusuran naik menyertakan titik awal dan seluruh atasan hingga akar: 3 baris.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Isi cache LRU di akhir, dari yang paling lama dipakai ke yang paling baru?',null,'kapasitas = 3
akses = ["D","A","B","F","B","F","A","D","B","F","F","D"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["B F D","D F B","F D B"]'::jsonb,null,0,'Simulasi LRU: hit=5, isi akhir (lama→baru) = B F D. Pada FIFO hit tidak memperbarui urutan (hit=7).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (kota, negara, umur);

SELECT * FROM orang
WHERE negara = ''x'' AND umur > 30 AND kota = ''x'';','sql','["4","3","2"]'::jsonb,null,1,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 3.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'process.nextTick(() => console.log("C"));
process.nextTick(() => { console.log("G"); Promise.resolve().then(() => console.log("B")); });
process.nextTick(() => { console.log("A"); Promise.resolve().then(() => console.log("undefined")); });
Promise.resolve().then(() => console.log("undefined"));','javascript','["A B C G undefined undefined","C G A undefined B undefined","C G B A"]'::jsonb,null,1,'Urutan: C G A undefined B undefined. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 11; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. A: counter = tmpA + 1
3. B: tmpB = counter
4. A: tmpA = counter
5. A: counter = tmpA + 1
6. B: counter = tmpB + 1
7. B: tmpB = counter
8. B: counter = tmpB + 1','python','["14","13","15"]'::jsonb,null,0,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 14, bukan 15. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'for i in range(panjang):
    for j in range(panjang):
        total += i * j','python','["O(n)","O(log n)","O(n²)"]'::jsonb,null,2,'Kompleksitas: O(n²). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Ayu, NULL) (2, Fajar, Bandung) (3, Citra, Bandung) (4, Eka, Padang) (5, Hana, NULL)
-- pesanan(id, pelanggan_id, total, status)
(1, 4, 90, lunas) (2, 3, 70, batal) (3, 3, 40, lunas) (4, 2, 60, lunas) (5, 3, 20, baru) (6, NULL, 60, lunas) (7, 2, 50, lunas)

SELECT kota, COUNT(*) AS n FROM pelanggan
GROUP BY kota
HAVING COUNT(*) >= 1
ORDER BY n DESC, kota;','sql','["Bandung,2 | Padang,1","NULL,2 | Bandung,2","NULL,2 | Bandung,2 | Padang,1"]'::jsonb,null,2,'GROUP BY menganggap semua NULL sebagai satu grup; COUNT(*) menghitungnya, COUNT(kota) tidak. Hasil: NULL,2 | Bandung,2 | Padang,1.',null,'Apakah NULL membentuk grup sendiri?',null),
('backend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan basis data relasional?',null,'1. MySQL
2. Astro
3. Redis
4. PostgreSQL
5. SQL Server','text','["2, 3, 4","1, 3, 4","1, 4, 5"]'::jsonb,null,2,'SQL Server, MySQL, PostgreSQL adalah basis data relasional; Astro dan Redis termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^2.1.3" }
// versi yang tersedia di registry:
2.1.3  2.1.4  2.1.6  2.2.5  2.3.3  2.3.6  3.1.6  3.2.5','json','["2.1.6","2.3.6","3.2.5"]'::jsonb,null,1,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 2.3.6.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 7 percobaan ulang
base = 250 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(3000, base * 2**i)   # i = 0, 1, 2, …','python','["31750","15750","12750"]'::jsonb,null,2,'Jeda: 250, 500, 1000, 2000, 3000, 3000, 3000 ms → total 12750 ms (cap 3000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','output','Berapa hasil query penelusuran ke atas dari pegawai 8?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 1) (4, 2) (5, 4) (6, 4) (7, 2) (8, 2)

WITH RECURSIVE naik(id) AS (
  SELECT 8
  UNION ALL
  SELECT s.atasan FROM staf s JOIN naik ON s.id = naik.id WHERE s.atasan IS NOT NULL
)
SELECT COUNT(*) FROM naik;','sql','["3","2","8"]'::jsonb,null,0,'Penelusuran naik menyertakan titik awal dan seluruh atasan hingga akar: 3 baris.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'process.nextTick(() => console.log("E"));
Promise.resolve().then(() => console.log("F"));
queueMicrotask(() => console.log("B"));
Promise.resolve().then(() => console.log("undefined"));','javascript','["B E F undefined","E F B","E F B undefined"]'::jsonb,null,2,'Urutan: E F B undefined. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 5 f.txt menjadi "fitur"
main: mengubah baris 8 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Eka, Medan) (2, Fajar, Medan) (3, Dedi, Bandung) (4, Ayu, Medan) (5, Hana, Bandung) (6, Citra, NULL)
-- pesanan(id, pelanggan_id, total, status)
(1, 4, 90, lunas) (2, 3, 90, lunas) (3, 4, 90, baru) (4, 1, 70, lunas) (5, 5, 90, lunas) (6, 5, 90, batal) (7, 4, 90, batal) (8, 2, 90, lunas)

SELECT COUNT(*) FROM (
  SELECT kota FROM pelanggan
  UNION ALL
  SELECT kota FROM pelanggan WHERE kota IS NOT NULL
) x
WHERE kota IS NULL OR kota <> ''Padang'';','sql','["11","3","10"]'::jsonb,null,0,'UNION ALL mempertahankan duplikat, UNION menghapusnya; kota <> ''Padang'' bernilai UNKNOWN untuk NULL sehingga perlu IS NULL eksplisit. Hasil: 11.',null,'UNION vs UNION ALL; perbandingan dengan NULL tidak pernah true.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, kota, umur);

SELECT * FROM orang
WHERE kota > 30 AND negara > 30;','sql','["0","2","1"]'::jsonb,null,2,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'def f(N):
    if N <= 1: return 1
    return f(N - 1) + f(N - 1)','python','["O(n log n)","O(n·m)","O(2ⁿ)"]'::jsonb,null,2,'Kompleksitas: O(2ⁿ). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','output','Throughput maksimum (query/detik) yang bisa dilayani kolam ini?',null,'kolam_koneksi = 10
rata-rata_query = 50 ms, satu koneksi menangani satu query pada satu waktu','python','["200","20","500"]'::jsonb,null,0,'Tiap koneksi menyelesaikan 20 query/detik × 10 koneksi = 200 q/s.',null,'Satu koneksi menyelesaikan 1000/ms query per detik.',null),
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
    return v * 6
print(hitung(3))','python','["a | b | 17","a | b | 18","b | a | 18"]'::jsonb,null,1,'Dekorator ditumpuk dari bawah ke atas saat dibungkus, tetapi saat dipanggil lapisan paling luar (a) berjalan lebih dulu. Hasil: a | b | 18.',null,'Siapa pembungkus terluar?',null),
('backend','output','Berapa jumlah cache HIT pada cache LRU ini?',null,'kapasitas = 4
akses = ["F","E","B","E","F","F","F","E","A","B","B"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["6","8","7"]'::jsonb,null,2,'Simulasi LRU: hit=7, isi akhir (lama→baru) = F E A B. Pada FIFO hit tidak memperbarui urutan (hit=7).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 7; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. B: counter = tmpB + 1
4. B: tmpB = counter
5. B: counter = tmpB + 1
6. A: counter = tmpA + 1
7. A: tmpA = counter
8. A: counter = tmpA + 1','python','["11","9","10"]'::jsonb,null,1,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 9, bukan 11. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','output','Berapa p95 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [134,117,325,242,465,111,557,791,527,138,443,333,62,517]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["340","791","557"]'::jsonb,null,1,'N=14, rank=⌈95/100×14⌉=14 → 791 ms. Rata-rata (340) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Berapa request yang DITERIMA?',null,'# Token bucket: kapasitas 3 token, mulai penuh pada detik 0
# isi ulang 2 token/detik (kontinu, maksimum 3); tiap request memakai 1 token
waktu_request = [3,4,7,9,10,11,11,12,13,15,16]  # detik','python','["3","10","11"]'::jsonb,null,2,'Simulasi: token = min(3, token + Δt×2); request diterima jika token ≥ 1. Diterima 11 dari 11.',null,'Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.',null),
('backend','guess','Menurut standar SQL, anomali apa yang MASIH mungkin terjadi pada level REPEATABLE READ?',null,'SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;','sql','["dirty read, non-repeatable read, phantom read","non-repeatable read, phantom read","phantom read"]'::jsonb,null,2,'Standar SQL: READ UNCOMMITTED mengizinkan ketiganya; READ COMMITTED mencegah dirty read; REPEATABLE READ juga mencegah non-repeatable read; SERIALIZABLE mencegah semuanya. (Implementasi nyata, mis. PostgreSQL, bisa lebih ketat.)',null,'Semakin tinggi level, semakin sedikit anomali yang tersisa.',null),
('backend','output','Berapa query SQL yang dijalankan (200 post, 3 penulis berbeda)?',null,'posts = Post.objects.all()[:200]
for p in posts:
    print(p.penulis.nama)        # relasi ForeignKey, lazy','python','["2","1","201"]'::jsonb,null,2,'Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_A → LOCK tabel_C → COMMIT
T2: LOCK tabel_B → LOCK tabel_C → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan"]'::jsonb,null,1,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 20) (2, B, 30) (3, B, 20) (4, B, 10) (5, A, 30) (6, A, 40)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,0 | 2,0 | 3,-10 | 4,-10 | 5,10 | 6,10","1,0 | 2,10 | 3,-10 | 4,-10 | 5,20 | 6,10","1,10 | 2,-10 | 3,-10 | 4,0 | 5,10 | 6,0"]'::jsonb,null,0,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,0 | 3,-10 | 4,-10 | 5,10 | 6,10.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','output','Berapa p95 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [825,54,505,830,485,635,156,110,806,770,168,853,122,43]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["830","853","454"]'::jsonb,null,1,'N=14, rank=⌈95/100×14⌉=14 → 853 ms. Rata-rata (454) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Ayu, Padang) (2, Eka, Padang) (3, Dedi, Bandung) (4, Citra, Padang) (5, Budi, Padang) (6, Fajar, Padang)
-- pesanan(id, pelanggan_id, total, status)
(1, 3, 30, baru) (2, 4, 20, batal) (3, 1, 40, lunas) (4, 2, 40, baru) (5, NULL, 80, lunas) (6, 1, 30, lunas) (7, 1, 90, lunas)

SELECT COUNT(*) FROM (
  SELECT kota FROM pelanggan
  UNION ALL
  SELECT kota FROM pelanggan WHERE kota IS NOT NULL
) x
WHERE kota IS NULL OR kota <> ''Padang'';','sql','["1","2","3"]'::jsonb,null,1,'UNION ALL mempertahankan duplikat, UNION menghapusnya; kota <> ''Padang'' bernilai UNKNOWN untuk NULL sehingga perlu IS NULL eksplisit. Hasil: 2.',null,'UNION vs UNION ALL; perbandingan dengan NULL tidak pernah true.',null),
('backend','output','Berapa request yang DITERIMA?',null,'# Token bucket: kapasitas 4 token, mulai penuh pada detik 0
# isi ulang 2 token/detik (kontinu, maksimum 4); tiap request memakai 1 token
waktu_request = [1,2,2,3,3,3,5,6,6,9,11]  # detik','python','["10","4","11"]'::jsonb,null,2,'Simulasi: token = min(4, token + Δt×2); request diterima jika token ≥ 1. Diterima 11 dari 11.',null,'Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.',null),
('backend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan framework web sisi server?',null,'1. Spring Boot
2. Eloquent
3. Vite
4. Rails
5. Django','text','["1, 4, 5","1, 3, 4","1, 2, 4"]'::jsonb,null,0,'Spring Boot, Django, Rails adalah framework web sisi server; Vite dan Eloquent termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'data = sorted(N_item)
for x in data:
    proses(x)','python','["O(n log n)","O(2ⁿ)","O(n)"]'::jsonb,null,0,'Kompleksitas: O(n log n). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','guess','Menurut standar SQL, anomali apa yang MASIH mungkin terjadi pada level READ COMMITTED?',null,'SET TRANSACTION ISOLATION LEVEL READ COMMITTED;','sql','["non-repeatable read, phantom read","dirty read, non-repeatable read, phantom read","phantom read"]'::jsonb,null,0,'Standar SQL: READ UNCOMMITTED mengizinkan ketiganya; READ COMMITTED mencegah dirty read; REPEATABLE READ juga mencegah non-repeatable read; SERIALIZABLE mencegah semuanya. (Implementasi nyata, mis. PostgreSQL, bisa lebih ketat.)',null,'Semakin tinggi level, semakin sedikit anomali yang tersisa.',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 9; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. B: tmpB = counter
3. A: counter = tmpA + 1
4. B: counter = tmpB + 1
5. A: tmpA = counter
6. B: tmpB = counter
7. B: counter = tmpB + 1
8. A: counter = tmpA + 1','python','["11","12","13"]'::jsonb,null,0,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 11, bukan 13. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'process.nextTick(() => { console.log("G"); Promise.resolve().then(() => console.log("C")); });
queueMicrotask(() => console.log("E"));
process.nextTick(() => { console.log("B"); Promise.resolve().then(() => console.log("undefined")); });
queueMicrotask(() => console.log("undefined"));
queueMicrotask(() => console.log("undefined"));','javascript','["G C E B","G B E undefined undefined C undefined","B C E G undefined undefined undefined"]'::jsonb,null,1,'Urutan: G B E undefined undefined C undefined. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, B, 10) (2, A, 30) (3, B, 20) (4, A, 50) (5, B, 10) (6, A, 20) (7, B, 20) (8, A, 50)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,0 | 2,0 | 3,10 | 4,20 | 5,-10 | 6,-30 | 7,10 | 8,30","1,0 | 2,20 | 3,-10 | 4,30 | 5,-40 | 6,10 | 7,0 | 8,30","1,10 | 2,20 | 3,-10 | 4,-30 | 5,10 | 6,30 | 7,0 | 8,0"]'::jsonb,null,0,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,0 | 3,10 | 4,20 | 5,-10 | 6,-30 | 7,10 | 8,30.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','output','Throughput maksimum (query/detik) yang bisa dilayani kolam ini?',null,'kolam_koneksi = 50
rata-rata_query = 20 ms, satu koneksi menangani satu query pada satu waktu','python','["1000","250","2500"]'::jsonb,null,2,'Tiap koneksi menyelesaikan 50 query/detik × 50 koneksi = 2500 q/s.',null,'Satu koneksi menyelesaikan 1000/ms query per detik.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_C → LOCK tabel_B → LOCK tabel_A → COMMIT
T2: LOCK tabel_B → LOCK tabel_C → LOCK tabel_A → COMMIT
T3: LOCK tabel_A → LOCK tabel_B → LOCK tabel_C → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_B → tabel_A","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten"]'::jsonb,null,0,'Graf urutan kunci memuat siklus tabel_A → tabel_B → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','output','Berapa hasil query hierarki ini?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 2) (4, 1) (5, 3)

WITH RECURSIVE r(id, d) AS (
  SELECT id, 0 FROM staf WHERE atasan IS NULL
  UNION ALL
  SELECT s.id, r.d + 1 FROM staf s JOIN r ON s.atasan = r.id
)
SELECT MAX(d) FROM r;','sql','["4","3","5"]'::jsonb,null,1,'Kedalaman pohon (akar = 0) dihitung rekursif; hasil maksimum 3.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Berapa query SQL yang dijalankan (200 post, 4 penulis berbeda)?',null,'posts = Post.objects.prefetch_related("penulis")[:200]
for p in posts:
    print(p.penulis.nama)','python','["1","201","2"]'::jsonb,null,2,'prefetch_related memakai query kedua dengan WHERE id IN (...): total 2 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, kota, umur);

SELECT * FROM orang
WHERE kota = ''x'' AND umur = ''x'';','sql','["0","1","2"]'::jsonb,null,0,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 0.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~3.0.3" }
// versi yang tersedia di registry:
3.0.3  3.0.5  3.1.0  4.1.3  4.1.5  4.2.4','json','["3.0.5","4.2.4","3.1.0"]'::jsonb,null,0,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 3.0.5.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 2 f.txt menjadi "fitur"
main: mengubah g.txt (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Apa output kode Python ini?',null,'print(round(4.5), round(0.5), round(-0.5), 5.0 // 2, -5 // 2, -5 % 3, divmod(-5, 3))','python','["4 2 0 2.0 -3 1 (-2, 1)","4 0 0 2.0 -3 1 (-2, 1)","4 0 0 1.0 -3 1 (-2, 1)"]'::jsonb,null,1,'round() memakai pembulatan bankir (setengah ke genap); // adalah floor division sehingga hasil negatif dibulatkan ke bawah; % mengikuti tanda pembagi. Hasil: 4 0 0 2.0 -3 1 (-2, 1).',null,'Pembulatan .5 ke genap; // membulatkan ke -∞.',null),
('backend','output','Berapa jumlah cache HIT pada cache LRU ini?',null,'kapasitas = 3
akses = ["F","A","E","F","C","E","B","B","F","E","C","E"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["4","6","5"]'::jsonb,null,2,'Simulasi LRU: hit=5, isi akhir (lama→baru) = F C E. Pada FIFO hit tidak memperbarui urutan (hit=4).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 7 percobaan ulang
base = 100 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(1000, base * 2**i)   # i = 0, 1, 2, …','python','["4500","5500","12700"]'::jsonb,null,0,'Jeda: 100, 200, 400, 800, 1000, 1000, 1000 ms → total 4500 ms (cap 1000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','output','Berapa request yang DITERIMA?',null,'# Token bucket: kapasitas 5 token, mulai penuh pada detik 0
# isi ulang 2 token/detik (kontinu, maksimum 5); tiap request memakai 1 token
waktu_request = [3,4,4,7,8,9,12,12,12,15]  # detik','python','["10","5","9"]'::jsonb,null,0,'Simulasi: token = min(5, token + Δt×2); request diterima jika token ≥ 1. Diterima 10 dari 10.',null,'Hitung token tersisa di tiap request, termasuk isi ulang sejak request sebelumnya.',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 4 percobaan ulang
base = 500 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(2000, base * 2**i)   # i = 0, 1, 2, …','python','["5000","7500","5500"]'::jsonb,null,2,'Jeda: 500, 1000, 2000, 2000 ms → total 5500 ms (cap 2000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','output','Berapa p99 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [574,593,625,875,893,792,764,740,130,687]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["875","893","667"]'::jsonb,null,1,'N=10, rank=⌈99/100×10⌉=10 → 893 ms. Rata-rata (667) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Berapa saldo akhir?',null,'-- saldo awal = 750, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 750
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 750
T1: UPDATE akun SET saldo = x + 20 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 80 WHERE id = 1; COMMIT;','sql','["770","830","850"]'::jsonb,null,1,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 750+80, sehingga tambahan 20 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('backend','output','Apa output kode Python ini?',null,'def tambah(x, keranjang=[]):
    keranjang.append(x)
    return len(keranjang)

print(tambah(4), tambah(5), tambah(6, []), tambah(7))','python','["1 2 11 3","1 2 1 3","1 4 1 3"]'::jsonb,null,1,'Nilai default dievaluasi SEKALI saat fungsi didefinisikan, jadi list default dipakai bersama antar panggilan; list yang dikirim eksplisit tidak ikut. Hasil: 1 2 1 3.',null,'Kapan nilai default dievaluasi?',null),
('backend','output','Berapa hasil query penelusuran ke atas dari pegawai 5?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 2) (4, 1) (5, 1) (6, 1) (7, 1)

WITH RECURSIVE naik(id) AS (
  SELECT 5
  UNION ALL
  SELECT s.atasan FROM staf s JOIN naik ON s.id = naik.id WHERE s.atasan IS NOT NULL
)
SELECT COUNT(*) FROM naik;','sql','["2","5","1"]'::jsonb,null,0,'Penelusuran naik menyertakan titik awal dan seluruh atasan hingga akar: 2 baris.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_A → LOCK tabel_C → LOCK tabel_B → COMMIT
T2: LOCK tabel_B → LOCK tabel_C → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mungkin: urutan penguncian membentuk siklus tabel_C → tabel_B → tabel_C"]'::jsonb,null,2,'Graf urutan kunci memuat siklus tabel_C → tabel_B → tabel_C: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~1.4.1" }
// versi yang tersedia di registry:
1.4.1  1.4.2  1.4.4  1.5.0  1.5.2  1.6.3  2.4.2  2.5.1','json','["1.6.3","1.4.4","2.5.1"]'::jsonb,null,1,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 1.4.4.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'Promise.resolve().then(() => console.log("A"));
process.nextTick(() => console.log("D"));
process.nextTick(() => console.log("E"));
Promise.resolve().then(() => console.log("undefined"));','javascript','["D E A undefined","A D E undefined","A D E"]'::jsonb,null,0,'Urutan: D E A undefined. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 40) (2, A, 50) (3, B, 50) (4, B, 40) (5, B, 40) (6, A, 10)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,10 | 2,-40 | 3,-10 | 4,0 | 5,0 | 6,0","1,0 | 2,10 | 3,0 | 4,-10 | 5,0 | 6,-40","1,0 | 2,10 | 3,0 | 4,-10 | 5,0 | 6,-30"]'::jsonb,null,1,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,10 | 3,0 | 4,-10 | 5,0 | 6,-40.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'while jumlah > 0:
    jumlah //= 10','python','["O(log n)","O(n)","O(2ⁿ)"]'::jsonb,null,0,'Kompleksitas: O(log n). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 8 f.txt menjadi "fitur"
main: mengubah baris 3 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual","Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru"]'::jsonb,null,1,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Berapa query SQL yang dijalankan (20 post, 3 penulis berbeda)?',null,'posts = Post.objects.all()[:20]
for p in posts:
    print(p.penulis.nama)        # relasi ForeignKey, lazy','python','["21","2","1"]'::jsonb,null,0,'Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Ayu, Medan) (2, Budi, Bandung) (3, Hana, Medan) (4, Gita, NULL) (5, Dedi, NULL)
-- pesanan(id, pelanggan_id, total, status)
(1, 2, 20, lunas) (2, 2, 60, lunas) (3, 2, 40, lunas) (4, 4, 20, lunas) (5, NULL, 20, batal) (6, NULL, 60, lunas) (7, 3, 80, baru)

SELECT COUNT(*), COUNT(o.id), COUNT(DISTINCT p.id)
FROM pelanggan p LEFT JOIN pesanan o ON o.pelanggan_id = p.id;','sql','["7,7,5","5,7,5","7,5,5"]'::jsonb,null,2,'COUNT(*) menghitung semua baris hasil join (satu pelanggan tampil sebanyak pesanannya, atau sekali bila tak punya), COUNT(kolom) melewati NULL, COUNT(DISTINCT) menghilangkan duplikat. Hasil: 7,5,5.',null,'Mana yang melewati NULL?',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (umur, negara, kota);

SELECT * FROM orang
WHERE kota = ''x'' AND negara = ''x'';','sql','["0","2","1"]'::jsonb,null,0,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 0.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','guess','Dari daftar ini, nomor mana yang BUKAN basis data relasional?',null,'1. SQL Server
2. Hibernate
3. PostgreSQL
4. MySQL
5. Jotai','text','["2 dan 4 dan 5","2 dan 5","1 dan 4 dan 5"]'::jsonb,null,1,'Hibernate dan Jotai termasuk kategori lain; SQL Server, PostgreSQL, MySQL adalah basis data relasional.',null,'Cari dua yang berasal dari kategori berbeda.',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 7; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. B: tmpB = counter
2. A: tmpA = counter
3. A: counter = tmpA + 1
4. B: counter = tmpB + 1
5. A: tmpA = counter
6. A: counter = tmpA + 1
7. B: tmpB = counter
8. B: counter = tmpB + 1','python','["9","10","11"]'::jsonb,null,1,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 10, bukan 11. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','output','Rata-rata request yang sedang diproses bersamaan (in-flight)?',null,'# hukum Little: L = λ × W
λ = 800 request/detik
W = 120 ms rata-rata per request','python','["6.67","96","96000"]'::jsonb,null,1,'L = 800 × 0.12 s = 96.',null,'Samakan satuan waktu dulu: ms → detik.',null),
('backend','output','Berapa jumlah cache HIT pada cache LRU ini?',null,'kapasitas = 3
akses = ["D","B","A","E","B","F","F","B","A","D"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["3","4","2"]'::jsonb,null,0,'Simulasi LRU: hit=3, isi akhir (lama→baru) = B A D. Pada FIFO hit tidak memperbarui urutan (hit=2).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','guess','Anomali konkurensi apa yang terjadi pada jadwal ini?',null,'T1: SELECT saldo FROM akun WHERE id = 1;     -- 100
T2: UPDATE akun SET saldo = 70 WHERE id = 1; COMMIT;
T1: SELECT saldo FROM akun WHERE id = 1;     -- 70','sql','["non-repeatable read","dirty read","lost update"]'::jsonb,null,0,'Baris yang sama dibaca dua kali dalam satu transaksi dengan nilai berbeda.',null,'Apa yang berubah di antara dua langkah baca, atau apa yang dibaca sebelum commit?',null),
('backend','output','Urutan output kode Node.js (CommonJS) ini?',null,'queueMicrotask(() => console.log("G"));
Promise.resolve().then(() => console.log("A"));
queueMicrotask(() => console.log("D"));
process.nextTick(() => { console.log("undefined"); Promise.resolve().then(() => console.log("undefined")); });
console.log("undefined");','javascript','["undefined undefined G A D undefined","G A D","A D G undefined undefined undefined"]'::jsonb,null,0,'Urutan: undefined undefined G A D undefined. Setelah kode sinkron selesai, Node mengosongkan antrean process.nextTick SEBELUM antrean microtask Promise, dan memeriksa nextTick lagi setelah tiap giliran.',null,'Antrean mana yang dikuras lebih dulu setelah kode sinkron: nextTick atau Promise?',null),
('backend','output','Total waktu tunggu (ms) di antara semua percobaan ulang sebelum menyerah?',null,'# percobaan pertama langsung; lalu 7 percobaan ulang
base = 250 ms, faktor = 2 (tanpa jitter)
delay_ke_i = min(1000, base * 2**i)   # i = 0, 1, 2, …','python','["5750","31750","6750"]'::jsonb,null,0,'Jeda: 250, 500, 1000, 1000, 1000, 1000, 1000 ms → total 5750 ms (cap 1000 memangkas jeda besar).',null,'Hitung setiap jeda dengan cap, lalu jumlahkan.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "^3.2.4" }
// versi yang tersedia di registry:
3.2.4  3.2.5  3.4.7  4.2.5  4.2.7  4.3.4','json','["3.2.5","3.4.7","4.3.4"]'::jsonb,null,1,'Caret mengizinkan perubahan selama digit bukan-nol paling kiri tidak berubah (untuk 0.x.y: hanya patch pada 0.y, dan terkunci pada 0.0.z). Tertinggi yang memenuhi: 3.4.7.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
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
    return v * 2
print(hitung(4))','python','["a | b | 8","a | 8 | b","b | a | 8"]'::jsonb,null,0,'Dekorator ditumpuk dari bawah ke atas saat dibungkus, tetapi saat dipanggil lapisan paling luar (a) berjalan lebih dulu. Hasil: a | b | 8.',null,'Siapa pembungkus terluar?',null),
('backend','output','Berapa jumlah cache HIT pada cache LRU ini?',null,'kapasitas = 3
akses = ["F","C","E","E","A","A","A","E","C","C","E","D"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["7","6","8"]'::jsonb,null,0,'Simulasi LRU: hit=7, isi akhir (lama→baru) = C E D. Pada FIFO hit tidak memperbarui urutan (hit=7).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','output','Berapa hasil query hierarki ini?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 1) (4, 3) (5, 2) (6, 5)

WITH RECURSIVE r(id, d) AS (
  SELECT id, 0 FROM staf WHERE atasan IS NULL
  UNION ALL
  SELECT s.id, r.d + 1 FROM staf s JOIN r ON s.atasan = r.id
)
SELECT MAX(d) FROM r;','sql','["3","4","6"]'::jsonb,null,0,'Kedalaman pohon (akar = 0) dihitung rekursif; hasil maksimum 3.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Berapa p50 latensi (ms) dengan metode nearest-rank?',null,'latensi_ms = [636,773,350,780,156,262,754,507,591,785,749,786,278,391,122]
# nearest-rank: urutkan naik, ambil elemen ke-ceil(p/100 × N) (indeks mulai 1)','python','["591","636","528"]'::jsonb,null,0,'N=15, rank=⌈50/100×15⌉=8 → 591 ms. Rata-rata (528) menyembunyikan ekor latensi.',null,'Urutkan dulu, lalu hitung peringkat dengan pembulatan ke atas.',null),
('backend','output','Apa hasil query ini?',null,'-- pelanggan(id, nama, kota)
(1, Ayu, Bandung) (2, Eka, Padang) (3, Fajar, Bandung) (4, Gita, NULL) (5, Hana, Medan) (6, Dedi, Bandung)
-- pesanan(id, pelanggan_id, total, status)
(1, 5, 70, baru) (2, 4, 60, lunas) (3, 2, 80, lunas) (4, 4, 50, baru) (5, 2, 60, lunas) (6, 4, 30, batal) (7, 3, 80, baru) (8, 1, 50, lunas) (9, 5, 70, lunas)

SELECT kota, COUNT(*) AS n FROM pelanggan
GROUP BY kota
HAVING COUNT(*) >= 1
ORDER BY n DESC, kota;','sql','["Bandung,3","Bandung,3 | Medan,1 | Padang,1","Bandung,3 | NULL,1 | Medan,1 | Padang,1"]'::jsonb,null,2,'GROUP BY menganggap semua NULL sebagai satu grup; COUNT(*) menghitungnya, COUNT(kota) tidak. Hasil: Bandung,3 | NULL,1 | Medan,1 | Padang,1.',null,'Apakah NULL membentuk grup sendiri?',null),
('backend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan reverse proxy/web server?',null,'1. PostgreSQL
2. Apache HTTP Server
3. Traefik
4. RabbitMQ
5. Nginx','text','["2, 3, 5","1, 2, 3","2, 4, 5"]'::jsonb,null,0,'Nginx, Apache HTTP Server, Traefik adalah reverse proxy/web server; PostgreSQL dan RabbitMQ termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('backend','output','Berapa request yang diterima oleh FIXED WINDOW (jendela [0,5), [5,10), …)?',null,'# batas 3 request per 5 detik
waktu_request = [3,4,4,6,7,9,10,10,13,16]  # detik','python','["10","7","11"]'::jsonb,null,0,'Fixed window mereset hitungan pada batas kelipatan 5 detik (menerima 10); sliding window menimbang 5 detik terakhir (menerima 7). Fixed window dapat meloloskan 2×3 request di sekitar batas jendela.',null,'Reset terjadi pada kelipatan tetap, bukan relatif terhadap tiap request.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (negara, umur, kota);

SELECT * FROM orang
WHERE kota = ''x'' AND umur = ''x'';','sql','["2","0","1"]'::jsonb,null,1,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 0.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','guess','Kompleksitas waktu terburuk kode ini terhadap ukuran input?',null,'hasil = []
for i in range(jumlah):
    hasil.insert(0, i)','python','["O(log n)","O(1)","O(n²)"]'::jsonb,null,2,'Kompleksitas: O(n²). Hitung berapa kali operasi inti berjalan terhadap n (loop yang menggandakan variabel = log n; loop bersarang saling bebas = perkalian).',null,'Berapa kali badan terdalam dijalankan sebagai fungsi n?',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_A → LOCK tabel_B → COMMIT
T2: LOCK tabel_C → LOCK tabel_A → LOCK tabel_B → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock pasti terjadi pada setiap eksekusi karena transaksi berjalan bersamaan","Deadlock mungkin: tabel_A → tabel_B → tabel_A dapat saling menunggu bila transaksi bersilangan","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten"]'::jsonb,null,2,'Semua transaksi mengunci dengan urutan yang konsisten (tak ada siklus pada graf urutan kunci), sehingga tak ada transaksi yang memegang kunci yang diminta pihak lain sambil menunggunya.',null,'Gambar panah antar kunci; adakah siklus?',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 10) (2, A, 30) (3, B, 40) (4, A, 50) (5, B, 40) (6, A, 30)

SELECT id, nilai - LAG(nilai, 1, nilai) OVER (PARTITION BY grup ORDER BY id) AS d FROM skor ORDER BY id;','sql','["1,0 | 2,20 | 3,0 | 4,20 | 5,0 | 6,-20","1,0 | 2,20 | 3,10 | 4,10 | 5,-10 | 6,-10","1,20 | 2,20 | 3,0 | 4,-20 | 5,0 | 6,0"]'::jsonb,null,0,'LAG mengambil nilai baris sebelumnya DALAM partisi; argumen ketiga adalah nilai default pada baris pertama. Hasil: 1,0 | 2,20 | 3,0 | 4,20 | 5,0 | 6,-20.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','output','Berapa query SQL yang dijalankan (20 post, 5 penulis berbeda)?',null,'posts = Post.objects.all()[:20]
for p in posts:
    print(p.penulis.nama)        # relasi ForeignKey, lazy','python','["21","1","2"]'::jsonb,null,0,'Lazy loading memicu satu query penulis per objek post (ORM tidak men-cache antar post berbeda): 1 + N.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 8 f.txt menjadi "fitur"
main: mengubah baris 6 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Merge otomatis berhasil dan membuat merge commit baru","Fast-forward: tidak ada merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,0,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: Merge otomatis berhasil dan membuat merge commit baru.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','output','Berapa nilai akhir counter?',null,'# counter awal = 0; tiap worker menjalankan dua kali: tmp = counter  lalu  counter = tmp + 1
# langkah berurutan (interleaving thread):
1. A: tmpA = counter
2. A: counter = tmpA + 1
3. B: tmpB = counter
4. A: tmpA = counter
5. B: counter = tmpB + 1
6. A: counter = tmpA + 1
7. B: tmpB = counter
8. B: counter = tmpB + 1','python','["3","2","4"]'::jsonb,null,0,'Setiap penulisan memakai nilai yang dibaca SEBELUMNYA, sehingga pembaruan yang selang-seling saling menimpa. Hasil 3, bukan 4. Gunakan lock atau operasi atomik.',null,'Telusuri langkah demi langkah dan catat tmpA, tmpB, dan counter.',null),
('backend','output','Throughput maksimum (query/detik) yang bisa dilayani kolam ini?',null,'kolam_koneksi = 40
rata-rata_query = 25 ms, satu koneksi menangani satu query pada satu waktu','python','["1000","1600","160"]'::jsonb,null,1,'Tiap koneksi menyelesaikan 40 query/detik × 40 koneksi = 1600 q/s.',null,'Satu koneksi menyelesaikan 1000/ms query per detik.',null),
('backend','output','Berapa saldo akhir?',null,'-- saldo awal = 130, READ COMMITTED, tanpa locking
T1: x = SELECT saldo FROM akun WHERE id = 1;       -- 130
T2: y = SELECT saldo FROM akun WHERE id = 1;       -- 130
T1: UPDATE akun SET saldo = x + 70 WHERE id = 1; COMMIT;
T2: UPDATE akun SET saldo = y + 90 WHERE id = 1; COMMIT;','sql','["200","220","290"]'::jsonb,null,1,'Pola baca-ubah-tulis di aplikasi: T2 menimpa dengan 130+90, sehingga tambahan 70 dari T1 hilang (lost update). Perbaikan: UPDATE saldo = saldo + n atau SELECT ... FOR UPDATE.',null,'T2 menulis berdasarkan nilai yang dibacanya, bukan nilai terbaru.',null),
('backend','guess','Apa hasil git merge?',null,'# f.txt berisi baris1 … baris9
fitur: mengubah baris 3 f.txt menjadi "fitur"
main: mengubah baris 2 f.txt menjadi "utama" (commit baru)

$ git checkout main
$ git merge fitur','bash','["Fast-forward: tidak ada merge commit baru","Merge otomatis berhasil dan membuat merge commit baru","CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual"]'::jsonb,null,2,'Git menggabungkan per-hunk (tiga arah). Konflik terjadi jika kedua sisi mengubah baris yang sama atau BERSEBELAHAN secara berbeda. Perubahan identik tidak konflik; tanpa commit baru di main hasilnya fast-forward. Diverifikasi dengan repositori nyata: CONFLICT: Git berhenti dan menandai file f.txt untuk diselesaikan manual.',null,'Dua perubahan pada baris yang berdekatan (selisih ≤ 1) dianggap bertumpukan.',null),
('backend','guess','Berapa kolom awal indeks yang bisa dipakai untuk mencari (seek) pada query ini?',null,'CREATE INDEX idx ON orang (umur, kota, negara);

SELECT * FROM orang
WHERE umur > 30 AND kota = ''x'' AND negara > 30;','sql','["3","2","1"]'::jsonb,null,2,'Aturan prefiks kiri: kolom dipakai berurutan dari kiri selama berupa kesamaan; kolom pertama dengan rentang masih terpakai tetapi memutus kolom sesudahnya; kolom yang dilewati memutus semuanya. Terpakai: 1.',null,'Indeks (a,b,c) memakai kolom dari kiri tanpa lompat; rentang menghentikan kolom berikutnya.',null),
('backend','guess','Versi mana yang akan terpasang saat npm install (versi tertinggi yang memenuhi rentang)?',null,'"dependencies": { "pustaka": "~0.0.1" }
// versi yang tersedia di registry:
0.0.1  0.0.2  0.2.2  0.2.3  0.2.4  1.1.1  1.1.3  1.2.1','json','["1.2.1","0.0.2","0.0.1"]'::jsonb,null,1,'Tilde mengizinkan hanya perubahan patch (minor tetap). Tertinggi yang memenuhi: 0.0.2.',null,'Cari digit bukan-nol paling kiri; ia terkunci pada caret.',null),
('backend','guess','Pernyataan mana yang benar tentang jadwal ini?',null,'T1: LOCK tabel_A → LOCK tabel_B → COMMIT
T2: LOCK tabel_B → LOCK tabel_A → COMMIT
T3: LOCK tabel_C → LOCK tabel_B → LOCK tabel_A → COMMIT
-- kunci dilepas saat COMMIT; transaksi berjalan bersamaan dan boleh saling menyela','sql','["Deadlock tidak mungkin karena kunci otomatis dilepas begitu transaksi lain butuh","Deadlock mustahil: semua transaksi mengunci tabel dalam urutan global yang konsisten","Deadlock mungkin: urutan penguncian membentuk siklus tabel_A → tabel_B → tabel_A"]'::jsonb,null,2,'Graf urutan kunci memuat siklus tabel_A → tabel_B → tabel_A: transaksi yang memegang satu tabel dan menunggu tabel berikutnya dapat saling menunggu. Perbaikan: samakan urutan penguncian.',null,'Gambar panah dari kunci yang dipegang ke kunci yang diminta berikutnya; adakah siklus?',null),
('backend','output','Apa output kode Python ini?',null,'print(round(3.5), round(4.5), round(-0.5), 2.0 // 2, -2 // 2, -2 % 3, divmod(-2, 3))','python','["4 4 0 1.0 -1 1 (-1, 1)","4 4 0 1.0 -1 1 (-1, 11)","5 4 0 1.0 -1 1 (-1, 1)"]'::jsonb,null,0,'round() memakai pembulatan bankir (setengah ke genap); // adalah floor division sehingga hasil negatif dibulatkan ke bawah; % mengikuti tanda pembagi. Hasil: 4 4 0 1.0 -1 1 (-1, 1).',null,'Pembulatan .5 ke genap; // membulatkan ke -∞.',null),
('backend','output','Berapa jumlah cache HIT pada cache LRU ini?',null,'kapasitas = 4
akses = ["D","E","D","D","E","B","A","C","E","A"]
# cache LRU: hit memperbarui kesegaran; saat penuh, buang yang paling lama tidak dipakai','python','["5","4","6"]'::jsonb,null,0,'Simulasi LRU: hit=5, isi akhir (lama→baru) = B C E A. Pada FIFO hit tidak memperbarui urutan (hit=5).',null,'Setiap hit memindahkan kunci ke posisi ''paling baru''.',null),
('backend','output','Berapa query SQL yang dijalankan (50 post, 4 penulis berbeda)?',null,'posts = Post.objects.select_related("penulis")[:50]
for p in posts:
    print(p.penulis.nama)','python','["51","1","2"]'::jsonb,null,1,'select_related melakukan JOIN sehingga semuanya dalam 1 query.',null,'Berapa query untuk daftar, dan berapa untuk relasinya?',null),
('backend','output','Apa hasil query ini (id,nilai per baris, dipisah |)?',null,'-- skor(id, grup, nilai)
(1, A, 30) (2, A, 30) (3, B, 10) (4, A, 40) (5, A, 10) (6, A, 30)

SELECT id, SUM(nilai) OVER (ORDER BY id) AS s FROM skor ORDER BY id;','sql','["1,30 | 2,60 | 3,10 | 4,100 | 5,110 | 6,140","1,30 | 2,60 | 3,70 | 4,110 | 5,120 | 6,150","1,150 | 2,150 | 3,150 | 4,150 | 5,150 | 6,150"]'::jsonb,null,1,'SUM() OVER (ORDER BY id) adalah jumlah kumulatif (frame default: awal sampai baris saat ini, termasuk seri pada kunci urut). Hasil: 1,30 | 2,60 | 3,70 | 4,110 | 5,120 | 6,150.',null,'Perhatikan PARTITION BY dan perlakuan seri pada ORDER BY.',null),
('backend','guess','Manakah kombinasi nomor yang SEMUANYA merupakan basis data relasional?',null,'1. PostgreSQL
2. PostCSS
3. SQL Server
4. Webpack
5. MariaDB','text','["2, 3, 4","2, 4, 5","1, 3, 5"]'::jsonb,null,2,'SQL Server, MariaDB, PostgreSQL adalah basis data relasional; PostCSS dan Webpack termasuk kategori lain.',null,'Kategorinya spesifik, bukan sekadar ''frontend'' atau ''backend''.',null),
('backend','output','Berapa hasil query hierarki ini?',null,'-- staf(id, atasan)
(1, NULL) (2, 1) (3, 2) (4, 1) (5, 4) (6, 5)

WITH RECURSIVE r(id, d) AS (
  SELECT id, 0 FROM staf WHERE atasan IS NULL
  UNION ALL
  SELECT s.id, r.d + 1 FROM staf s JOIN r ON s.atasan = r.id
)
SELECT MAX(d) FROM r;','sql','["6","4","3"]'::jsonb,null,2,'Kedalaman pohon (akar = 0) dihitung rekursif; hasil maksimum 3.',null,'Bangun pohonnya di kertas; CTE rekursif berhenti saat tak ada baris baru.',null),
('backend','output','Throughput maksimum (query/detik) yang bisa dilayani kolam ini?',null,'kolam_koneksi = 100
rata-rata_query = 50 ms, satu koneksi menangani satu query pada satu waktu','python','["2000","5000","200"]'::jsonb,null,0,'Tiap koneksi menyelesaikan 20 query/detik × 100 koneksi = 2000 q/s.',null,'Satu koneksi menyelesaikan 1000/ms query per detik.',null);
