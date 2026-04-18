-- =============================================
-- 추가 인물 데이터 (seed_data.sql 이후 실행)
-- 총 ~200명 추가
-- =============================================

INSERT INTO people (name, name_en, subcategory_id, nationality, mbti_official, mbti_source, mbti_confirmed, description, birth_year, namu_wiki_url) VALUES

-- ════════════════════════════════
-- 아이돌 추가 (subcategory_id = 1)
-- ════════════════════════════════

-- Stray Kids 추가
('리노', 'Lee Know', 1, 'korean', 'ISTP', 'Stray Kids 공식 채널', true, 'Stray Kids 멤버, 댄스 리더.', 1998, 'https://namu.wiki/w/리노(Stray Kids)'),
('현진', 'Hyunjin', 1, 'korean', 'ENFP', 'Stray Kids 공식 채널', true, 'Stray Kids 멤버, 비주얼·댄서·화가.', 2000, 'https://namu.wiki/w/현진(Stray Kids)'),
('한', 'Han', 1, 'korean', 'INFP', 'Stray Kids 공식 채널', true, 'Stray Kids 멤버, 메인 래퍼·작사가.', 2000, 'https://namu.wiki/w/한(Stray Kids)'),
('승민', 'Seungmin', 1, 'korean', 'ISTJ', 'Stray Kids 공식 채널', true, 'Stray Kids 멤버, 메인 보컬.', 2000, 'https://namu.wiki/w/승민(Stray Kids)'),
('아이엔', 'I.N.', 1, 'korean', 'ISFP', 'Stray Kids 공식 채널', true, 'Stray Kids 막내 멤버.', 2001, 'https://namu.wiki/w/아이엔'),

-- SEVENTEEN 추가
('에스쿱스', 'S.Coups', 1, 'korean', 'ESFJ', 'SEVENTEEN 공식 콘텐츠', true, 'SEVENTEEN 리더, 힙합 유닛.', 1995, 'https://namu.wiki/w/에스쿱스'),
('정한', 'Jeonghan', 1, 'korean', 'INFP', 'SEVENTEEN 공식 콘텐츠', true, 'SEVENTEEN 멤버, 보컬 유닛.', 1995, 'https://namu.wiki/w/정한(SEVENTEEN)'),
('조슈아', 'Joshua', 1, 'korean', 'ISFJ', 'SEVENTEEN 공식 콘텐츠', true, 'SEVENTEEN 멤버, 미국 출신.', 1995, 'https://namu.wiki/w/조슈아(SEVENTEEN)'),
('원우', 'Wonwoo', 1, 'korean', 'INFP', 'SEVENTEEN 공식 콘텐츠', true, 'SEVENTEEN 멤버, 힙합 유닛.', 1996, 'https://namu.wiki/w/원우(SEVENTEEN)'),
('우지', 'Woozi', 1, 'korean', 'INTJ', 'SEVENTEEN 공식 콘텐츠', true, 'SEVENTEEN 메인 프로듀서.', 1996, 'https://namu.wiki/w/우지(SEVENTEEN)'),
('디에잇', 'The8', 1, 'korean', 'ISFP', 'SEVENTEEN 공식 콘텐츠', true, 'SEVENTEEN 멤버, 중국 출신.', 1996, 'https://namu.wiki/w/디에잇'),
('민규', 'Mingyu', 1, 'korean', 'ENTJ', 'SEVENTEEN 공식 콘텐츠', true, 'SEVENTEEN 멤버, 비주얼.', 1997, 'https://namu.wiki/w/민규(SEVENTEEN)'),
('도겸', 'DK', 1, 'korean', 'ESFJ', 'SEVENTEEN 공식 콘텐츠', true, 'SEVENTEEN 메인 보컬.', 1997, 'https://namu.wiki/w/도겸'),
('승관', 'Seungkwan', 1, 'korean', 'ESFJ', 'SEVENTEEN 공식 콘텐츠', true, 'SEVENTEEN 멤버, 제주 출신 보컬.', 1998, 'https://namu.wiki/w/승관(SEVENTEEN)'),
('버논', 'Vernon', 1, 'korean', 'ISFP', 'SEVENTEEN 공식 콘텐츠', true, 'SEVENTEEN 멤버, 미국 출신.', 1998, 'https://namu.wiki/w/버논(SEVENTEEN)'),
('디노', 'Dino', 1, 'korean', 'ISFJ', 'SEVENTEEN 공식 콘텐츠', true, 'SEVENTEEN 막내, 퍼포먼스 유닛.', 1999, 'https://namu.wiki/w/디노(SEVENTEEN)'),

-- EXO 추가
('수호', 'Suho', 1, 'korean', 'ENFJ', 'EXO 공식 콘텐츠', true, 'EXO 리더, 배우 겸업.', 1991, 'https://namu.wiki/w/수호(EXO)'),
('찬열', 'Chanyeol', 1, 'korean', 'ENFP', 'EXO 공식 콘텐츠', true, 'EXO 멤버, 래퍼·배우·음악 프로듀서.', 1992, 'https://namu.wiki/w/찬열'),
('첸', 'Chen', 1, 'korean', 'ENFP', 'EXO 공식 콘텐츠', true, 'EXO 메인 보컬.', 1992, 'https://namu.wiki/w/첸(EXO)'),
('디오', 'D.O.', 1, 'korean', 'ISFJ', 'EXO 공식 콘텐츠', true, 'EXO 메인 보컬, 배우 겸업.', 1993, 'https://namu.wiki/w/디오(EXO)'),
('카이', 'Kai', 1, 'korean', 'INFJ', 'EXO 공식 콘텐츠', true, 'EXO 메인 댄서, 솔로 활동 중.', 1994, 'https://namu.wiki/w/카이(EXO)'),
('세훈', 'Sehun', 1, 'korean', 'ISTJ', 'EXO 공식 콘텐츠', true, 'EXO 막내, 배우 겸업.', 1994, 'https://namu.wiki/w/세훈'),
('시우민', 'Xiumin', 1, 'korean', 'ISTJ', 'EXO 공식 콘텐츠', true, 'EXO 최연장자.', 1990, 'https://namu.wiki/w/시우민'),
('레이', 'Lay', 1, 'foreign', 'INFP', 'EXO 공식 콘텐츠', true, 'EXO 멤버, 중국 출신 솔로 아티스트.', 1991, 'https://namu.wiki/w/레이(EXO)'),

-- TWICE 추가
('정연', 'Jeongyeon', 1, 'korean', 'ISFJ', 'TWICE 공식 콘텐츠', true, 'TWICE 멤버, 부드러운 보컬.', 1996, 'https://namu.wiki/w/정연(TWICE)'),
('모모', 'Momo', 1, 'foreign', 'ESTP', 'TWICE 공식 콘텐츠', true, 'TWICE 멤버, 일본 출신 댄서.', 1996, 'https://namu.wiki/w/모모(TWICE)'),
('사나', 'Sana', 1, 'foreign', 'ESFP', 'TWICE 공식 콘텐츠', true, 'TWICE 멤버, 일본 출신.', 1996, 'https://namu.wiki/w/사나(TWICE)'),
('미나', 'Mina', 1, 'foreign', 'ISFP', 'TWICE 공식 콘텐츠', true, 'TWICE 멤버, 일본 출신 발레 전공.', 1997, 'https://namu.wiki/w/미나(TWICE)'),
('다현', 'Dahyun', 1, 'korean', 'ENFP', 'TWICE 공식 콘텐츠', true, 'TWICE 멤버, 래퍼.', 1998, 'https://namu.wiki/w/다현(TWICE)'),
('쯔위', 'Tzuyu', 1, 'foreign', 'INFP', 'TWICE 공식 콘텐츠', true, 'TWICE 막내, 대만 출신 비주얼.', 1999, 'https://namu.wiki/w/쯔위'),

-- Red Velvet
('아이린', 'Irene', 1, 'korean', 'INTJ', 'Red Velvet 공식 콘텐츠', true, 'Red Velvet 리더, 비주얼.', 1991, 'https://namu.wiki/w/아이린(Red Velvet)'),
('슬기', 'Seulgi', 1, 'korean', 'ISFP', 'Red Velvet 공식 콘텐츠', true, 'Red Velvet 메인 댄서.', 1994, 'https://namu.wiki/w/슬기(Red Velvet)'),
('웬디', 'Wendy', 1, 'korean', 'ENFJ', 'Red Velvet 공식 콘텐츠', true, 'Red Velvet 메인 보컬, 캐나다 출신.', 1994, 'https://namu.wiki/w/웬디(Red Velvet)'),
('조이', 'Joy', 1, 'korean', 'ENFP', 'Red Velvet 공식 콘텐츠', true, 'Red Velvet 멤버, 배우 겸업.', 1996, 'https://namu.wiki/w/조이(Red Velvet)'),
('예리', 'Yeri', 1, 'korean', 'ENFP', 'Red Velvet 공식 콘텐츠', true, 'Red Velvet 막내.', 1999, 'https://namu.wiki/w/예리'),

-- ITZY
('예지', 'Yeji', 1, 'korean', 'ESTJ', 'ITZY 공식 콘텐츠', true, 'ITZY 리더, 메인 댄서·보컬.', 2000, 'https://namu.wiki/w/예지(ITZY)'),
('리아', 'Lia', 1, 'korean', 'ISFJ', 'ITZY 공식 콘텐츠', true, 'ITZY 멤버, 캐나다 출신.', 2000, 'https://namu.wiki/w/리아(ITZY)'),
('류진', 'Ryujin', 1, 'korean', 'ENTP', 'ITZY 공식 콘텐츠', true, 'ITZY 메인 래퍼, 메인 댄서.', 2001, 'https://namu.wiki/w/류진(ITZY)'),
('채령', 'Chaeryeong', 1, 'korean', 'ISFJ', 'ITZY 공식 콘텐츠', true, 'ITZY 멤버, 메인 댄서.', 2001, 'https://namu.wiki/w/채령'),
('유나', 'Yuna', 1, 'korean', 'ESFJ', 'ITZY 공식 콘텐츠', true, 'ITZY 막내, 비주얼.', 2003, 'https://namu.wiki/w/유나(ITZY)'),

-- (G)I-DLE
('소연', 'Soyeon', 1, 'korean', 'ENTJ', '(G)I-DLE 공식 콘텐츠', true, '(G)I-DLE 리더, 메인 래퍼·프로듀서.', 1998, 'https://namu.wiki/w/소연((G)I-DLE)'),
('미연', 'Miyeon', 1, 'korean', 'ISFJ', '(G)I-DLE 공식 콘텐츠', true, '(G)I-DLE 메인 보컬.', 1997, 'https://namu.wiki/w/미연((G)I-DLE)'),
('민니', 'Minnie', 1, 'foreign', 'ISFP', '(G)I-DLE 공식 콘텐츠', true, '(G)I-DLE 멤버, 태국 출신.', 1997, 'https://namu.wiki/w/민니'),
('우기', 'Yuqi', 1, 'foreign', 'ENFP', '(G)I-DLE 공식 콘텐츠', true, '(G)I-DLE 멤버, 중국 출신.', 1999, 'https://namu.wiki/w/우기'),
('슈화', 'Shuhua', 1, 'foreign', 'ISFP', '(G)I-DLE 공식 콘텐츠', true, '(G)I-DLE 막내, 대만 출신.', 2000, 'https://namu.wiki/w/슈화'),

-- IVE
('안유진', 'An Yujin', 1, 'korean', 'ENFP', 'IVE 공식 콘텐츠', true, 'IVE 리더, IZ*ONE 출신.', 2003, 'https://namu.wiki/w/안유진(아이브)'),
('가을', 'Gaeul', 1, 'korean', 'ISFJ', 'IVE 공식 콘텐츠', true, 'IVE 멤버.', 2002, 'https://namu.wiki/w/가을(아이브)'),
('레이', 'Rei', 1, 'foreign', 'INTJ', 'IVE 공식 콘텐츠', true, 'IVE 멤버, 일본 출신.', 2004, 'https://namu.wiki/w/레이(아이브)'),
('장원영', 'Wonyoung', 1, 'korean', 'ESFJ', 'IVE 공식 콘텐츠', true, 'IVE 센터, IZ*ONE 출신.', 2004, 'https://namu.wiki/w/장원영'),
('리즈', 'Liz', 1, 'korean', 'ENFJ', 'IVE 공식 콘텐츠', true, 'IVE 메인 보컬.', 2004, 'https://namu.wiki/w/리즈(아이브)'),
('이서', 'Leeseo', 1, 'korean', 'INFP', 'IVE 공식 콘텐츠', true, 'IVE 막내.', 2007, 'https://namu.wiki/w/이서(아이브)'),

-- Le Sserafim
('사쿠라', 'Sakura', 1, 'foreign', 'INTP', 'Le Sserafim 공식 콘텐츠', true, 'Le Sserafim 멤버, 일본 출신. IZ*ONE 출신.', 1998, 'https://namu.wiki/w/미야와키 사쿠라'),
('김채원', 'Chaewon', 1, 'korean', 'ISTJ', 'Le Sserafim 공식 콘텐츠', true, 'Le Sserafim 리더. IZ*ONE 출신.', 2000, 'https://namu.wiki/w/김채원(르세라핌)'),
('허윤진', 'Yunjin', 1, 'korean', 'ENFP', 'Le Sserafim 공식 콘텐츠', true, 'Le Sserafim 멤버, 미국 출신.', 2001, 'https://namu.wiki/w/허윤진'),
('카즈하', 'Kazuha', 1, 'foreign', 'INFJ', 'Le Sserafim 공식 콘텐츠', true, 'Le Sserafim 멤버, 일본 출신 발레리나.', 2003, 'https://namu.wiki/w/카즈하(르세라핌)'),
('홍은채', 'Eunchae', 1, 'korean', 'ESFP', 'Le Sserafim 공식 콘텐츠', true, 'Le Sserafim 막내.', 2006, 'https://namu.wiki/w/홍은채'),

-- GOT7
('재범', 'Jay B', 1, 'korean', 'ISTP', 'GOT7 공식 콘텐츠', true, 'GOT7 리더, 영화감독 겸업.', 1994, 'https://namu.wiki/w/임재범(GOT7)'),
('마크', 'Mark Tuan', 1, 'foreign', 'INFP', 'GOT7 공식 콘텐츠', true, 'GOT7 멤버, 미국 출신.', 1993, 'https://namu.wiki/w/마크(GOT7)'),
('잭슨', 'Jackson Wang', 1, 'foreign', 'ESFJ', 'GOT7 공식 콘텐츠', true, 'GOT7 멤버, 홍콩 출신 솔로 아티스트.', 1994, 'https://namu.wiki/w/잭슨(GOT7)'),
('박진영', 'Jinyoung', 1, 'korean', 'INFJ', 'GOT7 공식 콘텐츠', true, 'GOT7 멤버, 배우 겸업.', 1994, 'https://namu.wiki/w/박진영(GOT7)'),
('영재', 'Youngjae', 1, 'korean', 'ENFP', 'GOT7 공식 콘텐츠', true, 'GOT7 메인 보컬.', 1996, 'https://namu.wiki/w/최영재(GOT7)'),
('뱀뱀', 'BamBam', 1, 'foreign', 'ESFP', 'GOT7 공식 콘텐츠', true, 'GOT7 멤버, 태국 출신.', 1997, 'https://namu.wiki/w/뱀뱀'),
('유겸', 'Yugyeom', 1, 'korean', 'ISFJ', 'GOT7 공식 콘텐츠', true, 'GOT7 막내, 메인 댄서.', 1997, 'https://namu.wiki/w/김유겸'),

-- BIGBANG
('지드래곤', 'G-Dragon', 1, 'korean', 'ENFP', '인터뷰 종합', false, 'BIGBANG 리더, 솔로 아티스트·패션 아이콘.', 1988, 'https://namu.wiki/w/G-DRAGON'),
('탑', 'T.O.P', 1, 'korean', 'INTJ', '인터뷰 종합', false, 'BIGBANG 멤버, 래퍼·배우·미술품 수집가.', 1987, 'https://namu.wiki/w/T.O.P'),
('태양', 'Taeyang', 1, 'korean', 'ISFP', '인터뷰 종합', false, 'BIGBANG 메인 보컬, 솔로 아티스트.', 1988, 'https://namu.wiki/w/태양(가수)'),
('대성', 'Daesung', 1, 'korean', 'ESFJ', '인터뷰 종합', false, 'BIGBANG 멤버, 일본 솔로 활동.', 1989, 'https://namu.wiki/w/대성(BIGBANG)'),

-- 2NE1
('CL', 'CL', 1, 'korean', 'ENTJ', '인터뷰 종합', false, '2NE1 리더, 솔로 아티스트. 파리 거주.', 1991, 'https://namu.wiki/w/CL(가수)'),
('산다라박', 'Sandara Park', 1, 'korean', 'INFP', '인터뷰 종합', false, '2NE1 멤버, 배우 겸업. 필리핀 활동 경력.', 1984, 'https://namu.wiki/w/산다라 박'),
('박봄', 'Park Bom', 1, 'korean', 'INFJ', '인터뷰 종합', false, '2NE1 메인 보컬.', 1984, 'https://namu.wiki/w/박봄'),

-- SHINee
('온유', 'Onew', 1, 'korean', 'ISFJ', 'SHINee 공식 콘텐츠', true, 'SHINee 리더, 메인 보컬·배우.', 1989, 'https://namu.wiki/w/온유'),
('키', 'Key', 1, 'korean', 'ENTJ', 'SHINee 공식 콘텐츠', true, 'SHINee 멤버, 패션 아이콘.', 1991, 'https://namu.wiki/w/키(SHINee)'),
('민호', 'Minho', 1, 'korean', 'ESTJ', 'SHINee 공식 콘텐츠', true, 'SHINee 멤버, 배우 겸업.', 1991, 'https://namu.wiki/w/민호(SHINee)'),
('태민', 'Taemin', 1, 'korean', 'INFP', 'SHINee 공식 콘텐츠', true, 'SHINee 막내, 솔로 아티스트.', 1993, 'https://namu.wiki/w/태민'),

-- NCT (주요 멤버)
('태용', 'Taeyong', 1, 'korean', 'ENFJ', 'NCT 공식 콘텐츠', true, 'NCT 127 리더, 메인 래퍼·댄서.', 1995, 'https://namu.wiki/w/태용(NCT)'),
('재현', 'Jaehyun', 1, 'korean', 'INFP', 'NCT 공식 콘텐츠', true, 'NCT 127 멤버, 보컬·배우.', 1997, 'https://namu.wiki/w/재현(NCT)'),
('정우', 'Johnny', 1, 'foreign', 'ENFJ', 'NCT 공식 콘텐츠', true, 'NCT 127 멤버, 미국 출신.', 1995, 'https://namu.wiki/w/쟈니(NCT)'),
('도영', 'Doyoung', 1, 'korean', 'ENFJ', 'NCT 공식 콘텐츠', true, 'NCT 127 메인 보컬.', 1996, 'https://namu.wiki/w/도영(NCT)'),
('마크', 'Mark', 1, 'foreign', 'ISTJ', 'NCT 공식 콘텐츠', true, 'NCT 멀티 유닛 멤버, 캐나다 출신.', 1999, 'https://namu.wiki/w/마크(NCT)'),
('해찬', 'Haechan', 1, 'korean', 'ESFP', 'NCT 공식 콘텐츠', true, 'NCT 127 멤버, 밝은 에너지의 보컬.', 2000, 'https://namu.wiki/w/해찬'),

-- MONSTA X
('셔누', 'Shownu', 1, 'korean', 'ISTJ', 'MONSTA X 공식 콘텐츠', true, 'MONSTA X 리더, 메인 댄서.', 1992, 'https://namu.wiki/w/셔누'),
('민혁', 'Minhyuk', 1, 'korean', 'ENFJ', 'MONSTA X 공식 콘텐츠', true, 'MONSTA X 멤버, 방송 활동 활발.', 1993, 'https://namu.wiki/w/민혁(MONSTA X)'),
('기현', 'Kihyun', 1, 'korean', 'ISFJ', 'MONSTA X 공식 콘텐츠', true, 'MONSTA X 메인 보컬.', 1993, 'https://namu.wiki/w/기현(MONSTA X)'),
('형원', 'Hyungwon', 1, 'korean', 'INTJ', 'MONSTA X 공식 콘텐츠', true, 'MONSTA X 멤버, DJ 활동 병행.', 1994, 'https://namu.wiki/w/형원(MONSTA X)'),
('주헌', 'Jooheon', 1, 'korean', 'ENFP', 'MONSTA X 공식 콘텐츠', true, 'MONSTA X 메인 래퍼.', 1994, 'https://namu.wiki/w/주헌(MONSTA X)'),
('아이엠', 'I.M.', 1, 'korean', 'INTP', 'MONSTA X 공식 콘텐츠', true, 'MONSTA X 래퍼, 영어 능통.', 1996, 'https://namu.wiki/w/아이엠(MONSTA X)'),

-- 기타 아이돌/솔로
('강다니엘', 'Kang Daniel', 1, 'korean', 'ENFP', '공식 방송 인터뷰', true, 'Wanna One 출신 솔로 아티스트.', 1996, 'https://namu.wiki/w/강다니엘'),
('옹성우', 'Ong Seong-wu', 1, 'korean', 'INFP', '공식 인터뷰', true, 'Wanna One 출신, 배우 겸업.', 1995, 'https://namu.wiki/w/옹성우'),
('황민현', 'Hwang Min-hyun', 1, 'korean', 'ISTJ', '공식 인터뷰', true, 'NU''EST / Wanna One 출신.', 1995, 'https://namu.wiki/w/황민현'),
('하성운', 'Ha Sung-woon', 1, 'korean', 'ESFJ', '공식 인터뷰', true, 'Wanna One 출신 솔로 가수.', 1994, 'https://namu.wiki/w/하성운'),
('박우진', 'Park Woo-jin', 1, 'korean', 'ISFP', '공식 인터뷰', false, 'AB6IX 멤버, Wanna One 출신.', 1998, 'https://namu.wiki/w/박우진(AB6IX)'),
('에이핑크 손나은', 'Son Na-eun', 1, 'korean', 'ISFJ', '공식 인터뷰', false, '에이핑크 멤버, 배우 겸업.', 1994, 'https://namu.wiki/w/손나은'),
('에이핑크 정은지', 'Jung Eun-ji', 1, 'korean', 'ENFP', '공식 인터뷰', false, '에이핑크 메인 보컬, 배우 겸업.', 1993, 'https://namu.wiki/w/정은지'),
('MAMAMOO 화사', 'Hwasa', 1, 'korean', 'ESTP', '공식 인터뷰', false, 'MAMAMOO 멤버, 솔로 아티스트.', 1995, 'https://namu.wiki/w/화사'),
('MAMAMOO 솔라', 'Solar', 1, 'korean', 'ESTJ', '공식 인터뷰', false, 'MAMAMOO 리더·메인 보컬.', 1991, 'https://namu.wiki/w/솔라(MAMAMOO)'),
('오마이걸 유아', 'YooA', 1, 'korean', 'ISFP', '공식 인터뷰', false, '오마이걸 멤버, 솔로 활동 중.', 1995, 'https://namu.wiki/w/유아(오마이걸)'),
('브레이브걸스 유정', 'Yujung', 1, 'korean', NULL, NULL, false, '브레이브걸스 멤버. 역주행 신화의 주인공.', 1994, 'https://namu.wiki/w/브레이브걸스'),
('에스파 카리나', 'Karina', 1, 'korean', 'ENFJ', 'aespa 공식 콘텐츠', true, 'aespa 리더, 비주얼·댄서.', 2000, 'https://namu.wiki/w/카리나(에스파)'),
('에스파 지젤', 'Giselle', 1, 'foreign', 'ENTP', 'aespa 공식 콘텐츠', true, 'aespa 멤버, 일본 출신 래퍼.', 2000, 'https://namu.wiki/w/지젤(에스파)'),
('에스파 윈터', 'Winter', 1, 'korean', 'INFJ', 'aespa 공식 콘텐츠', true, 'aespa 멤버, 보컬·댄서.', 2001, 'https://namu.wiki/w/윈터(에스파)'),
('에스파 닝닝', 'Ningning', 1, 'foreign', 'ESFJ', 'aespa 공식 콘텐츠', true, 'aespa 메인 보컬, 중국 출신.', 2002, 'https://namu.wiki/w/닝닝(에스파)'),

-- NewJeans 추가
('뉴진스 민지', 'Minji', 1, 'korean', 'ISTJ', 'NewJeans 공식 콘텐츠', true, 'NewJeans 리더.', 2004, 'https://namu.wiki/w/민지(뉴진스)'),
('뉴진스 하니', 'Hanni', 1, 'foreign', 'ENFP', 'NewJeans 공식 콘텐츠', true, 'NewJeans 멤버, 호주 출신.', 2004, 'https://namu.wiki/w/하니(뉴진스)'),
('뉴진스 다니엘', 'Danielle', 1, 'foreign', 'ESFJ', 'NewJeans 공식 콘텐츠', true, 'NewJeans 멤버, 한국계 호주인.', 2005, 'https://namu.wiki/w/다니엘(뉴진스)'),
('뉴진스 해린', 'Haerin', 1, 'korean', 'INTJ', 'NewJeans 공식 콘텐츠', true, 'NewJeans 멤버, 차가운 비주얼.', 2006, 'https://namu.wiki/w/해린(뉴진스)'),
('뉴진스 혜인', 'Hyein', 1, 'korean', 'ISTP', 'NewJeans 공식 콘텐츠', true, 'NewJeans 막내.', 2008, 'https://namu.wiki/w/혜인(뉴진스)'),

-- ════════════════════════════════
-- 배우 (subcategory_id = 2)
-- ════════════════════════════════
('이민호', 'Lee Min-ho', 2, 'korean', 'ENTJ', '인터뷰 종합', false, '꽃보다 남자, 상속자들 등으로 아시아 스타덤 달성.', 1987, 'https://namu.wiki/w/이민호(배우)'),
('박서준', 'Park Seo-jun', 2, 'korean', 'ENFP', '인터뷰 종합', false, '이태원클라쓰, 드림 등 출연. 마블 영화 진출.', 1988, 'https://namu.wiki/w/박서준(배우)'),
('공유', 'Gong Yoo', 2, 'korean', 'INFJ', '인터뷰 종합', false, '도깨비, 부산행 출연 배우.', 1979, 'https://namu.wiki/w/공유(배우)'),
('현빈', 'Hyun Bin', 2, 'korean', 'INTJ', '인터뷰 종합', false, '사랑의 불시착 출연 배우.', 1982, 'https://namu.wiki/w/현빈'),
('손예진', 'Son Ye-jin', 2, 'korean', 'INFJ', '인터뷰 종합', false, '사랑의 불시착 주연, 현빈과 결혼.', 1982, 'https://namu.wiki/w/손예진'),
('이병헌', 'Lee Byung-hun', 2, 'korean', 'INTJ', '인터뷰 종합', false, '달콤한 인생, 터미네이터 제니시스 등 출연.', 1970, 'https://namu.wiki/w/이병헌'),
('전지현', 'Jun Ji-hyun', 2, 'korean', 'INTJ', '인터뷰 종합', false, '별에서 온 그대 주연. 한류 스타.', 1981, 'https://namu.wiki/w/전지현'),
('한소희', 'Han So-hee', 2, 'korean', 'INTJ', '인터뷰 종합', false, '마이 네임, 그 해 우리는 출연.', 1994, 'https://namu.wiki/w/한소희(배우)'),
('김고은', 'Kim Go-eun', 2, 'korean', 'INFP', '인터뷰 종합', false, '도깨비, 유미의 세포들 출연.', 1991, 'https://namu.wiki/w/김고은(배우)'),
('박보영', 'Park Bo-young', 2, 'korean', 'INFP', '인터뷰 종합', false, '늑대소년, 오 나의 귀신님 출연.', 1990, 'https://namu.wiki/w/박보영'),
('배수지', 'Bae Suzy', 2, 'korean', 'ISFJ', '인터뷰 종합', false, 'miss A 출신, 배우로 전향. 국민 첫사랑.', 1994, 'https://namu.wiki/w/배수지'),
('송강호', 'Song Kang-ho', 2, 'korean', 'ISFP', '인터뷰 종합', false, '기생충, 살인의 추억 등 칸 남우주연상 수상.', 1967, 'https://namu.wiki/w/송강호'),
('최민식', 'Choi Min-sik', 2, 'korean', 'INTJ', '인터뷰 종합', false, '올드보이, 악마를 보았다 출연.', 1962, 'https://namu.wiki/w/최민식'),
('황정민', 'Hwang Jung-min', 2, 'korean', 'ISTJ', '인터뷰 종합', false, '베테랑, 국제시장 출연 천만 배우.', 1970, 'https://namu.wiki/w/황정민(배우)'),
('마동석', 'Ma Dong-seok', 2, 'korean', 'ESFJ', '인터뷰 종합', false, '범죄도시 시리즈 주연. 마블 이터널스 출연.', 1971, 'https://namu.wiki/w/마동석'),
('전도연', 'Jeon Do-yeon', 2, 'korean', 'INFJ', '인터뷰 종합', false, '밀양으로 칸 여우주연상 수상.', 1973, 'https://namu.wiki/w/전도연'),
('김혜수', 'Kim Hye-soo', 2, 'korean', 'ENTJ', '인터뷰 종합', false, '시그널, 하이에나 등 출연. 강렬한 커리어.', 1970, 'https://namu.wiki/w/김혜수'),
('이영애', 'Lee Young-ae', 2, 'korean', 'ISFJ', '인터뷰 종합', false, '대장금, 친절한 금자씨 출연.', 1971, 'https://namu.wiki/w/이영애'),
('류준열', 'Ryu Jun-yeol', 2, 'korean', 'INFP', '인터뷰 종합', false, '응답하라 1988, 택시운전사 출연.', 1986, 'https://namu.wiki/w/류준열'),
('이제훈', 'Lee Je-hoon', 2, 'korean', 'ISFJ', '인터뷰 종합', false, '시그널, 모범택시 출연.', 1986, 'https://namu.wiki/w/이제훈'),
('정해인', 'Jung Hae-in', 2, 'korean', 'INFJ', '인터뷰 종합', false, '밥 잘 사주는 예쁜 누나, DP 출연.', 1988, 'https://namu.wiki/w/정해인'),
('조인성', 'Jo In-sung', 2, 'korean', 'INFP', '인터뷰 종합', false, '괜찮아, 사랑이야 등 드라마·영화 출연.', 1981, 'https://namu.wiki/w/조인성(배우)'),
('강동원', 'Kang Dong-won', 2, 'korean', 'INTJ', '인터뷰 종합', false, '검은 사제들, 1987 출연. 과묵한 이미지.', 1981, 'https://namu.wiki/w/강동원(배우)'),
('박신혜', 'Park Shin-hye', 2, 'korean', 'ISFJ', '인터뷰 종합', false, '상속자들, 닥터스 출연.', 1990, 'https://namu.wiki/w/박신혜'),
('이성경', 'Lee Sung-kyung', 2, 'korean', 'ENFP', '인터뷰 종합', false, '닥터스, 우리들의 블루스 출연. 모델 겸업.', 1990, 'https://namu.wiki/w/이성경'),
('김남길', 'Kim Nam-gil', 2, 'korean', 'ISTP', '인터뷰 종합', false, '선덕여왕, 빈센조 출연.', 1981, 'https://namu.wiki/w/김남길'),
('위하준', 'Wi Ha-joon', 2, 'korean', 'INTJ', '인터뷰 종합', false, '오징어게임, 지금 우리 학교는 출연.', 1990, 'https://namu.wiki/w/위하준'),
('이도현', 'Lee Do-hyun', 2, 'korean', 'INFJ', '인터뷰 종합', false, '18 어게인, 나쁜 엄마 출연.', 1995, 'https://namu.wiki/w/이도현(배우)'),
('변우석', 'Byun Woo-seok', 2, 'korean', 'INFP', '인터뷰 종합', false, '선재 업고 튀어 출연 후 급부상.', 1995, 'https://namu.wiki/w/변우석'),
('박형식', 'Park Hyung-sik', 2, 'korean', 'ISFJ', '인터뷰 종합', false, 'ZE:A 출신, 배우 전향. 강심장 군주 출연.', 1991, 'https://namu.wiki/w/박형식'),

-- 외국 배우
('레오나르도 디카프리오', 'Leonardo DiCaprio', 2, 'foreign', 'INFP', '전문가 분석 및 인터뷰 종합', false, '타이타닉, 아비에이터, 레버넌트. 환경 운동가.', 1974, 'https://namu.wiki/w/레오나르도 디카프리오'),
('브래드 피트', 'Brad Pitt', 2, 'foreign', 'ISFP', '전문가 분석', false, '파이트 클럽, 트로이, 원스 어폰 어 타임 인 할리우드 출연.', 1963, 'https://namu.wiki/w/브래드 피트'),
('톰 행크스', 'Tom Hanks', 2, 'foreign', 'ENFJ', '인터뷰 및 전문가 분석', false, '포레스트 검프, 캐스트 어웨이, 다빈치 코드 출연.', 1956, 'https://namu.wiki/w/톰 행크스'),
('메릴 스트립', 'Meryl Streep', 2, 'foreign', 'INFJ', '인터뷰 종합', false, '악마는 프라다를 입는다 등 아카데미 최다 수상.', 1949, 'https://namu.wiki/w/메릴 스트립'),
('키아누 리브스', 'Keanu Reeves', 2, 'foreign', 'INFP', '인터뷰 종합', false, '매트릭스, 존 윅 시리즈 출연. 인터넷 성인.', 1964, 'https://namu.wiki/w/키아누 리브스'),
('로버트 다우니 주니어', 'Robert Downey Jr.', 2, 'foreign', 'ENTP', '인터뷰 종합', false, '아이언맨 역할로 마블 유니버스 견인.', 1965, 'https://namu.wiki/w/로버트 다우니 주니어'),
('스칼렛 요한슨', 'Scarlett Johansson', 2, 'foreign', 'ESTP', '인터뷰 종합', false, '블랙 위도우, 조조 래빗 출연.', 1984, 'https://namu.wiki/w/스칼렛 요한슨'),
('제니퍼 로렌스', 'Jennifer Lawrence', 2, 'foreign', 'ENFP', '인터뷰 종합', false, '헝거 게임 시리즈, 실버 라이닝 플레이북. 최연소 아카데미 수상.', 1990, 'https://namu.wiki/w/제니퍼 로렌스'),
('엠마 왓슨', 'Emma Watson', 2, 'foreign', 'INTJ', '인터뷰 종합', false, '해리포터 헤르미온느 역. 유엔 여성 친선대사.', 1990, 'https://namu.wiki/w/엠마 왓슨'),
('나탈리 포트만', 'Natalie Portman', 2, 'foreign', 'INTJ', '인터뷰 종합', false, '블랙 스완, 레옹 출연. 하버드 심리학 졸업.', 1981, 'https://namu.wiki/w/나탈리 포트만'),
('티모시 샬라메', 'Timothée Chalamet', 2, 'foreign', 'INFP', '인터뷰 종합', false, '콜 미 바이 유어 네임, 듄 출연.', 1995, 'https://namu.wiki/w/티모시 샬라메'),
('젠데이아', 'Zendaya', 2, 'foreign', 'INTJ', '인터뷰 종합', false, '유포리아, 스파이더맨 출연. 에미상 최연소 수상.', 1996, 'https://namu.wiki/w/젠데이아'),
('라이언 레이놀즈', 'Ryan Reynolds', 2, 'foreign', 'ENTP', '인터뷰 종합', false, '데드풀 시리즈 출연, 유머 넘치는 마케터.', 1976, 'https://namu.wiki/w/라이언 레이놀즈'),
('크리스 에반스', 'Chris Evans', 2, 'foreign', 'ISFJ', '인터뷰 종합', false, '캡틴 아메리카 역. 사회 참여 활발.', 1981, 'https://namu.wiki/w/크리스 에반스'),
('마고 로비', 'Margot Robbie', 2, 'foreign', 'ESFP', '인터뷰 종합', false, '바비, 원스 어폰 어 타임 인 할리우드 출연.', 1990, 'https://namu.wiki/w/마고 로비'),
('케이트 블란쳇', 'Cate Blanchett', 2, 'foreign', 'INTJ', '인터뷰 종합', false, '엘리자베스, 반지의 제왕 간달프역으로 아카데미 2회 수상.', 1969, 'https://namu.wiki/w/케이트 블란쳇'),
('앤 해서웨이', 'Anne Hathaway', 2, 'foreign', 'ENFJ', '인터뷰 종합', false, '레 미제라블, 인터스텔라, 악마는 프라다를 입는다 출연.', 1982, 'https://namu.wiki/w/앤 해서웨이'),

-- ════════════════════════════════
-- 가수 (subcategory_id = 3)
-- ════════════════════════════════
-- 국내 솔로/그룹
('싸이', 'Psy', 3, 'korean', 'ESFP', '인터뷰 종합', false, '강남스타일로 세계적 인지도 획득.', 1977, 'https://namu.wiki/w/싸이'),
('이하이', 'Lee Hi', 3, 'korean', 'INFP', '인터뷰 종합', false, 'K-POP 스타 출신, AOMG 소속 솔로 가수.', 1996, 'https://namu.wiki/w/이하이'),
('악동뮤지션 이찬혁', 'Lee Chan-hyuk (AKMU)', 3, 'korean', 'INTP', '인터뷰 종합', false, '악동뮤지션 남매 중 오빠. 작사·작곡 담당.', 1996, 'https://namu.wiki/w/이찬혁'),
('악동뮤지션 이수현', 'Lee Su-hyun (AKMU)', 3, 'korean', 'ENFP', '인터뷰 종합', false, '악동뮤지션 남매 중 여동생. 메인 보컬.', 1999, 'https://namu.wiki/w/이수현(AKMU)'),
('볼빨간사춘기 안지영', 'Ahn Ji-young (BOL4)', 3, 'korean', 'INFP', '인터뷰 종합', false, '볼빨간사춘기 보컬. 우주를 줄게, 나만, 봄 사랑 벚꽃 말고 등 히트.', 1993, 'https://namu.wiki/w/안지영(볼빨간사춘기)'),
('에픽하이 타블로', 'Tablo', 3, 'korean', 'INFJ', '인터뷰 종합', false, '에픽하이 리더. 스탠퍼드 문학 졸업.', 1980, 'https://namu.wiki/w/타블로'),
('딘딘', 'Dean', 3, 'korean', 'INTP', '인터뷰 종합', false, 'R&B 싱어송라이터. I''M NOT SORRY 등 히트.', 1992, 'https://namu.wiki/w/딘(가수)'),
('박효신', 'Park Hyo-shin', 3, 'korean', 'INFP', '인터뷰 종합', false, '야생화, 눈의 꽃 등 발라드 명곡 보유.', 1981, 'https://namu.wiki/w/박효신'),
('임창정', 'Lim Chang-jung', 3, 'korean', 'ESFP', '인터뷰 종합', false, '소주 한 잔 등 히트. 배우 겸업.', 1971, 'https://namu.wiki/w/임창정'),
('이문세', 'Lee Moon-se', 3, 'korean', 'ISFP', '인터뷰 종합', false, '붉은 노을, 옛사랑 등 시대를 초월한 명곡.', 1959, 'https://namu.wiki/w/이문세'),

-- 해외 팝스타
('테일러 스위프트', 'Taylor Swift', 3, 'foreign', 'INFJ', '인터뷰 및 전문가 분석', false, '에라스 투어 역대 최고 매출. 팝·컨트리·포크 장르 아이콘.', 1989, 'https://namu.wiki/w/테일러 스위프트'),
('비욘세', 'Beyoncé', 3, 'foreign', 'ISFJ', '인터뷰 및 전문가 분석', false, '르미세라블, 블랙 이즈 킹. Grammy 최다 수상자.', 1981, 'https://namu.wiki/w/비욘세'),
('레이디 가가', 'Lady Gaga', 3, 'foreign', 'ENFP', '인터뷰 종합', false, '포커 페이스, 얕은 곳에서. 패션 아이콘.', 1986, 'https://namu.wiki/w/레이디 가가'),
('리아나', 'Rihanna', 3, 'foreign', 'ISTP', '인터뷰 종합', false, '다이아몬드, 엄브렐라. 펜티 뷰티 창업자.', 1988, 'https://namu.wiki/w/리아나'),
('에드 시런', 'Ed Sheeran', 3, 'foreign', 'ISFP', '인터뷰 종합', false, '쉐이프 오브 유, 퍼펙트. 자작곡 싱어송라이터.', 1991, 'https://namu.wiki/w/에드 시런'),
('저스틴 비버', 'Justin Bieber', 3, 'foreign', 'ISFP', '인터뷰 종합', false, '베이비, 러브 유어셀프. 유튜브 발굴 스타.', 1994, 'https://namu.wiki/w/저스틴 비버'),
('해리 스타일스', 'Harry Styles', 3, 'foreign', 'ENFJ', '인터뷰 종합', false, 'One Direction 출신 솔로 아티스트. 패션 아이콘.', 1994, 'https://namu.wiki/w/해리 스타일스'),
('빌리 아일리시', 'Billie Eilish', 3, 'foreign', 'INFP', '인터뷰 종합', false, '배드 가이, 해피어 댄 에버. 최연소 그래미 4관왕.', 2001, 'https://namu.wiki/w/빌리 아일리시'),
('아리아나 그란데', 'Ariana Grande', 3, 'foreign', 'ESFJ', '인터뷰 종합', false, '땡큐 넥스트, 세븐 링즈. 강렬한 고음 보컬.', 1993, 'https://namu.wiki/w/아리아나 그란데'),
('브루노 마스', 'Bruno Mars', 3, 'foreign', 'ESFP', '인터뷰 종합', false, '저스트 더 웨이 유 아, 업타운 펑크. 라이브 퍼포머.', 1985, 'https://namu.wiki/w/브루노 마스'),
('위켄드', 'The Weeknd', 3, 'foreign', 'INFP', '인터뷰 종합', false, '블라인딩 라이츠, 스타보이. R&B 아이콘.', 1990, 'https://namu.wiki/w/더 위켄드'),
('에미넴', 'Eminem', 3, 'foreign', 'ISTP', '인터뷰 종합', false, '루즈 유어셀프, 랩 갓. 힙합 역대 최다 판매 아티스트.', 1972, 'https://namu.wiki/w/에미넴'),
('드레이크', 'Drake', 3, 'foreign', 'INFP', '인터뷰 종합', false, '갓스 플랜, 원 댄스. 스트리밍 시대 정점의 래퍼.', 1986, 'https://namu.wiki/w/드레이크(래퍼)'),
('카니예 웨스트', 'Kanye West', 3, 'foreign', 'ENFP', '인터뷰 종합', false, '더 칼리지 드롭아웃, 마이 뷰티풀 다크 트위스티드 판타지.', 1977, 'https://namu.wiki/w/카니예 웨스트'),
('프레디 머큐리', 'Freddie Mercury', 3, 'foreign', 'ENFP', '전문가 분석 (자료 종합)', false, '퀸 리드 보컬. 위 아 더 챔피언스, 보헤미안 랩소디.', 1946, 'https://namu.wiki/w/프레디 머큐리'),
('마이클 잭슨', 'Michael Jackson', 3, 'foreign', 'INFP', '전문가 분석 (자료 종합)', false, '빌리 진, 스릴러. 팝의 황제.', 1958, 'https://namu.wiki/w/마이클 잭슨'),
('비틀즈 존 레논', 'John Lennon', 3, 'foreign', 'ENFP', '전문가 분석 (자료 종합)', false, '비틀즈 멤버, 평화 운동가. 이매진.', 1940, 'https://namu.wiki/w/존 레논'),
('봅 딜런', 'Bob Dylan', 3, 'foreign', 'INFP', '전문가 분석', false, '블로윈 인 더 윈드. 노벨 문학상 수상 뮤지션.', 1941, 'https://namu.wiki/w/밥 딜런'),
('두아 리파', 'Dua Lipa', 3, 'foreign', 'ESFP', '인터뷰 종합', false, '레빗에이션, 돈트 스타트 나우. 팝·디스코 퀸.', 1995, 'https://namu.wiki/w/두아 리파'),
('올리비아 로드리고', 'Olivia Rodrigo', 3, 'foreign', 'INFP', '인터뷰 종합', false, '드라이버스 라이선스, 굿 4 유. Z세대 팝 아이콘.', 2003, 'https://namu.wiki/w/올리비아 로드리고'),

-- ════════════════════════════════
-- 스포츠 추가
-- ════════════════════════════════
-- 축구 추가 (subcategory_id = 5)
('크리스티아누 호날두', 'Cristiano Ronaldo', 5, 'foreign', 'ENTJ', '인터뷰 및 전문가 분석', false, '발롱도르 5회 수상, 역대 최다 A매치 득점자.', 1985, 'https://namu.wiki/w/크리스티아누 호날두'),
('리오넬 메시', 'Lionel Messi', 5, 'foreign', 'ISFP', '인터뷰 및 전문가 분석', false, '발롱도르 8회 수상, 2022 월드컵 우승.', 1987, 'https://namu.wiki/w/리오넬 메시'),
('킬리앙 음바페', 'Kylian Mbappé', 5, 'foreign', 'ENFP', '인터뷰 종합', false, '21세기 최고의 공격수, PSG·레알 마드리드.', 1998, 'https://namu.wiki/w/킬리앙 음바페'),
('네이마르', 'Neymar', 5, 'foreign', 'ESFP', '인터뷰 종합', false, '브라질 최고 스타, 드리블의 달인.', 1992, 'https://namu.wiki/w/네이마르'),
('박지성', 'Park Ji-sung', 5, 'korean', 'ISFJ', '인터뷰 종합', false, '맨체스터 유나이티드 아시아 최초 챔피언스리그 우승.', 1981, 'https://namu.wiki/w/박지성'),
('이강인', 'Lee Kang-in', 5, 'korean', 'INFP', '인터뷰 종합', false, 'PSG 소속 공격형 미드필더. U-20 월드컵 골든볼.', 2001, 'https://namu.wiki/w/이강인'),
('황희찬', 'Hwang Hee-chan', 5, 'korean', 'ESFP', '인터뷰 종합', false, '울버햄튼·라이프치히 출신 공격수.', 1996, 'https://namu.wiki/w/황희찬'),
('차범근', 'Cha Bum-kun', 5, 'korean', NULL, NULL, false, '아시아 최초 유럽 5대 리그 득점왕. 한국 축구 전설.', 1953, 'https://namu.wiki/w/차범근'),

-- 야구 추가 (subcategory_id = 6)
('류현진', 'Ryu Hyun-jin', 6, 'korean', 'ISTJ', '인터뷰 종합', false, 'LA 다저스·토론토 블루제이스 선발투수. 사이영상 준우승.', 1987, 'https://namu.wiki/w/류현진'),
('추신수', 'Choo Shin-soo', 6, 'korean', 'ISTJ', '인터뷰 종합', false, 'MLB 텍사스 레인저스. 아시아 출신 역대 최대 계약.', 1982, 'https://namu.wiki/w/추신수'),
('박찬호', 'Park Chan-ho', 6, 'korean', 'ENTJ', '인터뷰 종합', false, '코리안 특급. LA 다저스 아시아 선수 최초 빅리그 전설.', 1973, 'https://namu.wiki/w/박찬호'),
('오타니 쇼헤이', 'Shohei Ohtani', 6, 'foreign', 'INTJ', '인터뷰 종합', false, '이도류(투수+타자). MLB 역대급 10억 달러 계약.', 1994, 'https://namu.wiki/w/오타니 쇼헤이'),

-- 농구 추가 (subcategory_id = 7)
('르브론 제임스', 'LeBron James', 7, 'foreign', 'ENFJ', '인터뷰 및 전문가 분석', false, 'NBA 역대 최다 득점. 4번의 챔피언십 우승.', 1984, 'https://namu.wiki/w/르브론 제임스'),
('스테판 커리', 'Stephen Curry', 7, 'foreign', 'ISFJ', '인터뷰 종합', false, '3점슛 혁명가. NBA 4회 우승.', 1988, 'https://namu.wiki/w/스테판 커리'),
('마이클 조던', 'Michael Jordan', 7, 'foreign', 'ENTJ', '전문가 분석', false, 'NBA 6회 우승. 에어 조던, 농구의 신.', 1963, 'https://namu.wiki/w/마이클 조던'),
('코비 브라이언트', 'Kobe Bryant', 7, 'foreign', 'ENTJ', '인터뷰 및 전문가 분석', false, '맘바 멘탈리티. LA 레이커스 5회 우승. 2020년 작고.', 1978, 'https://namu.wiki/w/코비 브라이언트'),
('케빈 듀란트', 'Kevin Durant', 7, 'foreign', 'INFP', '인터뷰 종합', false, '두 차례 NBA 우승, 파이널 MVP.', 1988, 'https://namu.wiki/w/케빈 듀란트'),

-- 테니스 추가 (subcategory_id = 8)
('라파엘 나달', 'Rafael Nadal', 8, 'foreign', 'ISFJ', '인터뷰 종합', false, '프랑스 오픈 14회 우승. 클레이코트 황제.', 1986, 'https://namu.wiki/w/라파엘 나달'),
('노박 조코비치', 'Novak Djokovic', 8, 'foreign', 'ENTJ', '인터뷰 종합', false, 'ATP 랭킹 1위 최장기 보유. 그랜드슬램 24회.', 1987, 'https://namu.wiki/w/노박 조코비치'),
('세레나 윌리엄스', 'Serena Williams', 8, 'foreign', 'ENTJ', '인터뷰 종합', false, '그랜드슬램 23회 우승. 역대 최고의 테니스 선수.', 1981, 'https://namu.wiki/w/세레나 윌리엄스'),
('카를로스 알카라스', 'Carlos Alcaraz', 8, 'foreign', 'ENFP', '인터뷰 종합', false, '21세 최연소 세계 랭킹 1위. 차세대 테니스 황제.', 2003, 'https://namu.wiki/w/카를로스 알카라스'),

-- 기타 스포츠 (subcategory_id = 10)
('우사인 볼트', 'Usain Bolt', 10, 'foreign', 'ESFP', '인터뷰 종합', false, '100m·200m 세계기록 보유. 번개.', 1986, 'https://namu.wiki/w/우사인 볼트'),
('무하마드 알리', 'Muhammad Ali', 10, 'foreign', 'ESTP', '전문가 분석', false, '나비처럼 날아서 벌처럼 쏴라. 복싱 세기의 챔피언.', 1942, 'https://namu.wiki/w/무하마드 알리'),
('안세영', 'An Se-young', 10, 'korean', 'ENTJ', '인터뷰 종합', false, '파리 올림픽 배드민턴 금메달리스트.', 2002, 'https://namu.wiki/w/안세영(배드민턴)'),
('우상혁', 'Woo Sang-hyeok', 10, 'korean', 'ESFP', '인터뷰 종합', false, '높이뛰기 세계랭킹 1위, 스마일 점퍼.', 1996, 'https://namu.wiki/w/우상혁'),

-- ════════════════════════════════
-- 정치인 추가 (subcategory_id = 11)
-- ════════════════════════════════
('버락 오바마', 'Barack Obama', 11, 'foreign', 'ENFJ', '인터뷰 및 전문가 분석', false, '미국 44대 대통령. 최초의 흑인 대통령.', 1961, 'https://namu.wiki/w/버락 오바마'),
('도널드 트럼프', 'Donald Trump', 11, 'foreign', 'ESTP', '인터뷰 및 전문가 분석', false, '미국 45·47대 대통령. 트럼프 그룹 사업가 출신.', 1946, 'https://namu.wiki/w/도널드 트럼프'),
('앙겔라 메르켈', 'Angela Merkel', 11, 'foreign', 'ISTJ', '인터뷰 및 전문가 분석', false, '독일 최장수 총리. 양자역학 박사 출신 정치인.', 1954, 'https://namu.wiki/w/앙겔라 메르켈'),
('윈스턴 처칠', 'Winston Churchill', 11, 'foreign', 'ENTP', '전문가 분석 (역사 기록)', false, '2차 세계대전 영국 총리. 노벨 문학상 수상.', 1874, 'https://namu.wiki/w/윈스턴 처칠'),
('에이브러햄 링컨', 'Abraham Lincoln', 11, 'foreign', 'INFJ', '전문가 분석 (역사 기록)', false, '미국 16대 대통령. 노예 해방 선언.', 1809, 'https://namu.wiki/w/에이브러햄 링컨'),
('마틴 루터 킹', 'Martin Luther King Jr.', 11, 'foreign', 'ENFJ', '전문가 분석', false, '나에게는 꿈이 있습니다. 흑인 민권운동 지도자.', 1929, 'https://namu.wiki/w/마틴 루터 킹'),
('마하트마 간디', 'Mahatma Gandhi', 11, 'foreign', 'INFJ', '전문가 분석 (자료 종합)', false, '비폭력 저항운동으로 인도 독립 이끈 지도자.', 1869, 'https://namu.wiki/w/마하트마 간디'),
('넬슨 만델라', 'Nelson Mandela', 11, 'foreign', 'ENFJ', '전문가 분석', false, '남아공 최초 민주 대통령. 27년 수감 후 화해 정치.', 1918, 'https://namu.wiki/w/넬슨 만델라'),
('문재인', 'Moon Jae-in', 11, 'korean', 'INFJ', '인터뷰 종합', false, '대한민국 19대 대통령. 남북정상회담 추진.', 1953, 'https://namu.wiki/w/문재인'),
('이재명', 'Lee Jae-myung', 11, 'korean', NULL, NULL, false, '더불어민주당 대선 후보, 경기지사 출신.', 1964, 'https://namu.wiki/w/이재명'),

-- ════════════════════════════════
-- CEO / 사업가 추가 (subcategory_id = 13)
-- ════════════════════════════════
('스티브 잡스', 'Steve Jobs', 13, 'foreign', 'ENTJ', '전문가 분석 (자서전·인터뷰)', false, '애플 공동창업자. 아이폰, 맥, 아이팟 탄생.', 1955, 'https://namu.wiki/w/스티브 잡스'),
('빌 게이츠', 'Bill Gates', 13, 'foreign', 'INTP', '인터뷰 및 전문가 분석', false, '마이크로소프트 창업자. 세계 최대 자선재단 설립.', 1955, 'https://namu.wiki/w/빌 게이츠'),
('일론 머스크', 'Elon Musk', 13, 'foreign', 'INTJ', '인터뷰 종합', false, '테슬라·스페이스X·X 창업자. 화성 이주 선언.', 1971, 'https://namu.wiki/w/일론 머스크'),
('제프 베이조스', 'Jeff Bezos', 13, 'foreign', 'ISTJ', '인터뷰 종합', false, '아마존 창업자. 블루오리진 우주 사업 추진.', 1964, 'https://namu.wiki/w/제프 베이조스'),
('워런 버핏', 'Warren Buffett', 13, 'foreign', 'INTP', '인터뷰 종합', false, '오마하의 현인. 버크셔 해서웨이 회장.', 1930, 'https://namu.wiki/w/워런 버핏'),
('마크 저커버그', 'Mark Zuckerberg', 13, 'foreign', 'INTJ', '인터뷰 및 전문가 분석', false, '페이스북(메타) 창업자. 하버드 중퇴.', 1984, 'https://namu.wiki/w/마크 저커버그'),
('팀 쿡', 'Tim Cook', 13, 'foreign', 'INTJ', '인터뷰 종합', false, '애플 CEO. 잡스 이후 애플 최고 가치 기업으로 성장 견인.', 1960, 'https://namu.wiki/w/팀 쿡'),
('래리 페이지', 'Larry Page', 13, 'foreign', 'INTP', '인터뷰 종합', false, '구글 공동창업자. 자율주행·생명연장 프로젝트 투자.', 1973, 'https://namu.wiki/w/래리 페이지'),

-- ════════════════════════════════
-- 예술가 / 역사적 인물 추가 (subcategory_id = 16)
-- ════════════════════════════════
('베토벤', 'Ludwig van Beethoven', 16, 'foreign', 'INTJ', '전문가 분석 (역사 기록)', false, '청각을 잃고도 불멸의 교향곡 9번을 작곡한 작곡가.', 1770, 'https://namu.wiki/w/루트비히 판 베토벤'),
('모차르트', 'Wolfgang Amadeus Mozart', 16, 'foreign', 'ENFP', '전문가 분석 (역사 기록)', false, '신동 출신 천재 작곡가. 35세에 요절.', 1756, 'https://namu.wiki/w/볼프강 아마데우스 모차르트'),
('파블로 피카소', 'Pablo Picasso', 16, 'foreign', 'ENTP', '전문가 분석', false, '게르니카, 아비뇽의 처녀들. 입체주의 창시.', 1881, 'https://namu.wiki/w/파블로 피카소'),
('살바도르 달리', 'Salvador Dalí', 16, 'foreign', 'ENTP', '전문가 분석', false, '기억의 지속. 초현실주의 거장.', 1904, 'https://namu.wiki/w/살바도르 달리'),
('나폴레옹', 'Napoleon Bonaparte', 16, 'foreign', 'ENTJ', '전문가 분석 (역사 기록)', false, '프랑스 황제. 유럽 정복과 나폴레옹 법전.', 1769, 'https://namu.wiki/w/나폴레옹 보나파르트'),
('마리 퀴리', 'Marie Curie', 16, 'foreign', 'INTJ', '전문가 분석', false, '노벨상 두 분야 수상 최초 과학자 (물리·화학).', 1867, 'https://namu.wiki/w/마리 퀴리'),
('지그문트 프로이트', 'Sigmund Freud', 16, 'foreign', 'INTJ', '전문가 분석', false, '정신분석학 창시자. 꿈의 해석 저자.', 1856, 'https://namu.wiki/w/지크문트 프로이트'),
('칼 마르크스', 'Karl Marx', 16, 'foreign', 'INTJ', '전문가 분석', false, '공산당 선언, 자본론 저자. 마르크스주의 창시자.', 1818, 'https://namu.wiki/w/카를 마르크스'),

-- ════════════════════════════════
-- MC/방송인 (subcategory_id = 17)
-- ════════════════════════════════
('유재석', 'Yoo Jae-suk', 17, 'korean', 'ENFJ', '방송 인터뷰 종합', false, '국민 MC. 무한도전, 런닝맨, 유 퀴즈 진행.', 1972, 'https://namu.wiki/w/유재석'),
('강호동', 'Kang Ho-dong', 17, 'korean', 'ESTP', '방송 인터뷰 종합', false, '1박2일, 아는 형님 MC. 전직 씨름 국가대표.', 1970, 'https://namu.wiki/w/강호동'),
('신동엽', 'Shin Dong-yup', 17, 'korean', 'ENTP', '방송 인터뷰 종합', false, '섹션TV, 놀라운 토요일 등 다수 예능 진행.', 1971, 'https://namu.wiki/w/신동엽(방송인)'),
('이경규', 'Lee Kyung-kyu', 17, 'korean', 'ESTJ', '방송 인터뷰 종합', false, '몰래카메라의 원조. 한국 예능 역사를 만든 MC.', 1960, 'https://namu.wiki/w/이경규'),
('오프라 윈프리', 'Oprah Winfrey', 17, 'foreign', 'ENFJ', '인터뷰 종합', false, '오프라 윈프리 쇼로 30년간 미국 최고 토크쇼 MC.', 1954, 'https://namu.wiki/w/오프라 윈프리');
