-- 시퀀스 삭제   
DROP SEQUENCE ORDERS_SEQ;
DROP SEQUENCE ORDER_DETAIL_SEQ;
DROP SEQUENCE CART_SEQ;
DROP SEQUENCE USERS_SEQ;
DROP SEQUENCE SLEEP_USERS_SEQ;
DROP SEQUENCE LEAVE_USERS_SEQ;
DROP SEQUENCE ORDER_LIST_SEQ;
DROP SEQUENCE ACCESS_USERS_SEQ;
DROP SEQUENCE QNA_SEQ;
DROP SEQUENCE NOTICE_SEQ;
DROP SEQUENCE REVIEW_SEQ;
DROP SEQUENCE PROD_SEQ; 

-- 테이블 삭제   
DROP TABLE QNA;
DROP TABLE NOTICE;
DROP TABLE REVIEW;
DROP TABLE ORDER_LIST;
DROP TABLE ORDER_DETAIL;
DROP TABLE ORDERS;
DROP TABLE CART;
DROP TABLE ACCESS_USERS;
DROP TABLE LEAVE_USERS;
DROP TABLE SLEEP_USERS;
DROP TABLE USERS;
DROP TABLE PRODUCT;

-- 시퀀스 생성   
CREATE SEQUENCE ORDERS_SEQ NOCACHE;
CREATE SEQUENCE ORDER_DETAIL_SEQ NOCACHE;
CREATE SEQUENCE CART_SEQ NOCACHE;
CREATE SEQUENCE USERS_SEQ NOCACHE;
CREATE SEQUENCE SLEEP_USERS_SEQ NOCACHE;
CREATE SEQUENCE LEAVE_USERS_SEQ NOCACHE;
CREATE SEQUENCE ORDER_LIST_SEQ NOCACHE;
CREATE SEQUENCE ACCESS_USERS_SEQ NOCACHE;
CREATE SEQUENCE NOTICE_SEQ NOCACHE;
CREATE SEQUENCE QNA_SEQ NOCACHE;
CREATE SEQUENCE PROD_SEQ NOCACHE;
CREATE SEQUENCE REVIEW_SEQ NOCACHE;

-- 상품 
CREATE TABLE PRODUCT (
    PROD_NO        NUMBER NOT NULL,             -- 품번
    PROD_NAME      VARCHAR2(60)  NOT NULL,      -- 품명(KR)
    PROD_NAME_ENG  VARCHAR2(60)  NOT NULL,      -- 품명(EN)
    PROD_PRICE     NUMBER        NOT NULL,      -- 가격
    PROD_CONTENT   CLOB          NOT NULL,      -- 상세설명
    PROD_THUMBNAIL VARCHAR2(100) NOT NULL,      -- 와인이미지
    PROD_IMG       CLOB          NOT NULL,      -- 내용이미지
    PROD_TYPE      VARCHAR2(20)  NOT NULL,      -- 종류
    PROD_NATION    VARCHAR2(100) NOT NULL,      -- 원산지
    PROD_BODY      VARCHAR2(30)  NOT NULL,      -- 바디감
    PROD_ALCOHOL   VARCHAR2(30)  NOT NULL,      -- 도수
    PROD_DATE      VARCHAR2(30)  NOT NULL,      -- 출시일자
    PROD_STOCK     NUMBER        NOT NULL,      -- 재고
    CONSTRAINT PK_PRODUCT PRIMARY KEY(PROD_NO)
);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '유 원 프리미티보', 'U-ONE PRIMITIVO', 25000, 'Alberello 농법을 사용하여 만두리아만의 독특한 떼루아를 느낄 수 있는 와인', 'https://www.winenara.com/uploads/product/550/1870_detail_069.png', 'https://www.winenara.com/uploads/editor/data/editor/goods/211130/u1_182129.png', '레드', '이탈리아', '무거움', '높음', '2023-04-30', 30);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '샤또 루빈 라이온 앤', 'CHATEAU ROUBINE LION', 45000, 'Wine Enthusiast에 25년간 와인 AND 푸드 관련 글을 기고해온 로저 보스', 'https://www.winenara.com/uploads/product/550/3e516b689bdfa0bfb560b2475dc6e3ce.png', 'https://www.winenara.com/uploads/editor/20221220112525315173565.png', '로제', '프랑스', '중간', '중간', '2023-03-30', 30);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '산 필리포 브루넬로', 'SAN FILIPPO BRUNELLO', 199000, '2017 빈티지, 2020 James Suckling 선정 Italia Top 100-30위', 'https://www.winenara.com/uploads/product/550/7405a2f09e4139796f8d2ca15dc759a7.png', 'https://www.winenara.com/uploads/editor/202207181034292052658501.png', '레드', '이탈리아', '무거움', '높음', '2023-02-15', 30);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '오이스터 베이', 'OYSTER BAY', 75000, '뉴질랜드 말보로 소비뇽 블랑의 명성을 전 세계 최초로 알린 오이스터 베이가 만들어 낸 SPARKLING 뀌베', 'https://www.winenara.com/uploads/product/550/3085_detail_036.png', 'https://www.winenara.com/uploads/editor/20220714180842635456417.png', '화이트', '뉴질랜드', '중간', '낮음', '2023-03-03', 15);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '보리우 빈야드', 'BV CALIFORNIA', 30000, '100년이 넘는 전통과 나파의 기준이라 불리우는 BV에서 생산하는 BEST VALUE 캘리포니아 와인', 'https://www.winenara.com/uploads/product/550/d6274c5c0c58ec4aa67fd2fa489c8c42.png', 'https://www.winenara.com/uploads/editor/202211041319161578369648.png', '레드', '미국', '중간', '중간', '2022-11-28', 30);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '에스쿠도로호', 'ESCUDO ROJO', 120000, '우아한 구조감과 깊은 탄닌, 베리의 와일드함과 동양적 스파이스가 함께 느껴진 칠레 최상급 와인', 'https://www.winenara.com/uploads/product/550/1870_detail_069.png', 'https://www.winenara.com/uploads/editor/20230216131750693848876.png', '레드', '칠레', '무거움', '높음', '2023-05-01', 2);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '테 와레 라', 'TWR SAUVIGNON', 30000, '2020 JAMES SUCKLING - 10 TOP VALUE NEW ZEALAND SAUVIGNON BLANC WINES', 'https://www.winenara.com/uploads/product/550/63d5da2235048aeabd506a5c986c044d.png', 'https://www.winenara.com/uploads/editor/202209191422131490385666.png', '화이트', '뉴질랜드', '중간', '중간', '2023-01-02', 40);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '인비보 X 사라', 'INVIVO X SJP', 27000, 'ROZE의 성지 프로방스와 남프랑스에서 생산된 ROZE와인으로 트렌디한 와인 문화를 이끌어갈 SJP의 선택', 'https://www.winenara.com/uploads/product/550/554b644c1bf51870d601542137df2071.png', 'https://www.winenara.com/uploads/editor/data/editor/goods/220224/582_102209.png', '로제', '프랑스', '가벼움', '중간(12~13%)', '2023-04-30', 9);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '베커스 시라', 'BEKKERS SYRAH', 140000, '1차, 2차 세계대전을 거치는 동안 강인한 리더쉽을 가진 영국의 정치가 윈스턴 처칠을 모티브로 만든 와인', 'https://www.winenara.com/uploads/product/550/7a7cdcc4bc1e4cea1bd1a5d48c1a9807.png', 'https://www.winenara.com/uploads/editor/20221128134318199735984.png', '레드', '미국', '무거움', '중간', '2023-01-01', 8);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '라 샤펠 고르돈느', 'LA CHAPELLE GORDONNE', 55000, '세계적 ROZE 열풍 속에서 Decanter가 선정한 ROZE 와인 Top 3', 'https://www.winenara.com/uploads/product/550/e8e4325ade849d3271bb7f8fee84d8ce.png', 'https://www.winenara.com/uploads/editor/20221018111500530987690.png', '로제', '프랑스', '중간', '높음', '2023-05-10', 34);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '아라스 이제이 카', 'ARRAS E.J.CARR', 229000, '2021 James Halliday Wine Companion Awards Winner : Best Sparkling Wine', 'https://www.winenara.com/uploads/product/550/f4365619a9cbdf8484cf82477362961a.png', 'https://www.winenara.com/uploads/editor/data/editor/goods/210610/210609EJCARLATE_pdp_101923.png', '스파클링', '이탈리아', '무거움', '높음', '2023-04-30', 30);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '리스보카 화이트', 'LISBOCA 화이트', 8900, '포르투갈 토착품종으로 빚은 포르투갈 현지의 매력', 'https://www.winenara.com/uploads/product/550/231ad864b52890eb3d467925bc032415.png', 'https://www.winenara.com/uploads/editor/202207151413402082447247.png', '화이트', '포루투칼', '중간', '중간', '2021-02-04', 11);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '르 쁘띠 에뚜알', 'LE PETIT ETOILE', 17900, '르 쁘띠 에뚜알은 작은 별 이라는 뜻으로, 이 무알콜 와인의 작고 섬세한 버블을 연상케 한다.', 'https://www.winenara.com/uploads/product/550/b85aad9e531010c9921cb0b6982fb30f.png', 'https://www.winenara.com/uploads/editor/20230508095515295704458.png', '스파클링', '프랑스', '중간', '낮음', '2022-07-29', 67);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '블랙타워 스파클링', 'BLACK TOWER SPARKKLING', 19900, '독일 NO.1 브랜드, 블랙타워가 만든 가성비 甲 ROZE 와인. 혼술, 혼술하기에 적당한 가격과 높은 퀄리티.', 'https://www.winenara.com/uploads/product/550/12c7b362572d31a4fc3a5ae7fd89389d.png', 'https://www.winenara.com/uploads/editor/20230125142904253619290.png', '로제', '독일', '가벼움', '낮음', '2021-01-02', 65);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '쥬세페 베르디', 'CECI GIUSEPPE VERDI', 13900, '입 안 가득 느껴지는 부드러운 기포와 풍부한 과일풍미', 'https://www.winenara.com/uploads/product/550/34a1b2f14bc4e4c89a26e5254e46fe9d.png', 'https://www.winenara.com/uploads/editor/20221021164152792430140.png', '스파클링', '이탈리아', '중간', '낮음', '2023-06-30', 120);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '장 폴 도망 샤또네프', 'JEAN PAUL DAUMEN', 89000, '바이오다이나믹 토양을 멋지게 표현한 라벨이 돋보이는 샤또네프뒤파프.', 'https://www.winenara.com/uploads/product/550/c12f7bcdbe9b29a2e97455dfc6679b61.png', 'https://www.winenara.com/uploads/editor/202212201453501899946469.png', '레드', '프랑스', '무거움','높음', '2022-01-11', 8);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '도멘 드 마르꾸', 'DOMAINE DU MARCOUX', 150000, '도멘 드 마르꾸의 두 여성 와인메이커가 로버트 파커로부터 ‘2003년 올해의 와인 인물’로 선정된 소량생산 부티크 론 와이너리', 'https://www.winenara.com/uploads/product/550/747_detail_067.png', 'https://www.winenara.com/uploads/editor/202212141724471677963678.png', '레드', '프랑스', '무거움', '높음', '2022-01-11', 21);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '레디페제', 'LE DIFESE', 49000, '베이비 사시카이아', 'https://www.winenara.com/uploads/product/550/620_detail_071.png', 'https://www.winenara.com/uploads/editor/20230111112934998109062.png', '레드', '이탈리아', '중간', '중간', '2022-10-21', 40);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '르 마치오체 브루넬로', 'LE MACIOCHE BRUNELLO', 150000, '수퍼 투스칸 솔라이아를 탄생시킨 안티노리 와인메이커인 렌조 코타렐라가 생산한 BRUNELLO DI MONTALCINO', 'https://www.winenara.com/uploads/product/550/1813_detail_070.png', 'https://www.winenara.com//uploads/editor/202207151341211761876197.png', '레드', '이탈리아', '무거움', '높음', '2022-03-01', 32);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '에리미나 레드' , 'HERRI MINA 레드', 69000, '44개 빈티지의 샤또 페트뤼스를 생산한 최고의 양조 전문가, 장 끌로드 베루에가 고향에서 생산하는 와인', 'https://www.winenara.com/uploads/product/550/1069_detail_090.png', 'https://www.winenara.com/uploads/editor/data/editor/goods/211125/401_191608.png', '레드', '프랑스', '무거움', '중간', '2023-03-10', 26);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '마니스위쯔 콩코드', 'MANISCHEWITZ CONCORD', 12900, '세계에서 가장 유명한 코셔 와인 브랜드 이자 세계에서 가장 많이 팔리는 콩코드 와인', 'https://www.winenara.com/uploads/product/550/7561c67ff66483f8bf82224fc533465b.png', 'https://www.winenara.com/uploads/editor/20221012162809230113007.png', '레드', '미국', '가벼움', '낮음', '2022-06-11', 20);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '디오라 피노누아', 'DIORA PINOT NOIR', 42000, '미국 TOP10 와이너리, Delicato Family wines에서 생산하는 프리미엄 캘리포니아 와인', 'https://www.winenara.com/uploads/product/550/e629009379f2d4899566ea87d62f8116.png', 'https://www.winenara.com/uploads/editor/20220715142820414413526.png', '레드', '미국', '무거움', '높음', '2022-09-30', 30);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '디오라 로제', 'DIORA ROSE', 35000, '미국 TOP10 와이너리, Delicato Family wines에서 생산하는 프리미엄 캘리포니아 와인. 바틀 디자인에 반하고 맛에도 반하는 신선한 피노누아 ROZE.', 'https://www.winenara.com/uploads/product/550/520ed5bf54d44cd1c11717d9f4ef39ef.png', 'https://www.winenara.com/uploads/editor/20220713152718156458879.png', '로제', '미국', '가벼움', '중간', '2022-07-04', 5);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '레 볼테', 'LE VOLTE', 50000, '와인 애호가들의 고품질 데일리 와인', 'https://www.winenara.com/uploads/product/550/142e4492b3870fe2f8858128d780a097.png', 'https://www.winenara.com/uploads/editor/20230126103215673782816.png', '레드', '이탈리아', '무거움', '중간', '2022-04-10', 11);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '빌라엠 미미키스 로제', 'VILLA M MIMI KISS ROSE', 13900, '톡톡튀는 칼라와 입술모양이 각인된 독특한 병 디자인이 눈길을 사로잡음', 'https://www.winenara.com/uploads/product/550/0a441900ffc64faaa8bba5b44d950ca2.png', 'https://www.winenara.com/uploads/editor/202210211720441733481170.png', '로제', ' 이탈리아', '가벼움', '낮음', '2022-04-10', 20);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '헌드레드 에이커 모건스', 'HUNDRED ACRE KAYLI MORGAN', 1500000, '로버트 파커의 100점 만점을 22번이나 받으며 단숨에 나파를 정복한 와인', 'https://www.winenara.com/uploads/product/550/1c4c545e390d362839a9daa06b0a4da6.png', 'https://www.winenara.com/uploads/editor/095714cbd070c803eab5902c3558b54d.png', '레드', '미국', '무거움', '높음', '2021-01-25', 3);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '웨일본 베이 피노누아', 'WHALEBONE BAY PINOT NOIR', 49000, '뉴질랜드 말보로의 와인 선구자가 만드는 미네랄이 풍부한 섬세한 가성비 피노누아', 'https://www.winenara.com/uploads/product/550/b8656afd323190d20c1c277d7627c070.png', 'https://www.winenara.com/uploads/editor/202211141633521180558909.png', '레드', '뉴질랜드', '중간', '중간', '2022-04-30', 25);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '룩벨레어 로제 팬텀', 'LUC BELAIRE ROSE', 62000, '장인정신과 퀄리티가 어우러져 한병한병 잊을 수 없는 경험을 선사하는 룩벨레어 ROZE 팬텀', 'https://www.winenara.com/uploads/product/550/2546_detail_013.png', 'https://www.winenara.com/uploads/editor/data/editor/goods/220107/rose_phantom_165436.png', '로제', '프랑스', '가벼움', '중간', '2022-05-10', 10);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '하트포드 코트 러시안', 'HARTFORD COURT RUSSIAN', 85000, '최고급 싱글빈야드에서 소량 생산하는 프리미엄 부티크 샤르도네', 'https://www.winenara.com/uploads/product/550/07ac6cdc7e8d58b0b3fded66122e345f.png', 'https://www.winenara.com/uploads/editor/202207151533291929379690.png', '화이트', '미국', '중간', '높음', '2022-05-15', 18);
INSERT INTO PRODUCT VALUES(PROD_SEQ.NEXTVAL, '마스 가비넬 그르나슈 그리', 'MAS GABINELE', 39000, '50년 이상 된 올드바인에서 재배한 그르나슈 그리만을 사용하여 만든 와인', 'https://www.winenara.com/uploads/product/550/d1a3d2f8836fe5c0ed4907d8a749d57c.png', 'https://www.winenara.com/uploads/editor/202212201012531471808237.png', '화이트', '미국', '중간', '높음', '2022-06-01', 30);
COMMIT;

-- 회원테이블
CREATE TABLE USERS (
    USER_NO              NUMBER             NOT NULL,           -- 회원 번호
    USER_ID             VARCHAR2(20 BYTE)   NOT NULL UNIQUE,    -- 회원 아이디
    USER_PW             VARCHAR2(20 BYTE)   NOT NULL,            -- 비밀번호
    USER_NAME           VARCHAR2(20 BYTE),                      -- 이름       
    USER_TEL             VARCHAR2(20 BYTE),                     -- 휴대폰 번호 하이픈 제외(-) 후 저장
    USER_POST            VARCHAR2(7 BYTE),                      -- 우편 번호
    USER_ADDRESS         VARCHAR2(50 BYTE),                     -- 주소
    USER_ADDR_DETAIL     VARCHAR2(80 BYTE),                     -- 상세 주소
    USER_EMAIL           VARCHAR2(40 BYTE)  NOT NULL,           -- 이메일
    USER_BIRTH           VARCHAR2(12 BYTE),                     -- 생년월일
    USER_GENDER          VARCHAR2(6 BYTE),                      -- 성별 M(남), F(여), NO(선택안함)
    USER_PW_MODIFIED_AT  DATE,                                  -- 비밀번호 변경일
    USER_AGREECODE       NUMBER             NOT NULL,           -- 동의여부(0:필수, 1:위치, 2:이벤트, 3:위치+이벤트)
    USER_STATE           NUMBER(1),                             -- 회원 상태(관리자:0, 회원:1, 비회원:2, 탈퇴회원:3)
    USER_JOINED_AT       DATE,                                  -- 등록일자
    USER_AUTOLOGIN_ID    VARCHAR2(32 BYTE),                     -- 자동로그인할 때 사용하는 ID(SESSION_ID를 사용함)
    USER_AUTOLOGIN_EXPIRED_AT DATE,                             -- 자동로그인 만료일
    CONSTRAINT PK_USERS PRIMARY KEY(USER_NO)
);

INSERT INTO USERS VALUES(USERS_SEQ.NEXTVAL, 'admin', '1111', '관리자', '01012345678', '24223', '와인시 소주구 맥주동', '알콜아파트 101동 111호', 'qwe123@naver.com', '90-12-31', 'F', SYSDATE, 0, 0, SYSDATE, NULL, NULL);
INSERT INTO USERS VALUES(USERS_SEQ.NEXTVAL, 'hyunju', '1111', '이현주', '01088888888', '24221', '서울시 금천구 가산동', '바이너리 101호', 'parkhy0sh1n@naver.com', '99-08-08', 'M', SYSDATE, 0, 0, SYSDATE, NULL, NULL);
COMMIT;

-- 휴면회원
CREATE TABLE SLEEP_USERS (
    USER_NO              NUMBER              NOT NULL,           -- 회원 번호
    USER_ID              VARCHAR2(20 BYTE)   NOT NULL UNIQUE,    -- 회원 아이디
    USER_PW              VARCHAR2(20 BYTE)   NOT NULL,           -- 비밀번호
    USER_NAME            VARCHAR2(20 BYTE),                      -- 이름       
    USER_TEL             VARCHAR2(20 BYTE),                      -- 휴대폰 번호 하이픈 제외(-) 후 저장
    USER_POST            VARCHAR2(7 BYTE),                       -- 우편 번호
    USER_ADDRESS         VARCHAR2(50 BYTE),                      -- 주소
    USER_ADDR_DETAIL     VARCHAR2(80 BYTE),                      -- 상세 주소
    USER_EMAIL           VARCHAR2(40 BYTE)   NOT NULL,           -- 이메일
    USER_BIRTH           VARCHAR2(12 BYTE),                      -- 생년월일
    USER_GENDER          VARCHAR2(6 BYTE),                       -- 성별 M(남), F(여), NO(선택안함)
    USER_PW_MODIFIED_AT  DATE,                                   -- 비밀번호 변경일
    USER_AGREECODE       NUMBER              NOT NULL,           -- 동의여부(0:필수, 1:위치, 2:이벤트, 3:위치+이벤트)
    USER_STATE           NUMBER(1),                              -- 회원 상태(관리자:0, 회원:1, 비회원:2, 탈퇴회원:3)
    USER_JOINED_AT       DATE,                                   -- 등록일자
    USER_SLEEP_AT        DATE                                    -- 휴면일
);

-- 탈퇴회원
CREATE TABLE LEAVE_USERS (
    USER_ID          VARCHAR2(40 BYTE)   NOT NULL UNIQUE,        -- 회원 아이디
    USER_EMAIL       VARCHAR2(100 BYTE)  NOT NULL UNIQUE,        -- 이메일
    USER_JOINED_AT   DATE,                                       -- 가입일
    USER_LEAVED_AT   DATE                                        -- 탈퇴일
);

-- 회원 접속 기록(회원마다 마지막 로그인 날짜 1개만 기록)
CREATE TABLE ACCESS_USERS (
    USER_ID             VARCHAR2(40 BYTE) NOT NULL UNIQUE,     -- 로그인한 사용자 ID
    LAST_LOGIN_AT       DATE,                                  -- 마지막 로그인 날짜
    CONSTRAINT FK_ACCESS_USERS FOREIGN KEY(USER_ID) REFERENCES USERS(USER_ID) ON DELETE CASCADE
);

-- 주문 테이블   
CREATE TABLE ORDERS (
    ORDER_NO                NUMBER  NOT NULL PRIMARY KEY,   -- 주문번호 
    USER_NO                 NUMBER  NOT NULL,               -- 회원번호 
    ORDER_DATE              DATE    NOT NULL,               -- 주문일  
    RECEIVER_NAME           VARCHAR2(15 BYTE),              -- 수령인 이름   
    RECEIVER_TEL            VARCHAR2(11 BYTE),              -- 수령인 연락처
    POST_CODE               VARCHAR2(7 BYTE),               -- 우편번호 
    RECEIVER_ADDRESS        VARCHAR2(50 BYTE),              -- 도로명 주소   
    RECEIVER_JIBUN_ADDRESS  VARCHAR2(50 BYTE),              -- 지번 주소    
    RECEIVER_DETAIL_ADDRESS VARCHAR2(80 BYTE),              -- 상세 주소    
    ORDER_REQUEST           CLOB,                           -- 요청사항 
    PAY_METHOD              VARCHAR2(20 BYTE),              -- 결제 방식    
    ORDER_AMOUNT            NUMBER,                         -- 주문 금액    
    PAY_NO                  VARCHAR2(50 BYTE),              -- 결제 번호(merchan uid)    
    PAY_SUCCESS             NUMBER,                         -- 결제 여부    
    ORDER_DISCOUNT          NUMBER,                         -- 할인 금액 
    CONSTRAINT FK_ORDERS_USERS FOREIGN KEY (USER_NO) REFERENCES USERS(USER_NO)
);
INSERT INTO ORDERS VALUES(ORDERS_SEQ.NEXTVAL, 2, '2023-05-26', '김민서', '01088888888', '24221', '서울시 금천구 독산동 시흥대로', '서울시 금천구 독산동 1004', '바이너리 111호', '문 앞에 놓고 가세요.', NULL, 25000, NULL, NULL, NULL);
COMMIT;


-- 장바구니 테이블 (장바구니에 담긴 상품)
CREATE TABLE CART (
    CART_NO     NUMBER        NOT NULL PRIMARY KEY,   -- 장바구니 번호 
    USER_NO     NUMBER        NOT NULL,               -- 회원 번호    
    PROD_NO     NUMBER        NOT NULL,               -- 상품 번호    
    QUANTITY    NUMBER,                               -- 주문 수량    
    PROD_NAME   VARCHAR2(60),                         -- 품번
    PROD_PRICE  NUMBER,                               -- 가격    
    PROD_THUMBNAIL VARCHAR2(100),                     -- 와인이미지

    CONSTRAINT FK_CART_USERS FOREIGN KEY   (USER_NO) REFERENCES USERS(USER_NO),
    CONSTRAINT FK_CART_PRODUCT FOREIGN KEY (PROD_NO) REFERENCES PRODUCT(PROD_NO)
    
);

INSERT INTO CART VALUES(CART_SEQ.NEXTVAL, 1, 1, 2, '유 원 프리미티보', 250000, 'https://www.winenara.com/uploads/product/550/1870_detail_069.png');
INSERT INTO CART VALUES(CART_SEQ.NEXTVAL, 1, 2, 4, '샤또 루빈 라이온 앤 드래곤', 45000, 'https://www.winenara.com/uploads/product/550/3e516b689bdfa0bfb560b2475dc6e3ce.png');
INSERT INTO CART VALUES(CART_SEQ.NEXTVAL, 1, 3, 6, '산 필리포 브루넬로', 199000, 'https://www.winenara.com/uploads/product/550/7405a2f09e4139796f8d2ca15dc759a7.png');
COMMIT;


-- 주문상세 테이블 (장바구니 목록)
CREATE TABLE ORDER_DETAIL (
    ORDER_DETAIL_NO     NUMBER  NOT NULL PRIMARY KEY,   -- 주문상세번호   
    ORDER_NO            NUMBER  NOT NULL,               -- 주문번호 
    PROD_NO             NUMBER  NOT NULL,               -- 상품번호  
    QUANTITY            NUMBER  NOT NULL,               -- 주문수량 
    ORDER_AMOUNT        NUMBER  NOT NULL,               -- 주문 금액    
    ORDER_DISCOUNT      NUMBER,                         -- 할인 금액    
    
    CONSTRAINT FK_ORDER_DETAIL_ORDERS FOREIGN KEY (ORDER_NO) REFERENCES ORDERS(ORDER_NO),
    CONSTRAINT FK_ORDER_DETAIL_PRODUCT FOREIGN KEY (PROD_NO) REFERENCES PRODUCT(PROD_NO)
);
INSERT INTO ORDER_DETAIL VALUES(ORDER_DETAIL_SEQ.NEXTVAL, 1, 1, 1, 25000, NULL);
COMMIT;

-- 주문내역
CREATE TABLE ORDER_LIST (
    ORDER_NO             NUMBER          NOT NULL,   -- 주문번호
    USER_NO                NUMBER        NOT NULL,   -- 회원번호
    ORDER_DATE             DATE          NOT NULL,   -- 주문일자
    RECEIVER_NAME         VARCHAR2(15),              -- 수령자명
    RECEIVER_TEL         VARCHAR2(11)    NOT NULL,   -- 수령자연락처
    RECEIVER_ADDRESS      VARCHAR2(50),              -- 도로명주소
    RECEIVER_JIBUN_ADDRESS   VARCHAR2(50),           -- 지번주소
    RECEIVER_DETAIL_ADDRESS   VARCHAR2(80),          -- 상세주소
    ORDER_REQUEST         CLOB,                      -- 요청사항
    PAY_METHOD             VARCHAR2(20),             -- 결제방식
    ORDER_AMOUNT         NUMBER,                     -- 주문금액
    ORDER_DISCOUNT          NUMBER,                  -- 할인금액
    CONSTRAINT FK_ORDER_LIST_ORDERS FOREIGN KEY(ORDER_NO) REFERENCES ORDERS(ORDER_NO) ON DELETE CASCADE,
    CONSTRAINT FK_ORDER_LIST_USERS FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO) ON DELETE CASCADE
);


-- 리뷰 
CREATE TABLE REVIEW (
    REVIEW_NO         NUMBER       NOT NULL, -- 리뷰번호
    USER_NO           NUMBER       NOT NULL, -- 회원번호
    ORDER_DETAIL_NO          NUMBER       NOT NULL, -- 주문번호
    REVIEW_CONTENT    CLOB         NOT NULL, -- 리뷰내용
    REVIEW_GRADE      DECIMAL(2,1) NOT NULL, -- 리뷰평점
    REVIEW_CREATED_AT DATE         NOT NULL, -- 등록일
    CONSTRAINT PK_REVIEW PRIMARY KEY(REVIEW_NO),
    CONSTRAINT FK_REVIEW_USERS FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO),
    CONSTRAINT FK_REVIEW_ORDER_DETAIL FOREIGN KEY(ORDER_DETAIL_NO) REFERENCES ORDER_DETAIL(ORDER_DETAIL_NO)
);
INSERT INTO REVIEW VALUES(REVIEW_SEQ.NEXTVAL, 2, 1, '좋은 상품 감사합니다ㅋ -민서-', 4.8, '2023-05-26');
INSERT INTO REVIEW VALUES(REVIEW_SEQ.NEXTVAL, 2, 1, '최고의 구매였습니다 -예나-', 4.8, '2023-05-26');
INSERT INTO REVIEW VALUES(REVIEW_SEQ.NEXTVAL, 2, 1, '와인 맛이 기가막혀요 -종찬-', 5.0, '2023-05-26');
INSERT INTO REVIEW VALUES(REVIEW_SEQ.NEXTVAL, 2, 1, '별로네요 환불해주세요 -우민-', 1.0, '2023-05-26');
INSERT INTO REVIEW VALUES(REVIEW_SEQ.NEXTVAL, 2, 1, '재구매할게요 만족합니다 -현주-', 4.0, '2023-05-26');
COMMIT;

-- 공지사항 
CREATE TABLE NOTICE (
    NOTICE_NO           NUMBER           NOT NULL,              -- 공지 번호      
    NOTICE_TITLE        VARCHAR2(100)     NOT NULL,             -- 제목         
    NOTICE_CONTENT      CLOB             NOT NULL,              -- 내용
    NOTICE_IMG          VARCHAR2(100)     NULL,                 -- 공지글 이미지
    NOTICE_CREATED_AT   VARCHAR2(100)     NOT NULL,             -- 공지 등록일
    CONSTRAINT PK_NOTICE PRIMARY KEY(NOTICE_NO)
);

INSERT INTO NOTICE VALUES(NOTICE_SEQ.NEXTVAL, '와인나라 서울창고 이전으로 인한 배송 불가 안내', '안녕하세요. 와인나라입니다. 10/22~10/25 까지 서울창고 이전으로 해당일자 배송일 선택이 중지됩니다.', NULL, '2022-12-31');
INSERT INTO NOTICE VALUES(NOTICE_SEQ.NEXTVAL, '[가정의 달 5월 프로모션] 와인나라 이달의 와인', '5월 가정의 달을 기념하여 와인 프로모션을 진행합니다.', 'https://www.winenara.com/uploads/editor/20230510104045540638455.png', '2022-11-10');
INSERT INTO NOTICE VALUES(NOTICE_SEQ.NEXTVAL, '[프로모션] UNANIME Brand Week', '오피가 새로 선정한 와인을 특별 가격으로 선보입니다. 프랑스 와인 콘테스트에서 선정된 우승작을 놓치지 마세요!', 'https://www.winenara.com/uploads/editor/20230508145300223331206.png', '2022-10-30');
INSERT INTO NOTICE VALUES(NOTICE_SEQ.NEXTVAL, '[프로모션] 봄봄봄 와인 특가', '새로운 계절을 맞이하여 특별한 이벤트를 준비했습니다. 봄에 어울리는 와인들을 특별한 가격으로 선보입니다. 이번 기회를 놓치지 마세요!', 'https://www.winenara.com/uploads/editor/202304171654191144568770.png', '2022-10-02');
INSERT INTO NOTICE VALUES(NOTICE_SEQ.NEXTVAL, '포추네이트 선 예약판매', '헌드레드 에이커의 제이슨이 탄생시킨 포추네이트 선을 만나보세요!', 'https://www.winenara.com/uploads/editor/202305150959271270499083.png', '2022-09-15');
INSERT INTO NOTICE VALUES(NOTICE_SEQ.NEXTVAL, '서비스 이전에 따른 와인나라 온라인몰(winenara.com) 개인정보 이전 안내', '와인나라 온라인몰을 운영하는 ㈜ 와인나라는 개인정보보호법 제27조에 의거하여 신규 사업장 설립에 따른 개인정보 이전에 대해 다음과 같이 안내 말씀 드립니다. ㈜와인나라 는 2021년 12월 1일부터 신규 사업장 ㈜와인나라 제일와인셀러점을 설립하여 와인나라 온라인몰 서비스를 이전할 예정입니다.', NULL, '2022-01-11'); 
INSERT INTO NOTICE VALUES(NOTICE_SEQ.NEXTVAL, '[공지] 와인나라 일시적 접속 중단 안내', '5/29(월) 오전 4시부터 오전 10시까지 내부 시스템 점검으로 와인나라 온라인몰의 접속이 중지됩니다.', NULL, '2022-08-08'); 
INSERT INTO NOTICE VALUES(NOTICE_SEQ.NEXTVAL, '[점검완료] 와인나라 회원가입시 오류 해결 안내', '지난주 발생한 와인나라 온라인몰의 회원가입시 오류와 관련하여 점검을 시행하였습니다. 이에 현재 정상적으로 회원 가입 및 온라인 몰 이용이 가능하심을 안내드립니다. 고객님의 편리한 쇼핑을 위해 더욱 노력하는 와인나라가 되겠습니다.', NULL, '2022-07-13'); 
INSERT INTO NOTICE VALUES(NOTICE_SEQ.NEXTVAL, '구정명절 직영점 휴무안내', '와인을 사랑하시는 고객님 설 명절연휴 와인과 함께 즐거운 시간 되시길 바라겠습니다. 감사합니다.', NULL, '2022-06-27');
COMMIT;

-- 문의게시판
CREATE TABLE QNA (
    QNA_NO          NUMBER         NOT NULL,               -- 문의글 번호 
    QNA_TITLE       VARCHAR(60)    NOT NULL,               -- 글 제목
    QNA_REGDATE     DATE           NOT NULL,               -- 등록일
    QNA_GUBUN       VARCHAR2(10)   NOT NULL,               --카테고리
    QNA_CONTENT     CLOB           NOT NULL,               --글 내용
    QNA_DEPTH       NUMBER         NOT NULL,               --1문의 1답변(문의 0, 답변 1)
    USER_NO         NUMBER         NOT NULL,               --회원 번호   
    CONSTRAINT PK_QNA PRIMARY KEY(QNA_NO),
    CONSTRAINT FK_QNA_USERS FOREIGN KEY(USER_NO) REFERENCES USERS(USER_NO) ON DELETE CASCADE
);