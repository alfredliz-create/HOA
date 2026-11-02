-- Winston Towers 200 — Board Decision Hub
-- Schema, row-level security, secret-ballot enforcement, auto-close.

create extension if not exists pgcrypto;

-- ---------- people ----------
create table people (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  email text not null unique,
  alt_emails text[] default '{}',
  phone text,
  role text not null default 'director' check (role in ('admin','president','director','manager','attorney','observer')),
  is_voter boolean not null default false,
  active boolean not null default true,
  login_token_hash text,            -- sha256 of personal login token (null = none issued)
  last_seen_at timestamptz,
  created_at timestamptz default now()
);

create table settings (
  key text primary key,
  value jsonb not null
);
insert into settings values
 ('voters_count', '7'),
 ('pass_rule', '"majority"'),
 ('default_deadline_days', '5'),
 ('timezone', '"America/New_York"');

-- ---------- vendors & contracts ----------
create table vendors (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  category text,                    -- laundry, uniforms, elevator, snow, landscaping, boiler, generator, engineering, legal, concierge, insurance...
  contact text,
  notes text
);

create table contracts (
  id uuid primary key default gen_random_uuid(),
  vendor_id uuid references vendors(id),
  title text not null,
  category text,
  status text not null default 'active' check (status in ('proposed','active','expired','terminated','declined')),
  term_start date,
  term_end date,
  term_months int,
  annual_cost numeric,
  total_value numeric,
  increase_cap_pct numeric,
  notice_days int,
  auto_renew boolean,
  coi_on_file boolean,
  coi_expires date,
  kpis jsonb default '{}',          -- free-form KPIs: {"revenue_share":"60%", "machines":24, ...}
  previous_contract_id uuid references contracts(id),
  doc_ref text,                     -- file name / link in the Winston Contracts project
  notes text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- ---------- reports (weekly updates, proposals, invoices that arrive) ----------
create table reports (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  source text not null default 'email' check (source in ('email','upload','manual')),
  gmail_message_id text unique,
  received_at timestamptz default now(),
  report_date date,
  from_email text,
  raw_text text,
  file_name text,
  status text not null default 'pending' check (status in ('pending','processed','ignored')),
  extraction jsonb default '{}',    -- {money:[], dates:[], fyi:[], sensitive:[], todos:[]}
  processed_at timestamptz,
  uploaded_by uuid references people(id)
);

-- ---------- decision cards ----------
create table cards (
  id uuid primary key default gen_random_uuid(),
  report_id uuid references reports(id) on delete set null,
  contract_id uuid references contracts(id),
  kind text not null default 'decision' check (kind in ('decision','contract','bid','invoice','policy')),
  title text not null,
  ask text not null,
  why text,
  cost_text text,
  amount numeric,
  options jsonb default '[]',
  recommendation text,
  deadline date,
  needs_open_meeting boolean default false,
  confidential boolean default false,
  status text not null default 'draft' check (status in ('draft','open','closed')),
  result text check (result in ('APPROVED','DECLINED','NOT DECIDED')),
  todo text,
  source_excerpt text,
  comparison jsonb default '{}',    -- {previous:{...}, proposed:{...}, delta:{...}, reserve_line:{...}, bids:[...]}
  flags jsonb default '[]',         -- ["Price +12.5% vs last year", "No COI on file"]
  created_by uuid references people(id),
  created_at timestamptz default now(),
  sent_at timestamptz,
  closed_at timestamptz,
  closed_reason text
);

create table votes (
  card_id uuid references cards(id) on delete cascade,
  person_id uuid references people(id),
  choice text not null check (choice in ('yes','no','info')),
  reason text not null,
  updated_at timestamptz default now(),
  primary key (card_id, person_id)
);

create table comments (
  id uuid primary key default gen_random_uuid(),
  card_id uuid references cards(id) on delete cascade,
  person_id uuid references people(id),
  text text not null,
  is_counsel boolean default false,
  created_at timestamptz default now()
);

create table notifications (
  id uuid primary key default gen_random_uuid(),
  card_id uuid references cards(id) on delete cascade,
  person_id uuid references people(id),
  type text not null check (type in ('invite','initial','reminder','escalation','summary','digest','login_link')),
  sent_at timestamptz default now()
);

create table audit_log (
  id bigserial primary key,
  at timestamptz default now(),
  person_id uuid,
  action text not null,
  detail jsonb
);

-- ---------- helpers ----------
create or replace function current_person_id() returns uuid
language sql stable security definer set search_path = public as $$
  select id from people
  where active and (lower(email) = lower(coalesce(auth.jwt()->>'email',''))
         or lower(coalesce(auth.jwt()->>'email','')) = any(select lower(unnest(alt_emails))))
  limit 1
$$;

create or replace function current_role_name() returns text
language sql stable security definer set search_path = public as $$
  select role from people where id = current_person_id()
$$;

create or replace function is_manager() returns boolean
language sql stable security definer set search_path = public as $$
  select coalesce(current_role_name() in ('admin','president','manager'), false)
$$;

create or replace function voters_count() returns int
language sql stable security definer set search_path = public as $$
  select coalesce((select (value)::int from settings where key='voters_count'),
                  (select count(*)::int from people where is_voter and active))
$$;

create or replace function majority_needed() returns int
language sql stable security definer set search_path = public as $$
  select voters_count()/2 + 1
$$;

-- Tally visible to everyone: counts only, never choices, until closed.
create or replace view card_progress as
select c.id as card_id,
       (select count(*) from votes v join people p on p.id=v.person_id where v.card_id=c.id and p.is_voter and p.active) as voted,
       (select count(*) from people p where p.is_voter and p.active) as voters,
       (select coalesce(array_agg(p.id order by p.name),'{}') from people p
          where p.is_voter and p.active and not exists (select 1 from votes v where v.card_id=c.id and v.person_id=p.id)) as waiting_ids,
       (select coalesce(array_agg(p.id order by p.name),'{}') from people p
          join votes v on v.person_id=p.id and v.card_id=c.id where p.is_voter and p.active) as voted_ids,
       case when c.status='closed' then
         (select count(*) from votes v join people p on p.id=v.person_id where v.card_id=c.id and p.is_voter and v.choice='yes') end as yes,
       case when c.status='closed' then
         (select count(*) from votes v join people p on p.id=v.person_id where v.card_id=c.id and p.is_voter and v.choice='no') end as no,
       case when c.status='closed' then
         (select count(*) from votes v join people p on p.id=v.person_id where v.card_id=c.id and p.is_voter and v.choice='info') end as info,
       majority_needed() as needed
from cards c;

-- Auto-close when a majority is reached.
create or replace function close_card_if_decided(cid uuid) returns void
language plpgsql security definer set search_path = public as $$
declare y int; n int; need int; st text;
begin
  select status into st from cards where id=cid;
  if st <> 'open' then return; end if;
  need := majority_needed();
  select count(*) filter (where v.choice='yes'), count(*) filter (where v.choice='no')
    into y, n
    from votes v join people p on p.id=v.person_id where v.card_id=cid and p.is_voter and p.active;
  if y >= need then
    update cards set status='closed', result='APPROVED', closed_at=now(), closed_reason='majority' where id=cid;
  elsif n >= need then
    update cards set status='closed', result='DECLINED', closed_at=now(), closed_reason='majority' where id=cid;
  end if;
end $$;

create or replace function votes_after_change() returns trigger
language plpgsql security definer set search_path = public as $$
begin
  perform close_card_if_decided(new.card_id);
  return new;
end $$;
create trigger votes_after_change after insert or update on votes
for each row execute function votes_after_change();

-- Deadline passed → NOT DECIDED (called by pg_cron nightly and by the app on load).
create or replace function close_expired_cards() returns int
language plpgsql security definer set search_path = public as $$
declare n int;
begin
  with u as (
    update cards set status='closed', result='NOT DECIDED', closed_at=now(), closed_reason='deadline'
    where status='open' and deadline is not null
      and deadline < (now() at time zone 'America/New_York')::date
    returning 1)
  select count(*) into n from u;
  return n;
end $$;

-- Vote RPC: validates everything server-side so the client can't cheat.
create or replace function cast_vote(p_card uuid, p_choice text, p_reason text) returns void
language plpgsql security definer set search_path = public as $$
declare me uuid; st text; isv boolean;
begin
  me := current_person_id();
  if me is null then raise exception 'You are not on the board roster.'; end if;
  select is_voter into isv from people where id=me;
  if not coalesce(isv,false) then raise exception 'Only voting directors can vote.'; end if;
  select status into st from cards where id=p_card;
  if st is distinct from 'open' then raise exception 'This decision is not open.'; end if;
  if p_choice not in ('yes','no','info') then raise exception 'Bad choice.'; end if;
  if length(trim(coalesce(p_reason,''))) < 2 then raise exception 'Please say why (one line).'; end if;
  insert into votes(card_id, person_id, choice, reason, updated_at) values (p_card, me, p_choice, trim(p_reason), now())
  on conflict (card_id, person_id) do update set choice=excluded.choice, reason=excluded.reason, updated_at=now();
  insert into audit_log(person_id, action, detail) values (me, 'vote', jsonb_build_object('card', p_card, 'choice', p_choice));
end $$;

create or replace function touch_seen() returns void
language sql security definer set search_path = public as $$
  update people set last_seen_at = now() where id = current_person_id();
$$;

-- ---------- row-level security ----------
alter table people enable row level security;
alter table settings enable row level security;
alter table vendors enable row level security;
alter table contracts enable row level security;
alter table reports enable row level security;
alter table cards enable row level security;
alter table votes enable row level security;
alter table comments enable row level security;
alter table notifications enable row level security;
alter table audit_log enable row level security;

-- Everyone on the roster can read the board's shared data.
create policy roster_read_people   on people   for select using (current_person_id() is not null);
create policy roster_read_settings on settings for select using (current_person_id() is not null);
create policy roster_read_vendors  on vendors  for select using (current_person_id() is not null);
create policy roster_read_contracts on contracts for select using (current_person_id() is not null);
create policy roster_read_reports  on reports  for select using (current_person_id() is not null);
create policy roster_read_cards    on cards    for select using (
  current_person_id() is not null
  and (status <> 'draft' or is_manager())
  and (not confidential or current_role_name() in ('admin','president','director','manager'))
);
create policy roster_read_comments on comments for select using (current_person_id() is not null);
create policy roster_read_notifications on notifications for select using (is_manager());
create policy roster_read_audit    on audit_log for select using (current_role_name()='admin');

-- Secret ballot: you see your own vote; everyone sees all votes once the card is closed.
create policy votes_read on votes for select using (
  person_id = current_person_id()
  or exists (select 1 from cards c where c.id = votes.card_id and c.status = 'closed')
);
-- Votes are written only through cast_vote().

-- Managers (admin/president/manager) maintain cards, reports, contracts, vendors.
create policy mgr_write_cards     on cards     for all using (is_manager()) with check (is_manager());
create policy mgr_write_reports   on reports   for all using (is_manager()) with check (is_manager());
create policy mgr_write_contracts on contracts for all using (is_manager()) with check (is_manager());
create policy mgr_write_vendors   on vendors   for all using (is_manager()) with check (is_manager());
create policy admin_write_people  on people    for all using (current_role_name()='admin') with check (current_role_name()='admin');
create policy admin_write_settings on settings for all using (current_role_name()='admin') with check (current_role_name()='admin');

-- Anyone on the roster can comment / ask a question, as themselves.
create policy comments_insert on comments for insert with check (person_id = current_person_id());
create policy comments_delete on comments for delete using (person_id = current_person_id() or is_manager());

grant usage on schema public to anon, authenticated;
grant select on card_progress to authenticated;
grant select, insert, update, delete on all tables in schema public to authenticated;
grant execute on all functions in schema public to authenticated;
revoke all on people from anon;
