import { supabase } from '@/lib/supabase'
import { getMbtiStatus } from '@/lib/mbti-utils'
import type { Person, VoteSummary } from '@/lib/types'
import PersonCard from '@/components/PersonCard'
import { Vote } from 'lucide-react'

export default async function VotePage() {
  const [peopleRes, votesRes, settingsRes] = await Promise.all([
    supabase.from('people').select('*, subcategories(*, categories(*))').eq('mbti_confirmed', false),
    supabase.from('vote_summary').select('*'),
    supabase.from('settings').select('*').in('key', ['vote_threshold_count', 'vote_threshold_percent']),
  ])

  const people = (peopleRes.data || []) as Person[]
  const allVotes = votesRes.data || []
  const settings = settingsRes.data || []

  const thresholdCount = parseInt(settings.find(s => s.key === 'vote_threshold_count')?.value || '30')
  const thresholdPercent = parseInt(settings.find(s => s.key === 'vote_threshold_percent')?.value || '55')

  const votesMap: Record<number, VoteSummary[]> = {}
  for (const v of allVotes) {
    if (!votesMap[v.person_id]) votesMap[v.person_id] = []
    votesMap[v.person_id].push(v as VoteSummary)
  }

  const needVote = people
    .filter(p => {
      const pvotes = votesMap[p.id] || []
      const status = getMbtiStatus(p, pvotes, thresholdCount, thresholdPercent)
      return status === 'voting'
    })
    .sort((a, b) => {
      const va = votesMap[a.id]?.reduce((s, v) => s + v.vote_count, 0) || 0
      const vb = votesMap[b.id]?.reduce((s, v) => s + v.vote_count, 0) || 0
      return vb - va
    })

  const tentative = people.filter(p => {
    const pvotes = votesMap[p.id] || []
    return getMbtiStatus(p, pvotes, thresholdCount, thresholdPercent) === 'tentative'
  })

  return (
    <div className="max-w-6xl mx-auto px-4 py-8">
      <div className="mb-8">
        <h1 className="text-2xl font-black text-gray-900 flex items-center gap-2 mb-1">
          <Vote size={22} className="text-orange-500" />
          MBTI 투표
        </h1>
        <p className="text-gray-500 text-sm">아직 MBTI가 확정되지 않은 인물들이에요. 여러분의 생각을 투표해주세요!</p>
      </div>

      {tentative.length > 0 && (
        <section className="mb-10">
          <h2 className="text-lg font-bold text-gray-800 mb-4">🔶 잠정 확정된 인물 ({tentative.length}명)</h2>
          <p className="text-sm text-gray-500 mb-4">충분한 투표가 모였지만 아직 공식 확인이 필요한 인물들이에요.</p>
          <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4">
            {tentative.map(p => (
              <PersonCard key={p.id} person={p} votes={votesMap[p.id] || []} thresholdCount={thresholdCount} thresholdPercent={thresholdPercent} />
            ))}
          </div>
        </section>
      )}

      <section>
        <h2 className="text-lg font-bold text-gray-800 mb-4">🗳️ 투표가 필요한 인물 ({needVote.length}명)</h2>
        {needVote.length === 0 ? (
          <p className="text-gray-400 text-center py-16">현재 투표가 필요한 인물이 없습니다.</p>
        ) : (
          <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4">
            {needVote.map(p => (
              <PersonCard key={p.id} person={p} votes={votesMap[p.id] || []} thresholdCount={thresholdCount} thresholdPercent={thresholdPercent} />
            ))}
          </div>
        )}
      </section>
    </div>
  )
}
