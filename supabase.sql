create table if not exists public.docs (path text primary key, col text not null, data jsonb not null default '{}'::jsonb, deleted boolean not null default false, updated_at timestamptz not null default now());
create index if not exists docs_col_upd on public.docs (col, updated_at);
alter table public.docs enable row level security;
drop policy if exists "lecture" on public.docs;
drop policy if exists "ajout" on public.docs;
drop policy if exists "maj" on public.docs;
create policy "lecture" on public.docs for select to anon using (true);
create policy "ajout" on public.docs for insert to anon with check (true);
create policy "maj" on public.docs for update to anon using (true) with check (true);
