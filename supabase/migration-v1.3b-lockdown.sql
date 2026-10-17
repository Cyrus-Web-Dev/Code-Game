-- Kode Tebak v1.3 (B): PENGUNCIAN data publik. Jalankan SETELAH kode v1.3 ter-deploy di Vercel
-- (kode lama masih membaca tabel profiles/user_stats langsung dari browser; kode v1.3 memakai RPC leaderboard_rows).
--
-- Efek: kunci anon tidak lagi bisa membaca tabel profiles & user_stats. Sebelumnya siapa pun bisa membaca
-- bahasa/framework favorit, role, dan foto semua pemain lewat API Supabase. Data itu dipakai sebagai "pertanyaan keamanan"
-- reset password, jadi harus tertutup.
drop policy if exists "profil publik (leaderboard)" on profiles;
drop policy if exists "statistik publik (leaderboard)" on user_stats;

-- Realtime tidak dipakai lagi (leaderboard polling lewat RPC) dan menyiarkan seluruh baris; lepaskan.
do $$ begin alter publication supabase_realtime drop table profiles; exception when others then null; end $$;
do $$ begin alter publication supabase_realtime drop table user_stats; exception when others then null; end $$;
