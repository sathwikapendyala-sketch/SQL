create database cognizant;
use cognizant;
create table salary(
id int ,
name varchar(50),
salary int
);
insert into salary values(1,'A',5000),(2,'B',7000),(3,'C',6000),(4,'D',7000);
show tables;
select * from salary;
select distinct name,salary
from salary
order by salary desc
limit 1 offset 1;

select max(salary)
from salary
where salary not in(select max(salary)
from salary );

create table train(
train_id int,
train_name varchar(50),
train_to varchar(50)
);

insert into train values(101,'Mumbai Express','Delhi'),
(102,'Mahananda','Ranchi'),(103,'Mailseva Express','Ranchi'),(104,'Kolkata Express','Ranchi');

select train_name,train_to
from train
where train_name like 'M%' and train_to='Ranchi';

insert into train values(105,'Mahananda','Ranchi');
select * from train;
delete from train
where train_id=105;

delete 
from train
where train_id not in(select min(train_id)
from train 
group by train_name,train_to
);

create table employee(
id int,name varchar(50),salary int);

insert into employee values(1,'Rajesh','50000'),(1,'Ramu','70000'),(1,'Ramesh','90000'),(1,'Dhayniya','40000'),(1,'Eva','60000');	

select * from employee
where salary=(select min(salary)
from employee);

CREATE TABLE travel_routes (
    start_point VARCHAR(50),
    end_point VARCHAR(50),
    km_travelled INT
);

INSERT INTO travel_routes (start_point, end_point, km_travelled) VALUES
('Paris', 'London', 450),
('London', 'Paris', 450),
('Berlin', 'Rome', 800),
('Rome', 'Berlin', 800),
('New York', 'Chicago', 1200),
('Chicago', 'New York', 1200);

select * from travel_routes;

select distinct least(start_point,end_point) as start_point,
greatest(end_point,start_point) as end_point,km_travelled
from travel_routes;

CREATE TABLE matches (
    match_id INT PRIMARY KEY AUTO_INCREMENT,  -- optional ID column
    team1 VARCHAR(50),
    team2 VARCHAR(50),
    match_date DATE  -- optional, for additional context
);
INSERT INTO matches (team1, team2, match_date) VALUES
('TeamA', 'TeamB', '2024-01-01'),
('TeamC', 'TeamD', '2024-01-02'),
('TeamE', 'TeamF', '2024-01-03'),
('TeamG', 'TeamA', '2024-01-04'),
('TeamB', 'TeamC', '2024-01-05'),
('TeamD', 'TeamE', '2024-01-06'),
('TeamF', 'TeamG', '2024-01-07'),
('TeamA', 'TeamC', '2024-01-08'),
('TeamB', 'TeamD', '2024-01-09'),
('TeamE', 'TeamG', '2024-01-10'),
('TeamF', 'TeamA', '2024-01-11'),
('TeamC', 'TeamE', '2024-01-12'),
('TeamD', 'TeamF', '2024-01-13'),
('TeamG', 'TeamB', '2024-01-14'),
('TeamA', 'TeamD', '2024-01-15'),
('TeamC', 'TeamF', '2024-01-16'),
('TeamB', 'TeamE', '2024-01-17'),
('TeamG', 'TeamC', '2024-01-18'),
('TeamD', 'TeamG', '2024-01-19'),
('TeamE', 'TeamA', '2024-01-20'),
('TeamF', 'TeamB', '2024-01-21');

select * from matches;

select team1,team2,count(*) as count
from matches1
group by team1,team2
having count>=1;

CREATE TABLE matches1 (
    match_id INT PRIMARY KEY AUTO_INCREMENT,  -- optional ID column
    team1 VARCHAR(50),
    team2 VARCHAR(50),
    match_date DATE  -- optional, for additional context
);
INSERT INTO matches1 (team1, team2, match_date) VALUES
('TeamA', 'TeamB', '2024-01-01'),
('TeamC', 'TeamD', '2024-01-02'),
('TeamE', 'TeamF', '2024-01-03'),
('TeamA', 'TeamC', '2024-01-04'),
('TeamC', 'TeamA', '2024-01-10'),
('TeamB', 'TeamD', '2024-01-05'),
('TeamD', 'TeamB', '2024-01-12'),

-- Played once
('TeamF', 'TeamG', '2024-01-06'),

-- Played multiple times
('TeamA', 'TeamD', '2024-01-07'),
('TeamD', 'TeamA', '2024-01-14'),
('TeamA', 'TeamD', '2024-01-21'),

-- Played once
('TeamG', 'TeamB', '2024-01-08'),

-- Played multiple times
('TeamC', 'TeamE', '2024-01-09'),
('TeamC', 'TeamE', '2024-01-16')

-- Some pairs haven't played:
-- TeamF vs TeamA (no match)
-- TeamG vs TeamC (no match)
-- TeamE vs TeamB (no match)
-- TeamF vs TeamD (no match)
-- etc.
;
CREATE TABLE population_stats (
    id INT PRIMARY KEY,
    record_date DATE,
    population_count INT
);

INSERT INTO population_stats (id, record_date, population_count) VALUES
(1, '2001-03-12', 45000),
(2, '2001-11-25', 46000),
(3, '2002-04-18', 47000),
(4, '2002-09-10', 48000),
(5, '2003-01-10', 50000),
(6, '2003-02-15', 51000),
(7, '2004-01-20', 52000),
(8, '2004-03-25', 53000),
(9, '2005-01-05', 54000),
(10, '2005-02-08', 55000),
(11, '2005-06-15', 56000);

select * from population_stats;

select month(record_date) as month,avg(population_count) as avg_count
from population_stats
where year(record_date) between '2003' and '2005'
group by month;

CREATE TABLE college_branches (
    College_ID INT,
    Branch_Name VARCHAR(50),
    Num_Students INT,
    Year_Originated INT
);
INSERT INTO college_branches (College_ID, Branch_Name, Num_Students, Year_Originated) VALUES
(101, 'CSE', 250, 1995),
(102, 'ECE', 200, 1998),
(103, 'MECH', 180, 2000),
(104, 'CIVIL', 160, 2002);

CREATE TABLE annual_days (
    College_ID INT,
    Dept_Name VARCHAR(50),
    Annual_Day_Year INT,
    Times_Celebrated INT
);

INSERT INTO annual_days (College_ID, Dept_Name, Annual_Day_Year, Times_Celebrated) VALUES
(101, 'CSE', 2015, 3),
(102, 'ECE', 2016, 1),
(103, 'MECH', 2017, 2),
(104, 'CIVIL', 2018, 4),
(101, 'IT', 2019, 5);

select b.College_ID,a.Branch_Name,b.Dept_Name,b.Times_Celebrated as count1
from college_branches as a
join annual_days as b
on a.College_ID=b.College_ID
where b.Times_Celebrated > 2
order by b.Dept_Name asc;

show tables;



create table customer(
custid int primary key,
custname varchar(50) not null,
age int not null,
city char(50),
salary numeric
);

select * from customer;

insert into customer(custid,custname,age,city,salary) values(1,'vishwas',21,'Hyderabad',50000),(2,'prudhvi',20,'boduppal',30000);
insert into customer(custid,custname,age,city,salary) values(3,'teddy',25,'andhra',45000);

update customer
set custname='kanna'
where custid=1;

alter table customer
rename column custid to Custid;

alter table customer
modify salary int;

alter table customer
add legit boolean;

alter table customer
drop column legit;

delete from customer
where Custid=3;

truncate table customer;

drop table customer;

CREATE TABLE worker (
    worker_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department VARCHAR(50),
    joining_date DATE
);

select * from worker;

INSERT INTO worker (worker_id, first_name, last_name, salary, department, joining_date)
VALUES
(1, 'John', 'Doe', 200000, 'HR', '2014-02-15'),
(2, 'Jane', 'Smith', 450000, 'Finance', '2014-02-20'),
(3, 'Michael', 'Johnson', 300000, 'IT', '2013-11-11'),
(4, 'Linda', 'Taylor', 50000, 'Marketing', '2015-06-01'),
(5, 'Chris', 'Brown', 100000, 'IT', '2014-02-25'),
(6, 'Sarah', 'Davis', 700000, 'HR', '2012-09-17'),
(7, 'David', 'Wilson', 300000, 'Finance', '2014-02-10');

update worker
set first_name='Lindas'
where worker_id=4;



select * 
from worker
order by first_name;

select * 
from worker
where first_name like '%a%';

select * from worker
where first_name like '%s' and length(first_name)=6;

select * from worker
where salary between 100000 and 500000;

select * 
from worker
where month(joining_date)=2 and year(joining_date)=2014;

select department,count(worker_id) as count
from worker
group by department 
order by count desc;

select now();

select *
from worker
order by salary desc
limit 5;

select distinct salary
from worker
order by salary desc
limit 1 offset 4;

select distinct salary
from worker w1
where(
select count(distinct salary)
from worker w2
where w2.salary>w1.salary
)=4;

select first_name,salary
from worker
where salary=(
select distinct salary
from worker
order by salary desc
limit 1 offset 4
);

select w1.first_name,w1.salary,w2.first_name
from worker w1
join worker w2
on w1.salary=w2.salary
and w1.worker_id<w2.worker_id;      -- actual meaning except itself while self join      < pedthe duplicate pairs pothay     <> pedthe untay


	select department
	from worker
	group by department
	having count(worker_id)<=4;

select department,count(worker_id)
from worker
group by department;

select replace(first_name,'a','A') as firstname
from worker;


select * from worker;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (name, age, department, salary) VALUES
('Alice Johnson', 28, 'HR', 45000.00),
('Bob Smith', 35, 'Engineering', 75000.00),
('Charlie Davis', 30, 'Sales', 55000.00),
('Diana Clark', 40, 'Marketing', 60000.00),
('Ethan Lewis', 25, 'Support', 40000.00),
-- Duplicate names
('Bob Smith', 29, 'Support', 42000.00),
('Alice Johnson', 32, 'Engineering', 70000.00),
('Charlie Davis', 27, 'HR', 48000.00);

select name,count(*) as time_repeated
from employees
group by name
having count(*)>1;

select *
from employees
order by salary desc
limit 3;

alter table employees
add column job_title varchar(50) not null;

select * from employees;

insert into employees(job_title)values('testing'),('development'),('development'),('testing'),('development'),('testing'),('development'),('testing');
delete from employees
where job_title in('development','testing');

update employees
set job_title='testing'
where id in(1,2,3,4);

update employees
set job_title='development'
where id in(5,6,7,8);

select job_title,avg(salary) as "avg salary"
from employees
group by job_title;

delete from employees
where salary<50000;

drop table employees;

update employees 
set salary=1.1*salary
where department='Support';
