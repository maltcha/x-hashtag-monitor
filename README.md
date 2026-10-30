# ZonaLead — Tanpa Login / Sinkronisasi Langsung

Paket ini menghapus prompt password dan autentikasi sesi. Saat website dibuka, dashboard langsung mengambil data. Tombol **Sinkronkan** langsung memanggil Edge Function tanpa meminta password.

## Isi paket
- `index.html` — frontend ZonaLead tanpa login/password.
- `supabase-x-monitor-index.ts` — Edge Function `x-monitor` tanpa pemeriksaan password/token.
- `supabase-migration.sql` — file migrasi dari paket sebelumnya (tidak perlu dijalankan ulang jika tabel sudah ada).

## Cara memasang
1. Di GitHub, buka repository dan branch `zonalead-preview`.
2. Ganti file `index.html` di root branch dengan `index.html` dari folder `zonalead-build`, lalu commit.
3. Di Supabase Dashboard, buka **Edge Functions → x-monitor → Code**.
4. Simpan salinan kode lama, lalu ganti seluruh isi function dengan `supabase-x-monitor-index.ts` dari paket ini dan klik **Deploy**.
5. Pastikan Supabase Function Secrets ini tetap tersedia: `SUPABASE_URL`, `SUPABASE_SERVICE_ROLE_KEY`, dan `X_BEARER_TOKEN`.
6. `ADMIN_PASSWORD` tidak lagi digunakan oleh versi ini; boleh dibiarkan tersimpan atau dihapus dari Function Secrets.
7. Buka ulang website ZonaLead. Dashboard akan terbuka langsung dan tombol Sinkronkan tidak akan meminta password.

## Peringatan keamanan penting
Versi ini sengaja membuat endpoint baca dan sinkronisasi dapat dipanggil tanpa login. Siapa pun yang mengetahui alamat endpoint dapat membaca data yang dikembalikan dan berpotensi menjalankan sinkronisasi. Jangan gunakan versi ini jika data harus benar-benar privat atau endpoint memerlukan pembatasan pemakaian. Secret Supabase dan token X tetap hanya disimpan di Supabase, jangan pernah dimasukkan ke HTML/GitHub atau dikirim lewat chat.

## Catatan fungsi
Paket ini hanya menghapus login/password. Ini tidak mengubah pencarian hashtag menjadi pencarian keyword WTB; backend tetap menjalankan fungsi pencarian yang sudah ada sampai fitur pencarian lead dikembangkan terpisah.
