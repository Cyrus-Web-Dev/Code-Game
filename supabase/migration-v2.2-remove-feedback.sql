-- ════════ v2.2: Hapus fitur Saran & Kritik (digantikan halaman /contact) ════════
-- Alasan: fitur lama mengunggah foto ke Supabase Storage (bucket privat "feedback"), yang tidak perlu lagi
-- karena saran/kritik/bug kini diarahkan langsung ke Instagram/Email/WA developer (lihat src/app/contact).
-- Aditif & aman diulang — jalankan kapan saja setelah migrasi v2 & v2.1.

-- 1) Hapus semua objek (foto) di bucket "feedback", lalu bucket-nya sendiri.
delete from storage.objects where bucket_id = 'feedback';
delete from storage.buckets where id = 'feedback';

-- 2) Hapus tabel feedback (berikut seluruh pesan & referensi attachments yang pernah tersimpan).
drop table if exists feedback;
