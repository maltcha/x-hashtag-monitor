# ZonaLead — tahap 1

Frontend pengembangan untuk menggantikan tampilan X Hashtag Monitor. Tetap memakai endpoint Supabase Edge Function yang sudah ada:
`https://fyzfadxhaunxoclgktle.supabase.co/functions/v1/x-monitor`

## Isi
- `index.html`: dashboard ZonaLead.
- `supabase-migration.sql`: migrasi opsional untuk kolom lead (belum diperlukan oleh frontend tahap 1).

## Fitur tahap 1
- Membaca hashtag dan postingan dari endpoint lama.
- Mengelompokkan postingan yang sudah terkumpul berdasarkan produk dan kata indikasi beli (Indonesia + Inggris).
- Filter produk, status, dan pencarian teks.
- Status dan catatan disimpan di localStorage browser (belum tersinkron lintas perangkat/database).
- Sinkronisasi memanggil action `sync` lama; fungsi lama masih mencari hashtag `#tag`, belum menjalankan pencarian keyword WTB secara langsung.
- CSV export dan tautan membuka post di X; tidak ada auto-reply.

## Penting sebelum dipasang live
1. Ini adalah versi preview, bukan deploy otomatis.
2. Backend lama masih memakai password admin dan CORS `*`; perlu pengamanan sebelum dipakai untuk data privat.
3. Untuk pemantauan WTB/intent yang sesungguhnya, Edge Function perlu diperbarui agar menjalankan query kata kunci X API dan menyimpan hasil dengan deduplikasi. Tampilan tahap 1 hanya mengklasifikasikan postingan yang sudah masuk.
4. Status dan catatan tahap 1 hanya tersimpan di browser yang sedang dipakai. Tahap backend berikutnya akan memindahkannya ke database.

## Cara preview
Buka `index.html` di browser atau deploy pada branch/preview GitHub Pages terpisah. Jangan timpa website live sebelum pengujian.
