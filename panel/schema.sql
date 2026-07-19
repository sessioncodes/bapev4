create table users (
  id uuid default gen_random_uuid() primary key,
  key text unique not null,
  discord_id text not null,
  hwid text,
  granted_at timestamptz default now(),
  revoked boolean default false
);

create index idx_users_key on users(key);
create index idx_users_discord_id on users(discord_id);
create index idx_users_hwid on users(hwid);
