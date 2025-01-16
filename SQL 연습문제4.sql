# 실습 4-1
create database `theater`;
create user 'theater'@'%' identified by '1234';
grant all privileges on `theater`.* to 'theater'@'%';
flush privileges;
use `theater`;


#실습 4-2
create table `movies`(
	`movie_id` int primary key auto_increment,
    `title` varchar(30) not null,
    `genre` varchar(10) not null,
    `release_date` date not null
    );



create table `customers`(
	`customer_id` int primary key auto_increment,
    `name` varchar(20) not null,
    `email` varchar(50) not null,
    `phone` char(13) not null
    );


create table `bookings`(
	`booking_id` int primary key ,
    `customer_id` int not null,
    `movie_id` int not null,
    `num_tickets` int not null,
    `booking_date` datetime not null
    );


#실습 4-3
insert into `movies` (`title`, `genre`, `release_date`) values ('쇼생크의 탈출', '드라마', '1994-10-14');
insert into `movies` (`title`, `genre`, `release_date`) values ('타이타닉', '로맨스', '1997-03-24');
insert into `movies` (`title`, `genre`, `release_date`) values ('탑건', '액션', '1987-07-16');
insert into `movies` (`title`, `genre`, `release_date`) values ('쥬라기공원', '액션', '1994-02-11');
insert into `movies` (`title`, `genre`, `release_date`) values ('글래디에이터', '액션', '2000-05-03');
insert into `movies` (`title`, `genre`, `release_date`) values ('시네마천국', '드라마', '1995-04-12');
insert into `movies` (`title`, `genre`, `release_date`) values ('미션임파서블', '액션', '1995-11-11');
insert into `movies` (`title`, `genre`, `release_date`) values ('노트북', '로맨스', '2003-08-23');
insert into `movies` (`title`, `genre`, `release_date`) values ('인터스텔라', 'SF', '2011-05-26');
insert into `movies` (`title`, `genre`, `release_date`) values ('아바타', 'SF', '2010-02-10');



select * from `movies`;


insert into `customers` (`name`, `email`, `phone`) values ('김유신', 'kys@example.com', '010-1234-1001');
insert into `customers` (`name`, `email`, `phone`) values ('김춘추', 'kcc@example.com', '010-1234-1002');
insert into `customers` (`name`, `email`, `phone`) values ('장보고', 'jbg@example.com', '010-1234-1003');
insert into `customers` (`name`, `email`, `phone`) values ('강감찬', 'kgc@example.com', '010-1234-1004');
insert into `customers` (`name`, `email`, `phone`) values ('이순신', 'iss@example.com', '010-1234-1005');


select * from `customers`;


insert into `bookings` (`booking_id`,`customer_id`, `movie_id`, `num_tickets`, `booking_date`) values ('101', '1', '1', '2', '2023-01-10 00:00:00');
insert into `bookings` (`booking_id`,`customer_id`, `movie_id`, `num_tickets`, `booking_date`) values ('102', '2', '2', '3', '2023-01-11 00:00:00');
insert into `bookings` (`booking_id`,`customer_id`, `movie_id`, `num_tickets`, `booking_date`) values ('103', '3', '2', '2', '2023-01-13 00:00:00');
insert into `bookings` (`booking_id`,`customer_id`, `movie_id`, `num_tickets`, `booking_date`) values ('104', '4', '3', '1', '2023-01-17 00:00:00');
insert into `bookings` (`booking_id`,`customer_id`, `movie_id`, `num_tickets`, `booking_date`) values ('105', '5', '5', '2', '2023-01-21 00:00:00');
insert into `bookings` (`booking_id`,`customer_id`, `movie_id`, `num_tickets`, `booking_date`) values ('106', '3', '8', '2', '2023-01-21 00:00:00');
insert into `bookings` (`booking_id`,`customer_id`, `movie_id`, `num_tickets`, `booking_date`) values ('107', '1', '10', '4', '2023-01-21 00:00:00');
insert into `bookings` (`booking_id`,`customer_id`, `movie_id`, `num_tickets`, `booking_date`) values ('108', '2', '9', '1', '2023-01-22 00:00:00');
insert into `bookings` (`booking_id`,`customer_id`, `movie_id`, `num_tickets`, `booking_date`) values ('109', '5', '7', '2', '2023-01-23 00:00:00');
insert into `bookings` (`booking_id`,`customer_id`, `movie_id`, `num_tickets`, `booking_date`) values ('110', '3', '4', '2', '2023-01-23 00:00:00');
insert into `bookings` (`booking_id`,`customer_id`, `movie_id`, `num_tickets`, `booking_date`) values ('111', '1', '6', '1', '2023-01-24 00:00:00');
insert into `bookings` (`booking_id`,`customer_id`, `movie_id`, `num_tickets`, `booking_date`) values ('112', '3', '5', '3', '2023-01-25 00:00:00');


#실습 4-4
select `title` from `movies`;

#실습 4-5
select * from `movies` where `genre` = '로맨스';


#실습 4-6
select `title`, `release_date`
from `movies`
where year(`release_date`) >= 2010;

#실습 4-7
select `booking_id`, `booking_Date`
from `bookings`
where `num_tickets` >=3;


#실습 4-8
select * 
from `bookings` 
where `booking_Date` < '2023-01-20';


#실습 4-8
select *
from `bookings`
where date(`booking_date`) < '2023-01-20';



#실습 4-9
select *
from `movies`
where `release_date` between '1990-01-01' and '1999-12-31';


#실습 4-10
select * 
from `bookings`
order by `booking_date` desc
limit 3;


#실습 4-11
select `title`, `release_Date`
from `movies`
order by `release_date`
limit 1;


#실습 4-12
select concat(`title`, ' - ', `release_date`) as 'movie_info'
from `movies`
where `genre` = '액션' and `title` like '%공원%' 
order by `release_date`
limit 1;

select * from `movies`;

#실습 4-13
select `booking_date`, `title`
from `bookings` as a
join `movies` as b
on a.movie_id = b.movie_id
where `customer_id` = 2;

select * from `bookings`;
select * from `movies`;

#실습 4-14
select 
	c.name,
    c.phone,
    b.booking_date,
    m.title
from `bookings` as b
join `customers` as c
on b.customer_id = c.customer_id
join movies as m
on b.movie_id = m.movie_id;



#실습 4-15
select
	m.genre,
    avg(b.num_tickets) as avg_tickets
from `bookings` as b
join `movies` as m
on b.movie_id = m.movie_id
group by m.genre;

select * from `movies`;

#실습 4-16
select
	c.name,
    AVG(B.num_tickets) AS avg_tickets
FROM Bookings B
JOIN `Customers` as C 
ON B.customer_id = C.customer_id
group by c.name;

#실습 4-17
select
	c.name,
    sum(b.num_tickets) as '전체 예매 티켓 수'
from `bookings` as b
JOIN Customers as C 
ON B.customer_id = C.customer_id
group by c.name
order by '전체 예매 티켓 수' desc;


#실습 4-18
select
	b.booking_id,
    b.movie_id,
    c.name,
    b.booking_date
from `bookings` as b
JOIN `Customers` as C 
ON B.customer_id = C.customer_id
order by b.booking_Date asc
limit 1;


#실습 4-19
select
	`genre`, `title`, `release_Date`
from `movies`
where (`genre`, `release_date`) in (select `genre`, max(`release_Date`)
										from `movies`
										group by `genre`);





#실습 4-20
select *
from `movies`
where `movie_id` in (select `movie_id`
						from `bookings`
                        where `customer_id` = (select `customer_id`
													from `customers`
													where `name` = '김유신'));


#실습 4-21
select `name`, `email`
from `customers`
where `customer_id` = (select `customer_id`
						from `bookings`
						group by `customer_id`
						order by sum(`num_tickets`) desc
						limit 1);


#실습 4-22
select * 
from `bookings`
where `num_tickets` > (select avg(`num_tickets`)
						from `bookings`);



#실습 4-23
select m.title, sum(b.num_tickets) as 'total_tickets'
from `bookings` as b
join Movies as m
on b.movie_id = m.movie_id
group by m.title;

#실습 4-24
select c.name, SUM(b.num_tickets) AS total_tickets, AVG(b.num_tickets) AS avg_tickets
from `bookings` as b
join Customers as c 
ON b.customer_id = c.customer_id
group by c.name;

#실습 4-25
SELECT c.customer_id, c.name, c.email, SUM(b.num_tickets) AS `예매 티켓수`
FROM Bookings as b
JOIN Customers as c
ON b.customer_id = c.customer_id
group by c.name
order by '예매 티켓수' desc;


#실습 4-26
select c.name, m.title, b.num_tickets, b.booking_Date
FROM bookings b
JOIN customers as c ON b.customer_id = c.customer_id
JOIN movies as m ON b.movie_id = m.movie_id
ORDER BY num_tickets DESC;


#실습 4-27
SELECT
	M.title,
	M.genre,
	SUM(B.num_tickets) AS `예매 티켓 수`,
AVG(B.num_tickets) AS `평균 티켓 수`
FROM bookings B
JOIN Movies M ON B.movie_id = M.movie_id
WHERE M.genre = '액션'
group by m.title
order by `평균 티켓 수` desc;



#실습 4-28
select
	B.customer_id,
	C.name,
	SUM(`num_tickets`) AS `ticket_total`
FROM bookings B
JOIN Customers C ON B.customer_id = C.customer_id
group by c.name
order by `ticket_total` desc;


#실습 4-29
select
	B.booking_id,
	B.customer_id,
	B.movie_id,
	maxTickets.max_tickets
FROM Bookings B
JOIN (
	SELECT movie_id, MAX(num_tickets) AS max_tickets
	FROM Bookings
    group by movie_id) as `maxtickets`
on B.movie_id = MaxTickets.movie_id AND B.num_tickets = MaxTickets.max_tickets;

#실습 4-30
sELECT
B.booking_id,
B.customer_id,
C.name,
M.title,
M.genre,
SUM(B.num_tickets) AS `예매 티켓 수`
FROM bookings B
JOIN movies M ON B.movie_id = M.movie_id
JOIN customers C ON B.customer_id = C.customer_id
GROUP BY M.title
having `예매 티켓 수` = (
SELECT MAX(total_tickets)
FROM (
SELECT SUM(B2.num_tickets) AS total_tickets
FROM Bookings B2
JOIN Movies M2 ON B2.movie_id = M2.movie_id
WHERE M2.genre = M.genre
GROUP BY M2.title
) AS SelectMAX
)
ORDER BY `예매 티켓 수` DESC;