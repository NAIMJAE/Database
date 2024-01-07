# GPT 연습문제 01
# 2024/01/06
# 테이블 3개를 이용해 제약조건, 연산자, 정렬, 그룹화, join을 이용해 데이터를 조회하는 문제 10개
drop table `Production_data`;
use `gptstudy`;
# Employees 테이블
create table `Employees`(
	`Employee_id` int primary key,
	`Name`        varchar(10),
	`Department`  varchar(10),
    `Hire_date`   Date
);
# Sales_performance 테이블
create table `Sales_performance` (
	`Sale_id`     int primary key,
	`Employee_id` int,
	`Sale_amount` decimal,
	`Sale_date`   date,
     foreign key (`Employee_id`) references `Employees` (`Employee_id`)
);
# Production_data 테이블
create table `Production_data` (
	`Product_id`   int primary key,
	`Product_name` varchar(10),
	`Product_date` date,
	`Quantity`     int
    );
# Employees 테이블 데이터
insert into `Employees` values (101, 'John Doe', 'Sales', '2023-01-15');
insert into `Employees` values (102, 'Jane Smith', 'Marketing', '2023-02-20');
insert into `Employees` values (103, 'Alex Lee', 'Production', '2023-03-10');

# Sales_performance 테이블 데이터
insert into `Sales_performance` values (1, 101, '500', '2023-05-12');
insert into `Sales_performance` values (2, 102, '700', '2023-06-20');
insert into `Sales_performance` values (3, 101, '300', '2023-07-05');
insert into `Sales_performance` values (4, 103, '1000', '2023-08-10');

# Production_data 테이블 데이터
insert into `Production_data` values (1, 'Laptop', '2023-04-01', 50);
insert into `Production_data` values (2, 'Smartphone', '2023-05-15', 100);
insert into `Production_data` values (3, 'Headphone', '2023-06-20', 80);

#문제.1 직원들의 이름과 입사 날짜를 조회하세요.
select `Name`, `Hire_date` from `Employees`;

#문제.2 직원들의 판매 실적과 판매 날짜를 조회하세요.
select `Sale_amount`, `Sale_date` from `Sales_performance`;

#문제.3 물건 생산 데이터에서 생산된 물건의 종류와 생산량을 조회하세요.
select `Product_name`, `Quantity` from `Production_data`;

#문제.4 직원들의 판매 실적 중 최소값을 조회하세요.
select a.`name`, min(b.`sale_amount`) from `Employees` as a
join `sales_performance` as b on a.`employee_id` = b.`employee_id` group by a.`name`;

#문제.5 물건 생산량 중 최대값을 조회하세요.
select * from `production_data` order by `quantity` desc limit 1;

#문제.6 직원과 판매 실적을 조인하여 직원 이름과 해당 판매 실적을 조회하세요.
select a.`name`, sum(b.`sale_amount`) as '판매실적' from `employees` as a
join `sales_performance` as b on a.`employee_id` = b.`employee_id` group by a.`name`;

#문제.7 물건 생산 데이터와 판매 실적을 조인하여 생산된 물건과 해당 판매 실적을 조회하세요.
select a.`product_name`, b.`sale_amount` from `production_data` as a
join `sales_performance` as b on a.`product_id` = b.`sale_id`;

#문제.8 판매 실적이 500 이상인 직원의 이름과 판매 실적을 조회하세요.
select a.`name`, sum(b.`sale_amount`) as '판매실적' from `employees` as a
join `sales_performance` as b on a.`employee_id` = b.`employee_id`  group by a.`name` Having sum(b.sale_amount) >= '500';

#문제.9 물건 생산량이 80 이하인 데이터의 모든 열을 조회하세요.
select * from `production_data` where quantity <= 80;

#문제.10 모든 테이블을 조인하여 모든 직원, 판매 실적, 그리고 물건 생산 데이터를 조회하세요.
select a.`name`, sum(b.`sale_amount`) as '판매실적', c.* from `employees` as a
join `sales_performance` as b on a.`employee_id` = b.`employee_id`
join `production_data` as c on b.`sale_id`= c.`product_id`  group by a.`name`;

