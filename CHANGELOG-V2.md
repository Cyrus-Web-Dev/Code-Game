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

## Cara deploy
1. Jalankan `supabase/migration-v2-godmode.sql` di SQL Editor Supabase (aman diulang; instalasi baru cukup
   `schema.sql` yang sudah memuat blok ini).
2. Soal God Mode sudah tersedia di `supabase/seed/god-1-demi_god.sql` s.d. `god-4-primordial_god.sql`
   (±165 soal, hasil `scripts/gen-god.mjs`). Jalankan file-file ini di SQL Editor untuk mengisi bank soal.
3. Untuk memperbanyak soal (maks 200/tingkat): tambah entri tools baru di `scripts/security-tools.mjs`,
   lalu jalankan `node scripts/gen-god.mjs` ulang.
4. `npm install && npm run build` seperti biasa.

## Catatan kualitas
- `npx tsc --noEmit` bersih tanpa error.
- Sekaligus memperbaiki 2 bug lama yang sudah ada sebelum v2: state `busy`/`msg` yang hilang di halaman Titles,
  dan tipe prop `PDFDownloadLink` di `PdfLink.tsx`.
