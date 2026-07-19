import { createClient } from '@supabase/supabase-js'

export const supabase = createClient(
  process.env.SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_KEY!
)

export interface User {
  id: string
  key: string
  discord_id: string
  hwid: string | null
  granted_at: string
  revoked: boolean
}
