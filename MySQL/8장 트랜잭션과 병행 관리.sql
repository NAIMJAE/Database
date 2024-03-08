# 날짜 : 2024/01/18
# 이름 : 박임재
# 내용 : 8장 트랜잭션과 병행 제어

# 실습 8-1
# 트랜잭션 시작
start transaction; 

select * from `bank_account`;
update `bank_account` set `a_balance` = `a_balance` - 10000
where `a_no` = '101-11-1001';

update `Bank_account`
	set `a_balance` = `a_balance` + 10000
    where `a_no` = '101-11-1003';

# 트랜잭션 작업 종료
commit;

# 실습 8-2
# 트랜잭션 시작
start transaction; 

select * from `bank_account`;
update `bank_account` set `a_balance` = `a_balance` - 10000
where `a_no` = '101-11-1001';

update `Bank_account`
	set `a_balance` = `a_balance` + 10000
    where `a_no` = '101-11-1003';

# 트랜잭션 실패 처리
rollback;
select * from `bank_account`;

# 실습 8-3
select @@autocommit; # 1이면 디스크에 자동 반영 0이면 롤백시 돌아옴
set autocommit = 0;

update `bank_account` set `a_balance` = `a_balance` - 10000
where `a_no` = '101-11-1001';

rollback;
select * from `bank_account`;

# 실습 8-4 Lock
select * from `bank_account` where `a_no` = '101-11-1001';

start transaction;

update `bank_account`
set `a_balance` = `a_balance` - 10000
where `a_no` = '101-11-1001';

commit;





