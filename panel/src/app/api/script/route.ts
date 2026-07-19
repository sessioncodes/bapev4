import { NextRequest, NextResponse } from 'next/server'
import { supabase } from '@/lib/supabase'

export async function GET(req: NextRequest) {
  const key = req.nextUrl.searchParams.get('key')

  if (!key) {
    return new NextResponse('-- Invalid request', { status: 400 })
  }

  const { data: user } = await supabase
    .from('users')
    .select('*')
    .eq('key', key)
    .single()

  if (!user || user.revoked) {
    return new NextResponse('-- Invalid or revoked key', { status: 403 })
  }

  const script = `shared.bapeKey = "${key}"
loadstring(game:HttpGet('https://raw.githubusercontent.com/sessioncodes/bapev4/'..readfile('bapevape/profiles/commit.txt')..'/loader.lua', false), 'loader')()`

  return new NextResponse(script, {
    headers: { 'Content-Type': 'text/plain' }
  })
}
