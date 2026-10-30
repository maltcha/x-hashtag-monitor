-- Jalankan hanya setelah backup dan review. Kolom tambahan kompatibel dengan tabel monitored_posts yang ada.
alter table public.monitored_posts
  add column if not exists product text,
  add column if not exists intent_type text,
  add column if not exists lead_status text not null default 'Baru',
  add column if not exists notes text,
  add column if not exists replied_at timestamptz;

create index if not exists monitored_posts_lead_status_idx
  on public.monitored_posts (lead_status);
create index if not exists monitored_posts_product_idx
  on public.monitored_posts (product);
