--create user odga identified by java;
--grant connect, resource to odga;
--conn odga/java
--imp userid=system/java1019 file='C:\backup.dmp' fromuser=odga touser=odga

--���̺� ����
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

--������ ����
DROP SEQUENCE BOARD_ID;
DROP SEQUENCE PLANNER_ID;
DROP SEQUENCE S_PLANNER_ID;
DROP SEQUENCE SUPPORT_ID;
DROP SEQUENCE MEMBER_ID;
DROP SEQUENCE LIKE_ID;
DROP SEQUENCE SUPPORT_ORIGIN_NO;
DROP SEQUENCE REPLY_ID;

--PURGE RECYCLEBIN;

--���̺� ����/�⺻Ű ����

-- �Խ���
CREATE TABLE BOARD (
      B_ID NUMBER NOT NULL, -- ��id,
      B_WRITER VARCHAR2(20) NOT NULL, -- �ۼ���,
      B_SUBJECT VARCHAR2(100) NULL, -- ����,
      B_CONTENT CLOB NULL, -- ����,
      B_IMG VARCHAR2(100) NULL, -- ���� �̹���
      B_RDATE DATE NULL, -- �ۼ���,
      B_CATGO VARCHAR2(40) NULL, -- ī�װ�
      B_LIKE NUMBER, -- ���ƿ��
      M_ID NUMBER, -- ȸ��id,
      B_REPLY NUMBER
);

-- �Խ���
ALTER TABLE BOARD
   ADD CONSTRAINT "PK_BOARD" -- �Խ��� �⺻Ű
   PRIMARY KEY (
      B_ID -- ��id
   );

--���ƿ�
CREATE TABLE "LIKE_T" ( --���ƿ�
      LI_ID NUMBER NOT NULL, --����ũid
      LIKEFLAG number,
      B_ID NUMBER,
      M_ID NUMBER  -- ȸ��id
);

ALTER TABLE "LIKE_T"
   ADD CONSTRAINT "PK_LIKE_T" 
   PRIMARY KEY (
      "LI_ID" 
   );

-- �÷���
CREATE TABLE "PLANNER" (
      P_ID NUMBER NOT NULL, --�÷�id
      P_RDATE DATE,
      M_ID NUMBER,  -- ȸ��id
      P_TITLE VARCHAR2(200),
      P_MSIZE VARCHAR2(20),
      P_CONCEPT VARCHAR2(50)
);

-- �÷���
ALTER TABLE "PLANNER"
   ADD CONSTRAINT "PK_PLANNER" -- �÷��� �⺻Ű
   PRIMARY KEY (
      "P_ID" -- �÷�id
   );


-- �����÷���
CREATE TABLE S_PLANNER (
      SP_ID NUMBER NOT NULL, -- �����÷�id,
      SP_DAY NUMBER NULL, -- DAY,
      SP_SDAY DATE NULL, -- ������,
      SP_EDAY DATE NULL, -- ������,
      contentid varchar2(200), -- ������id
      P_ID NUMBER -- �÷���id
);

-- �����÷���
ALTER TABLE "S_PLANNER"
   ADD CONSTRAINT "PK_S_PLANNER" -- �����÷��� �⺻Ű
   PRIMARY KEY (
      "SP_ID" -- �����÷�id
   );


-- ȸ��
CREATE TABLE "MEMBER" (
      "M_ID" NUMBER NOT NULL, -- ȸ��id,
      "M_EMAIL" VARCHAR2(40) NOT NULL, -- �̸���,
      "M_PWD" VARCHAR2(40) NULL, -- ��й�ȣ
      "M_NAME" VARCHAR2(100) NULL, -- �̸�,
      "M_PHONE" VARCHAR2(30) NULL, -- ��ȭ��ȣ,
      "M_GENDER" VARCHAR(10) NULL, -- ����,
      "M_BIRTH" DATE NULL, -- �������,
      "M_RDATE" DATE NULL, -- ������,
      "M_FNAME" VARCHAR2(100) NULL,-- �����̸�,
      "M_OFNAME" VARCHAR2(100) NULL, -- �������������̸�,
      "M_VERIFY" NUMBER NULL, -- ȸ��0/������9 Ȯ��,
      "M_ABOUT" VARCHAR2(200) -- �Ұ���
);

-- ȸ��
ALTER TABLE "MEMBER"
   ADD CONSTRAINT "PK_MEMBER" -- ȸ�� �⺻Ű
   PRIMARY KEY (
      "M_ID" -- ȸ��id
   );

-- ���
CREATE TABLE "REPLY" (
      "RE_ID" NUMBER NOT NULL, -- ���id,
      "RE_WRITER" VARCHAR2(20) NULL, -- �ۼ���,
      "RE_CONTENT" VARCHAR2(500) NULL, -- ����,
      "RE_RDATE" DATE NULL, -- �ۼ���,
      "B_ID" NUMBER NOT NULL, -- ��id
      RE_FNAME VARCHAR(100) --�����ʻ���
);

-- ���
ALTER TABLE "REPLY"
   ADD CONSTRAINT "PK_REPLY" -- ��� �⺻Ű
   PRIMARY KEY (
      "RE_ID" -- ���id
   );

-- �����ϱ�
create table SUPPORT (
    S_ID NUMBER NOT NULL,               -- ����ID
    S_SUBJECT VARCHAR2(100) NOT NULL,   -- ������
    S_CONTENT VARCHAR2(500) NOT NULL,   -- ���ǳ���
    S_RDATE DATE NOT NULL,              -- ���ǳ�¥
    M_ID NUMBER,                        -- ȸ��ID
    ORIGIN_NO NUMBER,
    GROUP_ORD NUMBER
);
-- �����ϱ�
alter table SUPPORT
    add constraint "PK_SUPPORT"           -- �����ϱ� �⺻Ű
    primary key(
        S_ID                            -- ����ID
    );

-- �����ڵ�
CREATE TABLE AREA_T (
      areacode varchar2(20), -- �����ڵ�id,
      area varchar2(200), -- ������
      LATITUDE NUMBER, --����
      LONGITUDE NUMBER --�浵
);

-- �����ڵ�
ALTER TABLE AREA_T
   ADD CONSTRAINT "PK_AREA_T" -- �����ڵ� �⺻Ű
   PRIMARY KEY (
      areacode -- �����ڵ�id
   );
   
-- �ñ����ڵ�
CREATE TABLE SIGUNGU_T (
	si_id number, --�ñ���id
	SI_NAME varchar2(200), -- �ñ�����
	sigungucode varchar2(20), -- �ñ����ڵ�
	areacode varchar2(20), -- �����ڵ�id
	CONSTRAINT FK_areacode FOREIGN KEY(areacode)
	REFERENCES AREA_T(areacode)	
);

-- �ñ����ڵ�
ALTER TABLE SIGUNGU_T
   ADD CONSTRAINT "PK_SIGUNGU_T" -- �ñ����ڵ� �⺻Ű
   PRIMARY KEY (
      si_id -- �ñ���id
   );

-- ��з�
CREATE TABLE CAT1_T (
	CAT1 varchar2(20), -- ��з�id 
	C1_NAME varchar2(200) -- ��з���
);

-- ��з�
ALTER TABLE CAT1_T
   ADD CONSTRAINT "PK_CAT1" -- ��з� �⺻Ű
   PRIMARY KEY (
      CAT1 -- ��з�id
   );

-- �ߺз�
CREATE TABLE CAT2_T (
	CAT2 varchar2(200), -- �ߺз�id 
	C2_NAME varchar2(200), -- �ߺз���
	CAT1 varchar2(20), -- ��з�id
	CONSTRAINT FK_CAT1 FOREIGN KEY(cat1)
	REFERENCES CAT1_T(cat1)
);

-- �ߺз�
ALTER TABLE CAT2_T
   ADD CONSTRAINT "PK_CAT2" -- �ߺз� �⺻Ű
   PRIMARY KEY (
      CAT2 -- �ߺз�id
   );

-- �Һз�
CREATE TABLE CAT3_T (
	CAT3 varchar2(200), -- �Һз�id 
	C3_NAME varchar2(200), -- �Һз���
	CAT2 varchar2(200), -- �ߺз�id
	CONSTRAINT FK_CAT2 FOREIGN KEY(CAT2)
	REFERENCES CAT2_T(CAT2)
);

-- �Һз�
ALTER TABLE CAT3_T
   ADD CONSTRAINT "PK_CAT3" -- �Һз� �⺻Ű
   PRIMARY KEY (
      CAT3 -- �Һз�id
   );

-- ������Ÿ��
CREATE TABLE CONTENTTYPE (
	CONTENTTYPEID varchar2(20), -- ������Ÿ��id 
	CT_NAME varchar2(200) -- ������Ÿ�Ը�
);

-- ������Ÿ��
ALTER TABLE CONTENTTYPE
   ADD CONSTRAINT "PK_CONTENTTYPE" -- ������Ÿ�� �⺻Ű
   PRIMARY KEY (
      CONTENTTYPEID -- ������Ÿ��id
   );

-- ������
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

--�ܷ�Ű

-- �Խ���
ALTER TABLE "BOARD"
   ADD CONSTRAINT "FK_MEMBER_TO_BOARD" -- ȸ�� -> �Խ���
   FOREIGN KEY (
      "M_ID" -- ȸ��id
   )
   REFERENCES "MEMBER" ( -- ȸ��
      "M_ID" -- ȸ��id
   )ON DELETE CASCADE;



-- �÷���
ALTER TABLE "PLANNER"
   ADD CONSTRAINT "FK_MEMBER_TO_PLANNER" -- ȸ�� -> �÷���
   FOREIGN KEY (
      "M_ID" -- ȸ��id
   )
   REFERENCES "MEMBER" ( -- ȸ��
      "M_ID" -- ȸ��id
   )ON DELETE CASCADE;
 
 -- �����÷���
ALTER TABLE S_PLANNER
   ADD CONSTRAINT "FK_TOURITEMS_TO_S_PLANNER" -- ������ -> �����÷���
   FOREIGN KEY (
      contentid -- ������id
   )
   REFERENCES TOURITEMS ( -- ������
      contentid -- ������id
   )ON DELETE CASCADE;

-- �����÷���
ALTER TABLE "S_PLANNER"
   ADD CONSTRAINT "FK_PLANNER_TO_S_PLANNER" -- �÷��� -> �����÷���
   FOREIGN KEY (
      "P_ID" -- �÷���id
   )
   REFERENCES "PLANNER" ( -- �÷���
      "P_ID"
   )ON DELETE CASCADE;

-- ���
ALTER TABLE "REPLY"
   ADD CONSTRAINT "FK_BOARD_TO_REPLY" -- �Խ��� -> ���
   FOREIGN KEY (
      "B_ID" -- ��id
   )
   REFERENCES "BOARD" ( -- �Խ���
      "B_ID" -- ��id
   )ON DELETE CASCADE;

--���ƿ�
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

-- �����ϱ�
ALTER TABLE "SUPPORT"
   ADD CONSTRAINT "FK_MEMBER_TO_SUPPORT" -- ȸ�� -> �����ϱ�
   FOREIGN KEY (
      "M_ID" -- ȸ��id
   )
   REFERENCES "MEMBER" ( -- ȸ��
      "M_ID" -- ȸ��id
   )ON DELETE CASCADE;

--������ ����

--���
CREATE SEQUENCE REPLY_ID
INCREMENT BY 1
START WITH 1
nocache;

--�Խ���
CREATE SEQUENCE BOARD_ID
INCREMENT BY 1
START WITH 1
nocache;

--�÷���
CREATE SEQUENCE PLANNER_ID
INCREMENT BY 1
START WITH 1
nocache;

--�����÷���
CREATE SEQUENCE S_PLANNER_ID
INCREMENT BY 1
START WITH 1
nocache;

--ȸ��
CREATE SEQUENCE MEMBER_ID
INCREMENT BY 1
START WITH 1
nocache;

--���ƿ�
CREATE SEQUENCE LIKE_ID
INCREMENT BY 1
START WITH 1
nocache;

--����
CREATE SEQUENCE SUPPORT_ID
INCREMENT BY 1
START WITH 1
nocache;

--���� ������
CREATE SEQUENCE SUPPORT_ORIGIN_NO
INCREMENT BY 1
START WITH 1
nocache;
