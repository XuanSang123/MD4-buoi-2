create database company;
drop database company;
drop database bt1_ss2;
drop database baitap1;
use company;

CREATE TABLE department (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE CHECK (length(name) > 6)
);

create table levels(
id int primary key auto_increment,
name varchar(100) not null unique,
basicsalary float not null check(basicsalary>=3500000),
AllowanceSalary	Float default(500000)
);

CREATE TABLE employee (
    id INT PRIMARY KEY auto_increment,
    name VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE CHECK (email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,}$'),
    phone VARCHAR(50) NOT NULL UNIQUE,
    address VARCHAR(255),
    gender TINYINT NOT NULL CHECK (gender IN (0 , 1, 2)),
    birthday date not null,
    LevelId int not null,
    DepartmentId int not null
);

create table timesheets(
id int primary key auto_increment,
AttendanceDate date not null default(now()),
employeeid int not null,
value float not null default(1) check(value in(0,0.5,1))
);

create table salary(
id int primary key auto_increment,
employeeid int not null,
bonussalary float default(0),
insurance float not null 
);

-- thêm khóa ngoại;
alter table employee add foreign key (LevelId) references levels(id) ;
alter table employee add foreign key (DepartmentId) references department(id);
alter table timesheets add foreign key (employeeid) references employee(id);
alter table salary add foreign key (employeeid) references employee(id);


insert into department(name) values ('mai xuan sang'),('thai ngoc phat'),('nguyen tran thanh quang'),('mỹ tran'),('my huyen'),('minh anh');
insert into levels(name,basicsalary,AllowanceSalary) values ('sang',4000000,1000000),('phat',70000000,5000000),('quang',10000000,2000000);
insert into employee (name,email,phone,address,gender,birthday,LevelId,DepartmentId) values('ngoc','ngoc@gmail.com','123123132','HCM',1,'1900-10-10',1,2),('sang','sang@gmail.com','124123132','HCM',1,'1900-10-10',2,2);
insert into timesheets(AttendanceDate,employeeid) values('2024-08-26',3),('2024-08-26',4);
insert into salary(insurance,employeeid) values (1000000,3),(200000,4);

-- show database;
select * from employee;
select * from department;
select * from levels;
select* from timesheets;
select * from salary;
drop table employee;
drop table department;
drop table levels;
drop table Timesheets;
drop table salary;
