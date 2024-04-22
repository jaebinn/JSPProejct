create database project;
use project;
drop database project;
/*유저테이블*/ 
create table user (
  user_id varchar(300) primary key,
  pw varchar(300) not null,
  name varchar(300) not null,
  tel_mobile varchar(100) not null, /*ex)00011111111 숫자11개*/
  tel_sub varchar(100), /*ex)00011111111 숫자11개*/
  email varchar(300), /*그냥문자열로*/
  gender varchar(3) not null, /* ex)M-K 남자내국인 ex)W-F 여자외국인 */
  age int not null,
  zipcode varchar(300) not null,
  addr varchar(1000) not null,
  addr_detail varchar(1000) not null,
  addr_etc varchar(300),
  user_etc varchar(300) /* ex)아픔\바보임 */
);
select * from user;
/* 전문가테이블 */ 
create table expert (
  expert_idx bigint primary key auto_increment,
  user_id varchar(300),
  resume text,
  is_drivable boolean not null default false,
  location varchar(1000),  
  keyword_list text, /*ex) 병원동행,가사도우미*/
  available_time varchar(30), /*ex)06 ~ 12*/
  cost int not null,
  account varchar(100) not null,
  totalCnt bigint default 0,
  constraint fk_expert_userid foreign key (user_id) references user(user_id)
);
drop table expert;
delete from expert;
select * from expert;
/* 전문가 자격증 경력 테이블 */
create table expert_career_list (
  expert_idx bigint not null,
  career_name varchar(500) not null, 
  start_time date not null,
  end_time date not null,
  constraint fk_expert_career_list_expert_idx foreign key (expert_idx) references expert (expert_idx)
);

/* 전문가 별점 테이블 */
create table rating(
	star_idx bigint AUTO_INCREMENT PRIMARY KEY,
    user_id varchar(300) not null,
    expert_idx bigint,
    star_score double,
    CONSTRAINT fk_star_user_id FOREIGN KEY (user_id) REFERENCES user (user_id),
    CONSTRAINT fk_star_expert_idx FOREIGN KEY (expert_idx) REFERENCES expert (expert_idx)
);
drop table rating;
SELECT SUM(star)
	    FROM review
	    WHERE expert_idx = 4;
/* 전문가 좋아요 테이블*/  
CREATE TABLE like_cnt (
    likeCnt_idx bigint AUTO_INCREMENT PRIMARY KEY,
    user_id varchar(300) NOT NULL,
    expert_idx bigint,
    isLike varchar(3) default 'X',
    CONSTRAINT fk_user_user_id FOREIGN KEY (user_id) REFERENCES user (user_id),
    CONSTRAINT fk_expert_expert_idx FOREIGN KEY (expert_idx) REFERENCES expert (expert_idx)
);
/* 전문가 자격증 테이블 */
create table expert_license_list (
  expert_idx bigint not null,
  license_name varchar(500) not null,
  acquire_date date not null,
  constraint fk_expert_license_list_expert_idx foreign key (expert_idx) references expert (expert_idx)
);

/*전문가테이블 - 파일*/
create table expert_file_indexes (
  system_name varchar(100) primary key,
  original_name varchar(100),
  expert_idx bigint not null,
  constraint fk_expert_file_indexes_expert_idx foreign key (expert_idx) references expert (expert_idx)
);
SELECT chat_detail.*, expert_file_indexes.original_name
	  FROM chat_detail
	  JOIN chat ON chat.chat_idx = chat_detail.chat_idx
	  JOIN expert_file_indexes ON expert_file_indexes.expert_idx = chat.expert_idx
	  WHERE chat_detail.chat_idx = 1;

/* 매칭테이블 */
create table payment(
  payment_idx bigint primary key auto_increment,
  user_id varchar(300),
  expert_idx bigint,
  service_day varchar(30), /*ex)YYYY-MM-DD*/
  start_date varchar(300), /*ex)06*/
  end_date varchar(300),	/*ex)12*/
  keyword varchar(300), 
  req varchar(300), /*요청사항*/
  pay int, /*최종금액 end_date - start-date 뺴서 나온 금액*/
  constraint fk_payment_user_id foreign key (user_id) references user (user_id),
  constraint fk_payment_expert_idx foreign key (expert_idx) references expert (expert_idx)
);

/* 리뷰테이블 */
create table review (
  user_id varchar(300),
  expert_idx bigint not null,
  expert_name varchar(300) not null,
  review_idx bigint primary key auto_increment,
  title varchar(500) not null,
  detail text not null,
  star int not null default 0,
  regdate datetime not null default current_timestamp
);

drop table review;
/* 유저가 사용하는 도움 게시판 */
create table u_board (
  board_idx bigint primary key auto_increment,
  title varchar(500) not null,
  contents text not null,
  regdate datetime not null default current_timestamp,
  updatedate datetime not null default current_timestamp,
  readcount int default 0,
  user_id varchar(300),
  constraint fk_u_board_user_id foreign key (user_id) references user (user_id)
);

/* 유저가 사용하는 도움 게시판 -> 댓글테이블 */
create table u_reply (
  u_reply_idx bigint primary key auto_increment,
  board_idx bigint,
  user_id varchar(300),
  contents varchar(1000),
  updatechk char(1) default 'x',
  regdate datetime default current_timestamp,
  constraint fk_u_reply_board_idx foreign key (board_idx) references u_board (board_idx),
  constraint fk_u_reply_user_id foreign key (user_id) references user (user_id)
);

/*유저가 사용하는 도움 게시판 - 파일*/
create table u_file_indexes (
  system_name varchar(100) primary key,
  original_name varchar(100),
  board_idx bigint not null,
  constraint fk_u_file_indexes_board_idx foreign key (board_idx) references u_board (board_idx)
);

/* faq 테이블 */
create table faq_board (
  board_idx bigint primary key auto_increment,
  title varchar(500) not null,
  contents text not null
);

/* 1:1 채팅내역 테이블*/ 
create table chat (
  chat_idx bigint primary key auto_increment,
  user_id varchar(300),
  expert_idx bigint not null,
  constraint fk_chat_userid foreign key (user_id) references user (user_id),
  constraint fk_chat_expert_idx foreign key (expert_idx) references expert (expert_idx)
);
select * from chat;
insert into chat value(1, "apple", 2);
/* 1:1 채팅 세부내용 테이블 */
create table chat_detail (
  chat_idx bigint not null,
  chat_detail_num bigint primary key auto_increment,
  type varchar(3), /*u면 user가 보낸거 e면 expert가 보낸거 er이면 전문가가 예약페이지 링크 보낸거*/
  contents varchar(1000) not null,
  is_read varchar(3) default 'x', /*x 면 안읽은거 o면 읽은거*/
  regdate datetime default current_timestamp,
  constraint fk_chat_detail_chat_idx foreign key (chat_idx) references chat (chat_idx)
);
