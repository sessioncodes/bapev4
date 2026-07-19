import { NextRequest, NextResponse } from 'next/server'
import { supabase } from '@/lib/supabase'

export async function POST(req: NextRequest) {
  const { key } = await req.json()

  if (!key) {
    return NextResponse.json({ success: false, error: 'Missing key' }, { status: 400 })
  }

  const { data: user, error } = await supabase
    .from('users')
    .select('key, discord_id, hwid, granted_at, revoked')
    .eq('key', key)
    .single()

  if (error || !user) {
    return NextResponse.json({ success: false, error: 'Invalid key' }, { status: 401 })
  }

  return NextResponse.json({
    success: true,
    user: {
      discord_id: user.discord_id,
      hwid: user.hwid ? user.hwid.slice(0, 8) + '...' : 'Not set',
      granted_at: user.granted_at,
      revoked: user.revoked
    }
  })
}
