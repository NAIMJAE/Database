#날짜 : 2024/01/03
#이름 : 박임재
#내용 : 4장 SQL 고급

#실습 4-1
CREATE TABLE `Member` (
	`uid`   VARCHAR(10) primary key,
	`name`  VARCHAR(10),
	`hp`    VARCHAR(13) unique,
	`pos`   VARCHAR(10) default '사원',
	`dep`   int default null,
	`rdate` datetime
);
CREATE TABLE `Department` (
	`depNo` int primary key,
	`name`  VARCHAR(10),
	`tel`   VARCHAR(12)
);
CREATE TABLE `Sales` (
	`seq`   int primary key auto_increment,
	`uid`   VARCHAR(10),
	`year`  year,
	`month` int,
	`sale`  int
);


#실습 4-2

INSERT INTO `Member` VALUES ('a101', '박혁거세', '010-1234-1001', '부장', 101, '2020-11-19 11:39:48');
INSERT INTO `Member` VALUES ('a102', '김유신', '010-1234-1002', '차장', 101, '2020-11-19 11:39:48');
INSERT INTO `Member` VALUES ('a103', '김춘추', '010-1234-1003', '사원', 101, '2020-11-19 11:39:48');
INSERT INTO `Member` VALUES ('a104', '장보고', '010-1234-1004', '대리', 102, '2020-11-19 11:39:48');
INSERT INTO `Member` VALUES ('a105', '강감찬', '010-1234-1005', '과장', 102, '2020-11-19 11:39:48');
INSERT INTO `Member` VALUES ('a106', '이성계', '010-1234-1006', '차장', 103, '2020-11-19 11:39:48');
INSERT INTO `Member` VALUES ('a107', '정철', '010-1234-1007', '차장', 103, '2020-11-19 11:39:48');
INSERT INTO `Member` VALUES ('a108', '이순신', '010-1234-1008', '부장', 104, '2020-11-19 11:39:48');
INSERT INTO `Member` VALUES ('a109', '허균', '010-1234-1009', '부장', 104, '2020-11-19 11:39:48');
INSERT INTO `Member` VALUES ('a110', '정약용', '010-1234-1010', '사원', 105, '2020-11-19 11:39:48');
INSERT INTO `Member` VALUES ('a111', '박지원', '010-1234-1011', '사원', 105, '2020-11-19 11:39:48');

INSERT INTO `Department` VALUES (101, '영업1부', '051-512-1001');
INSERT INTO `Department` VALUES (102, '영업2부', '051-512-1002');
INSERT INTO `Department` VALUES (103, '영업3부', '051-512-1003');
INSERT INTO `Department` VALUES (104, '영업4부', '051-512-1004');
INSERT INTO `Department` VALUES (105, '영업5부', '051-512-1005');
INSERT INTO `Department` VALUES (106, '영업지원부', '051-512-1006');
INSERT INTO `Department` VALUES (107, '인사부', '051-512-1007');

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a101', '2018', 1, 98100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a102', '2018', 1, 136000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a103', '2018', 1, 80100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a104', '2018', 1, 78000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a105', '2018', 1, 93000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a101', '2018', 2, 23500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a102', '2018', 2, 126000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a103', '2018', 2, 18500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a104', '2018', 2, 19000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a105', '2018', 2, 53000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a101', '2019', 1, 24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a102', '2019', 1, 109000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a103', '2019', 1, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a104', '2019', 1, 53500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a107', '2019', 1, 24000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a102', '2019', 2, 160000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a103', '2019', 2, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a104', '2019', 2, 43000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a105', '2019', 2, 24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a106', '2019', 2, 109000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a102', '2020', 1, 201000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a104', '2020', 1, 63000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a105', '2020', 1, 74000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a106', '2020', 1, 122000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a107', '2020', 1, 111000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a102', '2021', 2, 120000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a103', '2021', 2, 93000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a104', '2021', 2, 84000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a105', '2021', 2, 180000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`)VALUES ('a108', '2021', 2, 76000);

#실습 4-3

SELECT * FROM `Member` WHERE `name` = '김유신';
SELECT * FROM `Member` WHERE `pos` = '차장' AND dep=101;
SELECT * FROM `Member` WHERE `pos` = '차장' OR dep=101;
SELECT * FROM `Member` WHERE `naem` != '김춘추';
SELECT * FROM `Member` WHERE `name` <> '김춘추';
SELECT * FROM `Member` WHERE `pos` = '사원' OR `pos`='대리';
SELECT * FROM `Member` WHERE `pos` IN('사원', '대리');
SELECT * FROM `Member` WHERE `dep` IN(101, 102, 103);
SELECT * FROM `Member` WHERE `name` LIKE '%신'; #신으로 끝나는
SELECT * FROM `Member` WHERE `name` LIKE '김%';
SELECT * FROM `Member` WHERE `name` LIKE '김__';
SELECT * FROM `Member` WHERE `name` LIKE '_성_';
SELECT * FROM `Member` WHERE `name` LIKE '정_';
SELECT * FROM `Sales` WHERE `sale` > 50000;
SELECT * FROM `Sales` WHERE `sale` >= 50000 AND `sale` < 100000 AND `month`=1;
SELECT * FROM `Sales` WHERE `sale` BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `sale` NOT BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `year` IN(2020);
SELECT * FROM `Sales` WHERE `month` IN(1, 2);

#실습 4-4

SELECT * FROM `Sales` `sales`; #PK 값으로 정렬
SELECT * FROM `Sales` ORDER BY `sale`;
SELECT * FROM `Sales` ORDER BY `sale` ASC;
SELECT * FROM `Sales` ORDER BY `sale` DESC;
SELECT * FROM `Member` ORDER BY `name`;
SELECT * FROM `Member` ORDER BY `name` DESC;
SELECT * FROM `Member` ORDER BY `rdate` ASC;
SELECT * FROM `Sales` WHERE `sale` > 50000 ORDER BY `sale` DESC;
SELECT * FROM `Sales` WHERE `sale` > 50000 ORDER BY `year`, `month`, `sale` DESC;

#실습 4-5

SELECT * FROM `Sales` LIMIT 3;
SELECT * FROM `Sales` LIMIT 0, 3; #start(index number), size
SELECT * FROM `Sales` LIMIT 1, 2;
SELECT * FROM `Sales` LIMIT 5, 3;
SELECT * FROM `Sales` ORDER BY `sale` DESC;
SELECT * FROM `Sales` ORDER BY `sale` DESC LIMIT 3, 5;
SELECT * FROM `Sales` WHERE `sale` < 50000 ORDER BY `sale` DESC LIMIT 3;
SELECT * FROM `Sales` WHERE `sale` > 50000 ORDER BY `year` DESC, `month`, `sale` DESC LIMIT 5;

#실습 4-6

SELECT SUM(`sale`) AS `합계` FROM `Sales`;
SELECT AVG(`sale`) AS `평균` FROM `Sales`;
SELECT MAX(`sale`) AS `최대값` FROM `Sales`;
SELECT MIN(`sale`) AS `최소값` FROM `Sales`;
SELECT CEILING(1.2);
SELECT CEILING(1.8);
SELECT FLOOR(1.2);
SELECT FLOOR(1.8);
SELECT ROUND(1.2);
SELECT ROUND(1.8);
SELECT RAND();
SELECT CEILING(RAND() * 10);
SELECT COUNT(sale) AS `갯수` FROM `Sales`;
SELECT COUNT(*) AS `갯수` FROM `Sales`;

SELECT LEFT('HelloWorld', 5);
SELECT RIGHT('HelloWorld', 5);
SELECT SUBSTRING('HelloWorld', 6, 5);
SELECT CONCAT('Hello', 'world');
SELECT CONCAT(`uid`, `name`, `hp`) FROM `member` WHERE `uid`='a108';

SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();
INSERT INTO `Member` VALUES ('a112', '유관순', '010-1234-1012', '대리', 107, NOW());

#실습 4-7
# 2018년 1월 매출의 총합 구하기
SELECT SUM(`sale`) AS `매출 총합` FROM `Sales` WHERE `year` = 2018 AND `month` = 1;

#실습 4-8
# 2019년 2월에 5만원 이상 매출에 대한 총합과 평균 구하기
SELECT SUM(`sale`) AS `매출 총합` FROM `Sales` WHERE `year` = 2019 AND `month` = 1 AND `sale` > 50000;
SELECT AVG(`sale`) AS `매출 평균` FROM `Sales` WHERE `year` = 2019 AND `month` = 1 AND `sale` > 50000;

#실습 4-9
# 2020년 전체 매출 가운데 최저, 최고 매출 구하기


#실습 4-10

SELECT * FROM `Sales` GROUP BY `uid`;
SELECT * FROM `Sales` GROUP BY `year`;
SELECT * FROM `Sales` GROUP BY `uid`, `year`;

SELECT `uid`, COUNT(*) AS `건수` FROM `Sales` GROUP BY `uid`;
SELECT `uid`, SUM(`sale`) AS `합계` FROM `Sales` GROUP BY `uid`;
SELECT `uid`, AVG(`sale`) AS `평균` FROM `Sales` GROUP BY `uid`;

SELECT `uid`, `year`, SUM(`sale`) AS `합계` FROM `Sales` GROUP BY `uid`, `year`;
SELECT `uid`, `year`, SUM(`sale`) AS `합계` FROM `Sales` GROUP BY `uid`, `year` ORDER BY `year` ASC, `합계` DESC;
SELECT `uid`, `year`, SUM(`sale`) AS `합계` FROM `Sales` WHERE `sale` >= 50000 GROUP BY `uid`, `year` ORDER BY `합계` DESC;

#실습 4-11

SELECT `uid`, SUM(sale) AS `합계` FROM `Sales` GROUP BY `uid` HAVING `합계` >= 200000;
SELECT `uid`, SUM(sale) AS `합계` FROM `Sales` WHERE `sale` >= 100000 GROUP BY `uid`, `year` HAVING `합계` >= 200000 ORDER BY `합계` DESC;

#실습 4-12

CREATE TABLE `Sales2` LIKE `Sales`;
INSERT INTO `Sales2` SELECT * FROM `Sales`;
UPDATE `Sales2` SET `year` = `year` + 3;

SELECT * FROM `Sales` UNION SELECT * FROM `Sales2`;
SELECT * FROM `Sales` WHERE `sale` >=100000 UNION SELECT * FROM `Sales2` WHERE `sale` >=100000;

SELECT `uid`, `year`, `sale` FROM Sales UNION SELECT `uid`, `year`, `sale` FROM Sales2;

SELECT `uid`, `year`, SUM(`sale`) AS `합계` FROM `Sales` GROUP BY `uid`, `year`
UNION SELECT `uid`, `year`, SUM(`sale`) AS `합계` FROM `Sales2` GROUP BY `uid`, `year` ORDER BY `year` ASC, `합계` DESC;

#실습 4-13

SELECT * FROM `Sales` INNER JOIN `Member` ON `Sales`.uid = `Member`.uid;
SELECT * FROM `Member` INNER JOIN `Department` ON `Member`.dep = `Department`.depNo;

# Sales의 별칭은 a / Member의 별칭은 b / a.uid와 b.uid를 기준으로 JOIN
SELECT * FROM `Sales` AS a JOIN `Member` AS b ON a.uid = b.uid;
SELECT * FROM `Member` AS a JOIN `Department` AS b ON a.dep = b.depNo;

SELECT * FROM `Sales` As a, `Member` AS b WHERE a.uid = b.uid;
SELECT * FROM `Member` As a, `Department` AS b WHERE a.dep = b.depNo;

SELECT a.`seq`, a.`uid`, `sale`, `name`, `pos` FROM `Sales` AS a JOIN `Member` AS b ON a.`uid` = b.`uid`;

SELECT a.`seq`, a.`uid`, `sale`, `name`, `pos` FROM `Sales` AS a JOIN `Member` AS b USING (uid);

SELECT a.`seq`, a.`uid`, `sale`, `name`, `pos` FROM `Sales` AS a 
JOIN `Member` AS b ON a.`uid` = b.`uid` WHERE `sale` >= 100000;

SELECT a.`seq`, a.`uid`, b.`name`, b.`pos`, `year`, SUM(`sale`) AS `합계` FROM `Sales` AS a
JOIN `Member` AS b ON a.uid = b.uid 
GROUP BY a.`uid`, a.`year` HAVING `합계` >= 100000
ORDER BY a.`year` ASC, `합계` DESC;

SELECT * FROM `Sales` AS a 
JOIN `Member` AS b ON a.uid = b.uid
JOIN `Department` AS c ON b.dep = c.depNo;

SELECT a.`seq`, a.`uid`, a.`sale`, b.`name`, b.`pos`, c.`name` FROM `Sales` AS a 
JOIN `Member` AS b ON a.uid = b.uid
JOIN `Department` AS c ON b.dep = c.depNo;
 
SELECT a.`seq`, a.`uid`, a.`sale`, b.`name`, b.`pos`, c.`name` FROM `Sales` AS a 
JOIN `Member` AS b ON a.uid = b.uid
JOIN `Department` AS c ON b.dep = c.depNo
WHERE `sale` > 100000
ORDER BY `sale` DESC;





#실습 4-14
SELECT * FROM `Sales` AS a LEFT JOIN `Member` AS b ON a.uid = b.uid;
SELECT * FROM `Sales` AS a RIGHT JOIN `Member` AS b ON a.uid = b.uid;
SELECT a.`seq`, a.`uid`, `sale`, `name`, `pos` FROM `Sales` AS a LEFT JOIN `Member` AS b USING(uid);

 SELECT a.`seq`, a.`uid`, `sale`, `name`, `pos` FROM `Sales` AS a RIGHT JOIN `Member` AS b USING(uid);

#실습 4-15
# 모든 직원의 아이디, 이름, 직급, 부서명을 조회하시오
SELECT a.`uid`, a.`name`, `pos`, b.`name` FROM `Member` AS a JOIN `Department` AS b ON a.dep = b.depNO;

#실습 4-16
# '김유신' 직원의 2019년도 매출의 합을 조회하시오
SELECT a.`name`, b.`year`, SUM(`sale`) AS `매출의 합` FROM `Member` AS a JOIN `Sales` AS b 
ON a.`uid` = b.`uid` WHERE a.`uid`='a102' AND b.`year`='2019';
## uid a102의 year 2019의 sale의 합(SUM)

#실습 4-17
# 2019년 50,000 이상 매출에 대해 직원별 매출의 합이 100,000원 이상인 직원이름, 부서명, 직급, 년도, 매출 합을 조회하시오. 매출 합이 큰 순서부터 정렬

SELECT a.`name`, b.`name`, `pos`, `year`, SUM(`sale`) AS `매출 합` 
FROM `Member` AS a JOIN `Department` AS b ON a.`dep`=b.`depNo` 
JOIN `Sales` AS c ON a.`uid`=c.`uid`
WHERE c.`sale`>='50000' AND c.`year`='2019' AND `sale` >='100000'
GROUP BY a.`uid` ORDER BY `매출 합` DESC;
