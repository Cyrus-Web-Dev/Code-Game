Kode Tebak — paket file optimasi + fitur reset password
=====================================================

Cara pakai:
1. Backup project CODING_GAME kamu.
2. Extract zip ini, lalu SALIN file ke folder project dengan path yang sama
   (timpa file lama).
3. Pastikan file BARU ikut masuk:
   - src/lib/game-session.ts
   - src/app/forgot/page.tsx
   - src/app/api/auth/reset-password/route.ts
4. git add -A && git status  (pastikan .env.local TIDAK ikut)
5. git commit -m "Optimize API + forgot password + LB poll"
6. git push  → Vercel auto redeploy

Isi optimasi:
- Game: start/answer batch soal berikutnya (hemat ~50% invocations saat main)
- Cache /api/me 60s di client (navigasi hemat)
- Leaderboard: poll 45s + pause saat tab hidden (bukan realtime)
- Cache-Control singkat di /api/me dan /api/session
- Fitur lupa/reset password (/forgot)
- schema.sql idempotent
- globals.css: ease-linear (fix build Tailwind)

UI / gelar / animasi: tidak diubah.
