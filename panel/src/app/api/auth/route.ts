import { NextRequest, NextResponse } from 'next/server'
import { getUser, getUserByDiscord } from '@/lib/db'

export async function POST(req: NextRequest) {
  const { key, discord_id } = await req.json()

  if (!key && !discord_id) {
    return NextResponse.json({ success: false, error: 'Missing key or discord_id' }, { status: 400 })
  }

  const user = key ? await getUser(key) : await getUserByDiscord(discord_id)

  if (!user) {
    return NextResponse.json({ success: false, error: 'Invalid key' }, { status: 401 })
  }

  return NextResponse.json({
    success: true,
    user: {
      key: user.key,
      discord_id: user.discord_id,
      hwid: user.hwid ? user.hwid.slice(0, 8) + '...' : 'Not set',
      granted_at: user.granted_at,
      revoked: user.revoked
    }
  })
}
