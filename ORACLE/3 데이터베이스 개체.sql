/*
    날짜 : 2024/03/06
    이름 : 박임재
    내용 : 3. 데이터베이스 개체
*/

-- 실습 3-1 : 데이터 시간 조회
-- 전체 사전 조회
SELECT * FROM DIC;

-- 테이블 조회 (현재 사용자 기준)
SELECT TABLE_NAME FROM USER_TABLES;

-- 전체 테이블 조회 (현재 사용자 기준)
SELECT OWNER, TABLE_NAME FROM ALL_TABLES;

-- 전체 테이블 조회 (system 관리자만 가능)
SELECT * FROM DBA_TABLES;

-- 전체 사용자 조회(system 관리자만 가능)
SELECT * FROM DBA_USERS;