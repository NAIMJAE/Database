# 날짜 : 2024/01/08
# 이름 : 박임재
# 내용 : 제 5장 데이터베이스 개체

# 인덱스
# 실습 5-1
show index from `User1`;
show index from `User2`;
show index from `User3`;

# 실습 5-2
create index `idx_user1_uid` on `User1` (`uid`);
analyze table `User1`;

# 실습 5-3
drop index `idx_user1_uid` on `User1`;

# 실습 5-4
create view `vw_user1` as (select `name`, `hp`, `age` from `User1`);
create view `vw_user4_age_under30` as (select * from `User4` where `age` < 30);
create view `vw_member_with_sales` as (
	select
		a.`uid` as `직원아이디`,
		b.`name` as `직원이름`,
		b.`pos` as `직급`,
		c.`name` as `부서명`,
		a.`year` as `매출년도`,
		a.`month` as `월`,
		a.`sale` as `매출액`
        from `Sales` as a
        join `Member` as b on a.`uid` = b,`uid`
        join `Department` as c on b.`dep` = c.`depNo`
        );
# 실습 5-5
select * from `vw_user1`;
select * from `vw_user4_age_under30`;
select * from `vw_member_with_sales`;

# 실습 5-6
drop view `vw_user1`;

# 저장 프로시저
# 실습 5-7
DELIMITER $$
	CREATE procedure proc_test1()
	begin
		select * from `Member`;
		select * from `Department`;
	end $$
	DELIMITER ;

Call proc_test1();
# 실습 5-8
DELIMITER $$
	create procedure proc_test2(in _userName varchar(10))
	begin
		select * from `Member` where `name`=_userName;
	end $$
DELIMITER ;

call proc_test2('김유신');

DELIMITER $$
	create procedure proc_test3(in _pos varchar(10), in _dep tinyint)
	begin
		select * from `Member` where `pos` = `_pos` AND `dep` = `_dep`;
	end $$
DELIMITER ;

call proc_test3('차장', 101);

DELIMITER $$
	create procedure proc_test4(in _pos varchar(10), out _count int)
	begin
		select count(*) into _count from `member` where `pos` = `_pos` ;
	end $$
DELIMITER ;

call proc_test4('대리', @_count);
select concat('_count : ', @_count);

# 실습 5-9

DELIMITER $$
	create procedure proc_test5(in _name varchar(10))
	begin
		declare userId varchar(10);
        select `uid` into userId from `Member` where `name` = _name;
        select * from `Sales` where `uid` = userId;
	end $$
    delimiter ;

call proc_test5('김유신');

DELIMITER $$
	create procedure proc_test6()
    begin
		declare num1 int;
		declare num2 int;
		
        set num1 = 1;
        set num2 = 2;
        
        if (num1 > num2) then
			select 'num1이 num2보다 크다.' as `결과2`;
		else
			select 'num1이 num2보다 작다.' as `결과2`;
        end if;
	end $$
delimiter ;
    
call proc_test6();

DELIMITER $$
	create procedure proc_test7()
    begin
		declare sum int;
		declare num int;

		set sum = 0;
		set num = 1;

		while (num <= 10) do
			set sum = sum + num;
			set num = num + 1;
		end while;
        
        select sum as '1부터 10까지 합계';
	end $$
    delimiter ;
    
    call proc_test7();

# 실습 5-10

DELIMITER $$
create procedure proc_test8()
begin
	# 변수 선언
	declare total int default 0;
	declare price int;
	declare endOfRow boolean default false;
        
	# 커서 선언
	declare salesCursor cursor for
		select `sale` from `Sales`;
           
	# 반복 조건
	declare continue handler
		for not found set endOfRow = TRUE;
            
	# 커서 열기
	open salesCursor;
        
	cursor_loop: LOOP
		fetch salesCursor into price;
		
		if endOfRow then
			leave cursor_loop;
		end if ;
            
		set total = total + price;
	end loop;
	
	select total as '전체 합계';
        
	close salesCursor;
end $$
DELIMITER ;
    
call proc_test8();

# 저장 함수
# 실습 5-11

DELIMITER $$
	create function func_test1(_userid varchar(10)) returns int
    begin
		declare total int;
        
        select sum(`sale`) into total from `Sales` where `uid`= _userid;
        
        return total;
	end $$
    delimiter ;
    
select func_test1('a101');

DELIMITER $$
	create function func_test2(_sale int) returns double
    begin
     declare bonus double;
		
        if (_sale >= 100000) then
			set bonus = _sale * 0.1;
		else
			set bonus = _sale * 0.05;
		end if;
    
    return bonus;
    end $$
DELIMITER ;

select
	`uid`,
	`year`,
	`month`,
	`sale`,
    func_test2(`sale`) as `bonus` from `Sales`;






