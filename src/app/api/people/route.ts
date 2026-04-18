import { NextRequest, NextResponse } from 'next/server'
import { supabase } from '@/lib/supabase'
import type { SortOption, NationalityFilter } from '@/lib/types'

export async function GET(req: NextRequest) {
  const { searchParams } = new URL(req.url)
  const q = searchParams.get('q') || ''
  const category = searchParams.get('category') || ''
  const subcategory = searchParams.get('subcategory') || ''
  const mbti = searchParams.get('mbti') || ''
  const nationality = (searchParams.get('nationality') || 'all') as NationalityFilter
  const sort = (searchParams.get('sort') || 'views') as SortOption
  const page = parseInt(searchParams.get('page') || '1')
  const limit = 24

  let query = supabase
    .from('people')
    .select(`
      *,
      subcategories (
        id, name, slug,
        categories ( id, name, slug )
      )
    `, { count: 'exact' })

  if (q) query = query.or(`name.ilike.%${q}%,name_en.ilike.%${q}%`)
  if (nationality !== 'all') query = query.eq('nationality', nationality)
  if (mbti) query = query.eq('mbti_official', mbti)

  if (subcategory) {
    const { data: sub } = await supabase.from('subcategories').select('id').eq('slug', subcategory).single()
    if (sub) query = query.eq('subcategory_id', sub.id)
  } else if (category) {
    const { data: cat } = await supabase.from('categories').select('id').eq('slug', category).single()
    if (cat) {
      const { data: subs } = await supabase.from('subcategories').select('id').eq('category_id', cat.id)
      if (subs) query = query.in('subcategory_id', subs.map(s => s.id))
    }
  }

  if (sort === 'views_desc') query = query.order('view_count', { ascending: false })
  else if (sort === 'views_asc') query = query.order('view_count', { ascending: true })
  else if (sort === 'age_asc') query = query.order('birth_year', { ascending: true, nullsFirst: false })
  else if (sort === 'age_desc') query = query.order('birth_year', { ascending: false, nullsFirst: false })
  else if (sort === 'latest') query = query.order('created_at', { ascending: false })
  else if (sort === 'name') query = query.order('name', { ascending: true })
  else query = query.order('view_count', { ascending: false })

  const from = (page - 1) * limit
  const { data, error, count } = await query.range(from, from + limit - 1)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  return NextResponse.json({ people: data, total: count, page, limit })
}
