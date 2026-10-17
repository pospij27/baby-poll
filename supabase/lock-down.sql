-- Makes the `entries` table read-only for the public (anon) key used by the website,
-- and hides the guessers' names. Run once in Supabase: SQL Editor → New query → paste → Run.

-- 1. Turn on row-level security. Without a matching policy, nobody using the public key
--    can insert, update or delete rows.
alter table public.entries enable row level security;

-- 2. Remove any existing policies on the table (e.g. ones that allowed inserts or deletes).
do $$
declare pol record;
begin
  for pol in select policyname from pg_policies where schemaname = 'public' and tablename = 'entries' loop
    execute format('drop policy %I on public.entries', pol.policyname);
  end loop;
end $$;

-- 3. Allow reading rows only.
create policy "Public read-only" on public.entries for select to anon using (true);

-- 4. Only the anonymous columns can be read; the guessers' names are not exposed.
revoke all on public.entries from anon;
grant select (gender, date, girl_names, boy_names, created_at) on public.entries to anon;
