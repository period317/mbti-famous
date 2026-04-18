import { NextResponse } from 'next/server'
import { supabase } from '@/lib/supabase'

export async function GET() {
  const { data: categories } = await supabase
    .from('categories')
    .select('*')
    .order('sort_order')

  const { data: subcategories } = await supabase
    .from('subcategories')
    .select('*')
    .order('sort_order')

  return NextResponse.json({ categories: categories || [], subcategories: subcategories || [] })
}
