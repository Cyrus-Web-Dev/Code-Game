# Kode Tebak

Game tebak bahasa pemrograman dan framework dari potongan kode, dalam Bahasa Indonesia atau Inggris.
Next.js 14 (App Router) + TypeScript + Tailwind + Framer Motion + Three.js (react-three-fiber, drei) + Zustand + Shiki + Supabase (PostgreSQL).

## Fitur (v1.1)
- Menu awal + **onboarding tutorial** interaktif untuk pemain baru.
- Login (nama pengguna + kata sandi, hash **Argon2id**, **rate-limited**) dan register. Gelar awal otomatis.
- 5 tingkat (Easy–Hell), poin 10/20/50/100/150, timer 30 detik, hint harian, mode **Biasa / Maraton 100 / Speedrun 15 dtk**.
- **Daily Challenge** sekali per hari + **streak** beruntun.
- **Achievement** system (First Blood, Perfect 10, Speed Demon, dll).
- **Review soal salah** — pelajari kembali jawaban yang meleset.
- **Share hasil** ke clipboard / native share.
- **SFX** ringan (benar/salah/tick/level-up) via Web Audio.
- 1.500 soal bilingual, leaderboard realtime, profil + lencana + PDF, ensiklopedia 187 bahasa, feedback.
- UI dipoles: skeleton loading, animasi feedback, progress dots, option buttons berlabel A/B/C.

## 1. Siapkan Supabase
1. Buat project di https://supabase.com.
2. Buka **SQL Editor**, jalankan berurutan:
   `supabase/schema.sql`, lalu `supabase/seed/1-easy.sql`, `2-normal.sql`, `3-hard.sql`, `4-extreme.sql`, `5-hell.sql`.
3. Salin kunci dari **Project Settings > API**: URL, `anon` key, dan `service_role` key.

> Skema ini baru dan tidak kompatibel dengan versi lama (yang memakai Supabase Auth). Pakai project Supabase baru atau hapus tabel lama.

## 2. Jalankan lokal
```bash
cp .env.example .env.local   # isi semua nilai (SESSION_SECRET: openssl rand -base64 48)
npm install
npm run dev                  # http://localhost:3000
```
`npm install` membuat `package-lock.json`; ikut di-commit supaya build Vercel konsisten.

## 3. Upload ke GitHub (repo publik)
```bash
git init && git add . && git commit -m "Kode Tebak"
git branch -M main
git remote add origin https://github.com/USERNAME/kode-tebak.git
git push -u origin main
```
`.gitignore` sudah mengecualikan `.env*` (kecuali `.env.example`), `node_modules`, dan `.next`. **Jangan pernah meng-commit `SUPABASE_SERVICE_ROLE_KEY` atau `SESSION_SECRET`.** Sebelum push, jalankan `git status` dan pastikan tidak ada file `.env.local`.

## 4. Deploy ke Vercel
1. https://vercel.com/new, impor repo GitHub tadi (framework Next.js terdeteksi otomatis).
2. Isi **Environment Variables**: `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`, `SUPABASE_SERVICE_ROLE_KEY`, `SESSION_SECRET`. Opsional untuk email saran: `RESEND_API_KEY`, `FEEDBACK_TO_EMAIL`, `FEEDBACK_FROM`.
3. Deploy. Setiap `git push` ke `main` otomatis deploy ulang.

## Keamanan
- Password disimpan sebagai hash Argon2id (`@node-rs/argon2`, parameter OWASP) di tabel `credentials` yang tertutup untuk anon key.
- Sesi memakai cookie `httpOnly` bertanda tangan (JWT HS256, 30 hari).
- Semua tulis ke database lewat server dengan service role. Anon key hanya bisa membaca data leaderboard.
- Kunci jawaban tidak dikirim ke browser dan waktu soal dicek di server.
- Rate limit login (10 percobaan / 15 menit per IP, in-memory). Belum ada reset password (akun tanpa email). Untuk skala besar, tambahkan Upstash Ratelimit atau Vercel Firewall.

## Mengelola soal dan katalog
- `scripts/catalog.mjs`: daftar bahasa/framework (sumber tunggal untuk soal dan halaman Info). `scripts/notes-en.mjs`: deskripsi Inggrisnya.
- `npm run gen:questions [jumlah_per_tingkat]` membuat ulang `supabase/seed/*.sql` dan `src/data/languages.json`. Kosongkan tabel `questions` sebelum mengimpor ulang.

## Catatan
- `next.config.mjs` memakai `ignoreBuildErrors` dan `ignoreDuringBuilds` agar deploy pertama tidak terhenti. Setelah `npm run build` lokal bersih, ubah ke `false`.
- Kode contoh bahasa langka (Eiffel, Simula, RPG, bahasa esoterik, dan lainnya) ditulis dari referensi dasar dan belum dijalankan di interpreternya. Minta penutur bahasa itu memeriksanya.
- Nama variabel di dalam kode soal (mis. `jumlah`, `saldo`) tetap Indonesia pada mode Inggris; hanya teks soalnya yang diterjemahkan.

## v1.2: gelar, UI, dan akun demo
- **Lencana gelar** dibuat ulang (`src/lib/badge-svg.ts`): sayap berbulu per tingkat, mahkota untuk gelar legendaris, cincin teks, kilau, dan efek khas tiap tingkat (Easy: simbol kode melayang; Normal: hujan biner dan sirkuit; Hard: bintang mengorbit dan petir; Extreme: kabut, gigi roda, dan retakan layar; Hell: sinar emas, gelombang kejut, bara api, dan glitch). Semua gelar, **termasuk yang masih terkunci**, tampil penuh warna dan beranimasi; yang terkunci hanya diberi label dan bilah progres. Arahkan kursor ke lencana untuk mempercepat animasi dan memunculkan confetti.
- Halaman **Gelar** (koleksi), **Permainan** (kartu tingkat dengan lencana dan progres), **Profil** (hero, progres ke gelar standar/legendaris, pencapaian), dan **Peringkat** (podium + lencana tiap pemain) didesain ulang.
- `prefers-reduced-motion` dihormati: animasi lencana berhenti otomatis.

### Akun demo (contoh nyata untuk promosi)
1. Jalankan `supabase/schema.sql` dan semua `supabase/seed/*.sql` (bank soal harus lengkap, 300 soal per tingkat).
2. Jalankan `supabase/demo-account.sql` di SQL Editor.
3. Masuk dengan nama pengguna `sepuh_demo`, kata sandi `KodeTebak-Demo-0x00`.

Akun ini sudah "menyelesaikan" seluruh soal di semua tingkat (akurasi 90%), semua gelar terbuka, dan SEPUH CODING aktif. Datanya dibuat otomatis oleh SQL, **bukan hasil bermain sungguhan**, sehingga akun ditandai **DEMO** di profil dan leaderboard. Jangan menyajikannya sebagai pemain asli. Untuk kata sandi atau nama lain: `python3 scripts/make-demo-sql.py "kata_sandi" nama_pengguna` (butuh paket Python `cryptography`), lalu jalankan ulang SQL-nya. Karena kata sandi demo tercantum di README publik, ganti bila akun ini dipakai di produksi.

## v1.3: optimasi kuota Vercel, kecepatan, dan keamanan
Tampilan, gaya, dan gelar **tidak diubah**. Yang berubah hanya jalur data di belakangnya.

**Urutan deploy (penting):**
1. Supabase SQL Editor: jalankan `supabase/migration-v1.3a-additive.sql` (aditif, aman diulang, kode lama tetap jalan).
2. Deploy kode ke Vercel. Sesuaikan `vercel.json` (`"regions"`) dengan region project Supabase-mu (Supabase: Project Settings > Infrastructure; Singapore = `sin1`). Fungsi dan database yang berjauhan menambah ratusan milidetik di setiap query.
3. Setelah situs berjalan normal: jalankan `supabase/migration-v1.3b-lockdown.sql` (menutup pembacaan publik tabel `profiles` dan `user_stats`; leaderboard memakai RPC `leaderboard_rows`).
4. Disarankan di Vercel: env `DISABLE_SECURITY_RESET=1` (lihat bagian keamanan di bawah).
Instalasi baru cukup menjalankan `schema.sql` (sudah berisi semuanya). Bila migrasi A belum dijalankan, kode otomatis memakai jalur lama (lebih lambat, tetapi tidak error).

**Hasil per jawaban:** dari sekitar 20 query berurutan menjadi 2 round-trip database, 1 invocation (soal berikutnya ikut di response).
- `serve_question`, `bump_stats`, `grant_achievements`, `me_bundle`, `leaderboard_rows` (SQL): menggabungkan banyak query menjadi satu panggilan dan membuat penghitungan poin atomik (tidak ada lagi poin yang hilang karena dua request bersamaan).
- Penulisan jawaban, statistik, dan persiapan soal berikutnya berjalan paralel.
- `/api/session` tanpa query database (username dibaca dari token). Foto profil tidak ikut di `/api/me`; dilayani `/api/avatar?v=<hash>` yang di-cache browser.
- Latar bintang 3D dimuat setelah halaman interaktif dan dilewati pada mode hemat data / gerak dikurangi.
- Rate limit sekarang disimpan di database (`rate_hit`) sehingga berlaku di semua instance serverless; versi in-memory sebelumnya hanya berlaku per instance.

**Perbaikan bug dari versi optimasi sebelumnya:**
- Timer soal berikutnya: jam server mulai saat jawaban dikirim, sedangkan jam layar mulai saat tombol Lanjut ditekan, sehingga membaca penjelasan bisa membuat jawaban benar dianggap terlambat. Sekarang jam server soal berikutnya dimulai setelah jeda baca (20 detik; 6 detik di speedrun).
- Cache HTTP pada `/api/session` dan `/api/me` membuat login/logout "tersangkut" dan data basi. Dihapus; cache dikelola store klien.
- Cache `/api/me` di klien terbawa antar-akun pada tab yang sama; sekarang direset saat akun berganti, dan permintaan ganda digabung.

**Keamanan reset password:** metode "pertanyaan keamanan" memakai bahasa favorit, framework favorit, dan role. Data itu berentropi rendah dan sebelumnya bisa dibaca siapa pun lewat API Supabase, sehingga akun bisa diambil alih. Sekarang: data profil ditutup dari publik, ada batas 5 percobaan per hari per akun di database, akun DEMO tidak bisa di-reset, dan metode ini bisa dimatikan penuh dengan `DISABLE_SECURITY_RESET=1`. Risiko sisanya tetap ada selama metode ini aktif; penggantinya yang aman adalah kode pemulihan atau reset lewat email. Setelah reset, sesi login lama tetap berlaku sampai kedaluwarsa (30 hari).

**Jangan commit** folder `cheat-sheets/` (kunci jawaban semua soal) ke repo publik. Folder itu sudah ada di `.gitignore`.

## v1.4: teman, foto di peringkat, dan hint yang lebih detail
**Urutan pasang (database yang sudah berjalan):**
1. SQL Editor: jalankan `supabase/migration-v1.4-friends.sql` (aditif, aman diulang; sebelumnya pastikan `migration-v1.3a-additive.sql` sudah dijalankan).
2. Deploy kode ke Vercel.
3. (Opsional tetapi disarankan) perbarui hint soal yang sudah ada: jalankan `supabase/hints/1-easy.sql` sampai `5-hell.sql`. Tiap file berakhir dengan query pengecekan; kolom `hint_baru` harus sama dengan `total`.
Instalasi baru cukup menjalankan `schema.sql` lalu `supabase/seed/*.sql` (sudah berisi hint baru).

**Teman** (menu *Teman*, ikon dua orang):
- Cari pemain lewat awalan nama pengguna, kirim permintaan, terima/tolak, batalkan, atau hapus teman. Maksimal 100 teman dan 30 permintaan menunggu; pengiriman permintaan dibatasi 25/jam.
- Daftar teman menampilkan foto profil, gelar (dengan lencana), dan status: **Online**, **Sedang bermain {tingkat}**, atau **Offline · x jam lalu**. Titik merah di menu menunjukkan jumlah permintaan masuk.
- Klik nama (di Teman maupun Peringkat) untuk membuka profil pemain: gelar, lencana, poin, peringkat, streak, statistik per tingkat, dan pencapaian.
- **Yang tidak ditampilkan ke pemain lain:** role, framework favorit, tingkat pemahaman, dan foto lama. Data itu dipakai sebagai jawaban pertanyaan keamanan reset password, jadi sengaja disembunyikan. Status online hanya terlihat oleh teman.
- **Soal "real time":** status bukan koneksi websocket, melainkan heartbeat tiap 2 menit (saat tab terlihat) dan penyegaran daftar tiap 30 detik di halaman Teman. Pemain dianggap online bila terlihat dalam 4 menit terakhir. Cara ini tidak membatasi jumlah pemain online (Supabase Realtime gratis dibatasi 200 koneksi) dan hemat invocation Vercel.

**Foto profil** kini disimpan di Supabase Storage (bucket publik `avatars`) dan dilayani CDN Supabase, bukan Vercel; leaderboard dan daftar teman memuat foto tanpa memakai invocation. Foto lama (tersimpan di database) dipindahkan otomatis saat pemiliknya membuka halaman Profil; setelah itu fotonya muncul di peringkat. Pratinjau foto tanpa Storage tetap berfungsi bila bucket belum dibuat.

**Hint** ditulis ulang per soal (`scripts/upgrade-hints.mjs`, kamus di `scripts/hint-clues.mjs`):
- tebak bahasa: ciri sintaks bahasa tersebut ditambah tahun kemunculan;
- lengkapi kode: panjang kata, huruf awal dan akhir, serta ciri bahasa (nama kata yang dicari disamarkan);
- valid/error: apa yang harus diperiksa (kutip, kurung, atau ejaan kata kunci) sesuai jenis kesalahannya;
- output: langkah hitung sesuai kodenya (nilai variabel, arti operator, langkah pertama perhitungan).
Skrip ini juga memastikan hint tidak menyebut nama jawabannya. `npm run gen:questions` kini otomatis menjalankannya.

## v1.5: sayap baru, pilih gelar, info lengkap, riwayat, perbaikan timer
**Urutan pasang:** (1) SQL Editor: jalankan `supabase/migration-v1.5-title-ranks-history.sql` (aditif, aman diulang; pastikan migrasi 1.3a dan 1.4 sudah pernah dijalankan). (2) Deploy kode. Instalasi baru cukup `schema.sql` + `supabase/seed/*.sql`.

**Perbaikan bug: jawaban benar dianggap salah.** Timer di layar hanyalah penghitung yang dikurangi 1 tiap detik. Saat tab berpindah ke aplikasi lain, layar terkunci, atau HP lambat, penghitung itu tertinggal dari jam server, sehingga jawaban yang tampak masih tepat waktu ditolak sebagai terlambat (pilihannya sama dengan jawaban benar, tetapi tercatat salah). Perbaikan:
- timer kini memakai batas waktu absolut (`performance.now`) dan disinkronkan saat kembali ke tab, jadi layar dan server selalu sepakat;
- toleransi jaringan di server naik dari 3 ke 6 detik (permintaan di jaringan seluler bisa lambat); jeda baca penjelasan sebelum soal berikutnya naik ke 45 detik (speedrun 8 detik);
- bila jawaban memang terlambat, layar menampilkan pesan yang jelas ("Jawabanmu benar, tetapi terkirim setelah waktu habis"), dan jawaban yang benar-tapi-terlambat tidak lagi masuk daftar *Review* soal salah.

**SEPUH CODING:** halaman Gelar kini menjelaskan cara membukanya: kelima tingkat (Easy, Normal, Hard, Extreme, **dan Hell**) harus legendaris, dan tiap tingkat butuh minimal 150 soal dengan akurasi ≥ 85% yang dihitung dari seluruh jawaban di tingkat itu. Kartu SEPUH menampilkan daftar per tingkat (sudah legendaris atau belum, jumlah soal, akurasi) beserta perkiraan jawaban benar berturut-turut yang masih dibutuhkan; rumus kekurangan itu diuji (`answersNeeded` di `src/lib/config.ts`).

**Sayap baru:** semua gelar memakai sayap bergaya sayap malaikat tegak (bilah panjang melengkung, garis ganda, bulu sekunder, dan cuping bergerigi) dalam warna tiap tingkat. Gelar legendaris mengepak (bulu sekunder menyusul sedikit terlambat) dan mengepak lebih cepat saat disentuh kursor. Semuanya animasi CSS murni: tanpa pustaka tambahan, tanpa permintaan jaringan, jadi tidak menambah pemakaian kuota Vercel. Animasi dijeda otomatis saat lencana di luar layar, dihormati `prefers-reduced-motion`, dan di Peringkat serta Teman gelar legendaris kini ikut bergerak (sebelumnya dibekukan).

**Pilih gelar yang dipakai:** semua gelar yang terbuka, standar maupun legendaris (termasuk gelar standar tingkat yang legendarisnya sudah diraih), bisa dipilih lewat tombol *Pakai gelar ini* di halaman Gelar; *Kembali otomatis* mengembalikan ke gelar tertinggi. Pilihan divalidasi ulang di server dan tampil di Profil, Peringkat, Teman, dan profil pemain lain.

**Halaman Informasi:** 238 bahasa, framework, dan alat. Klik kartu untuk melihat contoh kode (146 entri), cara menjalankan/memakai, jalur belajar bertahap sesuai jenisnya, tautan situs resmi, dan kata kunci pencarian. Detail dimuat hanya saat kartu dibuka (`languages-detail.json`). Data dibuat oleh `npm run gen:info` dari `scripts/catalog.mjs`, `scripts/notes-en.mjs`, dan `scripts/info-data.mjs`. Perintah instalasi hanya ditulis bila umum dan stabil; sisanya diarahkan ke panduan di situs resmi, jadi periksa ulang bila versi alat berubah.

**Profil:** *Peringkat per tingkat* (Easy sampai Hell; hanya pemain yang punya poin di tingkat itu dihitung) dan *Riwayat permainan* (tingkat, mode, skor, benar/total, akurasi, durasi, selesai atau keluar). Riwayat hanya bisa dilihat pemilik dan temannya; pengecekan "berteman" dilakukan di database. Riwayat dimuat saat tombol ditekan dan memakai kursor waktu untuk "Muat lebih banyak" (tanpa polling).

**Saran & Kritik dengan foto:** lampirkan hingga 3 foto (JPG/PNG/WebP). Foto diperkecil di perangkat (maks. 1280 px, JPEG), isinya divalidasi di server (bukan hanya tipe yang diklaim), disimpan di bucket **privat** `feedback` (lihat di Supabase > Storage > feedback > folder nama pengguna), dan jalurnya tercatat di kolom `feedback.attachments`. Bila Resend dikonfigurasi, foto ikut terlampir di email. Dibatasi 6 kiriman per jam per pemain. Bila bucket belum dibuat, pesan teks tetap terkirim dan pemain diberi tahu bahwa fotonya gagal disimpan.
