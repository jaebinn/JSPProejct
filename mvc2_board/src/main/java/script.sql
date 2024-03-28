use gb;
create table t_user(
	userid varchar(300) primary key,
    userpw varchar(300) not null,
    username varchar(300) not null,
    usergender varchar(300),
    zipcode varchar(300) not null,
    addr varchar(1000),
    addrdetail varchar(1000) not null,
    addretc varchar(300),
    userhobby varchar(2000)
);
select * from t_user;

create table t_board(
	boardnum bigint primary key auto_increment,
    boardtitle varchar(300) not null,
    boardcontents text not null,
    regdate datetime default now(),
    updatedate datetime default now(),
    readcount int default 0,
    userid varchar(300)
);

insert into t_board (boardtitle, boardcontents, userid) values('샘플 데이터 1','샘플 데이터 게시글 내용입니다','apple');
insert into t_board (boardtitle, boardcontents, userid) values('샘플 데이터 2','샘플 데이터 게시글 내용입니다','banana');
insert into t_board (boardtitle, boardcontents, userid) values('샘플 데이터 3','샘플 데이터 게시글 내용입니다','cherry');

select * from t_board order by boardnum desc limit 1;
select boardtitle,boardcontents,userid from t_board;
insert into t_board (boardtitle,boardcontents,userid) (select boardtitle,boardcontents,userid from t_board);

create table t_file(
	systemname varchar(2000),
    orgname varchar(2000),
    boardnum bigint
);
select * from t_file;





