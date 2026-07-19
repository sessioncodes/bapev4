import { NextRequest, NextResponse } from 'next/server'
import { supabase } from '@/lib/supabase'

export async function GET(req: NextRequest) {
  const key = req.nextUrl.searchParams.get('key')
  const hwid = req.nextUrl.searchParams.get('hwid')

  if (!key || !hwid) {
    return NextResponse.json({ success: false, error: 'Missing key or hwid' }, { status: 400 })
  }

  const { data: user, error } = await supabase
    .from('users')
    .select('*')
    .eq('key', key)
    .single()

  if (error || !user) {
    return NextResponse.json({ success: false, error: 'Invalid key' }, { status: 401 })
  }

  if (user.revoked) {
    return NextResponse.json({ success: false, error: 'Key has been revoked' }, { status: 403 })
  }

  if (user.hwid && user.hwid !== hwid) {
    return NextResponse.json({ success: false, error: 'HWID mismatch' }, { status: 403 })
  }

  if (!user.hwid) {
    await supabase
      .from('users')
      .update({ hwid })
      .eq('id', user.id)
  }

  return NextResponse.json({ success: true, discord_id: user.discord_id })
}

export async function POST(req: NextRequest) {
  const { key, hwid } = await req.json()

  if (!key || !hwid) {
    return NextResponse.json({ success: false, error: 'Missing key or hwid' }, { status: 400 })
  }

  const { data: user, error } = await supabase
    .from('users')
    .select('*')
    .eq('key', key)
    .single()

  if (error || !user) {
    return NextResponse.json({ success: false, error: 'Invalid key' }, { status: 401 })
  }

  if (user.revoked) {
    return NextResponse.json({ success: false, error: 'Key has been revoked' }, { status: 403 })
  }

  if (user.hwid && user.hwid !== hwid) {
    return NextResponse.json({ success: false, error: 'HWID mismatch' }, { status: 403 })
  }

  if (!user.hwid) {
    await supabase
      .from('users')
      .update({ hwid })
      .eq('id', user.id)
  }

  return NextResponse.json({ success: true, discord_id: user.discord_id })
}
