--  Exercise 1 

-- Create a database schema for the online consultation and therapy website. The database should contain the following tables:-

-- Doctor table:- The table should contain the attributes such as id, name, specialization, etc.

-- Appointments table:- The table should contain information related to appointments set up by doctors and patients.

-- Patient table:- The table should contain information on patients.

-- Reviews table:- This table should contain reviews posted by patients.


-- solution

 
-- creating database for online consultation and therapy.
create database online_consultation_and_therapy;

-- creating table for doctor information.
create table Doctor(Doctor_id int primary key not null,
Doctor_name varchar(40) not null,
age int not null,
gender varchar (10) not null,
specialization varchar(30) not null,
doctor_mobile int(16) not null,
address varchar (35) not null
);


-- creating table for appointment details of the patients and doctors.
create table Appointments(Appointment_id int(20) primary key not null,
Doctor_name varchar(40) not null,
Doctor_id int not null,
patient_name varchar(30) not null,
patient_id int not null,
date date not null,
time  time not null,
patient_mobile int not null,
conformation_status varchar(10) not null);

-- creating Patient table containing information of patients.
create table Patient(patient_id int(20) primary key not null,
patient_name int(40) not null,
age int(10) not null,
gender varchar(10) not null,
address varchar(40) not null,
mobile_no int(15) not null,
consultant varchar(40) not null
);
drop table patient;

-- creating tableReviews table containing reviews posted by patients.
create table Reviews(patient_name varchar(35) not null,
patient_id int not null,
consultant_name varchar(40) not null,
appointment_id int(20) not null,
review varchar(200) not null,
review_date date not null
);


select * from appointments;
select * from doctor;
select * from patient;
select * from reviews;




--  Exercise 2 

-- for the given table writing the queries

create table Contact_Table(id int primary key not null,
Email varchar(30) ,
fname varchar(20),
lname varchar(20),
company varchar(40),
Active_flag boolean default true,
opt_out boolean default true
);
select * from contact_table;
drop table contact_table;
insert into Contact_table values(123,"a@a.com","Kian","Seth","ABC",true,true);
insert into Contact_table values(133,"b@a.com","Neha","Seth","ABC",true,false);
insert into Contact_table values(234,"c@c.com","Puru","Malik","CDF",false,false);
insert into Contact_table values(342,"d@d.com","Sid","Maan","TEG",true,false);

--  ------|-----------|---------|-------------|-------------|-------------|---------|
--  |id   |	Email	  |	fname	|	lname	  |	company		|Active_flag  |	opt_out |
--  |-----|---------- |---------|-------------|-------------|-------------|---------|
--  | 123 |	a@a.com	  |	Kian	|    Seth	  |ABC			|	1		  |	1		|
--  | 133 |	b@a.com	  |	Neha	|    Seth	  |ABC			|	1		  |	0		|
--  | 234 |	c@c.com	  |	Puru	|    Malik	  |CDF			|	0		  |	0		|
--  | 342 |	d@d.com	  |Sid		|    Maa	  |TEG			|	1		  |	0		|
-- -------|---------- |---------|-------------|-------------|-------------|---------|


-- 1.Select all columns from the contact table where the active flag is 1
select * from Contact_table where active_flag=true;

-- 2.Deactivate contacts who are opted out 
UPDATE contact_table SET opt_out=false WHERE opt_out=true;

-- 3.Delete all the contacts who have the company name as ‘ABC’
delete from contact_table where company="ABC";

-- 4.Insert a new row with id as 658, name as ‘mili’, email as ‘mili@gmail.com’, the company as ‘DGH’, active flag as 1, opt-out flag as 1
insert into contact_table(id,fname,email,company,active_flag,opt_out) values(658,"mili","mili@gmail.com","DGH",true,true);

-- 5.Pull out the unique values of the company column 
select distinct company from contact_table;
-- 6.Update name “mili” to “niti”.
update contact_table set fname="niti" where fname="mili";

select * from contact_table;



-- Exercise 3

-- Sample table: customer

-- customer_id |   cust_name    |    city    | grade | salesman_id 

-- -------------+----------------+------------+-------+-------------

--         3002 | Nick Rimando   | New York   |   100 |        5001

--         3007 | Brad Davis     | New York   |   200 |        5001

--         3005 | Graham Zusi    | California |   200 |        5002

--         3008 | Julian Green   | London     |   300 |        5002

--         3004 | Fabian Johnson | Paris      |   300 |        5006

--         3009 | Geoff Cameron  | Berlin     |   100 |        5003

--         3003 | Jozy Altidor   | Moscow     |   200 |        5007

--         3001 | Brad Guzan     | London     |       |        5005





-- Sample table: salesman

--  salesman_id |    name    |   city   | commission  

-- -------------+------------+----------+------------

--         5001 | James Hoog | New York |       0.15

--         5002 | Nail Knite | Paris    |       0.13

--         5005 | Pit Alex   | London   |       0.11

--         5006 | Mc Lyon    | Paris    |       0.14

--         5007 | Paul Adam  | Rome     |       0.13

--         5003 | Lauson Hen | San Jose |       0.12

-- Write a SQL query to find those customers with a grade less than 100.
-- It should return cust_name, customer city, grade, salesman, and salesman city. The result should be ordered by ascending customer_id.


create table customer(customer_id int,cust_name varchar(30),city varchar(33) ,grade int,salesman_id int);
insert into customer values(3002,"Nick Rimando","New York",100,5001);
insert into customer values(3007,"Brad Davis","New York",200 ,5001);
insert into customer values(3005,"Graham Zusi","California",200,5002);
insert into customer values(3008,"Julian Green","London",300,5002);
insert into customer values(3004,"Fabian Johnson","Paris",300,5006);
insert into customer values(3009,"Geoff Cameron","Berlin",100,5003);
insert into customer values(3003,"Jozy Altidor","Moscow ",200,5007);
insert into customer(customer_id,cust_name,city,salesman_id) values(3001,"Brad Guzan" ,"London",5005);

truncate table customer;
create table salesman(salesman_id int,name varchar(33),city varchar(40),commission float); 
insert into salesman values(5001,"James Hoog","New York",0.15);
insert into salesman values(5002,"Nail Knite", "Paris",0.13);
insert into salesman values(5005,"Pit Alex","London",0.11);
insert into salesman values(5006,"Mc Lyon","Paris" ,0.14);
insert into salesman values(5007,"Paul Adam","Rome" , 0.13);
insert into salesman values(5003,"Lauson Hen","San Jose",0.12);


select * from customer;
select * from salesman;
select customer.cust_name,customer.city as customer_city,customer.grade,salesman.name as salesman,salesman.city from customer 
left join salesman on customer.salesman_id=salesman.salesman_id order by customer.customer_id asc;