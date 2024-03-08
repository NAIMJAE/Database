# 날짜 : 2024/01/12
# 이름 : 박임재
# 내용 : Bank ERD 실습

# 실습 6-5
insert into `bank_customer` values ('730423-1000001', '김유신', 1, '010-1234-1001', '경남 김해시');
insert into `bank_customer` values ('730423-1000002', '김춘추', 1, '010-1234-1002', '경남 경주시');
insert into `bank_customer` values ('730423-1000003', '장보고', 1, '010-1234-1003', '전남 완도군');
insert into `bank_customer` values ('102-12-51094', '(주)정보산업', 2, '051-500-1004', '부산시 부산진구');
insert into `bank_customer` values ('930423-1000005', '이순신', 1, '010-1234-1005', '서울 종로구');


insert into `bank_account` values ('101-11-1001', 'S1', '자유저축예금','730423-1000001', 1550000, '2011-04-11');
insert into `bank_account` values ('101-11-1002', 'S1', '자유저축예금','930423-1000005', 260000, '2011-05-12');
insert into `bank_account` values ('101-11-1003', 'S1', '자유저축예금','730423-1000003', 75000, '2011-06-13');
insert into `bank_account` values ('101-12-1001', 'S2', '기업전용예금','102-12-51094', 15000000, '2011-07-14');
insert into `bank_account` values ('101-13-1001', 'S3', '정기저축예금','730423-1000002', 1200000, '2011-08-15');


insert into `bank_transaction` set `t_a_no` = '101-11-1001', `t_dist` = 1, `t_amount` = 50000, `t_datetime` = '2023-01-01 13:15:10';
insert into `bank_transaction` set `t_a_no` = '101-12-1001', `t_dist` = 2, `t_amount` = 1000000, `t_datetime` = '2023-01-02 13:15:12';
insert into `bank_transaction` set `t_a_no` = '101-11-1002', `t_dist` = 3, `t_amount` = 260000, `t_datetime` = '2023-01-03 13:15:14';
insert into `bank_transaction` set `t_a_no` = '101-11-1002', `t_dist` = 2, `t_amount` = 100000, `t_datetime` = '2023-01-04 13:15:16';
insert into `bank_transaction` set `t_a_no` = '101-11-1003', `t_dist` = 3, `t_amount` = 75000, `t_datetime` = '2023-01-05 13:15:18';
insert into `bank_transaction` set `t_a_no` = '101-11-1001', `t_dist` = 1, `t_amount` = 150000, `t_datetime` = '2023-01-05 13:15:28';


# 실습 6-6
select `c_no`, `c_name`, `c_phone`, `a_no`, `a_item_name`, `a_balance` from `bank_customer` as a
join `bank_account` as b on a.`c_no` = b.`a_c_no`;

select `t_dist`, `t_amount`, `t_datetime` from `bank_transaction` as a
join `bank_account` as b on a.`t_a_no` = b.`a_no`
join `bank_customer` as c on b.`a_c_no` = c.`c_no` where `c_name` = '이순신';

select `c_no`, `c_name`, `a_no`, `a_balance`, `a_open_date` from `bank_customer` as a
join `bank_account` as b on a.`c_no` = b.`a_c_no` where a.`c_dist`=1 order by `a_balance` desc limit 1;
