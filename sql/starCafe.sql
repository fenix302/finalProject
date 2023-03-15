-- star_cafe 계정 생성 및 권한 부여

CREATE USER star_cafe IDENTIFIED BY star_cafe;
GRANT CONNECT, RESOURCE TO star_cafe;
GRANT ALTER SESSION TO star_cafe;

show user

conn star_cafe/star_cafe

show user

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
INSERT INTO TB_COM_CODE(COMM_TY_CD, COMM_CD, COMM_CD_NM) VALUES('CODE0101', 'C', '원액');
INSERT INTO TB_COM_CODE(COMM_TY_CD, COMM_CD, COMM_CD_NM) VALUES('CODE0101', 'G', '굿즈');
INSERT INTO TB_COM_CODE(COMM_TY_CD, COMM_CD, COMM_CD_NM) VALUES('CODE0101', 'P', '선물용');
INSERT INTO TB_COM_CODE(COMM_TY_CD, COMM_CD, COMM_CD_NM) VALUES('CODE0101', 'R', '정기구매');


--회원정보
DROP TABLE TB_COM_USER CASCADE CONSTRAINT;
CREATE TABLE TB_COM_USER(
  USER_CODE VARCHAR2(20),             -- 유저코드
  ID VARCHAR2(255),                  -- 아이디
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
          USER_SEQ.NEXTVAL, 'admin', 'admin', 'admin@naver.com', 'admin.png', '관리자', '1980-02-12', '217-814',
          '01', '1234-5678', '서울시 송파구 방이동 현대아파트', '2020-08-21', 'A');

INSERT INTO TB_COM_USER(USER_CODE, ID, PW, EMAIL, USER_IMAGE, NAME, BIRTH, POST_NUM, PHONE_CD, PHONE_NUM, ADDRESS, ENT_DATE) VALUES (
          USER_SEQ.NEXTVAL, 'ksy', 'ksy', 'ksy@naver.com', 'ksy.png', '기성용', '1989-01-12', '134-512',
          '01', '1326-2632', '서울시 중구 동대문4가 종로빌딩', '2020-09-30');

INSERT INTO TB_COM_USER(USER_CODE, ID, PW, EMAIL, USER_IMAGE, NAME, BIRTH, POST_NUM, PHONE_CD, PHONE_NUM, ADDRESS, ENT_DATE) VALUES (
          USER_SEQ.NEXTVAL, 'shm', 'shm', 'shm@naver.com', 'shm.png', '손흥민', '1992-05-07', '613-844',
          '01', '5551-3774', '서울시 노원구 상계3동 한신아파트', '2020-08-02');

commit;


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

Insert into STAR_CAFE.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('C001','latte01.jpg','피치 앤 블랙티',25000,100,'C','2023-01-19 10:23');
Insert into STAR_CAFE.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('C002','latte02.jpg','100% 제주산 말차',25000,100,'C','2023-01-19 10:23');
Insert into STAR_CAFE.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('C003','latte03.jpg','악마 초코',25000,100,'C','2023-01-19 10:23');
Insert into STAR_CAFE.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('C004','latte04.jpg','콜드브루',25000,100,'C','2023-01-19 10:23');
Insert into STAR_CAFE.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('C005','latte05.jpg','페퍼민트 아이스티',25000,100,'C','2023-01-19 10:23');
Insert into STAR_CAFE.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('C006','latte06.jpg','레몬 아이스티',25000,100,'C','2023-01-19 10:23');
Insert into STAR_CAFE.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('C007','latte07.jpg','리얼딸기',25000,100,'C','2023-01-19 10:23');
Insert into STAR_CAFE.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('C008','latte08.jpg','자몽샤워',25000,100,'C','2023-01-19 10:23');
Insert into STAR_CAFE.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('C009','latte09.jpg','밀크티',25000,100,'C','2023-01-19 10:23');
Insert into STAR_CAFE.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('G0010','goods01.jpg','스타트 씨드키트',5900,50,'G','2023-01-19 10:23');
Insert into STAR_CAFE.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('G0011','goods02.jpg','매트 블랙 텀블러',9500,50,'G','2023-01-19 10:23');
Insert into STAR_CAFE.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('G0012','goods03.jpg','Carry 와인잔',7000,30,'G','2023-01-19 10:23');
Insert into STAR_CAFE.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('G0013','goods04.jpg','레더스킨 다이어리',11000,40,'G','2023-01-19 10:23');
Insert into STAR_CAFE.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('G0014','goods05.jpg','슈가케인 텀블러',8000,30,'G','2023-01-19 10:23');
Insert into STAR_CAFE.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('G0015','goods06.jpg','메세지 캐리어 파우치',14000,19,'G','2023-01-19 10:23');
Insert into STAR_CAFE.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('G0016','goods07.jpg','고체 치약',12000,55,'G','2023-01-19 10:23');
Insert into STAR_CAFE.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('P0017','present01.jpg','천성 선물세트 5종',35000,100,'P','2023-01-19 10:23');
Insert into STAR_CAFE.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('P0018','present02.jpg','천성 소매넣기세트',21000,50,'P','2023-01-19 10:23');
Insert into STAR_CAFE.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('P0019','present03.jpg','드립백 세트',18000,53,'P','2023-01-19 10:23');
Insert into STAR_CAFE.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('R0029','reg01.jpg','정기구매1',40000,20,'R','2023-01-19 10:23');
Insert into STAR_CAFE.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('R0030','reg02.jpg','정기구매2',70000,50,'R','2023-01-19 10:23');
Insert into STAR_CAFE.TB_PRODUCT (PRODUCT_CODE,PRODUCT_IMAGE,PRODUCT_NAME,PRODUCT_UNIT_PRICE,PRODUCT_COUNT,PRODUCT_CATEGORY_CD,PRODUCT_REG_DATE) values ('R0031','reg03.jpg','정기구매3',100000,4,'R','2023-01-19 10:23');



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

--상품 후기댓글정보
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
drop table tb_notice;

create table tb_notice(
bno number,
title varchar2(255) not null,
content varchar2(2000) not null,
writer varchar2(50) not null,
regdate date default sysdate);

alter table tb_notice add constraint pk_notice primary key (bno);

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

drop table tb_comm;

create table tb_comm (
bno number(10, 0),
title varchar2(200) not null,
content varchar2(2000) not null,
writer varchar2(50) not null,
regdate date default sysdate
);

alter table tb_comm add constraint pk_comm primary key (bno);

-- 상담 신청 게시판 정보

drop sequence seq_consulting;

create sequence seq_consulting
increment by 1
start with 0
maxvalue 9999999
minvalue 0;

drop table tb_consulting;

create table tb_consulting (
bno number(10, 0),
title varchar2(200) not null,
content varchar2(2000) not null,
writer varchar2(50) not null,
counselor varchar2(50) not null,
regdate date default sysdate
);

alter table tb_consulting add constraint pk_consulting primary key (bno);

-- 자유게시판 정보
drop sequence seq_general;

create sequence seq_general
increment by 1
start with 0
maxvalue 9999999
minvalue 0;

drop table tb_general;

create table tb_general (
bno number(10, 0),
title varchar2(200) not null,
content varchar2(2000) not null,
writer varchar2(50) not null,
regdate date default sysdate
);

alter table tb_general add constraint pk_general primary key (bno);

-- 자유 게시판 댓글 테이블 생성
drop table free_reply;
create table free_reply (
  rno number(10,0), 
  bno number(10,0) not null,
  user_code varchar2(20),
  reply varchar2(1000) not null,
  replyDate date default sysdate 
);

alter table free_reply add constraint pk_free_reply primary key (rno);

alter table free_reply  add constraint fk_tb_jw_free  
foreign key (bno)  references  tb_jw_free (bno);
alter table free_reply add constraint fk_tb_jw_free2
foreign key (user_code) references tb_com_user(user_code); 

-- 자유게시판 댓글 sql
-- 시작값을 1로하고 1씩 증가하는 general_reply_seq 자유게시판 시퀀스를 생성함.
drop sequence free_reply_seq;
create sequence free_reply_seq 
start with 1
increment by 1;

  -- 커뮤니티 게시판 테이블 생성
drop table comm_reply;
create table comm_reply (
  rno number(10,0), 
  bno number(10,0) not null,
  user_code varchar2(20),
  reply varchar2(1000) not null,
  replyDate date default sysdate 
);

alter table comm_reply add constraint pk_comm_reply primary key (rno);

alter table comm_reply  add constraint fk_tb_comm1  
foreign key (bno)  references  tb_comm (bno);
alter table comm_reply add constraint fk_tb_comm2
foreign key (user_code) references tb_com_user(user_code); 

-- 상담신청게시판 댓글 sql
-- 시작값을 1로하고 1씩 증가하는 consult_reply_seq 상담신청게시판 시퀀스를 생성함.
create sequence consult_reply_seq 
start with 1
increment by 1;

-- 상담신청 게시판 테이블 생성
create table consult_reply (
  rno number(10,0), 
  bno number(10,0) not null,
  reply varchar2(1000) not null,
  replyer varchar2(50) not null, 
  replyDate date default sysdate 
);

alter table consult_reply add constraint pk_consult_reply primary key (rno);

alter table consult_reply add constraint fk_tb_consulting
foreign key (bno)  references  tb_consulting (bno); 

-- 문의게시판 테이블 정보
create table tb_inquiry (
bno number(10, 0),
title varchar2(200) not null,
content varchar2(2000) not null,
writer varchar2(50) not null,
regdate date default sysdate
);

alter table tb_inquiry add constraint pk_inquiry primary key (bno);

create sequence seq_inquiry
increment by 1
start with 0
maxvalue 9999999
minvalue 0;


commit;
