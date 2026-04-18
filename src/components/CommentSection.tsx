'use client'

import { useState } from 'react'
import type { Comment } from '@/lib/types'
import { ArrowUp } from 'lucide-react'

interface Props {
  personId: number
  initialComments: Comment[]
}

export default function CommentSection({ personId, initialComments }: Props) {
  const [comments, setComments] = useState(initialComments)
  const [nickname, setNickname] = useState('')
  const [content, setContent] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    if (!nickname.trim() || !content.trim()) return
    setLoading(true)
    setError('')
    const res = await fetch(`/api/people/${personId}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ action: 'comment', nickname, content }),
    })
    const data = await res.json()
    setLoading(false)
    if (!res.ok) { setError(data.error || '댓글 등록에 실패했습니다'); return }
    setComments(prev => [data.comment, ...prev])
    setContent('')
  }

  function formatDate(iso: string) {
    const d = new Date(iso)
    return `${d.getMonth() + 1}.${d.getDate()} ${d.getHours().toString().padStart(2, '0')}:${d.getMinutes().toString().padStart(2, '0')}`
  }

  return (
    <div className="card p-6">
      <div className="mb-5">
        <p className="text-[12px] font-medium text-[#ABABAB] uppercase tracking-widest mb-0.5">Comments</p>
        <h3 className="text-[16px] font-bold text-[#111111]">댓글 {comments.length > 0 && <span className="text-[#ABABAB] font-normal">{comments.length}</span>}</h3>
      </div>

      {/* 입력 */}
      <form onSubmit={handleSubmit} className="mb-6">
        <div className="border border-[#E5E5E3] rounded-xl overflow-hidden focus-within:border-[#ABABAB] transition-colors">
          <div className="flex items-center gap-0 border-b border-[#E5E5E3]">
            <input
              value={nickname}
              onChange={e => setNickname(e.target.value)}
              placeholder="닉네임"
              maxLength={20}
              className="w-28 px-3.5 py-2.5 text-[13px] outline-none bg-transparent placeholder-[#ABABAB] text-[#111111]"
            />
            <div className="w-px h-4 bg-[#E5E5E3]" />
            <input
              value={content}
              onChange={e => setContent(e.target.value)}
              placeholder="댓글을 입력하세요..."
              maxLength={500}
              className="flex-1 px-3.5 py-2.5 text-[13px] outline-none bg-transparent placeholder-[#ABABAB] text-[#111111]"
            />
          </div>
          <div className="flex justify-end px-3 py-2">
            <button
              type="submit"
              disabled={loading || !nickname.trim() || !content.trim()}
              className="flex items-center gap-1.5 text-[12px] font-semibold text-[#111111] disabled:text-[#ABABAB] transition-colors"
            >
              {loading ? '...' : <><ArrowUp size={13} /> 등록</>}
            </button>
          </div>
        </div>
        {error && <p className="text-[12px] text-red-500 mt-1.5">{error}</p>}
      </form>

      {/* 목록 */}
      {comments.length === 0 ? (
        <p className="text-[13px] text-[#ABABAB] text-center py-8">첫 댓글을 남겨보세요</p>
      ) : (
        <div className="space-y-4">
          {comments.map(c => (
            <div key={c.id} className="flex gap-3">
              <div className="w-7 h-7 rounded-full bg-[#F0F0EE] flex items-center justify-center shrink-0">
                <span className="text-[11px] font-bold text-[#6B6B6B]">{c.nickname[0]}</span>
              </div>
              <div className="flex-1 min-w-0">
                <div className="flex items-center gap-2 mb-0.5">
                  <span className="text-[13px] font-semibold text-[#111111]">{c.nickname}</span>
                  <span className="text-[11px] text-[#ABABAB]">{formatDate(c.created_at)}</span>
                </div>
                <p className="text-[13px] text-[#6B6B6B] leading-relaxed">{c.content}</p>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
