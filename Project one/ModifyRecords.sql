-- author: Naveen Prabakar
-- Assignment 1.1

use assingmentone;

-- problem one
update students
set name = 'Scott'
where ssn = '746897816';

-- problem two
update major, students
set major.name = 'Computer science', major.level = 'MS'
where students.ssn = '746897816' and students.snum = major.snum;

-- problem three
delete from register
where regtime = 'Spring2021' and course_number >= 0;




