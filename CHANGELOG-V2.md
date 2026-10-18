# Kode Tebak v2 — Changelog

## 1) Bonus jawaban beruntun (Hard / Extreme / Hell)
- **Hard**: benar beruntun ≥3x → +50 (benar) +50 (bonus) = **100**/soal.
- **Extreme**: waktu per soal **20 detik**. Beruntun ≥3x → +100 +50 = **150**/soal.
- **Hell**: waktu per soal **20 detik**. Beruntun ≥4x → +150 +50 = **200**/soal.
- Bonus didapat **setiap** jawaban benar selama streak aktif (bukan cuma sekali saat ambang tercapai).
- File: `src/lib/config.ts` (STREAK_RULES, LEVEL_TIME), `src/app/api/game/answer/route.ts`, `game-session.ts`.

## 2) God Mode — 4 tingkat baru di atas Hell
| Tingkat | Warna | Gelar legendaris | Poin benar | Bonus beruntun (min 3x) | Waktu/soal |
|---|---|---|---|---|---|
| Demi God | Emas redup | BUG_HUNTER | +500 | +250 | 2 menit |
| God | Emas terang | CYBER_DEITY | +1000 | +500 | 2 menit |
| True God | Putih platina | Exploit Architect | +2000 | +1000 | 3 menit |
| Primordial God | Ungu-emas kosmik | The Cosmic Kernel | +5000 | +2500 | 5 menit |

- 2 mode pengerjaan: **Biasa** (10 soal) & **Maraton** (100 soal) — tanpa speedrun/daily.
- **Hint tanpa batas, 3 tahap**: definisi/konsep → petunjuk teknis → edukasi secure-coding dunia nyata.
- Selesai **tanpa** hint sama sekali → gelar "menyala penuh" (pure clear); pakai hint tetap dapat gelar tapi dicatat.
- Soal berisi **tools keamanan siber nyata** (Burp Suite, Nmap, Metasploit, Ghidra, OWASP ASVS, dll — lihat
  `scripts/security-tools.mjs`), bukan bahasa pemrograman.
- Halaman baru: `/god` (pilih tingkat), terintegrasi penuh ke `/titles`, `/leaderboard`, `/friends`, `/profile`
  (lencana, gelar, papan peringkat semua otomatis mendukung God Mode lewat fungsi generik di `config.ts`).
- Halaman **Info** kini punya bagian "Tools Keamanan Siber": fungsi, cara pakai, dan tips secure-coding tiap tool.

<<<<<<< HEAD
## 3) Developer Mode — Frontend / Backend / Full Stack
Gelar jalur **skill**, terpisah total dari gelar penaklukan Easy–Primordial God: bisa dipakai **bertumpuk**
(lebih dari satu sekaligus) dan tidak pernah menggantikan gelar utama yang sedang dipakai.

| Peran | Poin benar | Bonus beruntun (>3x berturut) | Waktu/soal | Hint |
|---|---|---|---|---|
| Frontend | +3000 | +250 | 2 menit | Tanpa batas |
| Backend | +3000 | +250 | 2 menit | Tanpa batas |
| Full Stack | +3000 | +250 | 2 menit | Tanpa batas |

- Soal menyesuaikan peran: Frontend soal HTML/CSS/JS/React/Vue/dll, Backend soal Python/PHP/Laravel/Django/SQL/dll,
  Full Stack campuran keduanya + framework lintas sisi (Next.js, Nuxt, dst). Lihat `scripts/dev-roles.mjs`.
- Bank soal: 250/peran, dihasilkan `scripts/gen-dev.mjs` dari katalog bahasa yang sama dipakai tingkat Easy–Hell.
- Gelar **Master Frontend / Master Backend / Master Fullstack** didapat di **akurasi ≥85%** dengan minimal
  **50 soal** dijawab di peran itu (gabungan sesi Biasa + Maraton).
- Hadiah bonus: **bingkai avatar bercahaya** di leaderboard & profil — merah membara (Frontend), hitam gelap
  gulita (Backend), ungu pekat berhawa gelap (Full Stack). Bertumpuk otomatis kalau punya lebih dari satu gelar
  Master. Dihitung 100% di klien dari `user_stats` yang sudah ada — tidak perlu kolom/fungsi SQL baru untuk gelarnya.
- Halaman baru `/dev` (pilih peran), reuse penuh mesin `/play/[level]` (timer, skor, streak, hint) lewat tipe
  `PlayableLevel` baru di `config.ts`.

## 4) Fitur Saran & Kritik dihapus → diganti halaman Kontak Developer
Alasan: fitur lama mengunggah foto bukti bug ke Supabase Storage (bucket privat `feedback`), yang jadi beban
penyimpanan tak perlu. Sekarang saran/kritik/bug diarahkan langsung ke Instagram/Email/WhatsApp developer.
- Dihapus: `src/app/feedback/`, `src/app/api/feedback/`, tabel `feedback`, bucket Storage `feedback`,
  env var `RESEND_API_KEY`/`FEEDBACK_TO_EMAIL`/`FEEDBACK_FROM` (sudah tidak dipakai, dihapus dari `.env.example`).
- Baru: halaman `/contact` (`src/app/contact/page.tsx`) — **isi dulu 3 tautan kontak asli di bagian atas file
  itu** (Instagram, email, nomor WA format internasional) sebelum deploy, masih placeholder.
- Migrasi: jalankan `supabase/migration-v2.2-remove-feedback.sql` untuk instalasi yang sudah berjalan
  (menghapus tabel + semua foto lama di bucket `feedback`). Instalasi baru dari `schema.sql` tidak lagi
  membuat tabel/bucket ini sama sekali.

## Cara deploy
1. Jalankan `supabase/migration-v2-godmode.sql` lalu `supabase/migration-v2.1-devmode.sql` di SQL Editor
   Supabase (aman diulang; instalasi baru cukup `schema.sql` yang sudah memuat kedua blok ini).
2. Soal God Mode: `supabase/seed/god-1-demi_god.sql` s.d. `god-4-primordial_god.sql` (±165 soal).
   Soal Developer Mode: `supabase/seed/dev-1-frontend.sql`, `dev-2-backend.sql`, `dev-3-fullstack.sql`
   (250 soal/peran). Jalankan semua file ini di SQL Editor untuk mengisi bank soal.
3. Untuk memperbanyak soal: God Mode → tambah entri tools di `scripts/security-tools.mjs` lalu jalankan
   ulang `node scripts/gen-god.mjs`; Developer Mode → tambah nama bahasa/framework di `scripts/dev-roles.mjs`
   lalu jalankan ulang `node scripts/gen-dev.mjs`.
=======
## Cara deploy
1. Jalankan `supabase/migration-v2-godmode.sql` di SQL Editor Supabase (aman diulang; instalasi baru cukup
   `schema.sql` yang sudah memuat blok ini).
2. Soal God Mode sudah tersedia di `supabase/seed/god-1-demi_god.sql` s.d. `god-4-primordial_god.sql`
   (±165 soal, hasil `scripts/gen-god.mjs`). Jalankan file-file ini di SQL Editor untuk mengisi bank soal.
3. Untuk memperbanyak soal (maks 200/tingkat): tambah entri tools baru di `scripts/security-tools.mjs`,
   lalu jalankan `node scripts/gen-god.mjs` ulang.
>>>>>>> 139710653228b172a081280c0c37a037c1a953fb
4. `npm install && npm run build` seperti biasa.

## Catatan kualitas
- `npx tsc --noEmit` bersih tanpa error.
- Sekaligus memperbaiki 2 bug lama yang sudah ada sebelum v2: state `busy`/`msg` yang hilang di halaman Titles,
  dan tipe prop `PDFDownloadLink` di `PdfLink.tsx`.
