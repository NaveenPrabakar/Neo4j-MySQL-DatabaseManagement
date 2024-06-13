-- author: Naveen Prabakar
-- Assignment 1.1

use assingmentone;

-- problem one
Select snum, ssn from students where name = 'Becky';

-- problem two
Select major.name, level from major, students 
where students.ssn = '123097834' 
and major.snum = students.snum;

-- problem three
Select name from Courses 
where department_code = 401;

-- problem four
Select name, level from degrees 
where department_code = 401;

-- problem five
Select students.name from students, minor 
where students.snum = minor.snum;

-- problem six
Select Count(minor.snum) from minor;

-- problem seven
Select students.name, students.snum 
from register, students 
where students.snum = register.snum
and course_number = 311;

-- problem eight
Select name, snum 
from students 
where students.dob = 
(select min(students.dob) from students);


-- problem nine
Select name, snum 
from students 
where students.dob = 
(select max(students.dob) from students);

-- problem ten
Select name, snum, ssn 
from students 
where name like '%n%' or '%N%';

-- problem eleven
Select name, snum, ssn 
from students 
where name not like '%n%' or '%N%';

-- problem tweleve
Select courses.name, register.course_number, COUNT(register.course_number)
from courses, register
where register.course_number = courses.number
group by courses.name, register.course_number;

-- problem thirteen
Select students.name  
from register, students
where regtime = 'Fall2020' and register.snum = students.snum;

-- problem fourteen
Select number, name 
from courses 
where department_code = 401;

-- problem fifteen
Select number, name 
from courses 
where department_code  = 401 or department_code = 404;











