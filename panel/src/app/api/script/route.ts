import { NextRequest, NextResponse } from 'next/server'
import { getUser } from '@/lib/db'

export async function GET(req: NextRequest) {
  const key = req.nextUrl.searchParams.get('key')

  if (!key) {
    return new NextResponse('-- Invalid request', { status: 400 })
  }

  const user = await getUser(key)

  if (!user || user.revoked) {
    return new NextResponse('-- Invalid or revoked key', { status: 403 })
  }

  const script = `shared.bapeKey = "${key}"
loadstring(game:HttpGet('https://raw.githubusercontent.com/sessioncodes/bapev4/'..readfile('bapevape/profiles/commit.txt')..'/loader.lua', false), 'loader')()`

  return new NextResponse(script, {
    headers: { 'Content-Type': 'text/plain' }
  })
}
