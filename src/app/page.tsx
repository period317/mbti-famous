import Link from 'next/link'
import { supabase } from '@/lib/supabase'
import PersonCard from '@/components/PersonCard'
import { getMbtiStatus } from '@/lib/mbti-utils'
import type { Person, VoteSummary, MbtiType } from '@/lib/types'
import { MBTI_TYPES, MBTI_COLORS, MBTI_DESCRIPTIONS } from '@/lib/types'
import { ArrowRight } from 'lucide-react'

async function getHomeData() {
  const [peopleRes, votesRes, settingsRes] = await Promise.all([
    supabase.from('people').select('*, subcategories(*, categories(*))').order('view_count', { ascending: false }).limit(100),
    supabase.from('vote_summary').select('*'),
    supabase.from('settings').select('*').in('key', ['vote_threshold_count', 'vote_threshold_percent']),
  ])

  const people = (peopleRes.data || []) as Person[]
  const allVotes = votesRes.data || []
  const settings = settingsRes.data || []

  const thresholdCount = parseInt(settings.find((s: any) => s.key === 'vote_threshold_count')?.value || '30')
  const thresholdPercent = parseInt(settings.find((s: any) => s.key === 'vote_threshold_percent')?.value || '55')

  const votesMap: Record<number, VoteSummary[]> = {}
  for (const v of allVotes) {
    if (!votesMap[v.person_id]) votesMap[v.person_id] = []
    votesMap[v.person_id].push(v as VoteSummary)
  }

  const needVote = people
    .filter(p => {
      const pvotes = votesMap[p.id] || []
      const status = getMbtiStatus(p, pvotes, thresholdCount, thresholdPercent)
      const total = pvotes.reduce((s, v) => s + v.vote_count, 0)
      return status === 'voting' && total >= 3
    })
    .sort((a, b) => {
      const va = votesMap[a.id]?.reduce((s, v) => s + v.vote_count, 0) || 0
      const vb = votesMap[b.id]?.reduce((s, v) => s + v.vote_count, 0) || 0
      return vb - va
    })
    .slice(0, 8)

  return { people, votesMap, needVote, trending: people.slice(0, 8), thresholdCount, thresholdPercent }
}

export default async function HomePage() {
  const { people, votesMap, needVote, trending, thresholdCount, thresholdPercent } = await getHomeData()
  const totalVotes = Object.values(votesMap).flat().reduce((s, v) => s + v.vote_count, 0)

  return (
    <div>
      {/* 히어로 — 미니멀 화이트 */}
      <section className="bg-white border-b border-[#E5E5E3]">
        <div className="max-w-5xl mx-auto px-5 py-16 md:py-24">
          <p className="text-[12px] font-medium text-[#ABABAB] tracking-widest uppercase mb-4">MBTI Famous</p>
          <h1 className="text-[2.5rem] md:text-[3.5rem] font-black tracking-tight text-[#111111] leading-[1.1] mb-5">
            유명인의 MBTI를<br />한곳에서.
          </h1>
          <p className="text-[15px] text-[#6B6B6B] mb-8 max-w-md leading-relaxed">
            출처가 있는 공식 정보와 커뮤니티 투표로 추정한 유형을 구분해서 보여드려요.
          </p>
          <div className="flex items-center gap-3">
            <Link href="/people" className="btn-primary inline-flex items-center gap-2">
              전체 인물 보기
            </Link>
            <Link href="/vote" className="btn-secondary inline-flex items-center gap-2">
              투표하기 <ArrowRight size={13} />
            </Link>
          </div>
        </div>
      </section>

      {/* 통계 */}
      <section className="bg-[#F7F7F5] border-b border-[#E5E5E3]">
        <div className="max-w-5xl mx-auto px-5 py-5 flex gap-10 flex-wrap">
          {[
            { value: `${people.length}+`, label: '등록 인물' },
            { value: `${totalVotes.toLocaleString()}+`, label: '누적 투표' },
            { value: '16', label: 'MBTI 유형' },
          ].map(s => (
            <div key={s.label}>
              <div className="text-[22px] font-black text-[#111111]">{s.value}</div>
              <div className="text-[12px] text-[#ABABAB] mt-0.5">{s.label}</div>
            </div>
          ))}
        </div>
      </section>

      <div className="max-w-5xl mx-auto px-5 py-10 space-y-14">

        {/* 투표 필요 */}
        {needVote.length > 0 && (
          <section>
            <div className="flex items-end justify-between mb-5">
              <div>
                <p className="text-[11px] font-medium text-[#ABABAB] uppercase tracking-widest mb-1">Vote Needed</p>
                <h2 className="text-[20px] font-bold text-[#111111]">투표가 필요한 인물</h2>
              </div>
              <Link href="/vote" className="text-[13px] text-[#6B6B6B] hover:text-[#111111] flex items-center gap-1 transition-colors">
                전체 <ArrowRight size={12} />
              </Link>
            </div>
            <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-3">
              {needVote.map(p => (
                <PersonCard key={p.id} person={p} votes={votesMap[p.id] || []} thresholdCount={thresholdCount} thresholdPercent={thresholdPercent} />
              ))}
            </div>
          </section>
        )}

        {/* 인기 인물 */}
        {trending.length > 0 && (
          <section>
            <div className="flex items-end justify-between mb-5">
              <div>
                <p className="text-[11px] font-medium text-[#ABABAB] uppercase tracking-widest mb-1">Trending</p>
                <h2 className="text-[20px] font-bold text-[#111111]">인기 인물</h2>
              </div>
              <Link href="/people?sort=views" className="text-[13px] text-[#6B6B6B] hover:text-[#111111] flex items-center gap-1 transition-colors">
                전체 <ArrowRight size={12} />
              </Link>
            </div>
            <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-3">
              {trending.map(p => (
                <PersonCard key={p.id} person={p} votes={votesMap[p.id] || []} thresholdCount={thresholdCount} thresholdPercent={thresholdPercent} />
              ))}
            </div>
          </section>
        )}

        {/* MBTI 유형별 */}
        <section>
          <div className="mb-5">
            <p className="text-[11px] font-medium text-[#ABABAB] uppercase tracking-widest mb-1">Browse by Type</p>
            <h2 className="text-[20px] font-bold text-[#111111]">유형별 보기</h2>
          </div>
          <div className="grid grid-cols-4 sm:grid-cols-8 gap-2">
            {MBTI_TYPES.map(type => (
              <Link
                key={type}
                href={`/people?mbti=${type}`}
                className="rounded-xl p-3 text-center transition-all hover:shadow-sm group"
                style={{
                  backgroundColor: `${MBTI_COLORS[type as MbtiType]}0E`,
                  border: `1px solid ${MBTI_COLORS[type as MbtiType]}22`,
                }}
              >
                <div className="font-bold text-[12px] tracking-wide" style={{ color: MBTI_COLORS[type as MbtiType] }}>{type}</div>
                <div className="text-[10px] text-[#ABABAB] mt-0.5 leading-tight">{MBTI_DESCRIPTIONS[type as MbtiType]}</div>
              </Link>
            ))}
          </div>
        </section>
      </div>
    </div>
  )
}
