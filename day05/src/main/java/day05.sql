use gb;

create table board(
	boardnum int primary key auto_increment,
	boardtitle varchar(300),
	boardcontents varchar(3000),
    regdate datetime default now(),
    userid varchar(300)
);

select * from board;