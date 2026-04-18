import { NextRequest, NextResponse } from 'next/server'
import { supabase } from '@/lib/supabase'

export async function GET(req: NextRequest) {
  const ids = req.nextUrl.searchParams.get('ids')
  if (!ids) return NextResponse.json({ votes: {} })

  const idList = ids.split(',').map(Number).filter(Boolean)
  const { data } = await supabase
    .from('vote_summary')
    .select('*')
    .in('person_id', idList)

  const votes: Record<number, typeof data> = {}
  for (const row of data || []) {
    if (!votes[row.person_id]) votes[row.person_id] = []
    votes[row.person_id]!.push(row)
  }

  return NextResponse.json({ votes })
}
