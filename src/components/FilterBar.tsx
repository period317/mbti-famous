'use client'

import { useRouter, useSearchParams } from 'next/navigation'
import type { Category, Subcategory, NationalityFilter, SortOption } from '@/lib/types'

interface Props {
  categories: Category[]
  subcategories: Subcategory[]
}

const SORT_OPTIONS: { value: SortOption; label: string }[] = [
  { value: 'views_desc', label: '조회수 높은순' },
  { value: 'views_asc',  label: '조회수 낮은순' },
  { value: 'age_asc',   label: '나이 많은순' },
  { value: 'age_desc',  label: '나이 어린순' },
  { value: 'name',      label: '이름순' },
  { value: 'latest',    label: '최신 등록순' },
  { value: 'votes',     label: '투표 많은순' },
]

const NATIONALITY_OPTIONS: { value: NationalityFilter; label: string }[] = [
  { value: 'all', label: '전체' },
  { value: 'korean', label: '한국인' },
  { value: 'foreign', label: '외국인' },
]

export default function FilterBar({ categories, subcategories }: Props) {
  const router = useRouter()
  const searchParams = useSearchParams()
  const current = {
    category:    searchParams.get('category') || '',
    subcategory: searchParams.get('subcategory') || '',
    nationality: (searchParams.get('nationality') || 'all') as NationalityFilter,
    sort:        (searchParams.get('sort') || 'views_desc') as SortOption,
    mbti:        searchParams.get('mbti') || '',
  }

  function update(key: string, value: string) {
    const p = new URLSearchParams(searchParams.toString())
    if (value) { p.set(key, value) } else { p.delete(key) }
    if (key === 'category') { p.delete('subcategory'); p.delete('mbti') }
    p.delete('page')
    router.push(`/people?${p.toString()}`)
  }

  const filteredSubs = current.category
    ? subcategories.filter(s => {
        const cat = categories.find(c => c.slug === current.category)
        return cat ? s.category_id === cat.id : false
      })
    : []

  return (
    <div className="bg-white border-b border-[#E5E5E3] sticky top-14 z-40">
      <div className="max-w-5xl mx-auto px-5 py-3 space-y-2.5">

        {/* 분야 */}
        <div className="flex items-center gap-2 flex-wrap">
          <span className="text-[11px] font-medium text-[#ABABAB] w-8 shrink-0">분야</span>
          <button className={`filter-pill ${!current.category ? 'active' : 'inactive'}`} onClick={() => update('category', '')}>전체</button>
          {categories.map(cat => (
            <button
              key={cat.id}
              className={`filter-pill ${current.category === cat.slug ? 'active' : 'inactive'}`}
              onClick={() => update('category', cat.slug)}
            >{cat.name}</button>
          ))}
        </div>

        {/* 세부 유형 */}
        {filteredSubs.length > 0 && (
          <div className="flex items-center gap-2 flex-wrap">
            <span className="text-[11px] font-medium text-[#ABABAB] w-8 shrink-0">유형</span>
            <button className={`filter-pill ${!current.subcategory ? 'active' : 'inactive'}`} onClick={() => update('subcategory', '')}>전체</button>
            {filteredSubs.map(sub => (
              <button
                key={sub.id}
                className={`filter-pill ${current.subcategory === sub.slug ? 'active' : 'inactive'}`}
                onClick={() => update('subcategory', sub.slug)}
              >{sub.name}</button>
            ))}
          </div>
        )}

        {/* 국적 + MBTI + 정렬 */}
        <div className="flex items-center gap-2 flex-wrap">
          <span className="text-[11px] font-medium text-[#ABABAB] w-8 shrink-0">국적</span>
          {NATIONALITY_OPTIONS.map(opt => (
            <button
              key={opt.value}
              className={`filter-pill ${current.nationality === opt.value ? 'active' : 'inactive'}`}
              onClick={() => update('nationality', opt.value === 'all' ? '' : opt.value)}
            >{opt.label}</button>
          ))}

          <div className="ml-auto">
            <select
              value={current.sort}
              onChange={e => update('sort', e.target.value)}
              className="filter-pill inactive text-[13px] bg-white outline-none cursor-pointer"
            >
              {SORT_OPTIONS.map(o => <option key={o.value} value={o.value}>{o.label}</option>)}
            </select>
          </div>
        </div>
      </div>
    </div>
  )
}
