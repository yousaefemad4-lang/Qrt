-- لينك محلك: شغّل هذا الملف مرة واحدة في Supabase > SQL Editor
-- غيّر الإيميل في كل مكان إلى إيميل المدير (إيميلك أنت)

create table if not exists public.stores (
  slug text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.stores enable row level security;

drop policy if exists "stores readable by everyone" on public.stores;
create policy "stores readable by everyone"
on public.stores for select
to anon, authenticated
using (true);

drop policy if exists "only admin writes stores" on public.stores;
create policy "only admin writes stores"
on public.stores for all
to authenticated
using (auth.jwt() ->> 'email' = 'yousaefemad2@gmail.com')
with check (auth.jwt() ->> 'email' = 'yousaefemad2@gmail.com');

insert into storage.buckets (id, name, public)
values ('shop-images', 'shop-images', true)
on conflict (id) do nothing;

drop policy if exists "shop images readable by everyone" on storage.objects;
create policy "shop images readable by everyone"
on storage.objects for select
to anon, authenticated
using (bucket_id = 'shop-images');

drop policy if exists "only admin writes shop images" on storage.objects;
create policy "only admin writes shop images"
on storage.objects for all
to authenticated
using (bucket_id = 'shop-images' and auth.jwt() ->> 'email' = 'yousaefemad2@gmail.com')
with check (bucket_id = 'shop-images' and auth.jwt() ->> 'email' = 'yousaefemad2@gmail.com');
