import { NextRequest, NextResponse } from 'next/server'
import { supabase } from '@/lib/supabase'

export async function POST(req: NextRequest) {
  const { key, discord_id } = await req.json()

  if (!key && !discord_id) {
    return NextResponse.json({ success: false, error: 'Missing key or discord_id' }, { status: 400 })
  }

  const query = supabase.from('users').update({ hwid: null })
  if (key) {
    query.eq('key', key)
  } else {
    query.eq('discord_id', discord_id)
  }

  const { error } = await query

  if (error) {
    return NextResponse.json({ success: false, error: 'Failed to reset HWID' }, { status: 500 })
  }

  return NextResponse.json({ success: true })
}
