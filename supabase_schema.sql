-- MBTI Famous People DB Schema

-- 카테고리 (스포츠, 엔터테인먼트, 정치/사회 등)
CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  sort_order INT DEFAULT 0
);

-- 세부 유형 (아이돌, 배우, 축구선수 등)
CREATE TABLE subcategories (
  id SERIAL PRIMARY KEY,
  category_id INT REFERENCES categories(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  sort_order INT DEFAULT 0
);

-- 인물
CREATE TABLE people (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  name_en TEXT,
  image_url TEXT,
  subcategory_id INT REFERENCES subcategories(id) ON DELETE SET NULL,
  nationality TEXT DEFAULT 'korean', -- 'korean' | 'foreign'
  mbti_official TEXT, -- 공식 확인된 MBTI (NULL이면 미확인)
  mbti_source TEXT,   -- 출처 URL 또는 설명
  mbti_confirmed BOOLEAN DEFAULT FALSE, -- 공식 여부
  description TEXT,
  birth_year INT,
  view_count INT DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 투표
CREATE TABLE votes (
  id SERIAL PRIMARY KEY,
  person_id INT REFERENCES people(id) ON DELETE CASCADE,
  mbti_type TEXT NOT NULL, -- 16개 유형 중 하나
  ip_hash TEXT NOT NULL, -- IP 해시 (중복 방지)
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(person_id, ip_hash) -- 인물당 1인 1표
);

-- 댓글
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  person_id INT REFERENCES people(id) ON DELETE CASCADE,
  nickname TEXT NOT NULL,
  content TEXT NOT NULL,
  ip_hash TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 투표 임계값 설정 (관리자 조정용)
CREATE TABLE settings (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL
);
INSERT INTO settings VALUES ('vote_threshold_count', '30');
INSERT INTO settings VALUES ('vote_threshold_percent', '55');
INSERT INTO settings VALUES ('admin_password_hash', ''); -- 관리자가 직접 설정

-- 기본 카테고리 데이터
INSERT INTO categories (name, slug, sort_order) VALUES
  ('엔터테인먼트', 'entertainment', 1),
  ('스포츠', 'sports', 2),
  ('정치/사회', 'politics', 3),
  ('비즈니스', 'business', 4),
  ('예술/문화', 'arts', 5),
  ('방송/미디어', 'media', 6);

-- 기본 세부 유형
INSERT INTO subcategories (category_id, name, slug, sort_order) VALUES
  (1, '아이돌', 'idol', 1),
  (1, '배우', 'actor', 2),
  (1, '가수', 'singer', 3),
  (1, '코미디언', 'comedian', 4),
  (2, '축구', 'football', 1),
  (2, '야구', 'baseball', 2),
  (2, '농구', 'basketball', 3),
  (2, '테니스', 'tennis', 4),
  (2, '골프', 'golf', 5),
  (2, '기타 스포츠', 'other-sports', 6),
  (3, '정치인', 'politician', 1),
  (3, '사회운동가', 'activist', 2),
  (4, 'CEO/기업인', 'ceo', 1),
  (5, '감독', 'director', 1),
  (5, '작가', 'writer', 2),
  (5, '화가/예술가', 'artist', 3),
  (6, 'MC/진행자', 'mc', 1),
  (6, '유튜버/크리에이터', 'youtuber', 2);

-- 조회수 증가 함수
CREATE OR REPLACE FUNCTION increment_view_count(person_id INT)
RETURNS VOID AS $$
  UPDATE people SET view_count = view_count + 1 WHERE id = person_id;
$$ LANGUAGE SQL;

-- 투표 집계 뷰
CREATE VIEW vote_summary AS
SELECT
  person_id,
  mbti_type,
  COUNT(*) as vote_count,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY person_id), 1) as percentage
FROM votes
GROUP BY person_id, mbti_type;

-- RLS 정책 (공개 읽기 허용)
ALTER TABLE people ENABLE ROW LEVEL SECURITY;
ALTER TABLE votes ENABLE ROW LEVEL SECURITY;
ALTER TABLE comments ENABLE ROW LEVEL SECURITY;
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE subcategories ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read people" ON people FOR SELECT USING (true);
CREATE POLICY "Public read categories" ON categories FOR SELECT USING (true);
CREATE POLICY "Public read subcategories" ON subcategories FOR SELECT USING (true);
CREATE POLICY "Public read votes" ON votes FOR SELECT USING (true);
CREATE POLICY "Public insert votes" ON votes FOR INSERT WITH CHECK (true);
CREATE POLICY "Public read comments" ON comments FOR SELECT USING (true);
CREATE POLICY "Public insert comments" ON comments FOR INSERT WITH CHECK (true);
CREATE POLICY "Public read settings" ON settings FOR SELECT USING (true);
