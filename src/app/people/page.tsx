import { Suspense } from 'react'
import { supabase } from '@/lib/supabase'
import FilterBar from '@/components/FilterBar'
import PeopleGrid from '@/components/PeopleGrid'
import type { Category, Subcategory } from '@/lib/types'

async function getCategories() {
  const { data: cats } = await supabase.from('categories').select('*').order('sort_order')
  const { data: subs } = await supabase.from('subcategories').select('*').order('sort_order')
  return {
    categories: (cats || []) as Category[],
    subcategories: (subs || []) as Subcategory[],
  }
}

export default async function PeoplePage() {
  const { categories, subcategories } = await getCategories()

  return (
    <div>
      <Suspense>
        <FilterBar categories={categories} subcategories={subcategories} />
      </Suspense>
      <div className="max-w-6xl mx-auto px-4 py-6">
        <Suspense fallback={<GridSkeleton />}>
          <PeopleGrid />
        </Suspense>
      </div>
    </div>
  )
}

function GridSkeleton() {
  return (
    <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4">
      {Array.from({ length: 20 }).map((_, i) => (
        <div key={i} className="bg-white rounded-2xl overflow-hidden border border-gray-100 animate-pulse">
          <div className="h-44 bg-gray-100" />
          <div className="p-3.5 space-y-2">
            <div className="h-4 bg-gray-100 rounded w-3/4" />
            <div className="h-3 bg-gray-100 rounded w-1/2" />
          </div>
        </div>
      ))}
    </div>
  )
}
