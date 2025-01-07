# 날짜 : 2025/01/07
# 이름 : 오재영
# 내용 : 3장 테이블 제약조건

# 기본키
CREATE TABLE `User2`(
	`uid` varchar(10) primary key,
    `name` varchar(10),
	`birth` char(10),
    `addr` varchar (50));
    
SELECT * FROM `USER2`;
insert into `user2` values('A101', '김유신', '1990-02-03', '김해');
insert into `user2` values('A102', '김춘추', '1991-02-03', '경주');
insert into `user2` values('A102', '장보고', '1992-03-04', '완도'); # uid 기본키로 지정하여 중복값 입력 x
insert into `user2` values('A103', '장보고', '1992-03-04', '완도');


# 고유키
create table `user3`(
	`uid` varchar(10) primary key,
    `name` varchar(10),
    `birth` char(10),
    `hp` char(13) unique,
    `addr` varchar(50));

select * from `user3`;
insert into `user3` values('A101', '김춘추', '1991-02-03', '010-1234-5678', 'aaa');
insert into `user3` values('A102', '장보고', '1992-03-04', '010-1111-1111', 'bbb'); 
insert into `user3` values('A103', '장보고', '1992-03-04', '010-1111-1111', 'bbb'); # 기본키 값이 달라도 고유키가 중복이 되면 오류


# 외래키
create table `Parent`(
	`pid` varchar(10) primary key,
    `name` varchar(10),
    `birth` char(10),
    `addr` varchar(100));
    
create table `child`(
	`cid` varchar(10) primary key,
    `name` varchar(10),
    `hp` char(13) unique,
    `parent` varchar(10),
    foreign key (`parent`) references `parent` (`pid`));



insert into `parent` values ('A101', '김유신', '1968-05-09', '경남 김해시');
insert into `parent` values ('A102', '김춘추', '1972-11-23', '경남 경주시');
insert into `parent` values ('A103', '장보고', '1978-03-01', '전남 완도시');
insert into `parent` values ('A104', '장보고', '1979-08-16', '서울시 관악구');
insert into `parent` values ('A105', '이순신', '1981-05-23', '부산시 진구');


insert into `child` values ('C101', '김철수', '010-1234-1001', 'P101');
insert into `child` values ('C102', '김영희', '010-1234-1002', 'P101');
insert into `child` values ('C103', '강철수', '010-1234-1003', 'P103');
insert into `child` values ('C104', '이철수', '010-1234-1004', 'P105');
insert into `child` values ('C105', '정약용', '010-1234-1005', 'P109'); # parent 테이블에 p109가 없기 때문에 오류가 발생한다.


# DEFAULT / NOT NULL

create table `user4`(
	`uid`  varchar(10) primary key,
    `name` varchar(10) not null,
    `gender` char(1),
    `age` int default 1,
    `hp` char(13) unique,
    `addr` varchar(20));

insert into `user4` values ('A101', '김유신', 'M', 25, '010-1234-1111', '경남 김해시');
insert into `user4` values ('A102', '김춘추', 'M', 23, '010-1234-2222', '경남 경주시');
insert into `user4` values ('A103', '장보고', 'M', 35, '010-1234-3333', '전남 완도시');
insert into `user4` set 
					`uid` = 'A104',
					`name`='신사임당',
                    `gender`='F',
                    `addr`='강릉시';

#
create table `user5`(
	`seq` int primary key auto_increment,
    `name` varchar(10) not null,
    `gender` char(1) check(`gender` in ('M', 'F')),
    `age` int default 1 check(`age` > 0 and `age` < 100),
    `addr` varchar(20)
	);


insert into `user5` (`name`, `gender`, `age`, `addr`) values ('김유신', 'M', '25', '경남 김해시');
insert into `user5` (`name`, `gender`, `age`, `addr`) values ('김춘추', 'M', '23', '경남 경주시');
insert into `user5` (`name`, `gender`, `age`, `addr`) values ('장보고', 'M', '35', '전남 완도시');
insert into `user5` (`name`, `gender`, `age`, `addr`) values ('강감찬', 'M', '42', '서울시 관악구');
insert into `user5` (`name`, `gender`, `age`, `addr`) values ('이순신', 'A', '51', '부산시'); # CHECK 조건에 충족하지 않는다. => gender
insert into `user5` (`name`, `gender`, `age`, `addr`) values ('신사임당', 'F', '-1', '강릉시'); # CHECK 조건에 충족하지 않는다. => age





