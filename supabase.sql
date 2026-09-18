-- run this in Supabase > SQL Editor (one time)
-- ตารางเก็บข้อความที่กดส่ง (คุณอารยา/คุณมิ้นท์)

create table if not exists public.messages (
  id bigint generated always as identity primary key,
  created_at timestamptz not null default now(),
  name text not null default 'mint',
  content text not null
);

-- เปิดใช้ Row Level Security
alter table public.messages enable row level security;

-- ให้ทุกคนโพสต์ข้อความได้ (ใช้จากหน้าเว็บ)
create policy "allow insert for all" on public.messages
  for insert
  to anon
  with check (true);

-- ให้อ่านข้อความได้ (แสดงผล/ตรวจได้)
create policy "allow select for all" on public.messages
  for select
  to anon
  using (true);