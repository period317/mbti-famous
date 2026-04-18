import { NextRequest, NextResponse } from 'next/server'
import { supabase } from '@/lib/supabase'
import { headers } from 'next/headers'
import { hashIp } from '@/lib/mbti-utils'

export async function GET(_req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const { id } = await params

  const { data: person, error } = await supabase
    .from('people')
    .select(`*, subcategories(*, categories(*))`)
    .eq('id', id)
    .single()

  if (error || !person) return NextResponse.json({ error: 'Not found' }, { status: 404 })

  await supabase.rpc('increment_view_count', { person_id: parseInt(id) })

  const { data: votes } = await supabase
    .from('vote_summary')
    .select('*')
    .eq('person_id', id)

  const { data: comments } = await supabase
    .from('comments')
    .select('id, nickname, content, created_at')
    .eq('person_id', id)
    .order('created_at', { ascending: false })
    .limit(50)

  return NextResponse.json({ person, votes: votes || [], comments: comments || [] })
}

export async function POST(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const { id } = await params
  const body = await req.json()
  const { action } = body

  const headersList = await headers()
  const ip = headersList.get('x-forwarded-for') || headersList.get('x-real-ip') || '127.0.0.1'
  const ipHash = hashIp(ip.split(',')[0].trim())

  if (action === 'vote') {
    const { mbti_type } = body
    const { error } = await supabase.from('votes').insert({
      person_id: parseInt(id),
      mbti_type,
      ip_hash: ipHash,
    })
    if (error) {
      if (error.code === '23505') return NextResponse.json({ error: '이미 투표하셨습니다' }, { status: 409 })
      return NextResponse.json({ error: error.message }, { status: 500 })
    }
    const { data: votes } = await supabase.from('vote_summary').select('*').eq('person_id', id)
    return NextResponse.json({ ok: true, votes })
  }

  if (action === 'comment') {
    const { nickname, content } = body
    if (!nickname?.trim() || !content?.trim()) {
      return NextResponse.json({ error: '닉네임과 내용을 입력해주세요' }, { status: 400 })
    }
    const { data, error } = await supabase.from('comments').insert({
      person_id: parseInt(id),
      nickname: nickname.trim().slice(0, 20),
      content: content.trim().slice(0, 500),
      ip_hash: ipHash,
    }).select('id, nickname, content, created_at').single()
    if (error) return NextResponse.json({ error: error.message }, { status: 500 })
    return NextResponse.json({ ok: true, comment: data })
  }

  return NextResponse.json({ error: 'Unknown action' }, { status: 400 })
}
