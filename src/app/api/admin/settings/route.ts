import { NextRequest, NextResponse } from 'next/server'
import { supabase } from '@/lib/supabase'

export async function GET(req: NextRequest) {
  const auth = req.headers.get('x-admin-password')
  if (auth !== process.env.ADMIN_PASSWORD) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }

  const { data } = await supabase.from('settings').select('*')
  const settings: Record<string, string> = {}
  for (const row of data || []) settings[row.key] = row.value

  return NextResponse.json(settings)
}
