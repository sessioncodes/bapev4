import { NextRequest, NextResponse } from 'next/server'
import { getUser, getUserByDiscord, createUser, revokeUser, unrevokeUser, resetHwidByDiscord, getAllUsers, sql } from '@/lib/db'
import crypto from 'crypto'

function generateKey() {
  return 'BAPE-' + crypto.randomBytes(16).toString('hex').toUpperCase()
}

export async function POST(req: NextRequest) {
  const secret = req.headers.get('x-admin-key')
  if (secret !== process.env.ADMIN_SECRET) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }

  const { action, discord_id, count } = await req.json()

  if (action === 'grant') {
    if (!discord_id) return NextResponse.json({ error: 'Missing discord_id' }, { status: 400 })

    const existing = await getUserByDiscord(discord_id)
    if (existing && !existing.revoked) {
      return NextResponse.json({ error: 'User already has an active key', key: existing.key })
    }
    if (existing && existing.revoked) {
      await unrevokeUser(discord_id)
      return NextResponse.json({ success: true, key: existing.key, action: 'regranted' })
    }

    const key = generateKey()
    await createUser(key, discord_id)
    return NextResponse.json({ success: true, key })
  }

  if (action === 'revoke') {
    if (!discord_id) return NextResponse.json({ error: 'Missing discord_id' }, { status: 400 })
    await revokeUser(discord_id)
    return NextResponse.json({ success: true })
  }

  if (action === 'resethwid') {
    if (!discord_id) return NextResponse.json({ error: 'Missing discord_id' }, { status: 400 })
    await resetHwidByDiscord(discord_id)
    return NextResponse.json({ success: true })
  }

  if (action === 'genkey') {
    const num = Math.min(count || 1, 10)
    const keys: string[] = []
    for (let i = 0; i < num; i++) {
      const key = generateKey()
      await createUser(key, 'unclaimed')
      keys.push(key)
    }
    return NextResponse.json({ success: true, keys })
  }

  if (action === 'users') {
    const users = await getAllUsers()
    const active = users.filter(u => !u.revoked).length
    const revoked = users.filter(u => u.revoked).length
    return NextResponse.json({ success: true, total: users.length, active, revoked })
  }

  return NextResponse.json({ error: 'Unknown action' }, { status: 400 })
}
