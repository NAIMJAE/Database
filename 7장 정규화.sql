# 날짜 : 2024/01/18
# 이름 : 박임재
# 내용 : 7장 정규화 실습

# 비정규형 테이블
create table `BookOrder` (
	`OrderNo`    int,
	`OrderDate`  date,
	`userNo`     varchar(10),
	`userName`   varchar(10),
	`userAddr`   varchar(50),
	`bookNo`     int,
	`bookName`   varchar(20),
	`count`      int,
	`price`      int
);

# 제1정규화 진행
insert into `bookorder` values (10001, NOW(), 'a101', '김유신', '김해', 101, '프로그래밍', 1,   28000);
insert into `bookorder` values (10002, NOW(), 'a102', '김춘추', '경주', 102, '프로그래밍', 1,   28000);
insert into `bookorder` values (10002, NOW(), 'a102', '김춘추', '경주', 102, '자료구조', 2,    32000);
insert into `bookorder` values (10003, NOW(), 'a103', '장보고', '완도', 102, '자료구조', 2,    32000);
insert into `bookorder` values (10004, NOW(), 'a104', '강감찬', '서울', 110, '데이터베이스', 1, 25000);
insert into `bookorder` values (10005, NOW(), 'a105', '이순신', '서울', 110, '데이터베이스', 1, 25000);
insert into `bookorder` values (10005, NOW(), 'a105', '이순신', '서울', 102, '자료구조', 1,    16000);

# 제2,3정규화 진행 후 데이터 삽입
insert into `book` values (101,'프로그래밍');
insert into `book` values (102,'자료구조');
insert into `book` values (110,'데이터베이스');

insert into `User` values ('a101', '김유신', '김해');
insert into `User` values ('a102', '김춘추', '경주');
insert into `User` values ('a103', '장보고', '완도');
insert into `User` values ('a104', '강감찬', '서울');
insert into `User` values ('a105', '이순신', '서울');

insert into `UserOrder` values (10001, NOW(), 'a101');
insert into `UserOrder` values (10002, NOW(), 'a102');
insert into `UserOrder` values (10003, NOW(), 'a103');
insert into `UserOrder` values (10004, NOW(), 'a104');
insert into `UserOrder` values (10005, NOW(), 'a105');

insert into `Order` values (10001, 101,1, 28000);
insert into `Order` values (10002, 101,1, 28000);
insert into `Order` values (10002, 102,2, 32000);
insert into `Order` values (10003, 102,2, 32000);
insert into `Order` values (10004, 110,1, 25000);
insert into `Order` values (10005, 110,1, 25000);
insert into `Order` values (10005, 102,1, 16000);

# 조회
select a.`orderNo` as `주문번호`,
	`orderDate` as `주문날짜`,
    d.`userNo` as `고객번호`,
    `userName` as `고객명`,
    `userAddr` as `주소`,
    b.`bookNo` as `도서번호`,
    `bookName` as `도서명`,
    `count` as `수량`,
    `price` as `가격`
    from `Order` as a
join `Book` as b on a.`bookNo` = b.`bookNo`
join `userorder` as c on a.`orderNo` = c.`orderNo`
join `user` as d on c.`userNo` = d.`userNo`
order by `주문번호`;









