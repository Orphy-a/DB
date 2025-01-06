# 날짜 2025/01/06
# 이름 : 오재영
# 내용 : 1장 데이터베이스 설치와 생성

# 실습 1-1
CREATE DATABASE `StudyDB`;
DROP DATABASE `studydb`;

# 실습 1-2
CREATE USER `jaeyoung0560`@`%` identified BY '1234';
grant all privileges on studydb.* to `jaeyoung0560`@`%`;
flush privileges;

# 실습 1-3
alter user `jaeyoung0560`@`%` identified by 'abc1234';
drop user 'jaeyoung0560'@'%';
flush privileges;
