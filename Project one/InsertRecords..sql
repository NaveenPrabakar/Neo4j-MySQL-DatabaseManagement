-- author: Naveen Prabakar
-- Assignment 1.1

use assingmentone;

-- Inserting data into table, students
Insert Into students(snum, ssn, name, gender, dob, c_addr, c_phone, p_addr, p_phone)
Value(1001, 654651234, 'Randy'	, 'M', "2000-12-01", '301 E Hall', '5152700988', 
'121 Main', '7083066321'),
(1002, 123097834, 'Victor',	'M'	, "2000-05-06",	'270 W Hall', '5151234578', '702 Walnut', '7080366333'),
(1003, 978012431, 'John',	'M',"1999-07-08", '201 W Hall',	'5154132805', '888 University', '5152012011'),
(1004, 746897816,'Seth','M'	, "1998-12-30",	'199 N Hall', '5158891504', '21 Green', '5154132907'),
(1005, 186032894, 'Nicole',	'F',"2001-04-01", '178 S Hall',	'5158891155', '13 Gray', '5157162071'),
(1006, 534218752,'Becky', 'F', "2001-05-16", '12 N Hall', '5157083698', '189 Clark', '2034367632'),
(1007, 432609519, 'Kevin',	'M', "2000-08-12", '75 E Hall',	'5157082497', '89 National', '7182340772');

-- Inserting data into table, departments
Insert Into departments(code, name, phone, college)
Value(401, 'Computer Science', '5152982801', 'LAS'),
(402, 'Mathematics', '5152982802', 'LAS'),
(403, 'Chemical Engineering', '5152982803', 'Engineering'),
(404, 'Landscape Architect', '5152982804', 'Design');

-- Inserting data into table, Degrees
Insert Into Degrees(name, level, department_code)
Value('Computer Science', 'BS', 401),
('Software Engineering', 'BS', 401),
('Computer Science', 'MS', 401),
('Computer Science', 'PhD', 401),
('Applied Mathematics', 'MS', 402),
('Chemical Engineering', 'BS', 403),
('Landscape Architect', 'BS', 404);

-- Inserting data into table, Courses
Insert Into Courses(number, name, description, credithours, level, department_code)
Value(113, 'Spreadsheet', 'Microsoft Excel and Access' ,3, 'Undergraduate', 401),
(311, 'Algorithm', 'Design and Analysis', 3, 'Undergraduate', 401),
(531, 'Theory of Computation', 'Theorem and Probability',3, 'Graduate', 401),
(363, 'Database', 'Design Principle', 3, 'Undergraduate',401),
(412, 'Water Management', 'WaterManagement',3, 'Undergraduate',404),
(228, 'Special Topics', 'Interesting Topics about CE',3, 'Undergraduate', 403),
(101, 'Calculus', 'Limit and Derivative',4, 'Undergraduate',402);

-- Inserting data into table, Register
Insert Into register(snum, course_number, regtime, grade)
Value(1001, 363, 'Fall2020', 3),
(1002, 311, 'Fall2020', 4),
(1003, 228, 'Fall2020', 4),
(1004, 363, 'Spring2021', 3),
(1005, 531, 'Spring2021', 4),
(1006, 363, 'Fall2020', 3),
(1007, 531, 'Spring2021', 4);

-- Inserting data into table, minor
Insert Into minor(snum, name, level)
Value(1007, 'Applied Mathematics', 'MS'),
(1005, 'Applied Mathematics', 'MS'),
(1001, 'Software Engineering', 'BS');


-- Inserting data into table, major
Insert Into major(snum, name, level)
Value(1001, 'Computer Science', 'BS'),
(1002, 'Software Engineering', 'BS'),
(1003, 'Chemical Engineering','BS'),
(1004, 'Landscape Architect', 'BS'),
(1005, 'Computer Science' , 'MS'),
(1006, 'Applied Mathematics', 'MS'),
(1007, 'Computer Science' , 'PhD');

