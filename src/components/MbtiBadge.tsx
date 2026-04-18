import type { MbtiType } from '@/lib/types'
import { MBTI_COLORS, MBTI_DESCRIPTIONS } from '@/lib/types'

interface Props {
  type: MbtiType
  size?: 'sm' | 'md' | 'lg'
  showDesc?: boolean
}

export default function MbtiBadge({ type, size = 'md', showDesc = false }: Props) {
  const color = MBTI_COLORS[type]
  const sizes = {
    sm: 'text-[11px] px-2 py-0.5 gap-1',
    md: 'text-[12px] px-2.5 py-1 gap-1.5',
    lg: 'text-[14px] px-3.5 py-1.5 gap-2',
  }

  return (
    <span
      className={`inline-flex items-center font-semibold rounded-md tracking-wide ${sizes[size]}`}
      style={{
        backgroundColor: `${color}12`,
        color,
        border: `1px solid ${color}28`,
      }}
    >
      {type}
      {showDesc && (
        <span className="font-normal opacity-60 text-[11px]">{MBTI_DESCRIPTIONS[type]}</span>
      )}
    </span>
  )
}
