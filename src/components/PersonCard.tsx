import Link from 'next/link'
import Image from 'next/image'
import type { Person, VoteSummary, MbtiType } from '@/lib/types'
import { getMbtiStatus, getEffectiveMbti } from '@/lib/mbti-utils'
import MbtiBadge from './MbtiBadge'

interface Props {
  person: Person
  votes?: VoteSummary[]
  thresholdCount?: number
  thresholdPercent?: number
}

const STATUS_DOT: Record<string, { color: string; label: string }> = {
  confirmed: { color: '#22C55E', label: '공식' },
  tentative: { color: '#F59E0B', label: '잠정' },
  voting:    { color: '#D1D5DB', label: '투표중' },
}

export default function PersonCard({ person, votes = [], thresholdCount = 30, thresholdPercent = 55 }: Props) {
  const status = getMbtiStatus(person, votes, thresholdCount, thresholdPercent)
  const effectiveMbti = getEffectiveMbti(person, votes, status)
  const dot = STATUS_DOT[status]

  return (
    <Link href={`/people/${person.id}`} className="block group">
      <div className="person-card overflow-hidden">
        {/* 이미지 */}
        <div className="relative aspect-square bg-[#F0F0EE] overflow-hidden rounded-t-[15px]">
          {person.image_url ? (
            <Image src={person.image_url} alt={person.name} fill className="object-cover transition-transform duration-500 group-hover:scale-[1.03]" />
          ) : (
            <div className="absolute inset-0 flex items-center justify-center">
              <span className="text-4xl font-black text-[#D0D0CE] select-none">{person.name[0]}</span>
            </div>
          )}

          {/* MBTI 오버레이 */}
          {effectiveMbti && (
            <div className="absolute bottom-2.5 left-2.5">
              <MbtiBadge type={effectiveMbti as MbtiType} size="sm" />
            </div>
          )}

          {/* 상태 dot */}
          <div className="absolute top-2.5 right-2.5 flex items-center gap-1 bg-white/80 backdrop-blur-sm rounded-full px-2 py-0.5">
            <div className="w-1.5 h-1.5 rounded-full" style={{ backgroundColor: dot.color }} />
            <span className="text-[10px] text-[#6B6B6B] font-medium">{dot.label}</span>
          </div>
        </div>

        {/* 정보 */}
        <div className="p-3">
          <p className="font-semibold text-[13.5px] text-[#111111] leading-tight truncate">{person.name}</p>
          <div className="flex items-center justify-between mt-1">
            {person.name_en ? (
              <p className="text-[11px] text-[#ABABAB] truncate">{person.name_en}</p>
            ) : (
              <p className="text-[11px] text-[#ABABAB]">
                {person.nationality === 'foreign' ? '외국인' : ''}
              </p>
            )}
            {person.subcategories && (
              <p className="text-[11px] text-[#ABABAB] shrink-0 ml-1">{(person.subcategories as any).name}</p>
            )}
          </div>
        </div>
      </div>
    </Link>
  )
}
