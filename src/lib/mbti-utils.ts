import type { MbtiType, MbtiStatus, VoteSummary } from './types'

export function getMbtiStatus(
  person: { mbti_official: MbtiType | null; mbti_confirmed: boolean },
  votes: VoteSummary[],
  thresholdCount: number = 30,
  thresholdPercent: number = 55
): MbtiStatus {
  if (person.mbti_confirmed && person.mbti_official) return 'confirmed'

  const totalVotes = votes.reduce((sum, v) => sum + v.vote_count, 0)
  if (totalVotes < thresholdCount) return 'voting'

  const topVote = votes.reduce((top, v) => (v.vote_count > (top?.vote_count ?? 0) ? v : top), votes[0])
  if (topVote && topVote.percentage >= thresholdPercent) return 'tentative'

  return 'voting'
}

export function getEffectiveMbti(
  person: { mbti_official: MbtiType | null },
  votes: VoteSummary[],
  status: MbtiStatus
): MbtiType | null {
  if (status === 'confirmed') return person.mbti_official
  if (status === 'tentative' && votes.length > 0) {
    const top = votes.reduce((a, b) => (a.vote_count > b.vote_count ? a : b))
    return top.mbti_type
  }
  return null
}

export function hashIp(ip: string): string {
  let hash = 0
  for (let i = 0; i < ip.length; i++) {
    const char = ip.charCodeAt(i)
    hash = (hash << 5) - hash + char
    hash = hash & hash
  }
  return Math.abs(hash).toString(36)
}

export const STATUS_LABELS: Record<MbtiStatus, string> = {
  confirmed: '공식 확인',
  tentative: '잠정 확정',
  voting: '투표 중',
}

export const STATUS_COLORS: Record<MbtiStatus, string> = {
  confirmed: 'bg-[#F0FDF4] text-[#16A34A] border-[#BBF7D0]',
  tentative: 'bg-[#FFFBEB] text-[#D97706] border-[#FDE68A]',
  voting:    'bg-[#F7F7F5] text-[#6B6B6B] border-[#E5E5E3]',
}
