--create user odga identified by java;
--grant connect, resource to odga;
--conn odga/java
--imp userid=system/java1019 file='C:\backup.dmp' fromuser=odga touser=odga

--테이블 삭제
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE PLANNER CASCADE CONSTRAINTS;
DROP TABLE S_PLANNER CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP TABLE LIKE_T CASCADE CONSTRAINTS;
DROP TABLE SUPPORT CASCADE CONSTRAINTS;
DROP TABLE TOURITEMS CASCADE CONSTRAINTS;
DROP TABLE AREA_T CASCADE CONSTRAINTS;
DROP TABLE SIGUNGU_T CASCADE CONSTRAINTS;
DROP TABLE CAT1_T CASCADE CONSTRAINTS;
DROP TABLE CAT2_T CASCADE CONSTRAINTS;
DROP TABLE CAT3_T CASCADE CONSTRAINTS;
DROP TABLE CONTENTTYPE CASCADE CONSTRAINTS;

--시쿼스 삭제
DROP SEQUENCE BOARD_ID;
DROP SEQUENCE PLANNER_ID;
DROP SEQUENCE S_PLANNER_ID;
DROP SEQUENCE SUPPORT_ID;
DROP SEQUENCE MEMBER_ID;
DROP SEQUENCE LIKE_ID;
DROP SEQUENCE SUPPORT_ORIGIN_NO;
DROP SEQUENCE REPLY_ID;

--PURGE RECYCLEBIN;

--테이블 생성/기본키 생성

-- 게시판
CREATE TABLE BOARD (
      B_ID NUMBER NOT NULL, -- 글id,
      B_WRITER VARCHAR2(20) NOT NULL, -- 작성자,
      B_SUBJECT VARCHAR2(100) NULL, -- 제목,
      B_CONTENT CLOB NULL, -- 내용,
      B_IMG VARCHAR2(100) NULL, -- 메인 이미지
      B_RDATE DATE NULL, -- 작성일,
      B_CATGO VARCHAR2(40) NULL, -- 카테고리
      B_LIKE NUMBER, -- 좋아요수
      M_ID NUMBER, -- 회원id,
      B_REPLY NUMBER
);

-- 게시판
ALTER TABLE BOARD
   ADD CONSTRAINT "PK_BOARD" -- 게시판 기본키
   PRIMARY KEY (
      B_ID -- 글id
   );

--좋아요
CREATE TABLE "LIKE_T" ( --좋아요
      LI_ID NUMBER NOT NULL, --라이크id
      LIKEFLAG number,
      B_ID NUMBER,
      M_ID NUMBER  -- 회원id
);

ALTER TABLE "LIKE_T"
   ADD CONSTRAINT "PK_LIKE_T" 
   PRIMARY KEY (
      "LI_ID" 
   );

-- 플래너
CREATE TABLE "PLANNER" (
      P_ID NUMBER NOT NULL, --플랜id
      P_RDATE DATE,
      M_ID NUMBER,  -- 회원id
      P_TITLE VARCHAR2(200),
      P_MSIZE VARCHAR2(20),
      P_CONCEPT VARCHAR2(50)
);

-- 플래너
ALTER TABLE "PLANNER"
   ADD CONSTRAINT "PK_PLANNER" -- 플래너 기본키
   PRIMARY KEY (
      "P_ID" -- 플랜id
   );


-- 세부플래너
CREATE TABLE S_PLANNER (
      SP_ID NUMBER NOT NULL, -- 세부플랜id,
      SP_DAY NUMBER NULL, -- DAY,
      SP_SDAY DATE NULL, -- 시작일,
      SP_EDAY DATE NULL, -- 종료일,
      contentid varchar2(200), -- 관광지id
      P_ID NUMBER -- 플래너id
);

-- 세부플래너
ALTER TABLE "S_PLANNER"
   ADD CONSTRAINT "PK_S_PLANNER" -- 세부플래너 기본키
   PRIMARY KEY (
      "SP_ID" -- 세부플랜id
   );


-- 회원
CREATE TABLE "MEMBER" (
      "M_ID" NUMBER NOT NULL, -- 회원id,
      "M_EMAIL" VARCHAR2(40) NOT NULL, -- 이메일,
      "M_PWD" VARCHAR2(40) NULL, -- 비밀번호
      "M_NAME" VARCHAR2(100) NULL, -- 이름,
      "M_PHONE" VARCHAR2(30) NULL, -- 전화번호,
      "M_GENDER" VARCHAR(10) NULL, -- 성별,
      "M_BIRTH" DATE NULL, -- 생년월일,
      "M_RDATE" DATE NULL, -- 가입일,
      "M_FNAME" VARCHAR2(100) NULL,-- 파일이름,
      "M_OFNAME" VARCHAR2(100) NULL, -- 오리지널파일이름,
      "M_VERIFY" NUMBER NULL, -- 회원0/관리자9 확인,
      "M_ABOUT" VARCHAR2(200) -- 소개글
);

-- 회원
ALTER TABLE "MEMBER"
   ADD CONSTRAINT "PK_MEMBER" -- 회원 기본키
   PRIMARY KEY (
      "M_ID" -- 회원id
   );

-- 댓글
CREATE TABLE "REPLY" (
      "RE_ID" NUMBER NOT NULL, -- 댓글id,
      "RE_WRITER" VARCHAR2(20) NULL, -- 작성자,
      "RE_CONTENT" VARCHAR2(500) NULL, -- 내용,
      "RE_RDATE" DATE NULL, -- 작성일,
      "B_ID" NUMBER NOT NULL, -- 글id
      RE_FNAME VARCHAR(100) --프로필사진
);

-- 댓글
ALTER TABLE "REPLY"
   ADD CONSTRAINT "PK_REPLY" -- 댓글 기본키
   PRIMARY KEY (
      "RE_ID" -- 댓글id
   );

-- 문의하기
create table SUPPORT (
    S_ID NUMBER NOT NULL,               -- 문의ID
    S_SUBJECT VARCHAR2(100) NOT NULL,   -- 문의자
    S_CONTENT VARCHAR2(500) NOT NULL,   -- 문의내용
    S_RDATE DATE NOT NULL,              -- 문의날짜
    M_ID NUMBER,                        -- 회원ID
    ORIGIN_NO NUMBER,
    GROUP_ORD NUMBER
);
-- 문의하기
alter table SUPPORT
    add constraint "PK_SUPPORT"           -- 문의하기 기본키
    primary key(
        S_ID                            -- 문의ID
    );

-- 지역코드
CREATE TABLE AREA_T (
      areacode varchar2(20), -- 지역코드id,
      area varchar2(200), -- 지역명
      LATITUDE NUMBER, --위도
      LONGITUDE NUMBER --경도
);

-- 지역코드
ALTER TABLE AREA_T
   ADD CONSTRAINT "PK_AREA_T" -- 지역코드 기본키
   PRIMARY KEY (
      areacode -- 지역코드id
   );
   
-- 시군구코드
CREATE TABLE SIGUNGU_T (
	si_id number, --시군구id
	SI_NAME varchar2(200), -- 시군구명
	sigungucode varchar2(20), -- 시군구코드
	areacode varchar2(20), -- 지역코드id
	CONSTRAINT FK_areacode FOREIGN KEY(areacode)
	REFERENCES AREA_T(areacode)	
);

-- 시군구코드
ALTER TABLE SIGUNGU_T
   ADD CONSTRAINT "PK_SIGUNGU_T" -- 시군구코드 기본키
   PRIMARY KEY (
      si_id -- 시군구id
   );

-- 대분류
CREATE TABLE CAT1_T (
	CAT1 varchar2(20), -- 대분류id 
	C1_NAME varchar2(200) -- 대분류명
);

-- 대분류
ALTER TABLE CAT1_T
   ADD CONSTRAINT "PK_CAT1" -- 대분류 기본키
   PRIMARY KEY (
      CAT1 -- 대분류id
   );

-- 중분류
CREATE TABLE CAT2_T (
	CAT2 varchar2(200), -- 중분류id 
	C2_NAME varchar2(200), -- 중분류명
	CAT1 varchar2(20), -- 대분류id
	CONSTRAINT FK_CAT1 FOREIGN KEY(cat1)
	REFERENCES CAT1_T(cat1)
);

-- 중분류
ALTER TABLE CAT2_T
   ADD CONSTRAINT "PK_CAT2" -- 중분류 기본키
   PRIMARY KEY (
      CAT2 -- 중분류id
   );

-- 소분류
CREATE TABLE CAT3_T (
	CAT3 varchar2(200), -- 소분류id 
	C3_NAME varchar2(200), -- 소분류명
	CAT2 varchar2(200), -- 중분류id
	CONSTRAINT FK_CAT2 FOREIGN KEY(CAT2)
	REFERENCES CAT2_T(CAT2)
);

-- 소분류
ALTER TABLE CAT3_T
   ADD CONSTRAINT "PK_CAT3" -- 소분류 기본키
   PRIMARY KEY (
      CAT3 -- 소분류id
   );

-- 콘텐츠타입
CREATE TABLE CONTENTTYPE (
	CONTENTTYPEID varchar2(20), -- 콘텐츠타입id 
	CT_NAME varchar2(200) -- 콘텐츠타입명
);

-- 콘텐츠타입
ALTER TABLE CONTENTTYPE
   ADD CONSTRAINT "PK_CONTENTTYPE" -- 콘텐츠타입 기본키
   PRIMARY KEY (
      CONTENTTYPEID -- 콘텐츠타입id
   );

-- 관광지
create table TOURITEMS (
    addr1 varchar2(200),
    addr2 varchar2(200),
    areacode varchar2(20),
    cat1 varchar2(20),
    cat2 varchar2(200),
    cat3 varchar2(200),
    contentid varchar2(200) primary key,
    contenttypeid varchar2(20),
    createdtime varchar2(200),
    firstimage varchar2(600),
    firstimage2 varchar2(600),
    mapx varchar2(200),
    mapy varchar2(200),
    mlevel varchar2(20),
    modifiedtime varchar2(200),
    readcount varchar2(200),
    sigungucode varchar2(20),
    tel varchar2(200),
    title varchar2(200),
    zipcode varchar2(200),
    CONSTRAINT FK_ITEMS_AREACODE FOREIGN KEY(areacode)
    REFERENCES AREA_T(areacode),
    CONSTRAINT FK_ITEMS_CAT1  FOREIGN KEY(cat1)
    REFERENCES CAT1_T(cat1),
    CONSTRAINT FK_ITEMS_CAT2 FOREIGN KEY(cat2)
    REFERENCES CAT2_T(cat2),
    CONSTRAINT FK_ITEMS_CAT3 FOREIGN KEY(cat3)
    REFERENCES CAT3_T(cat3)
);

--외래키

-- 게시판
ALTER TABLE "BOARD"
   ADD CONSTRAINT "FK_MEMBER_TO_BOARD" -- 회원 -> 게시판
   FOREIGN KEY (
      "M_ID" -- 회원id
   )
   REFERENCES "MEMBER" ( -- 회원
      "M_ID" -- 회원id
   )ON DELETE CASCADE;



-- 플래너
ALTER TABLE "PLANNER"
   ADD CONSTRAINT "FK_MEMBER_TO_PLANNER" -- 회원 -> 플래너
   FOREIGN KEY (
      "M_ID" -- 회원id
   )
   REFERENCES "MEMBER" ( -- 회원
      "M_ID" -- 회원id
   )ON DELETE CASCADE;
 
 -- 세부플래너
ALTER TABLE S_PLANNER
   ADD CONSTRAINT "FK_TOURITEMS_TO_S_PLANNER" -- 관광지 -> 세부플래너
   FOREIGN KEY (
      contentid -- 관광지id
   )
   REFERENCES TOURITEMS ( -- 관광지
      contentid -- 관광지id
   )ON DELETE CASCADE;

-- 세부플래너
ALTER TABLE "S_PLANNER"
   ADD CONSTRAINT "FK_PLANNER_TO_S_PLANNER" -- 플래너 -> 세부플래너
   FOREIGN KEY (
      "P_ID" -- 플래너id
   )
   REFERENCES "PLANNER" ( -- 플래너
      "P_ID"
   )ON DELETE CASCADE;

-- 댓글
ALTER TABLE "REPLY"
   ADD CONSTRAINT "FK_BOARD_TO_REPLY" -- 게시판 -> 댓글
   FOREIGN KEY (
      "B_ID" -- 글id
   )
   REFERENCES "BOARD" ( -- 게시판
      "B_ID" -- 글id
   )ON DELETE CASCADE;

--좋아요
ALTER TABLE "LIKE_T"
   ADD CONSTRAINT "FK_BOARD_TO_LIKE_T" 
   FOREIGN KEY (
      "B_ID" 
   )
   REFERENCES "BOARD" ( 
      "B_ID" 
   )ON DELETE CASCADE; 

ALTER TABLE "LIKE_T"
   ADD CONSTRAINT "FK_MEMBER_TO_LIKE_T" 
   FOREIGN KEY (
      "M_ID" 
   )
   REFERENCES "MEMBER" (
      "M_ID" 
   )ON DELETE CASCADE;

-- 문의하기
ALTER TABLE "SUPPORT"
   ADD CONSTRAINT "FK_MEMBER_TO_SUPPORT" -- 회원 -> 문의하기
   FOREIGN KEY (
      "M_ID" -- 회원id
   )
   REFERENCES "MEMBER" ( -- 회원
      "M_ID" -- 회원id
   )ON DELETE CASCADE;

--시쿼스 생성

--댓글
CREATE SEQUENCE REPLY_ID
INCREMENT BY 1
START WITH 1
nocache;

--게시판
CREATE SEQUENCE BOARD_ID
INCREMENT BY 1
START WITH 1
nocache;

--플래너
CREATE SEQUENCE PLANNER_ID
INCREMENT BY 1
START WITH 1
nocache;

--세부플래너
CREATE SEQUENCE S_PLANNER_ID
INCREMENT BY 1
START WITH 1
nocache;

--회원
CREATE SEQUENCE MEMBER_ID
INCREMENT BY 1
START WITH 1
nocache;

--좋아요
CREATE SEQUENCE LIKE_ID
INCREMENT BY 1
START WITH 1
nocache;

--문의
CREATE SEQUENCE SUPPORT_ID
INCREMENT BY 1
START WITH 1
nocache;

--문의 오리진
CREATE SEQUENCE SUPPORT_ORIGIN_NO
INCREMENT BY 1
START WITH 1
nocache;
