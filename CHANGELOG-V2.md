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

## 3) Developer Mode — Frontend / Backend / Full Stack
Gelar jalur **skill**, terpisah total dari gelar penaklukan Easy–Primordial God: bisa dipakai **bertumpuk**
(lebih dari satu sekaligus) dan tidak pernah menggantikan gelar utama yang sedang dipakai.

| Peran | Poin benar | Bonus beruntun (>3x berturut) | Waktu/soal | Hint |
|---|---|---|---|---|
| Frontend | +3000 | +250 | 2 menit | Tanpa batas |
| Backend | +3000 | +250 | 2 menit | Tanpa batas |
| Full Stack | +3000 | +250 | 2 menit | Tanpa batas |

- ~~Soal menyesuaikan peran dari katalog bahasa Easy–Hell~~ → **diganti total di v2.4** (lihat bagian 6): soal Developer Mode kini skenario kerja nyata level hard–hell.
- Bank soal: **800/peran** (v2.4), dihasilkan `scripts/gen-dev.mjs` dari `scripts/dev-bank/*` (bukan lagi katalog bahasa Easy–Hell).
- Gelar **Master Frontend / Master Backend / Master Fullstack** didapat di **akurasi ≥90%** dengan minimal
  **500 soal** dijawab di peran itu (gabungan sesi Biasa + Maraton) — dinaikkan di v2.4 dari 85% / 50 soal.
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

## 5) v2.3 — Peringkat God/Dev, bingkai Master mewah, perbaikan animasi
- **Bug**: gelar legendaris di halaman Peringkat kaku. Penyebab: badge baris #4+ (mode `still`) menyuntikkan CSS `.bk *{animation:none}` yang bersifat GLOBAL
  ke seluruh halaman sehingga ikut mematikan badge podium. Kini aturan itu hanya berlaku untuk SVG ber-class `still` (`src/lib/badge-svg.ts`).
- **Peringkat**: tab baru Demi God / God / True God / Primordial God dan Frontend / Backend / Full Stack di `/leaderboard`.
  Tidak perlu SQL baru untuk ini — `leaderboard_rows(p_tab)` sudah generik terhadap `user_stats.difficulty`.
- **Profil** (`/profile` dan `/u/[username]`): kartu "Peringkat per tingkat" kini 3 kelompok (Klasik, God Mode, Developer Mode).
- **Bingkai Master** (`src/components/Master.tsx`, `Avatar.tsx`, `globals.css`): murni CSS (conic-gradient + mask + transform), tanpa dependensi baru.
  Merah membara menyala (Frontend), hitam pekat beraura gelap (Backend), ungu tajam + merah + hitam (Full Stack).
  Dipakai di avatar, border kartu podium #1–#3, baris peringkat, kartu profil, teman, dan halaman Dev.
- **Pilih bingkai**: halaman `/titles` punya bagian "Bingkai Master" (pakai salah satu yang sudah dibuka, otomatis, atau tanpa bingkai).
  Server memverifikasi ulang syarat Master dari `user_stats` (`/api/master`).
- **Migrasi wajib**: jalankan `supabase/migration-v2.3-master-frame.sql` (kolom `profiles.selected_master` + `msel` di leaderboard_rows/friends_overview/player_profile).

## 6) v2.4 — Developer Mode HARD MODE (soal baru total + syarat Master 500 soal / 90%)
**Masalah v2.1–v2.3:** soal Developer Mode hanyalah "tebak bahasa/framework dari potongan kode" memakai katalog yang sama dengan Easy–Hell,
sehingga gelar Master terasa hambar. **Sekarang:**
- **Bank soal baru total** (`scripts/dev-bank/`), **800 soal/peran**, tidak ada satu pun yang sama dengan Easy–Hell (diperiksa otomatis oleh generator).
  Tingkat kesulitan setara Hard–Hell: pemain harus *menelusuri* kode/aturan, bukan mengenali sintaks.
- **Jawaban DIHITUNG, bukan ditulis tangan**: kode JavaScript dijalankan di Node (sandbox `vm`, dan proses Node nyata untuk `process.nextTick`),
  Python dijalankan di python3, SQL di SQLite 3.45 (window function, CTE rekursif), Git di repositori nyata, dan aturan spesifikasi
  (CSS cascade/@layer, flexbox, grid, margin collapse, stacking context, CORS, SameSite/cookie, CSP, cache HTTP, JWT, cron, SemVer) disimulasikan.
- **Sembilan tipe soal** (usulan pengguna, dinaikkan levelnya): output/sintaks hilang, pengelompokan teknologi (kategori halus), studi kasus stack,
  analisis solusi/arsitektur, HTTP & REST, Git (konflik merge, reset/revert/stash), responsif/mobile (srcset+sizes+DPR, dvh, viewport), jargon, keamanan.
- **Syarat Master: 500 soal dengan akurasi ≥90%** (`DEV_BADGE_RULE` di `src/lib/config.ts`; teks UI otomatis ikut karena memakai parameter).
- **Soal belum pernah dijawab diprioritaskan** (`serve_question` di `migration-v2.4-dev-hardmode.sql` dan `schema.sql`): tanpa ini 500 jawaban dari bank
  terbatas akan penuh pengulangan acak. Soal baru habis → baru mengulang.
- **Anti-celah**: opsi jawaban diseimbangkan panjangnya (celah "pilih opsi terpanjang" ditutup), posisi jawaban A/B/C merata (~33% tiap posisi), pengecoh dibuat dari model kesalahan nyata.
- Seed dipecah 250 soal/berkas (`dev-1-frontend-1.sql` … `dev-3-fullstack-4.sql`, 12 berkas) agar muat di SQL Editor. Bagian 1 tiap peran **menonaktifkan** soal lama peran itu.
- Pemain yang sebelumnya sudah Master (50 soal/85%) akan dihitung ulang dengan syarat baru dan bisa kehilangan gelar sampai memenuhinya.
- **Profil menampilkan SEMUA gelar yang diraih** (komponen `src/components/EarnedTitles.tsx`): gelar standar + legendaris di tiap tingkat (termasuk God Mode)
  dan gelar Master, dengan tanda ★ pada gelar yang sedang dipakai. Tampil di profil sendiri (`/profile`) dan di profil pemain lain (`/u/[username]`),
  sehingga pemain lain bisa melihat koleksi gelarnya. Dihitung dari statistik yang sudah dikirim `player_profile` (tanpa perubahan SQL, tanpa data privat tambahan).
- Soal Developer Mode masih berbahasa Indonesia (kolom `_en` null; UI otomatis jatuh ke teks Indonesia seperti sebelumnya).

## 7) v2.5 — Efek premium God Mode & Master + halaman Informasi baru
**Efek (semua berjalan di browser pemain; tidak menambah beban serverless/bandwidth Vercel secara berarti):**
- `TitleBadge`: tilt 3D + kilap yang mengikuti kursor (CSS variables + requestAnimationFrame, **tanpa library**: versi awal memakai framer-motion tetapi menambah ±37 kB First Load ke /profile, /titles, /leaderboard, /u sehingga diganti), aura konik berputar (hanya `transform`, dikomposit GPU),
  dijeda otomatis saat di luar layar. Confetti khas tiap tier God (hujan emas ✦ / cincin cahaya + ⚡ / pecahan platina ◆ / ledakan kosmik ★☄) — `canvas-confetti` kini dimuat malas.
- Partikel three.js (hanya saat hover & dimuat malas): Demi God partikel naik + cincin, God orbit + 3 cincin cahaya, True God stardust, Primordial ledakan + 4 cincin ungu. GPU daya-rendah, tanpa antialias, dpr ≤1.25.
- Kartu gelar legendaris: **foil border** berputar (`.foil`) dan nama berkilau (`.name-shine`) di halaman Gelar, God Mode, profil sendiri, profil pemain lain, dan daftar "Semua gelar".
- Master: sapuan kilap pada pil, suasana khas tiap peran pada kartu (bara/scanline/aurora), bintik yang mengorbit avatar, animasi masuk kartu.
- **Anggaran efek otomatis** (`src/lib/fx.ts`): `off` (prefers-reduced-motion), `lite` (Data Saver / koneksi 2G / RAM ≤2GB / CPU ≤2 inti: hanya CSS + confetti kecil, tanpa three.js & tilt), `full`.

**Halaman Informasi (`/info`) kini 3 tab** (`#bahasa`, `#keamanan`, `#peran`; tab berat dimuat malas):
- **Bahasa & Framework** — isi lama.
- **Tools Keamanan** — 90 entri: 55 lama (pentest + standar) + **35 baru** (pertahanan, AppSec/DevSecOps, kriptografi & kredensial, jaringan, forensik, cloud/container).
  Tiap entri: fungsi, tujuan penggunaan, cara pemakaian, contoh perintah, tips, situs resmi. Ada filter grup, pencarian, peta "tools apa untuk tahap apa", dan peringatan etika/hukum.
- **Peran Developer** — Frontend / Backend / Full Stack: apa itu, tanggung jawab, keahlian, alat, keseharian, jalur belajar, jebakan umum, sisi keamanan (chip membuka tool terkait),
  kaitan dengan Master di Developer Mode, tabel perbandingan, dan FAQ.
- Sumber data: `scripts/security-extra.mjs`, `scripts/role-info.mjs` → `npm run gen:info` (memvalidasi duplikat, tautan https, dan rujukan silang) → `src/data/security-extra.json`, `roles.json`.

## Cara deploy
1. Jalankan `supabase/migration-v2-godmode.sql`, `migration-v2.1-devmode.sql`, lalu **`migration-v2.4-dev-hardmode.sql`** di SQL Editor
   Supabase (aman diulang; instalasi baru cukup `schema.sql` yang sudah memuat semuanya).
2. Soal God Mode: `supabase/seed/god-1-demi_god.sql` s.d. `god-4-primordial_god.sql` (±165 soal).
   Soal Developer Mode (v2.4): **12 berkas** `supabase/seed/dev-1-frontend-1..4.sql`, `dev-2-backend-1..4.sql`, `dev-3-fullstack-1..4.sql`
   (800 soal/peran). Jalankan SEMUA berkas (urut 1→4 per peran); bagian 1 menonaktifkan soal lama.
3. Untuk memperbanyak soal: God Mode → tambah entri tools di `scripts/security-tools.mjs` lalu jalankan
   ulang `node scripts/gen-god.mjs`; Developer Mode → tambah famili/entri di `scripts/dev-bank/*.mjs`
   lalu jalankan ulang `npm run gen:dev` (parameter `DEV_TARGET=800` mengatur jumlah/peran).
4. `npm install && npm run build` seperti biasa.

## Catatan kualitas
- `npx tsc --noEmit` bersih tanpa error.
- Sekaligus memperbaiki 2 bug lama yang sudah ada sebelum v2: state `busy`/`msg` yang hilang di halaman Titles,
  dan tipe prop `PDFDownloadLink` di `PdfLink.tsx`.
