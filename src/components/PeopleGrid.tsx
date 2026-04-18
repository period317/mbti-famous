'use client'

import { useSearchParams } from 'next/navigation'
import { useEffect, useState, useCallback } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import PersonCard from './PersonCard'
import MbtiBadge from './MbtiBadge'
import type { Person, VoteSummary, MbtiType } from '@/lib/types'
import { MBTI_TYPES, MBTI_DESCRIPTIONS } from '@/lib/types'
import { getMbtiStatus, getEffectiveMbti } from '@/lib/mbti-utils'
import { Search, ChevronLeft, ChevronRight, Grid2x2, List, Eye } from 'lucide-react'

interface PeopleResponse {
  people: Person[]
  total: number
  page: number
  limit: number
}

interface VotesMap {
  [personId: number]: VoteSummary[]
}

export default function PeopleGrid() {
  const searchParams = useSearchParams()
  const [data, setData] = useState<PeopleResponse | null>(null)
  const [votesMap, setVotesMap] = useState<VotesMap>({})
  const [loading, setLoading] = useState(true)
  const [viewMode, setViewMode] = useState<'card' | 'list'>('card')

  const currentMbti = searchParams.get('mbti') || ''

  const fetchData = useCallback(async () => {
    setLoading(true)
    const res = await fetch(`/api/people?${searchParams.toString()}`)
    const json = await res.json()
    setData(json)

    if (json.people?.length) {
      const ids = json.people.map((p: Person) => p.id).join(',')
      const vRes = await fetch(`/api/votes/batch?ids=${ids}`)
      if (vRes.ok) {
        const vJson = await vRes.json()
        setVotesMap(vJson.votes || {})
      }
    }
    setLoading(false)
  }, [searchParams])

  useEffect(() => { fetchData() }, [fetchData])

  const page = parseInt(searchParams.get('page') || '1')
  const q = searchParams.get('q') || ''

  function setPage(p: number) {
    const params = new URLSearchParams(searchParams.toString())
    params.set('page', String(p))
    window.history.pushState(null, '', `/people?${params.toString()}`)
    window.scrollTo({ top: 0, behavior: 'smooth' })
    fetchData()
  }

  function setMbti(mbti: string) {
    const params = new URLSearchParams(searchParams.toString())
    if (mbti && mbti !== currentMbti) { params.set('mbti', mbti) } else { params.delete('mbti') }
    params.delete('page')
    window.location.href = `/people?${params.toString()}`
  }

  const totalPages = Math.ceil(((data?.total) || 0) / (data?.limit || 24))

  return (
    <div>
      {/* MBTI 칩 */}
      <div className="mb-4">
        <div className="flex flex-wrap gap-1.5">
          <button
            onClick={() => setMbti('')}
            className={`text-[11px] font-semibold px-3 py-1.5 rounded-full border transition-colors ${
              !currentMbti ? 'bg-[#111111] text-white border-[#111111]' : 'border-[#E5E5E3] text-[#6B6B6B] hover:border-[#111111] hover:text-[#111111]'
            }`}
          >전체</button>
          {MBTI_TYPES.map(t => (
            <button
              key={t}
              onClick={() => setMbti(t)}
              title={MBTI_DESCRIPTIONS[t]}
              className={`text-[11px] font-semibold px-3 py-1.5 rounded-full border transition-colors ${
                currentMbti === t
                  ? 'bg-[#111111] text-white border-[#111111]'
                  : 'border-[#E5E5E3] text-[#6B6B6B] hover:border-[#111111] hover:text-[#111111]'
              }`}
            >{t}</button>
          ))}
        </div>
      </div>

      {/* 카운트 + 뷰 토글 */}
      <div className="flex items-center justify-between mb-4">
        <p className="text-sm text-gray-500">
          총 <span className="font-semibold text-gray-800">{data?.total?.toLocaleString() ?? '…'}</span>명
          {q && <span> · &quot;{q}&quot; 검색 결과</span>}
          {currentMbti && <span> · {currentMbti}</span>}
        </p>
        <div className="flex items-center gap-1 bg-[#F7F7F5] rounded-lg p-0.5">
          <button
            onClick={() => setViewMode('card')}
            className={`p-1.5 rounded-md transition-colors ${viewMode === 'card' ? 'bg-white shadow-sm text-[#111111]' : 'text-[#ABABAB] hover:text-[#6B6B6B]'}`}
          ><Grid2x2 size={15} /></button>
          <button
            onClick={() => setViewMode('list')}
            className={`p-1.5 rounded-md transition-colors ${viewMode === 'list' ? 'bg-white shadow-sm text-[#111111]' : 'text-[#ABABAB] hover:text-[#6B6B6B]'}`}
          ><List size={15} /></button>
        </div>
      </div>

      {/* 로딩 스켈레톤 */}
      {loading && viewMode === 'card' && (
        <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 xl:grid-cols-6 gap-3">
          {Array.from({ length: 24 }).map((_, i) => (
            <div key={i} className="bg-white rounded-2xl overflow-hidden border border-gray-100 animate-pulse">
              <div className="aspect-square bg-gray-100" />
              <div className="p-3 space-y-2">
                <div className="h-3.5 bg-gray-100 rounded w-3/4" />
                <div className="h-3 bg-gray-100 rounded w-1/2" />
              </div>
            </div>
          ))}
        </div>
      )}

      {loading && viewMode === 'list' && (
        <div className="bg-white rounded-2xl border border-[#E5E5E3] overflow-hidden divide-y divide-[#F0F0EE]">
          {Array.from({ length: 20 }).map((_, i) => (
            <div key={i} className="flex items-center gap-3 px-4 py-2.5 animate-pulse">
              <div className="w-9 h-9 rounded-xl bg-gray-100 shrink-0" />
              <div className="flex-1 h-3.5 bg-gray-100 rounded w-32" />
              <div className="w-14 h-5 bg-gray-100 rounded-full" />
              <div className="w-12 h-3 bg-gray-100 rounded" />
            </div>
          ))}
        </div>
      )}

      {/* 빈 결과 */}
      {!loading && !data?.people?.length && (
        <div className="flex flex-col items-center justify-center py-24 text-gray-400">
          <Search size={40} className="mb-4 opacity-30" />
          <p className="font-medium">
            {q ? `"${q}" 검색 결과가 없습니다` : '등록된 인물이 없습니다'}
          </p>
        </div>
      )}

      {/* 카드 뷰 */}
      {!loading && !!data?.people?.length && viewMode === 'card' && (
        <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 xl:grid-cols-6 gap-3">
          {data.people.map(person => (
            <PersonCard
              key={person.id}
              person={person}
              votes={votesMap[person.id] || []}
            />
          ))}
        </div>
      )}

      {/* 리스트 뷰 */}
      {!loading && !!data?.people?.length && viewMode === 'list' && (
        <div className="bg-white rounded-2xl border border-[#E5E5E3] overflow-hidden">
          <div className="grid grid-cols-[2fr_80px_80px_60px_50px] text-[11px] font-semibold text-[#ABABAB] px-4 py-2 border-b border-[#F0F0EE] bg-[#FAFAFA]">
            <span>이름</span>
            <span>MBTI</span>
            <span>분야</span>
            <span>국적</span>
            <span className="text-right">조회수</span>
          </div>
          <div className="divide-y divide-[#F7F7F5]">
            {data.people.map(person => {
              const votes = votesMap[person.id] || []
              const status = getMbtiStatus(person, votes, 30, 55)
              const effectiveMbti = getEffectiveMbti(person, votes, status) as MbtiType | null
              return (
                <Link
                  key={person.id}
                  href={`/people/${person.id}`}
                  className="grid grid-cols-[2fr_80px_80px_60px_50px] items-center px-4 py-2 hover:bg-[#F7F7F5] transition-colors"
                >
                  <div className="flex items-center gap-2.5 min-w-0">
                    <div className="relative w-9 h-9 rounded-xl overflow-hidden bg-[#F0F0EE] shrink-0">
                      {person.image_url ? (
                        <Image src={person.image_url} alt={person.name} fill className="object-cover" />
                      ) : (
                        <div className="absolute inset-0 flex items-center justify-center">
                          <span className="text-sm font-black text-[#D0D0CE]">{person.name[0]}</span>
                        </div>
                      )}
                    </div>
                    <div className="min-w-0">
                      <p className="font-semibold text-[13px] text-[#111111] truncate">{person.name}</p>
                      {person.name_en && <p className="text-[10px] text-[#ABABAB] truncate">{person.name_en}</p>}
                    </div>
                  </div>
                  <div>
                    {effectiveMbti ? <MbtiBadge type={effectiveMbti} size="sm" /> : <span className="text-[11px] text-[#D0D0CE]">—</span>}
                  </div>
                  <span className="text-[11px] text-[#6B6B6B] truncate">{(person.subcategories as any)?.name || '—'}</span>
                  <span className="text-[11px] text-[#ABABAB]">{person.nationality === 'korean' ? '🇰🇷' : '🌐'}</span>
                  <span className="text-[11px] text-[#ABABAB] flex items-center justify-end gap-0.5">
                    <Eye size={10} />{person.view_count}
                  </span>
                </Link>
              )
            })}
          </div>
        </div>
      )}

      {/* 페이지네이션 */}
      {!loading && totalPages > 1 && (
        <div className="flex items-center justify-center gap-2 mt-10">
          <button
            onClick={() => setPage(page - 1)}
            disabled={page <= 1}
            className="p-2 rounded-lg border border-gray-200 disabled:opacity-30 hover:border-[#111111] transition-colors"
          ><ChevronLeft size={16} /></button>
          {Array.from({ length: Math.min(totalPages, 7) }, (_, i) => {
            const p = page <= 4 ? i + 1 : page - 3 + i
            if (p < 1 || p > totalPages) return null
            return (
              <button
                key={p}
                onClick={() => setPage(p)}
                className={`w-9 h-9 rounded-lg text-sm font-medium transition-colors ${p === page ? 'bg-[#111111] text-white' : 'border border-gray-200 text-gray-600 hover:border-[#111111]'}`}
              >{p}</button>
            )
          })}
          <button
            onClick={() => setPage(page + 1)}
            disabled={page >= totalPages}
            className="p-2 rounded-lg border border-gray-200 disabled:opacity-30 hover:border-[#111111] transition-colors"
          ><ChevronRight size={16} /></button>
        </div>
      )}
    </div>
  )
}
