-- 회원 시퀀스
DROP SEQUENCE USER_SEQ;
CREATE SEQUENCE USER_SEQ;

-- 물품 시퀀스
DROP SEQUENCE PRODUCT_SEQ;
CREATE SEQUENCE PRODUCT_SEQ;

-- 판매 시퀀스
DROP SEQUENCE SELL_SEQ;
CREATE SEQUENCE SELL_SEQ;

-- 장바구니 시퀀스
DROP SEQUENCE CART_SEQ;
CREATE SEQUENCE CART_SEQ;

-- 카드결제 시퀀스
drop sequence card_seq
create sequence card_seq
     minvalue 1
     maxvalue 999999
     start with 1
     increment by 1
     cache 20;

DROP TABLE TB_COM_CODE CASCADE CONSTRAINT;
CREATE TABLE TB_COM_CODE(
  COMM_TY_CD VARCHAR2(10),
  COMM_CD VARCHAR2(20),
  COMM_CD_NM VARCHAR2(30),
  CONSTRAINT TB_CODE_PK PRIMARY KEY(COMM_TY_CD, COMM_CD)
);

-- 전화번호
INSERT INTO TB_COM_CODE(COMM_TY_CD, COMM_CD, COMM_CD_NM) VALUES('CODE0100', '01', '010');
INSERT INTO TB_COM_CODE(COMM_TY_CD, COMM_CD, COMM_CD_NM) VALUES('CODE0100', '02', '011');
INSERT INTO TB_COM_CODE(COMM_TY_CD, COMM_CD, COMM_CD_NM) VALUES('CODE0100', '03', '016');
INSERT INTO TB_COM_CODE(COMM_TY_CD, COMM_CD, COMM_CD_NM) VALUES('CODE0100', '04', '019');

--분류코드
INSERT INTO TB_COM_CODE(COMM_TY_CD, COMM_CD, COMM_CD_NM) VALUES('CODE0101', 'B', '팔찌');
INSERT INTO TB_COM_CODE(COMM_TY_CD, COMM_CD, COMM_CD_NM) VALUES('CODE0101', 'N', '목걸이');
INSERT INTO TB_COM_CODE(COMM_TY_CD, COMM_CD, COMM_CD_NM) VALUES('CODE0101', 'R', '반지');
INSERT INTO TB_COM_CODE(COMM_TY_CD, COMM_CD, COMM_CD_NM) VALUES('CODE0101', 'E', '귀걸이');


--회원정보
DROP TABLE TB_COM_USER CASCADE CONSTRAINT;
CREATE TABLE TB_COM_USER(
  USER_CODE VARCHAR2(20),             -- 유저코드
  ID VARCHAR2(20),                  -- 아이디
  PW VARCHAR2(20),                   -- 패스워드
  EMAIL VARCHAR2(50),                      -- 이메일
  USER_IMAGE VARCHAR2(100),               -- 유저이미지
  NAME VARCHAR2(20),                       -- 이름
  BIRTH VARCHAR2(20),                      -- 생일
  POST_NUM VARCHAR2(20),                   -- 우편번호
  PHONE_CD VARCHAR2(2),                    -- 전화번호앞자리 코드
  PHONE_NUM VARCHAR2(20),                  -- 전화번호뒷자리
  ADDRESS VARCHAR2(100),                   -- 주소
  ENT_DATE VARCHAR2(30),                   -- 회원가입일
  GRADE VARCHAR2(1) DEFAULT 'M',			   -- 회원등급
  CONSTRAINT TB_COM_USER_PK PRIMARY KEY(USER_CODE)
);

INSERT INTO TB_COM_USER(USER_CODE, ID, PW, EMAIL, USER_IMAGE, NAME, BIRTH, POST_NUM, PHONE_CD, PHONE_NUM, ADDRESS, ENT_DATE, GRADE) VALUES (
          'USER0000' || USER_SEQ.NEXTVAL, 'admin', 'admin', 'admin@naver.com', 'admin.png', '관리자', '1980-02-12', '217-814',
          '01', '1234-5678', '서울시 송파구 방이동 현대아파트', '2020-08-21', 'A');

INSERT INTO TB_COM_USER(USER_CODE, ID, PW, EMAIL, USER_IMAGE, NAME, BIRTH, POST_NUM, PHONE_CD, PHONE_NUM, ADDRESS, ENT_DATE) VALUES (
          'USER0000' || USER_SEQ.NEXTVAL, 'ksy', 'ksy', 'ksy@naver.com', 'ksy.png', '기성용', '1989-01-12', '134-512',
          '01', '1326-2632', '서울시 중구 동대문4가 종로빌딩', '2020-09-30');

INSERT INTO TB_COM_USER(USER_CODE, ID, PW, EMAIL, USER_IMAGE, NAME, BIRTH, POST_NUM, PHONE_CD, PHONE_NUM, ADDRESS, ENT_DATE) VALUES (
          'USER0000' || USER_SEQ.NEXTVAL, 'shm', 'shm', 'shm@naver.com', 'shm.png', '손흥민', '1992-05-07', '613-844',
          '01', '5551-3774', '서울시 노원구 상계3동 한신아파트', '2020-08-02');

commit;

--댓글정보
DROP TABLE TB_REPLY CASCADE CONSTRAINT;
CREATE TABLE TB_REPLY(
  PRODUCT_CODE VARCHAR2(30),                  -- 투표코드
  USER_CODE VARCHAR2(20),                  -- 유저코드
  USER_REPLY_NO NUMBER(3),           -- 댓글일련번호
  USER_REPLY VARCHAR2(1000),         -- 댓글내용
  REPLY_DATE VARCHAR2(30),           -- 댓글날짜
  CONSTRAINT TB_REPLY_PK PRIMARY KEY(PRODUCT_CODE, USER_CODE, USER_REPLY_NO),
  CONSTRAINT TB_REPLY_FK_PRODUCT FOREIGN KEY(PRODUCT_CODE) REFERENCES TB_PRODUCT(PRODUCT_CODE),
  CONSTRAINT TB_REPLY_FK_USER FOREIGN KEY(USER_CODE) REFERENCES TB_COM_USER(USER_CODE)
);

--별점정보
DROP TABLE TB_MARK CASCADE CONSTRAINT;
CREATE TABLE TB_MARK(
  PRODUCT_CODE VARCHAR2(30),                  -- 투표코드
  USER_CODE VARCHAR2(20),                  -- 유저코드
  MARK_RATING NUMBER,        		 -- 별점(5점만점)
  CONSTRAINT TB_MARK_PK PRIMARY KEY(PRODUCT_CODE, USER_CODE),
  CONSTRAINT TB_MARK_FK_PRODUCT FOREIGN KEY(PRODUCT_CODE) REFERENCES TB_PRODUCT(PRODUCT_CODE),
  CONSTRAINT TB_MARK_FK_USER FOREIGN KEY(USER_CODE) REFERENCES TB_COM_USER(USER_CODE)
);



--제품정보
DROP TABLE TB_PRODUCT CASCADE CONSTRAINT;
CREATE TABLE TB_PRODUCT(
  PRODUCT_CODE VARCHAR2(20),                  -- 제품코드
  PRODUCT_IMAGE VARCHAR2(70),                 -- 제품이미지
  PRODUCT_NAME VARCHAR2(200),                  -- 제품명
  PRODUCT_UNIT_PRICE NUMBER,			  -- 제품단가
  PRODUCT_COUNT NUMBER,					  -- 제품재고수량
  PRODUCT_CATEGORY_CD VARCHAR2(20),              -- 제품코드
  PRODUCT_REG_DATE VARCHAR2(20),              -- 제품등록일
  CONSTRAINT TB_PRODUCT_PK PRIMARY KEY(PRODUCT_CODE)
);

Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('R001','ring01.jpg','실버 볼 하트 반지',39120,8,'R','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('R002','ring02.jpg','델마르 실버 반지',65700,10,'R','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('R003','ring03.jpg','탄생석 하트 체인반지',59900,29,'R','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('R004','ring04.jpg','press ring',52250,20,'R','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('R005','ring05.jpg','mushroom ring',139000,35,'R','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('R006','ring06.jpg','14K 테일링 볼륨 반지',382500,15,'R','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('R007','ring07.jpg','와이어 로프 꼬임 반지',108800,20,'R','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('R008','ring08.jpg','실버 볼드 멜팅 위아몬즈 반지',49420,20,'R','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('R009','ring09.jpg','prot ring',89000,50,'R','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('R0010','ring10.jpg','round ring',59000,20,'R','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('N0011','neck01.jpg','솔리테어 프롱 위아몬즈',107030,50,'N','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('N0012','neck02.jpg','애비로드 실버 목걸이',134300,10,'N','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('N0013','neck03.jpg','Vintage heart Necklace',81600,30,'N','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('N0014','neck04.jpg','토글 목걸이 콤비(silver 925)',13900,40,'N','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('N0015','neck05.jpg','마스터 플랫 키 실버 목걸이',125800,30,'N','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('N0016','neck06.jpg','14k 라운드 콤비 목걸이',229500,19,'N','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('N0017','neck07.jpg','노드 써틴 초커 목걸이 J No 13 콤비',149400,15,'N','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('N0018','neck08.jpg','레코드 투라인 라지 코인 목걸이',104000,10,'N','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('N0019','neck09.jpg','14K 페이보릿 캐스퍼 목걸이',298400,5,'N','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('N0020','neck10.jpg','통스 다이나믹 서스펜션 목걸이',110500,5,'N','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('E0021','ear01.jpg','m.m.e _a',62040,10,'E','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('E0022','ear02.jpg','Puff E',98000,5,'E','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('E0023','ear03.jpg','blueberries',58000,13,'E','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('E0024','ear04.jpg','mini loop pearl earring',25000,4,'E','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('E0025','ear05.jpg','14k 천연석 하프 이터니티 링 귀걸이',251100,10,'E','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('E0026','ear06.jpg','3chain drop earring',33250,5,'E','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('E0027','ear07.jpg','droplet combi 2way earrings',98000,9,'E','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('E0028','ear08.jpg','애비로드 로잉 후프 언발 실버 귀걸이 - 콤비',130500,15,'E','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('B0029','bracelet01.jpg','Lucky days Bracelet',40500,20,'B','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('B0030','bracelet02.jpg','Slim ballchain Bracelet',76260,50,'B','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('B0031','bracelet03.jpg','라이크어플라워 미니 챠밍 실버 체인 팔찌',73500,4,'B','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('B0032','bracelet04.jpg','가든블랙 카렌실버',48000,70,'B','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('B0033','bracelet05.jpg','grapevine karen',48000,5,'B','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('B0034','bracelet06.jpg','Heart Pearl Bracelet - Dot Chain',73000,60,'B','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('B0035','bracelet07.jpg','Slim ballchain Bracelet (믹스체인/골드)',76260,81,'B','2023-01-19 10:23');
Insert into MINI_ADMIN.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('B0036','bracelet08.jpg','모먼트 T바 스네이크 체인 실버 팔찌',92900,20,'B','2023-01-19 10:23');


--판매내역정보
DROP TABLE TB_SELL CASCADE CONSTRAINT;
CREATE TABLE TB_SELL(
  SELL_CODE VARCHAR2(20),          -- 판매내역코드
  PRODUCT_CODE VARCHAR2(20),       -- 제품코드
  USER_CODE VARCHAR2(20),          -- 유저코드
  SELL_PRICE NUMBER,         -- 판매총가격
  SELL_COUNT NUMBER,         -- 판매총수량
  SELL_YN VARCHAR2(1) DEFAULT 'N',  -- 판매여부
  SELL_DATE VARCHAR2(30),          -- 판매일
  CONSTRAINT TB_SELL_PK PRIMARY KEY(SELL_CODE),
  CONSTRAINT TB_SELL_FK_PRODUCT FOREIGN KEY(PRODUCT_CODE) REFERENCES TB_PRODUCT(PRODUCT_CODE),
  CONSTRAINT TB_SELL_FK_USER FOREIGN KEY(USER_CODE) REFERENCES TB_COM_USER(USER_CODE)
);

--장바구니정보
DROP TABLE TB_CART CASCADE CONSTRAINT;
CREATE TABLE TB_CART(
  CART_CODE VARCHAR2(20),          -- 장바구니코드
  PRODUCT_CODE VARCHAR2(20),       -- 제품코드
  USER_CODE VARCHAR2(20),          -- 유저코드
  CART_PRICE NUMBER,         -- 해당제품총가격
  CART_COUNT NUMBER,         -- 해당제품총수량
  CART_DATE VARCHAR2(30),          -- 장바구니 저장일
  CONSTRAINT TB_CART_PK PRIMARY KEY(CART_CODE),
  CONSTRAINT TB_CART_FK_PRODUCT FOREIGN KEY(PRODUCT_CODE) REFERENCES TB_PRODUCT(PRODUCT_CODE),
  CONSTRAINT TB_CART_FK_USER FOREIGN KEY(USER_CODE) REFERENCES TB_COM_USER(USER_CODE)
);


-- 카드결제 정보
drop table pay_import cascade constraint;
create table pay_import(
	pay_id varchar2(50) not null primary key,
	import_id varchar2(50),
	pay_amount int,
	per_num varchar2(50),
	per_time date
);

-- 공지사항 정보
drop table tb_jw_notice;

create table tb_jw_notice(
bno number,
title varchar2(255) not null,
content varchar2(2000) not null,
writer varchar2(50) not null,
regdate date default sysdate);

alter table tb_jw_notice add constraint pk_notice primary key (bno);

drop sequence seq_notice;

create sequence seq_notice
increment by 1
start with 0
maxvalue 9999999
minvalue 0;

-- 커뮤니티 게시판 정보
drop sequence seq_comm;

create sequence seq_comm
increment by 1
start with 0
maxvalue 9999999
minvalue 0;

drop table tb_jw_comm;

create table tb_jw_comm (
bno number(10, 0),
title varchar2(200) not null,
content varchar2(2000) not null,
writer varchar2(50) not null,
regdate date default sysdate
);

alter table tb_jw_comm add constraint pk_comm primary key (bno);

-- 상담 신청 게시판 정보

drop sequence seq_consulting;

create sequence seq_consulting
increment by 1
start with 0
maxvalue 9999999
minvalue 0;

drop table tb_jw_consulting;

create table tb_jw_consulting (
bno number(10, 0),
title varchar2(200) not null,
content varchar2(2000) not null,
writer varchar2(50) not null,
counselor varchar2(50) not null,
regdate date default sysdate
);

alter table tb_jw_consulting add constraint pk_consulting primary key (bno);

COMMIT;

-- 자유게시판 정보
-- drop sequence seq_jw_general;

-- create sequence seq_jw_general
-- increment by 1
-- start with 0
-- maxvalue 9999999
-- minvalue 0;

-- drop table tb_jw_general;

-- create table tb_jw_general (
-- bno number(10, 0),
-- title varchar2(200) not null,
-- content varchar2(2000) not null,
-- writer varchar2(50) not null,
-- regdate date default sysdate
-- );

-- alter table tb_jw_general add constraint pk_general primary key (bno);

-- commit;
