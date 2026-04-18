'use client'

import { useState, useEffect } from 'react'
import type { Person, Category, Subcategory, MbtiType } from '@/lib/types'
import { MBTI_TYPES } from '@/lib/types'
import { Plus, Edit2, Trash2, Lock, Settings, X, Check } from 'lucide-react'

const EMPTY_PERSON = {
  name: '', name_en: '', image_url: '', subcategory_id: '', nationality: 'korean',
  mbti_official: '', mbti_source: '', mbti_confirmed: false, description: '', birth_year: '', namu_wiki_url: '',
}

export default function AdminPage() {
  const [password, setPassword] = useState('')
  const [authed, setAuthed] = useState(false)
  const [authError, setAuthError] = useState('')

  const [people, setPeople] = useState<Person[]>([])
  const [categories, setCategories] = useState<Category[]>([])
  const [subcategories, setSubcategories] = useState<Subcategory[]>([])
  const [loading, setLoading] = useState(false)

  const [editPerson, setEditPerson] = useState<typeof EMPTY_PERSON | null>(null)
  const [editId, setEditId] = useState<number | null>(null)

  const [thresholdCount, setThresholdCount] = useState('30')
  const [thresholdPercent, setThresholdPercent] = useState('55')
  const [settingsSaved, setSettingsSaved] = useState(false)

  async function checkAuth(e: React.FormEvent) {
    e.preventDefault()
    const res = await fetch('/api/admin', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', 'x-admin-password': password },
      body: JSON.stringify({ action: 'update_setting', key: 'test', value: 'test' }),
    })
    if (res.status === 401) { setAuthError('비밀번호가 올바르지 않습니다'); return }
    setAuthed(true)
    loadData()
  }

  async function loadData() {
    setLoading(true)
    const [pRes, cRes, sRes] = await Promise.all([
      fetch('/api/people?limit=200'),
      fetch('/api/categories'),
      fetch('/api/admin/settings', { headers: { 'x-admin-password': password } }),
    ])
    const pData = await pRes.json()
    const cData = await cRes.json()
    setPeople(pData.people || [])
    setCategories(cData.categories || [])
    setSubcategories(cData.subcategories || [])
    if (sRes.ok) {
      const sData = await sRes.json()
      setThresholdCount(sData.vote_threshold_count || '30')
      setThresholdPercent(sData.vote_threshold_percent || '55')
    }
    setLoading(false)
  }

  async function savePerson() {
    if (!editPerson) return
    const action = editId ? 'update_person' : 'create_person'
    const person = {
      ...editPerson,
      id: editId,
      birth_year: editPerson.birth_year ? parseInt(editPerson.birth_year as string) : null,
      subcategory_id: editPerson.subcategory_id ? parseInt(editPerson.subcategory_id as string) : null,
      mbti_official: editPerson.mbti_official || null,
      mbti_source: editPerson.mbti_source || null,
      name_en: editPerson.name_en || null,
      image_url: editPerson.image_url || null,
      description: editPerson.description || null,
      namu_wiki_url: (editPerson as any).namu_wiki_url || null,
    }
    const res = await fetch('/api/admin', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', 'x-admin-password': password },
      body: JSON.stringify({ action, person }),
    })
    if (res.ok) { setEditPerson(null); setEditId(null); loadData() }
  }

  async function deletePerson(id: number) {
    if (!confirm('정말 삭제하시겠습니까?')) return
    await fetch('/api/admin', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', 'x-admin-password': password },
      body: JSON.stringify({ action: 'delete_person', id }),
    })
    loadData()
  }

  async function saveSettings() {
    await Promise.all([
      fetch('/api/admin', { method: 'POST', headers: { 'Content-Type': 'application/json', 'x-admin-password': password }, body: JSON.stringify({ action: 'update_setting', key: 'vote_threshold_count', value: thresholdCount }) }),
      fetch('/api/admin', { method: 'POST', headers: { 'Content-Type': 'application/json', 'x-admin-password': password }, body: JSON.stringify({ action: 'update_setting', key: 'vote_threshold_percent', value: thresholdPercent }) }),
    ])
    setSettingsSaved(true)
    setTimeout(() => setSettingsSaved(false), 2000)
  }

  const selectedCat = editPerson?.subcategory_id
    ? subcategories.find(s => s.id === parseInt(editPerson.subcategory_id as string))?.category_id
    : null
  const filteredSubs = selectedCat
    ? subcategories.filter(s => s.category_id === selectedCat)
    : subcategories

  if (!authed) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-[#f8f7ff]">
        <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-8 w-full max-w-sm">
          <div className="flex items-center gap-2 mb-6">
            <Lock size={18} className="text-[#6B4FBB]" />
            <h1 className="font-black text-gray-900 text-lg">관리자 로그인</h1>
          </div>
          <form onSubmit={checkAuth} className="space-y-3">
            <input
              type="password"
              value={password}
              onChange={e => setPassword(e.target.value)}
              placeholder="비밀번호"
              className="w-full px-4 py-2.5 border border-gray-200 rounded-xl text-sm outline-none focus:border-[#6B4FBB]"
            />
            {authError && <p className="text-xs text-red-500">{authError}</p>}
            <button type="submit" className="w-full py-2.5 bg-[#6B4FBB] text-white rounded-xl font-bold text-sm hover:bg-[#5a3faa] transition-colors">
              로그인
            </button>
          </form>
        </div>
      </div>
    )
  }

  return (
    <div className="max-w-6xl mx-auto px-4 py-8">
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-black text-gray-900">관리자 패널</h1>
        <button
          onClick={() => { setEditPerson({ ...EMPTY_PERSON }); setEditId(null) }}
          className="flex items-center gap-2 px-4 py-2 bg-[#6B4FBB] text-white rounded-xl font-medium text-sm hover:bg-[#5a3faa] transition-colors"
        >
          <Plus size={15} /> 인물 추가
        </button>
      </div>

      {/* 설정 */}
      <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-5 mb-6">
        <h2 className="font-bold text-gray-800 flex items-center gap-2 mb-4">
          <Settings size={15} className="text-[#6B4FBB]" /> 투표 임계값 설정
        </h2>
        <div className="flex items-center gap-4 flex-wrap">
          <label className="flex items-center gap-2 text-sm">
            <span className="text-gray-600">최소 투표 수</span>
            <input type="number" value={thresholdCount} onChange={e => setThresholdCount(e.target.value)}
              className="w-20 px-2 py-1.5 border border-gray-200 rounded-lg text-sm outline-none focus:border-[#6B4FBB]" />
            <span className="text-gray-400">표</span>
          </label>
          <label className="flex items-center gap-2 text-sm">
            <span className="text-gray-600">최소 비율</span>
            <input type="number" value={thresholdPercent} onChange={e => setThresholdPercent(e.target.value)}
              className="w-20 px-2 py-1.5 border border-gray-200 rounded-lg text-sm outline-none focus:border-[#6B4FBB]" />
            <span className="text-gray-400">% 이상 → 잠정 확정</span>
          </label>
          <button onClick={saveSettings}
            className="flex items-center gap-1.5 px-4 py-1.5 bg-gray-800 text-white rounded-lg text-sm font-medium hover:bg-gray-700 transition-colors">
            {settingsSaved ? <><Check size={13} /> 저장됨</> : '저장'}
          </button>
        </div>
      </div>

      {/* 인물 편집 모달 */}
      {editPerson && (
        <div className="fixed inset-0 bg-black/40 z-50 flex items-center justify-center p-4">
          <div className="bg-white rounded-2xl shadow-xl w-full max-w-lg max-h-[90vh] overflow-y-auto p-6">
            <div className="flex items-center justify-between mb-5">
              <h2 className="font-black text-gray-900">{editId ? '인물 수정' : '인물 추가'}</h2>
              <button onClick={() => { setEditPerson(null); setEditId(null) }}><X size={18} className="text-gray-400" /></button>
            </div>
            <div className="space-y-3">
              {[
                { label: '이름 *', key: 'name', placeholder: '홍길동' },
                { label: '영문 이름', key: 'name_en', placeholder: 'Hong Gildong' },
                { label: '이미지 URL', key: 'image_url', placeholder: 'https://...' },
                { label: '설명', key: 'description', placeholder: '간단한 소개' },
                { label: '출생연도', key: 'birth_year', placeholder: '1990' },
                { label: 'MBTI 출처', key: 'mbti_source', placeholder: '출처 URL 또는 설명' },
                { label: '나무위키 URL', key: 'namu_wiki_url', placeholder: 'https://namu.wiki/w/...' },
              ].map(f => (
                <div key={f.key}>
                  <label className="text-xs font-semibold text-gray-500 mb-1 block">{f.label}</label>
                  <input
                    value={(editPerson as any)[f.key] || ''}
                    onChange={e => setEditPerson(p => p ? { ...p, [f.key]: e.target.value } : null)}
                    placeholder={f.placeholder}
                    className="w-full px-3 py-2 border border-gray-200 rounded-xl text-sm outline-none focus:border-[#6B4FBB]"
                  />
                </div>
              ))}
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label className="text-xs font-semibold text-gray-500 mb-1 block">국적</label>
                  <select value={editPerson.nationality} onChange={e => setEditPerson(p => p ? { ...p, nationality: e.target.value as 'korean' | 'foreign' } : null)}
                    className="w-full px-3 py-2 border border-gray-200 rounded-xl text-sm outline-none focus:border-[#6B4FBB]">
                    <option value="korean">한국인</option>
                    <option value="foreign">외국인</option>
                  </select>
                </div>
                <div>
                  <label className="text-xs font-semibold text-gray-500 mb-1 block">공식 MBTI</label>
                  <select value={editPerson.mbti_official || ''} onChange={e => setEditPerson(p => p ? { ...p, mbti_official: e.target.value } : null)}
                    className="w-full px-3 py-2 border border-gray-200 rounded-xl text-sm outline-none focus:border-[#6B4FBB]">
                    <option value="">미확인</option>
                    {MBTI_TYPES.map(t => <option key={t} value={t}>{t}</option>)}
                  </select>
                </div>
              </div>
              <div>
                <label className="text-xs font-semibold text-gray-500 mb-1 block">카테고리</label>
                <select onChange={e => {
                  const catId = parseInt(e.target.value)
                  const firstSub = subcategories.find(s => s.category_id === catId)
                  setEditPerson(p => p ? { ...p, subcategory_id: firstSub ? String(firstSub.id) : '' } : null)
                }}
                  className="w-full px-3 py-2 border border-gray-200 rounded-xl text-sm outline-none focus:border-[#6B4FBB] mb-2">
                  <option value="">카테고리 선택</option>
                  {categories.map(c => <option key={c.id} value={c.id}>{c.name}</option>)}
                </select>
                <select value={editPerson.subcategory_id || ''} onChange={e => setEditPerson(p => p ? { ...p, subcategory_id: e.target.value } : null)}
                  className="w-full px-3 py-2 border border-gray-200 rounded-xl text-sm outline-none focus:border-[#6B4FBB]">
                  <option value="">세부 유형 선택</option>
                  {filteredSubs.map(s => <option key={s.id} value={s.id}>{s.name}</option>)}
                </select>
              </div>
              <div className="flex items-center gap-2">
                <input type="checkbox" id="confirmed" checked={editPerson.mbti_confirmed}
                  onChange={e => setEditPerson(p => p ? { ...p, mbti_confirmed: e.target.checked } : null)}
                  className="rounded" />
                <label htmlFor="confirmed" className="text-sm text-gray-700">공식 확인된 MBTI</label>
              </div>
            </div>
            <div className="flex gap-2 mt-5">
              <button onClick={() => { setEditPerson(null); setEditId(null) }}
                className="flex-1 py-2.5 border border-gray-200 text-gray-600 rounded-xl text-sm font-medium hover:bg-gray-50">취소</button>
              <button onClick={savePerson}
                className="flex-1 py-2.5 bg-[#6B4FBB] text-white rounded-xl text-sm font-bold hover:bg-[#5a3faa]">저장</button>
            </div>
          </div>
        </div>
      )}

      {/* 인물 목록 */}
      {loading ? (
        <div className="text-center py-12 text-gray-400">불러오는 중...</div>
      ) : (
        <div className="bg-white rounded-2xl border border-gray-100 shadow-sm overflow-hidden">
          <div className="px-5 py-3 border-b border-gray-50 text-sm font-semibold text-gray-500">
            전체 {people.length}명
          </div>
          <div className="divide-y divide-gray-50">
            {people.map(p => (
              <div key={p.id} className="flex items-center gap-3 px-5 py-3 hover:bg-gray-50">
                <div className="flex-1 min-w-0">
                  <span className="font-semibold text-gray-900">{p.name}</span>
                  {p.name_en && <span className="text-xs text-gray-400 ml-2">{p.name_en}</span>}
                </div>
                <span className="text-xs text-gray-400">{p.nationality === 'korean' ? '🇰🇷' : '🌐'}</span>
                {p.mbti_official && (
                  <span className="text-xs font-bold px-2 py-0.5 rounded bg-purple-50 text-[#6B4FBB]">
                    {p.mbti_official} {p.mbti_confirmed ? '✅' : ''}
                  </span>
                )}
                <div className="flex gap-1">
                  <button onClick={() => {
                    setEditId(p.id)
                    setEditPerson({
                      name: p.name, name_en: p.name_en || '', image_url: p.image_url || '',
                      subcategory_id: p.subcategory_id ? String(p.subcategory_id) : '',
                      nationality: p.nationality, mbti_official: p.mbti_official || '',
                      mbti_source: p.mbti_source || '', mbti_confirmed: p.mbti_confirmed,
                      description: p.description || '', birth_year: p.birth_year ? String(p.birth_year) : '',
                      namu_wiki_url: (p as any).namu_wiki_url || '',
                    })
                  }} className="p-1.5 text-gray-400 hover:text-[#6B4FBB] hover:bg-purple-50 rounded-lg transition-colors">
                    <Edit2 size={13} />
                  </button>
                  <button onClick={() => deletePerson(p.id)}
                    className="p-1.5 text-gray-400 hover:text-red-500 hover:bg-red-50 rounded-lg transition-colors">
                    <Trash2 size={13} />
                  </button>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  )
}
