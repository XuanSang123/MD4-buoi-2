-- Quản lí sách
create database quanlisach;
drop database quanlisach;categoryauthor
use quanlisach;

-- bảng category
create table category (
        id int auto_increment primary key,
        name varchar(100) not null,
        status tinyint default(1) check(status in (0,1))
);

-- bảng Author 
create table Author(
        id int auto_increment primary key,
        name varchar(100) not null unique,
        totalBook int default(0)
);
-- Bảng book
create table BOOK(
       id int auto_increment primary key,
        name varchar(150) not null,
        status tinyint default(1) check(status in (0,1)) ,
        price float check(price >= 100000),
        createdDate datetime default(now()),
        categoryId int not null,
        authorId int not null
);

-- thêm khóa ngoại
ALter table book 
add foreign key(categoryId)  references category(id);
ALter table book 
add foreign key(authorId)  references author(id);


-- thêm dữ liệu 
insert into category(name) values
('Quan'),
('AO'),
('Trang Sức'),
('Quan tài'),
('Điện thoại');

insert into author(name)
value
('Mai Xuan Sang'),
('Huyn Cong Tinh'),
('Ho XUan Hung'),
('My Huyen'),
('My Tran');


insert into book(name,price,categoryId,authorId)
values
('Tiếng anh giao tiếp 1', 1000000, 1,2),
('Tiếng anh giao tiếp 2', 1000000, 1,2),
('Tiếng anh giao tiếp 3', 1000000, 1,2),
('Tiếng anh giao tiếp 4', 1000000, 1,2),
('Tiếng anh giao tiếp 5', 1000000, 1,2),
('Tiếng anh giao tiếp 6', 1000000, 1,2),
('Tiếng anh giao tiếp 7', 1000000, 1,2),
('Tiếng anh giao tiếp 8', 1000000, 1,2),
('Tiếng anh giao tiếp 9', 1000000, 1,2),
('Tiếng anh giao tiếp 10', 1000000, 1,2),
('Tiếng anh giao tiếp 11', 1000000, 1,2),
('Tiếng anh giao tiếp 12', 1000000, 1,2),
('Tiếng anh giao tiếp 13', 1000000, 1,2),
('Tiếng anh giao tiếp 14', 1000000, 1,2),
('Tiếng anh giao tiếp 15', 1000000, 1,2);

select * from book;
