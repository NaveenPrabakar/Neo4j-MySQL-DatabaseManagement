-- author: Naveen Prabakar
-- Assignment 1.1


-- drops database if it already exists
drop database if exists assingmentone;
create database assingmentone;
use assingmentone;

-- Creates table for students
Create Table students(
snum integer,
ssn integer,
name varchar(10),
gender varchar(1),
dob datetime,
c_addr varchar(20),
c_phone varchar(10),
p_addr varchar(20),
p_phone varchar(10),

Primary Key(ssn),
unique(snum)
);


-- Creates Table for departments
Create Table departments(

code integer,
name varChar(50),  
phone varchar(10),
college varchar(20),

Primary key(code),
unique(name)

);


-- creates table for degrees
Create Table Degrees(

name varchar(50),
level varchar(5),
department_code integer,

Primary key(name, level),
foreign key(department_code)
  references departments(code)
);


-- creates table for courses
Create Table Courses(

number integer,
name varchar(50),
description varchar(50),
credithours integer,
level varchar(20),
department_code integer,

Primary key(number),
unique(name),

foreign key(department_code)
references departments(code)

);


-- creates table for register
Create Table register(
snum integer,
course_number integer,
regtime varchar(20),
grade integer,

Primary key(snum, course_number),

foreign key(snum) references students(snum),

foreign key(course_number) references courses(number)
);


-- creates table for major
Create Table major(
snum integer,
name varchar(50),
level varchar(5),

Primary key(snum, name, level),

foreign key(snum) references students(snum),

foreign key(name, level) references degrees(name, level)

);


-- creates table for minor
Create Table minor(

snum integer,
name varchar(50),
level varChar(5),

Primary key(snum, name, level),

foreign key(snum) references students(snum),

foreign key(name, level) references degrees(name, level)

);


