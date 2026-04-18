'use client'

import { useState } from 'react'
import type { MbtiType, VoteSummary, MbtiStatus } from '@/lib/types'
import { MBTI_TYPES, MBTI_COLORS, MBTI_DESCRIPTIONS } from '@/lib/types'
import { getMbtiStatus } from '@/lib/mbti-utils'
import MbtiBadge from './MbtiBadge'

interface Props {
  personId: number
  votes: VoteSummary[]
  totalVotes: number
  status: MbtiStatus
  thresholdCount: number
  thresholdPercent: number
  officialMbti: MbtiType | null
}

export default function VoteSection({ personId, votes: initialVotes, totalVotes: initialTotal, status: initialStatus, thresholdCount, thresholdPercent, officialMbti }: Props) {
  const [votes, setVotes] = useState(initialVotes)
  const [totalVotes, setTotalVotes] = useState(initialTotal)
  const [voted, setVoted] = useState(false)
  const [selectedType, setSelectedType] = useState<MbtiType | null>(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')

  const status = getMbtiStatus({ mbti_official: officialMbti, mbti_confirmed: initialStatus === 'confirmed' }, votes, thresholdCount, thresholdPercent)
  const topVote = votes[0]

  async function handleVote(type: MbtiType) {
    if (voted || loading) return
    setSelectedType(type)
    setLoading(true)
    setError('')
    const res = await fetch(`/api/people/${personId}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ action: 'vote', mbti_type: type }),
    })
    const data = await res.json()
    setLoading(false)
    if (!res.ok) { setError(data.error || '투표에 실패했습니다'); setSelectedType(null); return }
    const newVotes = (data.votes || []).sort((a: VoteSummary, b: VoteSummary) => b.vote_count - a.vote_count)
    setVotes(newVotes)
    setTotalVotes(newVotes.reduce((s: number, v: VoteSummary) => s + v.vote_count, 0))
    setVoted(true)
  }

  if (initialStatus === 'confirmed') {
    return (
      <div className="card p-6 mb-4">
        <p className="text-[12px] font-medium text-[#ABABAB] uppercase tracking-widest mb-1">MBTI</p>
        <p className="text-[13px] text-[#6B6B6B]">공식적으로 확인된 MBTI입니다.</p>
      </div>
    )
  }

  return (
    <div className="card p-6 mb-4">
      <div className="flex items-center justify-between mb-5">
        <div>
          <p className="text-[12px] font-medium text-[#ABABAB] uppercase tracking-widest mb-0.5">Community Vote</p>
          <h3 className="text-[16px] font-bold text-[#111111]">이 인물의 MBTI는?</h3>
        </div>
        <div className="text-right">
          {totalVotes > 0 && <p className="text-[13px] font-semibold text-[#111111]">{totalVotes.toLocaleString()}표</p>}
          <p className="text-[11px] text-[#ABABAB]">
            {thresholdCount}표 + {thresholdPercent}% → 잠정 확정
          </p>
        </div>
      </div>

      {/* 잠정 확정 배너 */}
      {status === 'tentative' && topVote && (
        <div className="flex items-center gap-3 bg-[#FFFBEB] border border-[#FDE68A] rounded-xl px-4 py-3 mb-5">
          <MbtiBadge type={topVote.mbti_type as MbtiType} size="sm" />
          <span className="text-[13px] text-[#92400E]">
            {topVote.percentage}% ({topVote.vote_count.toLocaleString()}표) — 잠정 확정
          </span>
        </div>
      )}

      {/* 결과 바 (투표 후 또는 기존 데이터 있을 때) */}
      {totalVotes > 0 && (
        <div className="space-y-2.5 mb-5">
          {votes.slice(0, 6).map(v => (
            <div key={v.mbti_type} className="flex items-center gap-3">
              <span className="text-[11px] font-bold w-11 text-right shrink-0" style={{ color: MBTI_COLORS[v.mbti_type as MbtiType] }}>
                {v.mbti_type}
              </span>
              <div className="flex-1 bg-[#F0F0EE] rounded-full h-[3px]">
                <div className="vote-bar rounded-full" style={{ width: `${v.percentage}%`, backgroundColor: MBTI_COLORS[v.mbti_type as MbtiType] }} />
              </div>
              <span className="text-[11px] text-[#ABABAB] w-10 shrink-0">{v.percentage}%</span>
            </div>
          ))}
          {votes.length > 6 && <p className="text-[11px] text-[#ABABAB] pl-14">{votes.length - 6}개 유형 더...</p>}
        </div>
      )}

      {/* 투표 버튼 */}
      {voted ? (
        <div className="bg-[#F7F7F5] rounded-xl px-4 py-3 text-[13px] text-[#6B6B6B]">
          <strong className="text-[#111111]">{selectedType}</strong>으로 투표해주셨어요. 감사합니다!
        </div>
      ) : (
        <div className="grid grid-cols-4 gap-1.5">
          {MBTI_TYPES.map(type => (
            <button
              key={type}
              onClick={() => handleVote(type)}
              disabled={loading}
              className="py-3 rounded-xl text-center transition-all disabled:opacity-40 border"
              style={{
                borderColor: selectedType === type ? MBTI_COLORS[type] : `${MBTI_COLORS[type]}20`,
                backgroundColor: `${MBTI_COLORS[type]}08`,
              }}
            >
              <div className="text-[11px] font-bold" style={{ color: MBTI_COLORS[type] }}>{type}</div>
              <div className="text-[9px] text-[#ABABAB] mt-0.5 leading-tight">{MBTI_DESCRIPTIONS[type]}</div>
            </button>
          ))}
        </div>
      )}
      {error && <p className="text-[12px] text-red-500 mt-2 text-center">{error}</p>}
    </div>
  )
}
