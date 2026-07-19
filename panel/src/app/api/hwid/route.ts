import { NextRequest, NextResponse } from 'next/server'
import { resetHwid, resetHwidByDiscord } from '@/lib/db'

export async function POST(req: NextRequest) {
  const { key, discord_id } = await req.json()

  if (!key && !discord_id) {
    return NextResponse.json({ success: false, error: 'Missing key or discord_id' }, { status: 400 })
  }

  try {
    if (key) {
      await resetHwid(key)
    } else {
      await resetHwidByDiscord(discord_id)
    }
  } catch {
    return NextResponse.json({ success: false, error: 'Failed to reset HWID' }, { status: 500 })
  }

  return NextResponse.json({ success: true })
}
