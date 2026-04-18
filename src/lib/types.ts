export type MbtiType =
  | 'INTJ' | 'INTP' | 'ENTJ' | 'ENTP'
  | 'INFJ' | 'INFP' | 'ENFJ' | 'ENFP'
  | 'ISTJ' | 'ISFJ' | 'ESTJ' | 'ESFJ'
  | 'ISTP' | 'ISFP' | 'ESTP' | 'ESFP'

export const MBTI_TYPES: MbtiType[] = [
  'INTJ', 'INTP', 'ENTJ', 'ENTP',
  'INFJ', 'INFP', 'ENFJ', 'ENFP',
  'ISTJ', 'ISFJ', 'ESTJ', 'ESFJ',
  'ISTP', 'ISFP', 'ESTP', 'ESFP',
]

// 채도를 낮춘 세련된 팔레트 — NT(청), NF(로즈), SJ(세이지), SP(앰버)
export const MBTI_COLORS: Record<MbtiType, string> = {
  INTJ: '#3D4A5C', INTP: '#4A5568', ENTJ: '#2C4A6E', ENTP: '#3A5A7A',
  INFJ: '#6B4E5E', INFP: '#7A5A6B', ENFJ: '#8C5A50', ENFP: '#9A6A5E',
  ISTJ: '#3D5A4A', ISFJ: '#4A6A58', ESTJ: '#2E5040', ESFJ: '#3A6050',
  ISTP: '#6A5A3A', ISFP: '#7A6A48', ESTP: '#8A5A2E', ESFP: '#9A6A3A',
}

export const MBTI_DESCRIPTIONS: Record<MbtiType, string> = {
  INTJ: '전략가', INTP: '논리술사', ENTJ: '통솔자', ENTP: '변론가',
  INFJ: '옹호자', INFP: '중재자', ENFJ: '선도자', ENFP: '활동가',
  ISTJ: '현실주의자', ISFJ: '수호자', ESTJ: '경영자', ESFJ: '집정관',
  ISTP: '장인', ISFP: '모험가', ESTP: '사업가', ESFP: '연예인',
}

export type MbtiStatus = 'confirmed' | 'tentative' | 'voting'

export interface Category {
  id: number
  name: string
  slug: string
  sort_order: number
}

export interface Subcategory {
  id: number
  category_id: number
  name: string
  slug: string
  sort_order: number
  categories?: Category
}

export interface Person {
  id: number
  name: string
  name_en: string | null
  image_url: string | null
  subcategory_id: number | null
  nationality: 'korean' | 'foreign'
  mbti_official: MbtiType | null
  mbti_source: string | null
  mbti_confirmed: boolean
  description: string | null
  birth_year: number | null
  view_count: number
  created_at: string
  subcategories?: Subcategory & { categories?: Category }
}

export interface VoteSummary {
  person_id: number
  mbti_type: MbtiType
  vote_count: number
  percentage: number
}

export interface Comment {
  id: number
  person_id: number
  nickname: string
  content: string
  created_at: string
}

export type SortOption = 'views_desc' | 'views_asc' | 'age_asc' | 'age_desc' | 'latest' | 'name' | 'votes'
export type NationalityFilter = 'all' | 'korean' | 'foreign'

export interface Database {
  public: {
    Tables: {
      categories: { Row: Category; Insert: Omit<Category, 'id'>; Update: Partial<Category> }
      subcategories: { Row: Subcategory; Insert: Omit<Subcategory, 'id'>; Update: Partial<Subcategory> }
      people: { Row: Person; Insert: Omit<Person, 'id' | 'created_at' | 'view_count'>; Update: Partial<Person> }
      votes: { Row: { id: number; person_id: number; mbti_type: string; ip_hash: string; created_at: string }; Insert: Omit<{ id: number; person_id: number; mbti_type: string; ip_hash: string; created_at: string }, 'id' | 'created_at'>; Update: never }
      comments: { Row: Comment & { ip_hash: string }; Insert: Omit<Comment, 'id' | 'created_at'> & { ip_hash: string }; Update: never }
      settings: { Row: { key: string; value: string }; Insert: { key: string; value: string }; Update: { value: string } }
    }
    Views: {
      vote_summary: { Row: VoteSummary }
    }
    Functions: {
      increment_view_count: { Args: { person_id: number }; Returns: void }
    }
  }
}
