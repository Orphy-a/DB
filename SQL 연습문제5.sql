#실습 5-1
create database `bookstore`;
create user 'bookstore'@'%' identified by '1234';
grant all privileges on `bookstore`.* to 'bookstore'@'%';
flush privileges;
use `bookstore`;


#실습 5-2
create table `customer`(
	`custid` int primary key auto_increment,
    `name` varchar(10) not null,
    `address` varchar(20) default null,
    `phone` varchar(13) default null
    ); 


create table `book`(
	bookid int primary key,
    bookname varchar(20) not null,
	publisher varchar(20) not null,
    price int default null
    );

create table `order`(
	orderid int primary key auto_increment,
    custid int not null,
    bookid int not null,
    saleprice int not null,
    orderdate date not null
	);


#실습 5-3
insert into customer (name, address, phone) values ('박지성', '영국 맨체스타', '000-5000-0001');
insert into customer (name, address, phone) values ('김연아', '대한민국 서울', '000-6000-0001');
insert into customer (name, address, phone) values ('장미란', '대한민국 강원도', '000-7000-0001');
insert into customer (name, address, phone) values ('추신수', '미국 클리블랜드', '000-8000-0001');
insert into customer (name, address) values ('박세리', '대한민국 대전');

select * from customer;


insert into book (bookid, bookname, publisher, price) values ('1', '축구의 역사', '굿스포츠', '7000');
insert into book (bookid, bookname, publisher, price) values ('2', '축구아는 여자', '나무수', '13000');
insert into book (bookid, bookname, publisher, price) values ('3', '축구의 이해', '대한미디어', '22000');
insert into book (bookid, bookname, publisher, price) values ('4', '골프 바이블', '대한미디어', '35000');
insert into book (bookid, bookname, publisher, price) values ('5', '피겨 교본', '굿스포츠', '8000');
insert into book (bookid, bookname, publisher, price) values ('6', '역도 단계별기술', '굿스포츠', '6000');
insert into book (bookid, bookname, publisher, price) values ('7', '야구의 추억', '이상미디어', '20000');
insert into book (bookid, bookname, publisher, price) values ('8', '야구를 부탁해', '이상미디어', '13000');
insert into book (bookid, bookname, publisher, price) values ('9', '올림픽이야기', '삼성당', '7500');
insert into book (bookid, bookname, publisher, price) values ('10', 'Olympic Champions', 'pearson', '13000');


select * from book;

insert into `order` (orderid, custid, bookid, saleprice, orderdate) values ('1', '1', '1', '6000', '2024-07-01');
insert into `order` (orderid, custid, bookid, saleprice, orderdate) values ('2', '1', '3', '21000', '2024-07-03');
insert into `order` (orderid, custid, bookid, saleprice, orderdate) values ('3', '2', '5', '8000', '2024-07-03');
insert into `order` (orderid, custid, bookid, saleprice, orderdate) values ('4', '3', '6', '6000', '2024-07-04');
insert into `order` (orderid, custid, bookid, saleprice, orderdate) values ('5', '4', '7', '20000', '2024-07-05');
insert into `order` (orderid, custid, bookid, saleprice, orderdate) values ('6', '1', '2', '12000', '2024-07-07');
insert into `order` (orderid, custid, bookid, saleprice, orderdate) values ('7', '4', '8', '13000', '2024-07-07');
insert into `order` (orderid, custid, bookid, saleprice, orderdate) values ('8', '3', '10', '12000', '2024-07-08');
insert into `order` (orderid, custid, bookid, saleprice, orderdate) values ('9', '2', '10', '7000', '2024-07-09');
insert into `order` (orderid, custid, bookid, saleprice, orderdate) values ('10', '3', '8', '13000', '2024-07-10');



select * from `order`;

#실습 5-4
select custid, name, address from customer;

#실습 5-5
select bookname, price
from book;


#실습 5-6
select price, bookname
from book;

#실습 5-7
select bookid, bookname, publisher, price
from book;


#실습 5-8
select publisher
from book;


#실습 5-9
select distinct publisher
from book;


#실습 5-10
select *
from book
where price >= 20000;

#실습 5-11
select *
from book
where price <20000;


#실습 5-12
select *
from book
where price>=10000 and price<=20000;

#실습 5-13
select bookid, bookname, price
from book
where price>=15000 and price<=30000;


#실습 5-14
select *
from book
where bookid = 2 or bookid = 3 or bookid = 5; 

select *
from book
where bookid in(2, 3, 5);


#실습 5-15
select *
from book
where bookid % 2 = 0;

select *
from book
where mod(bookid, 2) = 0;

#실습 5-16
select *
from customer
where `name` like '박%';


#실습 5-17
select *
from customer
where address like '대한민국%';

#실습 5-18
select * 
from customer
where phone is not null;



#실습 5-19
select *
from book
where publisher = '굿스포츠' or publisher = '대한미디어';  



#실습 5-20
select publisher
from book
where bookname = '축구의 역사';


#실습 5-21
select publisher
from book
where bookname like '%축구%';


#실습 5-22
select *
from book
where bookname like '_구%';


#실습 5-23
select *
from book
where price>=20000 and bookname like '%축구%';




#실습 5-24
select *
from book
order by bookname;



#실습 5-25
select *
from book
order by price, bookname;


#실습 5-26
select *
from book
order by price desc, publisher;



#실습 5-27
select *
from book
order by price desc
limit 3;


#실습 5-28
select *
from book
order by price
limit 3;



#실습 5-29
select sum(saleprice) as 총판매액
from `order`;


#실습 5-30
select sum(saleprice), avg(saleprice), min(saleprice), max(saleprice)
from `order`;



#실습 5-31
select count(*) as 판매건수
from `order`;




#실습 5-32
select `bookid`, replace(bookname, '야구', '농구') as bookname, publisher, price
from book;






#실습 5-33
select custid, count(*) as 수량
from `order`
where saleprice >= 8000
group by custid
having 수량 >=2;


#실습 5-34
select *
from customer as c
join `order` as o
on c.custid = o.custid;


#실습 5-35
select *
from customer as c
join `order` as o
on c.custid = o.custid
order by c.custid;




#실습 5-36
select c.name, o.saleprice 
from customer as c
join `order` as o
on c.custid = o.custid;


#실습 5-37
select c.name, sum(saleprice)
from customer as c
join `order` as o
on c.custid = o.custid
group by c.name
order by c.name;



#실습 5-38
select c.name, b.bookname
from customer as c
join `order` as o
on c.custid = o.custid
join book as b
on b.bookid = o.bookid
order by b.bookid;


#실습 5-39
select c.name, b.bookname
from customer as c
join `order` as o
on c.custid = o.custid
join book as b
on b.bookid = o.bookid
where o.saleprice = 20000
order by b.bookid;


#실습 5-40
select c.name, o.saleprice
from customer as c
left join `order` as o
on c.custid = o.custid;



#실습 5-41
select sum(saleprice) as 총매출
from customer as c
join `order` as o
on c.custid = o.custid
where c.name = '김연아';


#실습 5-42
select bookname
from book
order by price desc
limit 1;



#실습 5-43
select c.name
from customer as c
left join `order` as o
on c.custid = o.custid
where o.saleprice is null;

select * from customer;

#실습 5-44
insert into book (bookid, bookname, publisher) values ('11', '스포츠의학', '한솔의학서적');


#실습 5-45
update `customer` set address = '대한민국 부산' where `custid` = 5;


#실습 5-46
delete from customer where custid = 5; 



select * from customer;
select * from book;
select * from `order`;

