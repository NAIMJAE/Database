# GPT 연습문제 01
# 2024/01/07
# 테이블 3개를 이용해 제약조건, 연산자, 정렬, 그룹화, join을 이용해 데이터를 조회하는 문제 10개


# 항공편 구매자 정보 테이블
create table `passenger_info` (
	`Passenger_id` int primary key,
	`name`         varchar(20),
	`email`		   varchar(30),
	`age`          int,
	`gender`       varchar(10)
    );
    
# 항공편 구매자 정보 테이블 데이터
INSERT INTO `passenger_info` (`passenger_id`, `name`, `email`, `age`, `gender`)
VALUES
(1, 'John Doe', 'john@example.com', 32, 'Male'),
(2, 'Jane Smith', 'jane@example.com', 28, 'Female'),
(3, 'Alex Lee', 'alex@example.com', 45, 'Male'),
(4, 'Emma Brown', 'emma@example.com', 35, 'Female'),
(5, 'Olivia Kim', 'olivia@example.com', 40, 'Female'),
(6, 'Liam Johnson', 'liam@example.com', 25, 'Male'),
(7, 'Ava Wilson', 'ava@example.com', 30, 'Female'),
(8, 'Noah Garcia', 'noah@example.com', 33, 'Male');
    
# 항공편 노선 및 출발 정보 테이블
create table `flight_routes` (
	`route_id`       int primary key,
	`origin`         varchar(10),
	`destination`    varchar(10),
	`departure_date` date,
	`flight_number`  varchar(10)
);

# 항공편 노선 및 출발 정보 테이블 데이터
INSERT INTO `flight_routes` (`route_id`, `origin`, `destination`, `departure_date`, `flight_number`)
VALUES
(1, 'ICN', 'JFK', '2023-05-20', 'KE123'),
(2, 'LAX', 'LHR', '2023-06-15', 'BA456'),
(3, 'JFK', 'CDG', '2023-07-10', 'AF789'),
(4, 'DXB', 'BKK', '2023-08-05', 'EK321'),
(5, 'JFK', 'LAX', '2023-09-01', 'AA222'),
(6, 'BKK', 'ICN', '2023-10-18', 'OZ333'),
(7, 'LHR', 'CDG', '2023-11-25', 'BA789'),
(8, 'CDG', 'JFK', '2023-12-30', 'AF123');

# 항공사별 항공편 판매정보 테이블
create table `airline_sales` (
	`sale_id`      int primary key,
	`airline`      varchar(30),
	`route_id`     int,
	`passenger_id` int,
	`ticket_price` DECIMAL,
	foreign key (`route_id`) references `flight_routes` (`route_id`),
    foreign key (`passenger_id`) references `passenger_info` (`passenger_id`)
);

# 항공사별 항공편 판매정보 테이블 데이터
INSERT INTO `airline_sales` (`sale_id`, `airline`, `route_id`, `passenger_id`, `ticket_price`)
VALUES
(1, 'Korean Air', 1, 1, 1200.00),
(2, 'British Airways', 2, 2, 1500.00),
(3, 'Air France', 3, 3, 1100.00),
(4, 'Emirates', 4, 4, 1350.00),
(5, 'American Airlines', 5, 5, 1400.00),
(6, 'Asiana Airlines', 6, 6, 1250.00),
(7, 'British Airways', 7, 7, 1150.00),
(8, 'Air France', 8, 8, 1300.00);

# 문제.1 John Doe라는 이름을 가진 구매자의 정보 조회
select * from `passenger_info` where `name` = 'John Doe';

# 문제.2 JFK 공항에서 출발하는 항공편의 정보 조회
select * from `flight_routes` where `origin` = 'JFK';

# 문제.3 2023년 8월 1일 이후의 항공편 정보 조회
select * from `flight_routes` where `departure_date` >= '2023-08-01';

# 문제.4 British Airways 항공사의 판매 정보 조회
select * from `airline_sales` where `airline` = 'British Airways';

# 문제.5 Alex Lee라는 이름을 가진 구매자가 구매한 항공편과 가격 조회
select a.`name`, c.`flight_number`, b.`ticket_price` from `passenger_info` as a
join `airline_sales` as b on a.`passenger_id` = b.`passenger_id`
join `flight_routes` as c on b.`route_id` = c.`route_id` having a.`name` = 'Alex Lee'; 

# 문제.6 30세 이상의 구매자 수 조회
select count(`age`) as '30세 이상 구매자 수' from `passenger_info` where `age` >= 30 ;

# 문제.7 항공편의 출발지, 도착지별로 판매 수익 조회하기
select a.`origin`, a.`destination`, sum(b.`ticket_price`) as '판매 수익' from `flight_routes` as a
join `airline_sales` as b on a.`route_id` = b.`route_id`
group by a.`origin`, a.`destination`;

# 문제.8 각 구매자별로 구매한 항공편의 평균 가격 조회하기


# 문제.9 출발 날짜에 따른 항공편 정보 조회하기


# 문제.10 각 항공사별로 판매된 항공편의 가장 비싼 티켓 가격 조회하기
select `airline`, max(`ticket_price`) from `airline_sales` group by `airline`;


