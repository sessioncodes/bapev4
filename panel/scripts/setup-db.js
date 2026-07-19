const { sql } = require('@vercel/postgres')

async function setup() {
  await sql`
    CREATE TABLE IF NOT EXISTS users (
      id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
      key TEXT UNIQUE NOT NULL,
      discord_id TEXT NOT NULL,
      hwid TEXT,
      granted_at TIMESTAMPTZ DEFAULT NOW(),
      revoked BOOLEAN DEFAULT false
    )
  `
  await sql`CREATE INDEX IF NOT EXISTS idx_users_key ON users(key)`
  await sql`CREATE INDEX IF NOT EXISTS idx_users_discord_id ON users(discord_id)`
  console.log('Database setup complete.')
  process.exit(0)
}

setup().catch(e => { console.error(e); process.exit(1) })
