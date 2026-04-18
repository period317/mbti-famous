'use client'

import Link from 'next/link'
import { useState } from 'react'
import { Search, X } from 'lucide-react'
import { useRouter, usePathname } from 'next/navigation'

export default function Header() {
  const [searchOpen, setSearchOpen] = useState(false)
  const [query, setQuery] = useState('')
  const router = useRouter()
  const pathname = usePathname()

  const handleSearch = (e: React.FormEvent) => {
    e.preventDefault()
    if (query.trim()) {
      router.push(`/people?q=${encodeURIComponent(query.trim())}`)
      setSearchOpen(false)
      setQuery('')
    }
  }

  return (
    <header className="bg-white border-b border-[#E5E5E3] sticky top-0 z-50">
      <div className="max-w-5xl mx-auto px-5 h-14 flex items-center justify-between gap-6">

        <Link href="/people" className="flex items-center gap-1 shrink-0">
          <span className="text-[15px] font-black tracking-tight text-[#111111]">MBTI</span>
          <span className="text-[15px] font-light text-[#111111] tracking-tight ml-1">인물사전</span>
        </Link>

        <nav className="hidden md:flex items-center gap-1">
          <Link
            href="/vote"
            className={`px-3 py-1.5 rounded-lg text-[13px] font-medium transition-colors ${
              pathname === '/vote'
                ? 'text-[#111111] bg-[#F0F0EE]'
                : 'text-[#6B6B6B] hover:text-[#111111] hover:bg-[#F7F7F5]'
            }`}
          >
            투표
          </Link>
        </nav>

        <div className="flex items-center gap-1">
          {searchOpen ? (
            <form onSubmit={handleSearch} className="flex items-center gap-2 bg-[#F7F7F5] border border-[#E5E5E3] rounded-lg px-3 py-1.5">
              <Search size={13} className="text-[#ABABAB] shrink-0" />
              <input
                autoFocus
                value={query}
                onChange={e => setQuery(e.target.value)}
                placeholder="인물 검색..."
                className="bg-transparent text-[13px] outline-none w-36 text-[#111111] placeholder-[#ABABAB]"
              />
              <button type="button" onClick={() => { setSearchOpen(false); setQuery('') }}>
                <X size={13} className="text-[#ABABAB] hover:text-[#6B6B6B]" />
              </button>
            </form>
          ) : (
            <button
              onClick={() => setSearchOpen(true)}
              className="p-2 text-[#6B6B6B] hover:text-[#111111] hover:bg-[#F7F7F5] rounded-lg transition-colors"
            >
              <Search size={16} />
            </button>
          )}
        </div>
      </div>
    </header>
  )
}
