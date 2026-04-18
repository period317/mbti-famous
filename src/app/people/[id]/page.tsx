import { notFound } from 'next/navigation'
import { supabase } from '@/lib/supabase'
import { getMbtiStatus, getEffectiveMbti, STATUS_LABELS, STATUS_COLORS } from '@/lib/mbti-utils'
import MbtiBadge from '@/components/MbtiBadge'
import VoteSection from '@/components/VoteSection'
import CommentSection from '@/components/CommentSection'
import Image from 'next/image'
import Link from 'next/link'
import type { MbtiType, VoteSummary, Comment } from '@/lib/types'
import { ExternalLink, ChevronLeft, Eye } from 'lucide-react'

async function getPersonData(id: string) {
  const [personRes, votesRes, commentsRes, settingsRes] = await Promise.all([
    supabase.from('people').select('*, subcategories(*, categories(*))').eq('id', id).single(),
    supabase.from('vote_summary').select('*').eq('person_id', id),
    supabase.from('comments').select('id, nickname, content, created_at').eq('person_id', id).order('created_at', { ascending: false }).limit(50),
    supabase.from('settings').select('*').in('key', ['vote_threshold_count', 'vote_threshold_percent']),
  ])
  return {
    person: personRes.data,
    votes: (votesRes.data || []) as VoteSummary[],
    comments: (commentsRes.data || []) as Comment[],
    settings: settingsRes.data || [],
  }
}

export default async function PersonPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params
  const { person, votes, comments, settings } = await getPersonData(id)
  if (!person) notFound()

  await supabase.rpc('increment_view_count', { person_id: parseInt(id) })

  const thresholdCount = parseInt(settings.find((s: any) => s.key === 'vote_threshold_count')?.value || '30')
  const thresholdPercent = parseInt(settings.find((s: any) => s.key === 'vote_threshold_percent')?.value || '55')

  const status = getMbtiStatus(person, votes, thresholdCount, thresholdPercent)
  const effectiveMbti = getEffectiveMbti(person, votes, status) as MbtiType | null
  const totalVotes = votes.reduce((s, v) => s + v.vote_count, 0)
  const sortedVotes = [...votes].sort((a, b) => b.vote_count - a.vote_count)

  return (
    <div className="max-w-2xl mx-auto px-5 py-8">
      <Link href="/people" className="inline-flex items-center gap-1 text-[13px] text-[#6B6B6B] hover:text-[#111111] mb-6 transition-colors">
        <ChevronLeft size={14} /> 목록
      </Link>

      {/* 인물 헤더 */}
      <div className="card overflow-hidden mb-4">
        <div className="flex gap-5 p-6">
          <div className="relative w-24 h-24 rounded-2xl overflow-hidden bg-[#F0F0EE] shrink-0">
            {person.image_url ? (
              <Image src={person.image_url} alt={person.name} fill className="object-cover" />
            ) : (
              <div className="absolute inset-0 flex items-center justify-center">
                <span className="text-3xl font-black text-[#D0D0CE]">{person.name[0]}</span>
              </div>
            )}
          </div>

          <div className="flex-1 min-w-0">
            <div className="flex items-start gap-2 mb-2 flex-wrap">
              <div>
                <h1 className="text-[22px] font-black text-[#111111] leading-tight">{person.name}</h1>
                {person.name_en && <p className="text-[12px] text-[#ABABAB]">{person.name_en}</p>}
              </div>
              <span className={`text-[11px] px-2.5 py-0.5 rounded-full border font-medium ${STATUS_COLORS[status]}`}>
                {STATUS_LABELS[status]}
              </span>
            </div>

            <div className="flex flex-wrap gap-1.5 mb-3">
              {person.subcategories && (
                <span className="text-[11px] bg-[#F7F7F5] text-[#6B6B6B] px-2.5 py-1 rounded-lg">
                  {(person.subcategories as any).categories?.name} · {(person.subcategories as any).name}
                </span>
              )}
              <span className="text-[11px] bg-[#F7F7F5] text-[#6B6B6B] px-2.5 py-1 rounded-lg">
                {person.nationality === 'korean' ? '한국인' : '외국인'}
              </span>
              {person.birth_year && (
                <span className="text-[11px] bg-[#F7F7F5] text-[#6B6B6B] px-2.5 py-1 rounded-lg">
                  {person.birth_year}년생
                </span>
              )}
            </div>

            {person.description && (
              <p className="text-[13px] text-[#6B6B6B] leading-relaxed mb-2">{person.description}</p>
            )}
            {person.namu_wiki_url && (
              <a
                href={person.namu_wiki_url}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-1 text-[12px] text-[#ABABAB] hover:text-[#111111] transition-colors"
              >
                <ExternalLink size={11} />
                나무위키에서 보기
              </a>
            )}
          </div>
        </div>

        {/* MBTI 결과 영역 */}
        {effectiveMbti && (
          <div className="px-6 py-4 border-t border-[#E5E5E3] bg-[#FAFAFA] flex items-center justify-between">
            <div className="flex items-center gap-3">
              <MbtiBadge type={effectiveMbti} size="lg" showDesc />
              {totalVotes > 0 && status !== 'confirmed' && (
                <span className="text-[12px] text-[#ABABAB]">{totalVotes.toLocaleString()}표 기반</span>
              )}
            </div>
            {status === 'confirmed' && person.mbti_source && (
              <a
                href={person.mbti_source.startsWith('http') ? person.mbti_source : undefined}
                target="_blank"
                rel="noopener noreferrer"
                className="text-[12px] text-[#ABABAB] hover:text-[#111111] flex items-center gap-1 transition-colors"
              >
                <ExternalLink size={11} />
                {person.mbti_source.startsWith('http') ? '출처' : person.mbti_source}
              </a>
            )}
            <span className="text-[11px] text-[#ABABAB] flex items-center gap-1 ml-auto">
              <Eye size={11} /> {person.view_count.toLocaleString()}
            </span>
          </div>
        )}
      </div>

      <VoteSection
        personId={person.id}
        votes={sortedVotes}
        totalVotes={totalVotes}
        status={status}
        thresholdCount={thresholdCount}
        thresholdPercent={thresholdPercent}
        officialMbti={person.mbti_official as MbtiType | null}
      />

      <CommentSection personId={person.id} initialComments={comments} />
    </div>
  )
}
