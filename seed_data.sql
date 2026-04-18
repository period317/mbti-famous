-- =============================================
-- namu_wiki_url 컬럼 추가
-- =============================================
ALTER TABLE people ADD COLUMN IF NOT EXISTS namu_wiki_url TEXT;

-- =============================================
-- 시드 데이터 — 유명인 MBTI
-- subcategory_id: 아이돌=1 배우=2 가수=3 코미디언=4
--   축구=5 야구=6 농구=7 테니스=8 골프=9 기타스포츠=10
--   정치인=11 사회운동가=12 CEO=13 감독=14 작가=15 예술가=16 MC=17 유튜버=18
-- =============================================

INSERT INTO people (name, name_en, subcategory_id, nationality, mbti_official, mbti_source, mbti_confirmed, description, birth_year, namu_wiki_url) VALUES

-- ════════════════════════════════
-- 아이돌 (subcategory_id = 1)
-- ════════════════════════════════

-- BTS (공식 Weverse/V LIVE 공개)
('RM', 'Kim Namjoon', 1, 'korean', 'ENFP', 'BTS 공식 Weverse 2022 / 이전 결과 INFP → ENFP 변경', true, 'BTS 리더, 래퍼. 여러 차례 공식 채널에서 MBTI 결과 공개.', 1994, 'https://namu.wiki/w/RM(%EB%9E%A9%ED%8D%BC)'),
('진', 'Kim Seokjin', 1, 'korean', 'INTP', 'BTS 공식 Weverse 2022', true, 'BTS 멤버. 이전 ENFJ에서 INTP로 변경.', 1992, 'https://namu.wiki/w/%EC%A7%84(BTS)'),
('슈가', 'Min Yoongi', 1, 'korean', 'INTJ', 'BTS 공식 Weverse 2022', true, 'BTS 멤버, 래퍼·프로듀서. INTJ 결과 일관되게 유지.', 1993, 'https://namu.wiki/w/%EC%8A%88%EA%B0%80(BTS)'),
('제이홉', 'Jung Hoseok', 1, 'korean', 'ENFJ', 'BTS 공식 Weverse 2022', true, 'BTS 멤버, 래퍼·댄서. 에너지 넘치는 ENFJ.', 1994, 'https://namu.wiki/w/%EC%A0%9C%EC%9D%B4%ED%99%89'),
('지민', 'Park Jimin', 1, 'korean', 'INFP', 'BTS 공식 Weverse 2022', true, 'BTS 멤버. INFP 결과 공개.', 1995, 'https://namu.wiki/w/%EC%A7%80%EB%AF%BC(BTS)'),
('뷔', 'Kim Taehyung', 1, 'korean', 'ENFP', 'BTS 공식 Weverse 2023', true, 'BTS 멤버. 최근 결과 ENFP.', 1995, 'https://namu.wiki/w/%EB%B7%94'),
('정국', 'Jeon Jungkook', 1, 'korean', 'ISFJ', 'BTS 공식 채널 공개', true, 'BTS 막내. ISFJ 결과 여러 번 공개.', 1997, 'https://namu.wiki/w/%EC%A0%95%EA%B5%AD(BTS)'),

-- BLACKPINK
('지수', 'Kim Jisoo', 1, 'korean', 'ISFJ', 'BLACKPINK 공식 콘텐츠', true, 'BLACKPINK 멤버, 배우 겸업.', 1995, 'https://namu.wiki/w/%EC%A7%80%EC%88%98(BLACKPINK)'),
('제니', 'Jennie Kim', 1, 'korean', 'ISTJ', 'BLACKPINK 공식 콘텐츠', true, 'BLACKPINK 멤버, 솔로 활동.', 1996, 'https://namu.wiki/w/%EC%A0%9C%EB%8B%88(BLACKPINK)'),
('로제', 'Roseanne Park', 1, 'korean', 'INFP', 'BLACKPINK 공식 콘텐츠', true, 'BLACKPINK 멤버. INFP 결과 공개.', 1997, 'https://namu.wiki/w/%EB%A1%9C%EC%A0%9C(BLACKPINK)'),
('리사', 'Lalisa Manoban', 1, 'korean', 'ESFJ', 'BLACKPINK 공식 콘텐츠', true, 'BLACKPINK 멤버 (태국 출신).', 1997, 'https://namu.wiki/w/%EB%A6%AC%EC%82%AC(BLACKPINK)'),

-- aespa
('카리나', 'Yu Jimin', 1, 'korean', 'ISFP', 'aespa 공식 콘텐츠', true, 'aespa 멤버, 리더.', 2000, 'https://namu.wiki/w/%EC%B9%B4%EB%A6%AC%EB%82%98(aespa)'),
('윈터', 'Kim Minjeong', 1, 'korean', 'INTJ', 'aespa 공식 콘텐츠', true, 'aespa 멤버.', 2001, 'https://namu.wiki/w/%EC%9C%88%ED%84%B0(aespa)'),
('닝닝', 'Ning Yizhuo', 1, 'korean', 'ENFP', 'aespa 공식 콘텐츠', true, 'aespa 멤버 (중국 출신).', 2002, 'https://namu.wiki/w/%EB%8B%9D%EB%8B%9D(aespa)'),
('지젤', 'Uchinaga Aeri', 1, 'korean', 'INTP', 'aespa 공식 콘텐츠', true, 'aespa 멤버 (일본 출신).', 2000, 'https://namu.wiki/w/%EC%A7%80%EC%A0%A4(aespa)'),

-- NewJeans
('민지', 'Minji', 1, 'korean', 'ISFP', 'NewJeans 공식 콘텐츠', true, 'NewJeans 멤버, 리더.', 2004, 'https://namu.wiki/w/%EB%AF%BC%EC%A7%80(NewJeans)'),
('하니', 'Pham Ngoc Han', 1, 'korean', 'ENFJ', 'NewJeans 공식 콘텐츠', true, 'NewJeans 멤버 (베트남계 호주인).', 2004, 'https://namu.wiki/w/%ED%95%98%EB%8B%88(NewJeans)'),
('다니엘', 'Danielle Marsh', 1, 'korean', 'ENFP', 'NewJeans 공식 콘텐츠', true, 'NewJeans 멤버 (한국계 호주인).', 2005, 'https://namu.wiki/w/%EB%8B%A4%EB%8B%88%EC%97%98(NewJeans)'),
('혜인', 'Hyein', 1, 'korean', 'ISFJ', 'NewJeans 공식 콘텐츠', true, 'NewJeans 막내.', 2008, 'https://namu.wiki/w/%ED%98%9C%EC%9D%B8(NewJeans)'),

-- Stray Kids
('방찬', 'Bang Chan', 1, 'korean', 'ENFJ', 'Stray Kids 공식 콘텐츠', true, 'Stray Kids 리더 (호주 출신).', 2000, 'https://namu.wiki/w/%EB%B0%A9%EC%B0%AC'),
('필릭스', 'Lee Felix', 1, 'korean', 'ENFP', 'Stray Kids 공식 콘텐츠', true, 'Stray Kids 멤버 (호주 출신).', 2000, 'https://namu.wiki/w/%ED%95%84%EB%A6%AD%EC%8A%A4(Stray%20Kids)'),
('현진', 'Hwang Hyunjin', 1, 'korean', 'ISFP', 'Stray Kids 공식 콘텐츠', true, 'Stray Kids 멤버.', 2000, 'https://namu.wiki/w/%ED%98%84%EC%A7%84(Stray%20Kids)'),

-- SEVENTEEN
('에스쿱스', 'Choi Seungcheol', 1, 'korean', 'ISFJ', 'SEVENTEEN 공식 콘텐츠', true, 'SEVENTEEN 리더.', 1995, 'https://namu.wiki/w/%EC%97%90%EC%8A%A4%EC%BF%B5%EC%A6%88'),
('호시', 'Kwon Soonyoung', 1, 'korean', 'ESTP', 'SEVENTEEN 공식 콘텐츠', true, 'SEVENTEEN 퍼포먼스팀 리더.', 1996, 'https://namu.wiki/w/%ED%98%B8%EC%8B%9C(SEVENTEEN)'),
('버논', 'Hansol Vernon Chwe', 1, 'korean', 'INTP', 'SEVENTEEN 공식 콘텐츠', true, 'SEVENTEEN 멤버 (한국계 미국인).', 1998, 'https://namu.wiki/w/%EB%B2%84%EB%85%BC(SEVENTEEN)'),

-- EXO/솔로
('카이', 'Kim Jongin', 1, 'korean', 'ISFP', 'EXO 공식 콘텐츠', true, 'EXO 멤버, 솔로 활동.', 1994, 'https://namu.wiki/w/%EC%B9%B4%EC%9D%B4(EXO)'),
('첸', 'Kim Jongdae', 1, 'korean', 'ENFJ', 'EXO 공식 콘텐츠', true, 'EXO 멤버.', 1992, 'https://namu.wiki/w/%EC%B2%B8'),

-- TWICE
('나연', 'Im Nayeon', 1, 'korean', 'ENFJ', 'TWICE 공식 콘텐츠', true, 'TWICE 멤버.', 1995, 'https://namu.wiki/w/%EB%82%98%EC%97%B0(TWICE)'),
('사나', 'Minatozaki Sana', 1, 'korean', 'ESFP', 'TWICE 공식 콘텐츠', true, 'TWICE 멤버 (일본 출신).', 1996, 'https://namu.wiki/w/%EC%82%AC%EB%82%98(TWICE)'),
('다현', 'Kim Dahyun', 1, 'korean', 'ENFP', 'TWICE 공식 콘텐츠', true, 'TWICE 멤버.', 1998, 'https://namu.wiki/w/%EB%8B%A4%ED%98%84(TWICE)'),

-- ════════════════════════════════
-- 배우 (subcategory_id = 2)
-- ════════════════════════════════
('이정재', 'Lee Jung-jae', 2, 'korean', 'ISTP', '인터뷰 및 프로필 공개', false, '오징어 게임 주연, 에미상 수상 배우.', 1972, 'https://namu.wiki/w/%EC%9D%B4%EC%A0%95%EC%9E%AC(%EB%B0%B0%EC%9A%B0)'),
('김혜수', 'Kim Hye-soo', 2, 'korean', NULL, NULL, false, '대한민국 대표 여배우.', 1970, 'https://namu.wiki/w/%EA%B9%80%ED%98%9C%EC%88%98(%EB%B0%B0%EC%9A%B0)'),
('송강호', 'Song Kang-ho', 2, 'korean', NULL, NULL, false, '기생충, 살인의 추억 등 칸 영화제 남우주연상 수상 배우.', 1967, 'https://namu.wiki/w/%EC%86%A1%EA%B0%95%ED%98%B8'),
('전지현', 'Jun Ji-hyun', 2, 'korean', NULL, NULL, false, '별에서 온 그대, 도깨비 등 한류 대표 배우.', 1981, 'https://namu.wiki/w/%EC%A0%84%EC%A7%80%ED%98%84(%EB%B0%B0%EC%9A%B0)'),
('공유', 'Gong Yoo', 2, 'korean', NULL, NULL, false, '커피프린스 1호점, 도깨비 주연.', 1979, 'https://namu.wiki/w/%EA%B3%B5%EC%9C%A0(%EB%B0%B0%EC%9A%B0)'),
('이민호', 'Lee Min-ho', 2, 'korean', 'ISTP', '공식 팬미팅 공개', false, '꽃보다 남자, 상속자들 등 한류 배우.', 1987, 'https://namu.wiki/w/%EC%9D%B4%EB%AF%BC%ED%98%B8(%EB%B0%B0%EC%9A%B0)'),
('박서준', 'Park Seo-joon', 2, 'korean', 'ISFP', '인터뷰 공개', false, '이태원 클라쓰, 어벤져스 등 출연 배우.', 1988, 'https://namu.wiki/w/%EB%B0%95%EC%84%9C%EC%A4%80(%EB%B0%B0%EC%9A%B0)'),
('김고은', 'Kim Go-eun', 2, 'korean', 'INFP', '인터뷰 공개', false, '도깨비, 유미의 세포들 주연 배우.', 1991, 'https://namu.wiki/w/%EA%B9%80%EA%B3%A0%EC%9D%80(%EB%B0%B0%EC%9A%B0)'),

-- 외국 배우
('레오나르도 디카프리오', 'Leonardo DiCaprio', 2, 'foreign', 'ISFP', '전문가 분석 및 인터뷰 종합', false, '타이타닉, 레버넌트 아카데미상 수상 배우.', 1974, 'https://namu.wiki/w/%EB%A0%88%EC%98%A4%EB%82%98%EB%A5%B4%EB%8F%84_%EB%94%94%EC%BA%90%ED%94%84%EB%A6%AC%EC%98%A4'),
('메릴 스트립', 'Meryl Streep', 2, 'foreign', 'INTJ', '전문가 분석', false, '역대 아카데미상 최다 노미네이트 배우.', 1949, 'https://namu.wiki/w/%EB%A9%94%EB%A6%B4_%EC%8A%A4%ED%8A%B8%EB%A6%BD'),
('조니 뎁', 'Johnny Depp', 2, 'foreign', 'INFP', '인터뷰 및 전문가 분석 종합', false, '캐리비안의 해적 시리즈 주연.', 1963, 'https://namu.wiki/w/%EC%A1%B0%EB%8B%88_%EB%8E%81'),
('키아누 리브스', 'Keanu Reeves', 2, 'foreign', 'INFP', '인터뷰 종합', false, '매트릭스, 존 윅 시리즈 주연.', 1964, 'https://namu.wiki/w/%ED%82%A4%EC%95%84%EB%88%84_%EB%A6%AC%EB%B8%8C%EC%8A%A4'),
('나탈리 포트만', 'Natalie Portman', 2, 'foreign', 'INFJ', '전문가 분석', false, '블랙 스완, 레옹 등 출연 배우.', 1981, 'https://namu.wiki/w/%EB%82%98%ED%83%88%EB%A6%AC_%ED%8F%AC%ED%8A%B8%EB%A7%8C'),

-- ════════════════════════════════
-- 가수 (subcategory_id = 3)
-- ════════════════════════════════
('아이유', 'IU', 3, 'korean', 'INFP', '팬 사인회 및 인터뷰 공개', true, '국민 여동생, 작곡가 겸 싱어송라이터.', 1993, 'https://namu.wiki/w/%EC%95%84%EC%9D%B4%EC%9C%A0'),
('지드래곤', 'G-Dragon', 3, 'korean', 'ISTP', '인터뷰 종합', false, '빅뱅 멤버, K-pop 아이콘.', 1988, 'https://namu.wiki/w/%EC%A7%80%EB%93%9C%EB%9E%98%EA%B3%A4'),
('태양', 'Taeyang', 3, 'korean', 'ISFP', '인터뷰 종합', false, '빅뱅 멤버.', 1988, 'https://namu.wiki/w/%ED%83%9C%EC%96%91(%EA%B0%80%EC%88%98)'),
('박효신', 'Park Hyo-shin', 3, 'korean', 'INFP', '인터뷰 공개', false, '뮤지컬 배우 겸 가수.', 1981, 'https://namu.wiki/w/%EB%B0%95%ED%9A%A8%EC%8B%A0'),
('테일러 스위프트', 'Taylor Swift', 3, 'foreign', 'ENFJ', '인터뷰 및 전문가 분석 종합', false, '팝 슈퍼스타, 싱어송라이터.', 1989, 'https://namu.wiki/w/%ED%85%8C%EC%9D%BC%EB%9F%AC_%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8'),
('비욘세', 'Beyoncé', 3, 'foreign', 'ISFJ', '전문가 분석', false, '팝·R&B 슈퍼스타.', 1981, 'https://namu.wiki/w/%EB%B9%84%EC%9A%98%EC%84%B8'),
('에미넴', 'Eminem', 3, 'foreign', 'ISTP', '인터뷰 및 전문가 분석', false, '힙합 레전드.', 1972, 'https://namu.wiki/w/%EC%97%90%EB%AF%B8%EB%84%B4'),
('커트 코베인', 'Kurt Cobain', 3, 'foreign', 'INFP', '인터뷰·일기·전문가 분석 종합', false, '너바나 보컬. INFP의 대표적 인물로 자주 언급.', 1967, 'https://namu.wiki/w/%EC%BB%A4%ED%8A%B8_%EC%BD%94%EB%B2%A0%EC%9D%B8'),
('데이비드 보위', 'David Bowie', 3, 'foreign', 'ENFP', '전문가 분석', false, '글램록 전설, 예술적 다양성으로 유명.', 1947, 'https://namu.wiki/w/%EB%8D%B0%EC%9D%B4%EB%B9%84%EB%93%9C_%EB%B3%B4%EC%9C%84'),

-- ════════════════════════════════
-- 축구 (subcategory_id = 5)
-- ════════════════════════════════
('손흥민', 'Son Heung-min', 5, 'korean', 'ESFJ', '인터뷰 및 공개 콘텐츠 종합', false, '토트넘 홋스퍼 주전, 아시아 축구 레전드.', 1992, 'https://namu.wiki/w/%EC%86%90%ED%9D%A5%EB%AF%BC'),
('이강인', 'Lee Kang-in', 5, 'korean', 'ENFP', '공식 SNS 공개', true, 'PSG 소속, 황금세대 스타 플레이어.', 2001, 'https://namu.wiki/w/%EC%9D%B4%EA%B0%95%EC%9D%B8'),
('리오넬 메시', 'Lionel Messi', 5, 'foreign', 'ISFP', '전문가 분석', false, '역대 최고 축구 선수 중 한 명. 발롱도르 8회 수상.', 1987, 'https://namu.wiki/w/%EB%A6%AC%EC%98%A4%EB%84%AC_%EB%A9%94%EC%8B%9C'),
('크리스티아누 호날두', 'Cristiano Ronaldo', 5, 'foreign', 'ENTJ', '전문가 분석 및 인터뷰 종합', false, '세계 최고 수준 스트라이커. 자기관리의 아이콘.', 1985, 'https://namu.wiki/w/%ED%81%AC%EB%A6%AC%EC%8A%A4%ED%8B%B0%EC%95%84%EB%88%84_%ED%98%B8%EB%82%A0%EB%91%90'),
('킬리안 음바페', 'Kylian Mbappé', 5, 'foreign', 'ENFJ', '인터뷰 종합', false, '레알 마드리드 공격수, 차세대 최고 선수.', 2001, 'https://namu.wiki/w/%ED%82%AC%EB%A6%AC%EC%95%88_%EB%AF%80%EB%B0%94%ED%8E%98'),

-- ════════════════════════════════
-- 야구 (subcategory_id = 6)
-- ════════════════════════════════
('오타니 쇼헤이', 'Shohei Ohtani', 6, 'foreign', 'ISFJ', '인터뷰 종합', false, 'LA 다저스 투타겸업 슈퍼스타.', 1994, 'https://namu.wiki/w/%EC%98%A4%ED%83%80%EB%8B%88_%EC%87%BC%ED%97%A4%EC%9D%B4'),
('류현진', 'Ryu Hyun-jin', 6, 'korean', 'ISFP', '인터뷰 종합', false, '대한민국 최고의 좌완 투수.', 1987, 'https://namu.wiki/w/%EB%A5%98%ED%98%84%EC%A7%84'),

-- ════════════════════════════════
-- 테니스 (subcategory_id = 8)
-- ════════════════════════════════
('로저 페더러', 'Roger Federer', 8, 'foreign', 'ISFP', '전문가 분석 및 인터뷰 종합', false, '테니스 레전드, 그랜드슬램 20회 우승.', 1981, 'https://namu.wiki/w/%EB%A1%9C%EC%A0%80_%ED%8E%98%EB%8D%94%EB%9F%AC'),
('정현', 'Chung Hyeon', 8, 'korean', 'INTJ', '인터뷰 공개', false, '한국 테니스 간판 선수.', 1996, 'https://namu.wiki/w/%EC%A0%95%ED%98%84(%ED%85%8C%EB%8B%88%EC%8A%A4_%EC%84%A0%EC%88%98)'),

-- ════════════════════════════════
-- 골프 (subcategory_id = 9)
-- ════════════════════════════════
('박세리', 'Se Ri Pak', 9, 'korean', 'ISTJ', '전문가 분석', false, 'LPGA 레전드, 박세리 키즈의 어머니.', 1977, 'https://namu.wiki/w/%EB%B0%95%EC%84%B8%EB%A6%AC'),
('고진영', 'Ko Jin-young', 9, 'korean', 'INFJ', '인터뷰 종합', false, '세계 1위 여자 골퍼.', 1995, 'https://namu.wiki/w/%EA%B3%A0%EC%A7%84%EC%98%81'),
('타이거 우즈', 'Tiger Woods', 9, 'foreign', 'ISTP', '전문가 분석', false, '역대 최고 골퍼 중 한 명, 메이저 15회 우승.', 1975, 'https://namu.wiki/w/%ED%83%80%EC%9D%B4%EA%B1%B0_%EC%9A%B0%EC%A6%88'),

-- ════════════════════════════════
-- 정치인 (subcategory_id = 11)
-- ════════════════════════════════
('버락 오바마', 'Barack Obama', 11, 'foreign', 'ENFJ', '전문가 분석 및 연설·저술 종합', false, '미국 44대 대통령, 노벨평화상 수상.', 1961, 'https://namu.wiki/w/%EB%B2%84%EB%9D%BD_%EC%98%A4%EB%B0%94%EB%A7%88'),
('존 F. 케네디', 'John F. Kennedy', 11, 'foreign', 'ENFP', '전문가 분석', false, '미국 35대 대통령.', 1917, 'https://namu.wiki/w/%EC%A1%B4_%ED%94%BC%EC%B8%A0%EC%A0%9C%EB%9F%B4%EB%93%9C_%EC%BC%80%EB%84%A4%EB%94%94'),
('마가렛 대처', 'Margaret Thatcher', 11, 'foreign', 'ENTJ', '전문가 분석', false, '영국 최초 여성 총리, 철의 여인.', 1925, 'https://namu.wiki/w/%EB%A7%88%EA%B0%80%EB%A0%9B_%EB%8C%80%EC%B2%98'),
('넬슨 만델라', 'Nelson Mandela', 11, 'foreign', 'ENFJ', '전문가 분석', false, '남아공 최초 흑인 대통령, 노벨평화상 수상.', 1918, 'https://namu.wiki/w/%EB%84%AC%EC%8A%A8_%EB%A7%8C%EB%8D%B8%EB%9D%BC'),

-- ════════════════════════════════
-- CEO/기업인 (subcategory_id = 13)
-- ════════════════════════════════
('스티브 잡스', 'Steve Jobs', 13, 'foreign', 'ENTJ', '전문가 분석 및 전기 종합', false, '애플 공동창업자. 혁신의 아이콘.', 1955, 'https://namu.wiki/w/%EC%8A%A4%ED%8B%B0%EB%B8%8C_%EC%9E%A1%EC%8A%A4'),
('일론 머스크', 'Elon Musk', 13, 'foreign', 'INTJ', '인터뷰 종합', false, '테슬라·SpaceX·X 창업자.', 1971, 'https://namu.wiki/w/%EC%9D%BC%EB%A1%A0_%EB%A8%B8%EC%8A%A4%ED%81%AC'),
('마크 저커버그', 'Mark Zuckerberg', 13, 'foreign', 'INTJ', '인터뷰 및 전문가 분석', false, '메타(페이스북) 창업자 겸 CEO.', 1984, 'https://namu.wiki/w/%EB%A7%88%ED%81%AC_%EC%A0%80%EC%BB%A4%EB%B2%84%EA%B7%B8'),
('빌 게이츠', 'Bill Gates', 13, 'foreign', 'ENTJ', '전문가 분석', false, '마이크로소프트 창업자, 자선사업가.', 1955, 'https://namu.wiki/w/%EB%B9%8C_%EA%B2%8C%EC%9D%B4%EC%B8%A0'),
('워렌 버핏', 'Warren Buffett', 13, 'foreign', 'ISTJ', '전문가 분석 및 인터뷰 종합', false, '오마하의 현인, 세계 최고 투자자.', 1930, 'https://namu.wiki/w/%EC%9B%8C%EB%A0%8C_%EB%B2%84%ED%95%8F'),
('이재용', 'Lee Jae-yong', 13, 'korean', NULL, NULL, false, '삼성전자 회장.', 1968, 'https://namu.wiki/w/%EC%9D%B4%EC%9E%AC%EC%9A%A9(%EC%82%BC%EC%84%B1)'),

-- ════════════════════════════════
-- 감독 (subcategory_id = 14)
-- ════════════════════════════════
('봉준호', 'Bong Joon-ho', 14, 'korean', 'INTP', '인터뷰 종합', false, '기생충으로 아카데미 4관왕. 장르의 경계를 허문 감독.', 1969, 'https://namu.wiki/w/%EB%B4%89%EC%A4%80%ED%98%B8'),
('박찬욱', 'Park Chan-wook', 14, 'korean', 'INTJ', '인터뷰 종합', false, '올드보이, 헤어질 결심 등 칸 영화제 수상 감독.', 1963, 'https://namu.wiki/w/%EB%B0%95%EC%B0%AC%EC%9A%B1'),
('크리스토퍼 놀란', 'Christopher Nolan', 14, 'foreign', 'INTJ', '전문가 분석 및 인터뷰 종합', false, '인셉션, 인터스텔라, 오펜하이머 감독.', 1970, 'https://namu.wiki/w/%ED%81%AC%EB%A6%AC%EC%8A%A4%ED%86%A0%ED%8D%BC_%EB%86%80%EB%9E%80'),
('스티븐 스필버그', 'Steven Spielberg', 14, 'foreign', 'ENFP', '전문가 분석', false, 'E.T., 쉰들러 리스트 등 할리우드 거장.', 1946, 'https://namu.wiki/w/%EC%8A%A4%ED%8B%B0%EB%B8%90_%EC%8A%A4%ED%95%84%EB%B2%84%EA%B7%B8'),

-- ════════════════════════════════
-- 작가 (subcategory_id = 15)
-- ════════════════════════════════
('한강', 'Han Kang', 15, 'korean', 'INFJ', '인터뷰 종합', false, '채식주의자, 소년이 온다 저자. 노벨문학상 수상.', 1970, 'https://namu.wiki/w/%ED%95%9C%EA%B0%95(%EC%86%8C%EC%84%A4%EA%B0%80)'),
('무라카미 하루키', 'Haruki Murakami', 15, 'foreign', 'INFP', '인터뷰 및 에세이 종합', false, '노르웨이의 숲, 1Q84 저자.', 1949, 'https://namu.wiki/w/%EB%AC%B4%EB%9D%BC%EC%B9%B4%EB%AF%B8_%ED%95%98%EB%A3%A8%ED%82%A4'),
('J.K. 롤링', 'J.K. Rowling', 15, 'foreign', 'INFJ', '인터뷰 및 전문가 분석', false, '해리포터 시리즈 저자.', 1965, 'https://namu.wiki/w/J.K.%20%EB%A1%A4%EB%A7%81'),
('어니스트 헤밍웨이', 'Ernest Hemingway', 15, 'foreign', 'ISTP', '전문가 분석', false, '노인과 바다, 무기여 잘 있거라 저자. 노벨문학상 수상.', 1899, 'https://namu.wiki/w/%EC%96%B4%EB%8B%88%EC%8A%A4%ED%8A%B8_%ED%97%A4%EB%B0%8D%EC%9B%A8%EC%9D%B4'),
('프란츠 카프카', 'Franz Kafka', 15, 'foreign', 'INFP', '전문가 분석', false, '변신, 심판 저자. INFP의 아이콘적 인물.', 1883, 'https://namu.wiki/w/%ED%94%84%EB%9E%80%EC%B8%A0_%EC%B9%B4%ED%94%84%EC%B9%B4'),

-- ════════════════════════════════
-- 역사적 인물 / 예술가 (subcategory_id = 16)
-- ════════════════════════════════
('레오나르도 다빈치', 'Leonardo da Vinci', 16, 'foreign', 'ENTP', '전문가 분석 (역사 기록 종합)', false, '르네상스 시대 화가·발명가·과학자.', 1452, 'https://namu.wiki/w/%EB%A0%88%EC%98%A4%EB%82%98%EB%A5%B4%EB%8F%84_%EB%8B%A4%EB%B9%88%EC%B9%98'),
('앨버트 아인슈타인', 'Albert Einstein', 16, 'foreign', 'INTP', '전문가 분석 (저술·편지 종합)', false, '상대성이론 제창, 노벨물리학상 수상.', 1879, 'https://namu.wiki/w/%EC%95%8C%EB%B2%84%ED%8A%B8_%EC%95%84%EC%9D%B8%EC%8A%88%ED%83%80%EC%9D%B8'),
('니체', 'Friedrich Nietzsche', 16, 'foreign', 'INTJ', '전문가 분석', false, '차라투스트라는 이렇게 말했다 저자. 철학자.', 1844, 'https://namu.wiki/w/%ED%94%84%EB%A6%AC%EB%93%9C%EB%A6%AC%ED%9E%88_%EB%8B%88%EC%B2%B4'),
('반 고흐', 'Vincent van Gogh', 16, 'foreign', 'INFP', '전문가 분석 (편지 종합)', false, '별이 빛나는 밤, 해바라기 등 후기 인상주의 화가.', 1853, 'https://namu.wiki/w/%EB%B9%88%EC%84%BC%ED%8A%B8_%EB%B0%98_%EA%B3%A0%ED%9D%90');
