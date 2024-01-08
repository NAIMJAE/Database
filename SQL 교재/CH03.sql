# 날짜 : 2024/01/08
# 이름 : 박임재
# 내용 : 교재 ch03 SQL 기본 문법

# Ch3-1
# 손코딩 p.111
use market_db;

# 손코딩 p.112
use market_db;
select * from member;

# 손코딩 p.114
select mem_name from member;

# 손코딩 p.115
select addr, debut_date, mem_name from member;

# 손코딩 p.116
select * from member where mem_name = '블랙핑크';

# 손코딩 p.117
select * from member where mem_number = 4;

# 손코딩 p.118
select mem_name, height, mem_number from member where height >= 165 or mem_number > 6;
select mem_name, height from member where height >= 163 and height <= 165;
select mem_name, height from member where height between 163 AND 165;

# 손코딩 p.119
select mem_name, addr from member where addr = '경기' or addr = '전남' or addr = '경남';
select mem_name, addr from member where addr in('경기', '전남', '경남');
select * from member where mem_name like '우%';

# 손코딩 p.120
select * from member where mem_name like '__핑크'; 

# Ch3-2
# 손코딩 p.125
select mem_id, mem_name, debut_date from member order by debut_date;

# 손코딩 p.126
select mem_id, mem_name, debut_date from member order by debut_date desc;
select mem_id, mem_name, debut_date, height from member where height >= 164 order by height desc;

# 손코딩 p.127
select mem_id, mem_name, debut_date, height from member where height >= 164 order by height desc, debut_date ASC;

# 손코딩 p.128
select mem_name, debut_date from member order by debut_date limit 3;

# 손코딩 p.129
select mem_name, height from member order by height desc limit 3, 2;

# 손코딩 p.130
select addr from member;
select addr from member order by addr;
select distinct addr from member;

# 손코딩 p.131
select mem_id, amount from buy order by mem_id;

# 손코딩 p.132
select mem_id, sum(amount) from buy group by mem_id;
select mem_id "회원아이디", sum(amount) "총구매개수" from buy group by mem_id;

# 손코딩 p.133
select mem_id "회원아이디", sum(price*amount) "총구매금액" from buy group by mem_id;
select AVG(amount) "평균구매개수" from buy;

# 손코딩 p.134
select mem_id, AVG(amount) "평균구매개수" from buy group by mem_id;
select count(*) from member;
select count(phone1) "연락처가 있는 회원" from member;

select mem_id "회원 아이디", sum(price*amount) "총 구매 금액" from buy group by mem_id;

# 손코딩 p.135
select mem_id "회원 아이디", sum(price*amount) "총 구매 금액" from buy group by mem_id having sum(price*amount) > 1000;

# 손코딩 p.136
select mem_id "회원 아이디", sum(price*amount) "총 구매 금액" from buy group by mem_id having sum(price*amount) > 1000 order by sum(price*amount) desc;

# Ch3-3
# 손코딩 p.141
use market_db;
create Table hongong1 (toy_id INT, toy_name CHAR(4), age INT);
insert into hongong1 values (1, '우디', 25);

insert into hongong1 (toy_id, toy_name) values (2, '버즈');

insert into hongong1 (toy_id, age, toy_name) values ('제시', 20, 3);

# 손코딩 p.142
create table hongong2 (
	toy_id int auto_increment primary key,
    toy_name char(4),
    age int);
    
insert into hongong2 values (null, '보핍', 25);
insert into hongong2 values (null, '슬링키', 22);
insert into hongong2 values (null, '렉스', 21);
select * from hongong2;

# 손코딩 p.143
alter table hongong2 auto_increment=100;
insert into hongong2 values (null, '재남', 35);
select * from hongong2;

create table hongong3 (
	toy_id int auto_increment primary key,
    toy_name char(4),
    age int);
alter table hongong3 auto_increment=1000;
set @@auto_increment_increment=3; # 증가값 3

# 손코딩 p.144
insert into hongong3 values (null, '토마스', 20);
insert into hongong3 values (null, '제임스', 23);
insert into hongong3 values (null, '고든', 25);
select * from hongong3;

# 손코딩 p.145
select count(*) from world.city;
desc world.city;
select * from world.city limit 5;

# 손코딩 p.146
create table city_popul (city_name char(35), population int);
insert into city_popul select Name, Population from world.city;

# 손코딩 p.147
use market_db;
update city_popul 
	set city_name = '서울'
    where city_name = 'seoul';
select * from city_popul where city_name = '서울';

# 손코딩 p.148
update city_popul
	set city_name = '뉴욕', population = 0
    where city_name = 'new york';
select * from city_popul where city_name = '뉴욕';

update city_popul
	set city_name = '서울';

# 손코딩 p.149
update city_popul
	set population = population / 10000;
select * from city_popul limit 5;

delete from city_popul where city_name like 'new%';

# 손코딩 p.150
delete from city_popul where city_name like 'new%' limit 5;

# 손코딩 p.151
create table big_table1 (select * from world.city, sakila.country);
create table big_table2 (select * from world.city, sakila.country);
create table big_table3 (select * from world.city, sakila.country);
select count(*) from  big_table1;

delete from big_table1;
drop table big_table2;
truncate table big_table3;