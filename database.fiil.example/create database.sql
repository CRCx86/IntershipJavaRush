-- CREATE database test;
USE test;

DROP table if exists book_table;
create table book_table(
	book_id int(11) not null auto_increment,
    book_title varchar(100),
    book_description varchar(100),
    book_author varchar(100),
    book_isbn varchar(100),
    book_printYear int(11),
    book_readAlready BOOL,
    primary key (book_id))
engine = InnoDB
default char set = utf8;

insert into book_table (book_id, book_title, book_description,
book_author, book_isbn, book_printYear, book_readAlready) values (1, "a1", "b1", "c1", "d1", 2, false),
(2, "a2", "b2", "c2", "d2", 2, false),
(3, "a3", "b3", "c3", "d3", 2, false),
(4, "a4", "b4", "c4", "d4", 2, false),
(5, "a5", "b5", "c5", "d5", 2, false),
(6, "a6", "b6", "c6", "d6", 2, false),
(7, "a7", "b7", "c7", "d7", 2, false),
(8, "a8", "b8", "c8", "d8", 2, false),
(9, "a9", "b9", "c9", "d9", 2, false),
(10, "a10", "b10", "c10", "d10", 2, false),
(11, "a11", "b11", "c11", "d11", 2, false),
(12, "a12", "b12", "c12", "d12", 2, false),
(13, "a13", "b13", "c13", "d13", 2, false),
(14, "a14", "b14", "c14", "d14", 2, false),
(15, "a15", "b15", "c15", "d15", 2, false);
(16, "a16", "b16", "c16", "d16", 2, false);
(17, "a17", "b17", "c17", "d17", 2, false);
(18, "a18", "b18", "c18", "d18", 2, false);
(19, "a19", "b19", "c19", "d19", 2, false);
(20, "a20", "b20", "c20", "d20", 2, false);
(21, "a21", "b21", "c21", "d21", 2, false);
(22, "a22", "b22", "c22", "d22", 2, false);
(23, "a23", "b23", "c23", "d23", 2, false);
(24, "a24", "b24", "c24", "d24", 2, false);
(25, "a25", "b25", "c25", "d25", 2, false);