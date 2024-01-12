#
#
#

# 실습 6-8
insert into `student` values ('20201011', '김유신', '010-1234-1001', 3, '경남 김해시');
insert into `student` values ('20201122', '김춘추', '010-1234-1002', 3, '경남 경주시');
insert into `student` values ('20210213', '장보고', '010-1234-1003', 2, '전남 완도군');
insert into `student` values ('20210324', '강감찬', '010-1234-1004', 2, '서울 관악구');
insert into `student` values ('20220415', '이순신', '010-1234-1005', 1, '서울 종로구');

insert into `Lecture` values (101, '컴퓨터과학 개론', 2, 40, '본301');
insert into `Lecture` values (102, '프로그래밍 언어', 3, 52, '본302');
insert into `Lecture` values (103, '데이터페이스', 3, 56, '본303');
insert into `Lecture` values (104, '자료구조', 3, 60, '본304');
insert into `Lecture` values (105, '운영체제', 3, 52, '본305');

insert into `register` (`regStdNo`, `regLecNo`, `regMidScore`, `regFinalScore`) values ('20220415', 101, 60, 30);
insert into `register` (`regStdNo`, `regLecNo`, `regMidScore`, `regFinalScore`) values ('20210324', 103, 54, 36);
insert into `register` (`regStdNo`, `regLecNo`, `regMidScore`, `regFinalScore`) values ('20201011', 105, 52, 28);
insert into `register` (`regStdNo`, `regLecNo`, `regMidScore`, `regFinalScore`) values ('20220415', 102, 38, 40);
insert into `register` (`regStdNo`, `regLecNo`, `regMidScore`, `regFinalScore`) values ('20210324', 104, 56, 32);
insert into `register` (`regStdNo`, `regLecNo`, `regMidScore`, `regFinalScore`) values ('20210213', 103, 48, 40);

# 실습 6-9
select `stdNo`,`stdName`,`stdHp`,`stdYear` from `student` as a
left join `register` as b on a.`stdNo` = b.`regStdNo`
where b.`regStdNo` is null;

update `register` set `regTotalScore` = `regMidScore` + `regFinalScore`, `regFrade`
 = if(`regTotalScore` >= 90, 'A',
	if(`regTotalScore` >= 80, 'B',
	if(`regTotalScore` >= 70, 'C', 'D')));
select * from `register`;

select 
	`regStdNo`, 
    `regLecNo`, 
    `regMidScore`,
    `regFinalScore`,
    `regMidScore` + `regFinalScore` as `합`,
    case
		when (`regMidScore` + `regFinalScore` >= 90) then 'A'
		when (`regMidScore` + `regFinalScore` >= 80) then 'B'
		when (`regMidScore` + `regFinalScore` >= 70) then 'C'
		when (`regMidScore` + `regFinalScore` >= 60) then 'D'
	else 'F'
    end as `등급`
from `Register`;

select `stdNo`, `stdName`, `stdYear`, `lecName`, `regMidScore`, `regFinalScore`, `regTotalScore` ,`regFrade` from `student` as a
join `register` as b on a.`stdNo` = b.`regStdNo`
join `lecture` as c on b.`regLecNo` = c.`lecNo`where `stdYear` = 2;
