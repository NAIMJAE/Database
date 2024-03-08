#날짜 : 2024/01/03
#이름 : 박임재
#내용 : 3장 제약조건

#실습 3-1 / Primary Key

CREATE TABLE `User2` (
	`uid`   varchar(10) primary key,
	`name`  varchar(10),
	`birth` char(10),
	`addr`  varchar(50)
);
drop table `User2`;

#실습 3-2

insert into `User2` values ('A101', '김유신', '1968-05-09', '경남 김해시');
insert into `User2` values ('A102', '김춘추', '1972-11-23', '경남 경주시');
insert into `User2` values ('A103', '장보고', '1978-03-01', '전남 완도군');
insert into `User2` values ('A105', '강감찬', '1979-08-16', '서울시 관악구');
insert into `User2` values ('A106', '이순신', '1981-05-23', '부산시 진구');

#실습 3-3 / Unique

CREATE TABLE `User3` (
	`uid`   VARCHAR(10) primary key,
	`name`  VARCHAR(10),
	`birth` CHAR(10),
	`hp`    CHAR(13) unique,
	`addr`  VARCHAR(50)
);
Drop table `User3`;
#실습 3-4

insert into `User3` values ('A101', '김유신', '1968-05-09', '010-1234-1111', '경남 김해시');
insert into `User3` values ('A102', '김춘추', '1972-11-23', '010-1234-2222', '경남 경주시');
insert into `User3` values ('A103', '장보고', '1978-03-01', '010-1234-3333', '전남 완도군');
insert into `User3` values ('A104', '강감찬', '1979-08-16', '010-1234-4444', '서울시 관악구');
insert into `User3` values ('A105', '이순신', '1981-05-23', '010-1234-5555', '부산시 진구');
insert into `User3` values ('A106', '안중근', '1981-05-23', NULL , '부산시 진구');

#실습 3-5

CREATE TABLE `Parent` (
	`pid`   VARCHAR(10) primary Key,
	`name`  VARCHAR(10),
	`birth` CHAR(13),
	`addr`  VARCHAR(100)
);
CREATE TABLE `Child` (
	`cid`   VARCHAR(10) primary key,
	`name`  VARCHAR(10),
	`hp`    CHAR(13) Unique,
	`parent`VARCHAR(10),
    Foreign key (`Parent`) references `Parent` (`pid`)
);
Drop table `Parent`;
Drop table `Child`;

#실습 3-6

insert into `Parent` values ('P101', '김유신', '1968-05-09', '경남 김해시');
insert into `Parent` values ('P102', '김춘추', '1972-11-23', '경남 경주시');
insert into `Parent` values ('P103', '장보고', '1978-03-01', '전남 완도시');
insert into `Parent` values ('P104', '강감찬', '1979-08-16', '서울시 관악구');
insert into `Parent` values ('P105', '이순신', '1981-05-23', '부산시 진구');

insert into `Child` values ('c101', '김철수', '010-1234-1001', 'P101');
insert into `Child` values ('c102', '김영희', '010-1234-1002', 'P101');
insert into `Child` values ('c103', '강철수', '010-1234-1003', 'P103');
insert into `Child` values ('c104', '이철수', '010-1234-1004', 'P107');

#실습 3-7 primary key / not null

CREATE TABLE `User4` (
	`uid`     VARCHAR(10) primary key,
	`name`    VARCHAR(10) NOT NULL,
	`gender`  CHAR(1),
	`age`     int default 1,
	`hp`      char(13) unique,
	`addr`    VARCHAR(10)
);
drop table `User4`;

#실습 3-8

insert into `User4` values ('A101', '김유신', 'M', 25 , '010-1234-1111', '경남 김해시');
insert into `User4` values ('A102', '김춘추', 'M', 23 , '010-1234-2222', '경남 경주시');
insert into `User4` values ('A103', '장보고', 'M', 35 , '010-1234-3333', '잔남 완도시');
insert into `User4` values ('A104', '강감찬', 'M', 42 , '010-1234-4444', '서울시 관악구');
insert into `User4` 
						(`uid`, `name`, `gender`, `hp`, `addr`)
					values
						('A105', '이순신', 'M', '010-1234-5555', '부산시 진구');
insert into `User4` values ('A106', '신사임당', 'F', 32 , NULL, '강릉시');
insert into `User4` values ('A107', '허난설현', 'F', 27 , NULL, '경기도 광주시');

#실습 3-9 auto_increment / check

CREATE TABLE `User5` (
	`seq`    int primary key auto_increment,
	`name`   varchar(10) not null,
	`gender` char(1) check(`gender` in ('M', 'F')), # 범주 검사
	`age`    int default 1 check (`age` > 0 and `age` < 100), # 범위 검사
	`addr`   varchar(20)
);
drop table `User5`;

#실습 3-10

insert into `User5` (`name`, `gender`, `age`, `addr`) values ('김유신', 'M', 25, '경남 김해시');
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('김춘추', 'M', 23, '경남 경주시');
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('장보고', 'M', 35, '전남 완도시');
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('강감찬', 'M', 42, '서울시 관악구');
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('이순신', 'M', 51, '부산시');
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('신사임당', 'F', 54, '강릉시');