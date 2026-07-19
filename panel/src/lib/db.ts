import { sql } from '@vercel/postgres'

export async function getUser(key: string) {
  const { rows } = await sql`SELECT * FROM users WHERE key = ${key} LIMIT 1`
  return rows[0] || null
}

export async function getUserByDiscord(discord_id: string) {
  const { rows } = await sql`SELECT * FROM users WHERE discord_id = ${discord_id} LIMIT 1`
  return rows[0] || null
}

export async function createUser(key: string, discord_id: string) {
  await sql`INSERT INTO users (key, discord_id, hwid, granted_at, revoked) VALUES (${key}, ${discord_id}, NULL, NOW(), false)`
}

export async function revokeUser(discord_id: string) {
  await sql`UPDATE users SET revoked = true, hwid = NULL WHERE discord_id = ${discord_id}`
}

export async function unrevokeUser(discord_id: string) {
  await sql`UPDATE users SET revoked = false WHERE discord_id = ${discord_id}`
}

export async function setHwid(key: string, hwid: string) {
  await sql`UPDATE users SET hwid = ${hwid} WHERE key = ${key}`
}

export async function resetHwid(key: string) {
  await sql`UPDATE users SET hwid = NULL WHERE key = ${key}`
}

export async function resetHwidByDiscord(discord_id: string) {
  await sql`UPDATE users SET hwid = NULL WHERE discord_id = ${discord_id}`
}

export async function getAllUsers() {
  const { rows } = await sql`SELECT discord_id, revoked, hwid, granted_at FROM users WHERE discord_id != 'unclaimed'`
  return rows
}

export { sql }
