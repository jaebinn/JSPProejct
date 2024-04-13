create database project;
use project;

drop database project;

/*유저테이블*/ 
create table user (
  user_id varchar(300) primary key,
  pw varchar(300) not null,
  name varchar(300) not null,
  tel_mobile varchar(100) not null,
  tel_sub varchar(100),
  email varchar(300),
  gender char(1) not null check (gender in ('M', 'W')),
  age int not null,
  zipcode varchar(300) not null,
  addr varchar(1000) not null,
  addr_detail varchar(1000) not null,
  addr_etc varchar(300)
);
select * from user;
insert into user values("apple", "1234","김사과", "010-1111-1111", "010-1111-1112","apple@naver.com","M", 20,"06234","서울 강남구","역삼동 테헤란로 남도빌딩","101동");
insert into user values("banana", "1234","반하나", "010-2222-2222", "010-2222-2223","banana@naver.com","W", 21,"06234","서울 강남구","역삼동 테헤란로 남도빌딩","101동");
insert into user values("cherry", "1234","이체리", "010-3333-3333", "010-3333-3334","cherry@naver.com","W", 25,"06234","서울 강남구","역삼동 테헤란로 남도빌딩","101동");
insert into user values("durian", "1234","차두리", "010-4444-4444","010-4444-4445", "durian@naver.com","M",30, "06234","서울 강남구","역삼동 테헤란로 남도빌딩","101동");
insert into user values("melon", "1234","김멜론", "010-5555-5555","010-5555-5556", "melon@naver.com","M",35, "06234","서울 강남구","역삼동 테헤란로 남도빌딩","101동");
insert into user values("berry", "1234","최베리", "010-6666-6666","010-6666-6667", "berry@naver.com","W",35, "06234","서울 강남구","역삼동 테헤란로 남도빌딩","101동");

/* 전문가테이블 */ 
create table expert (
  expert_idx bigint primary key auto_increment,
  user_id varchar(300),
  resume text,
  is_drivable boolean not null default false,
  location varchar(1000),
  keyword_list text,
  available_time text,
  cost int not null,
  account varchar(100) not null,
  like_cnt int default 0,
  constraint foreign key (user_id) references user(user_id)
);
SELECT expert.*, user.name, user.age
      FROM expert
      JOIN user ON expert.user_id = user.user_id
      order by expert_idx desc limit 1,4;
insert into expert(expert_idx,user_id,resume,is_drivable,location,keyword_list,available_time,cost, account) values(1,"apple","안녕하세요 최선을 다하겠습니다.",true,"경기도 용인시","가사도우미, 병원동행","10시부터18시", 13000,"3333-11113535");
insert into expert(expert_idx,user_id,resume,is_drivable,location,keyword_list,available_time,cost, account) values(2,"banana","안녕하세요 최선을 다하겠습니다.",true,"경기도 이천시","가사도우미, 병원동행","11시부터18시", 18000,"3333-11113535");
insert into expert(expert_idx,user_id,resume,is_drivable,location,keyword_list,available_time,cost, account) values(3,"cherry","안녕하세요 최선을 다하겠습니다.",true,"서울시 강남구","가사도우미, 병원동행","12시부터18시", 15000,"3333-11113535");
insert into expert(expert_idx,user_id,resume,is_drivable,location,keyword_list,available_time,cost, account) values(4,"durian","안녕하세요 최선을 다하겠습니다.",true,"대전광역시","가사도우미, 병원동행","13시부터18시", 10000,"3333-11113535");
insert into expert(expert_idx,user_id,resume,is_drivable,location,keyword_list,available_time,cost, account) values(5,"melon","안녕하세요 최선을 다하겠습니다.",true,"인천광역시","가사도우미, 병원동행","14시부터18시", 11000,"3333-11113535");
insert into expert(expert_idx,user_id,resume,is_drivable,location,keyword_list,available_time,cost, account) values(6,"berry","안녕하세요 저의 가족처럼 보살피도록 하겠습니다.",true,"부산광역시","가사도우미, 병원동행","08시부터20시", 11000,"3333-11113535");

select * from expert;
update expert
		set like_cnt = like_cnt + 1
		where expert_idx = 1;
/* 전문가 자격증 경력 테이블 */
create table expert_career_list (
  expert_idx bigint not null,
  career_name varchar(500) not null,
  start_time date not null,
  end_time date not null,
  constraint fk_expert_career_list_expert_idx foreign key (expert_idx) references expert (expert_idx)
);

SELECT expert.*, user.name, user.age, expert_career_list.career_name
	      FROM expert
	      JOIN user ON expert.user_id = user.user_id JOIN expert_career_list ON expert.expert_idx = expert_career_list.expert_idx
	      order by expert_idx desc limit 1,4;
insert into expert_career_list values(1,"10년이상",'2024-04-06','2024-04-06');
insert into expert_career_list values(2,"5년이상",'2024-04-06','2024-12-31');
insert into expert_career_list values(3,"3년이상",'2024-04-06','2024-10-31');
insert into expert_career_list values(4,"1년이상",'2024-04-06','2024-08-31');
insert into expert_career_list values(5,"없음",'2024-04-06','2024-10-01');
insert into expert_career_list values(6,"7년이상",'2024-04-06','2025-10-01');
SELECT expert.*, user.name, user.age, expert_career_list.career_name
        FROM expert
        JOIN user ON expert.user_id = user.user_id
        JOIN expert_career_list ON expert.expert_idx = expert_career_list.expert_idx
        ORDER BY cost ASC
        LIMIT 1, 4;

select expert.*, user.name, user.age, expert_career_list.career_name
		from expert
		join user on expert.user_id = user.user_id join expert_career_list on expert.expert_idx = expert_career_list.expert_idx
		where expert.expert_idx = 1;
select * from expert_career_list;
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
  is_license_identification boolean not null,
  expert_idx bigint not null,
  constraint fk_expert_file_indexes_expert_idx foreign key (expert_idx) references expert (expert_idx)
);

/* 매칭테이블 */
create table matching (
  matching_idx bigint primary key auto_increment,
  user_id varchar(300),
  expert_idx bigint,
  start_date datetime not null default current_timestamp,
  end_date datetime not null,
  constraint fk_matching_user_id foreign key (user_id) references user (user_id),
  constraint fk_matching_expert_idx foreign key (expert_idx) references expert (expert_idx)
);

/* 결제내역테이블 */
create table payment (
  payment_idx bigint primary key auto_increment,
  matching_idx bigint,
  deposit int not null default 0 comment '예약금',
  overpay int not null default 0 comment '후불금',
  charge int not null default 0 comment '수수료',
  constraint fk_payment_matching_idx foreign key (matching_idx) references matching (matching_idx)
);

/* 리뷰테이블 */
create table review (
  review_idx bigint primary key auto_increment,
  matching_idx bigint,
  title varchar(500) not null,
  detail text not null,
  star int not null default 5,
  regdate datetime not null default current_timestamp,
  constraint fk_review_matching_idx foreign key (matching_idx) references matching (matching_idx)
);

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
insert into u_board values(1,'1번 테스트 글','1번 테스트 글 내용',now(),now(),'0','1');
insert into u_board values(2,'2번 테스트 글','2번 테스트 글 내용',now(),default,'0','2');
insert into u_board values(3,'3번 테스트 글','3번 테스트 글 내용',now(),default,'0','3');

insert into u_board (title,contents,user_id) (select title,contents,user_id from u_board);
select * from u_board order by board_idx desc;
delete from u_board where board_idx = '887';
drop table u_board;

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
select * from u_reply;
drop table u_reply;

/*유저가 사용하는 도움 게시판 - 파일*/
create table u_file_indexes (
  system_name varchar(100) primary key,
  original_name varchar(100),
  board_idx bigint not null,
  constraint fk_u_file_indexes_board_idx foreign key (board_idx) references u_board (board_idx)
);
select * from u_file_indexes;
drop table u_file_indexes;

/* faq 테이블 */
create table faq_board (
  board_idx bigint primary key auto_increment,
  title varchar(500) not null,
  contents text not null
);
insert into faq_board(title,contents) values('재빈님 얼마나 진행하셨나요?','db쪽만하면 끝날듯? 프론트는 저한테는 너무 쉬워서 하고 놀고있어요 후후후 힘의 차이가 느껴지십니까?');
insert into faq_board(title,contents) values('은정님 얼마나 진행하셨나요?','가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하');
insert into faq_board (title,contents) (select title,contents from faq_board);
select * from faq_board;
drop table faq_board;

/* 1:1 채팅내역 테이블*/ 
create table chat (
  chat_idx bigint primary key auto_increment,
  userid varchar(300),
  expert_idx bigint not null,
  constraint fk_chat_userid foreign key (userid) references user (user_id),
  constraint fk_chat_expert_idx foreign key (expert_idx) references expert (expert_idx)
);

/* 1:1 채팅 세부내용 테이블 */
create table chat_detail (
  chat_idx bigint not null,
  type boolean not null default false,
  contents varchar(1000) not null,
  regdate datetime default current_timestamp,
  constraint fk_chat_detail_chat_idx foreign key (chat_idx) references chat (chat_idx)
);