//Students
Load CSV with headers from "https://www.dropbox.com/scl/fi/528c4oadlq9mwrdnsamci/students.csv?rlkey=tla1gah01pk8bz4wttcdxqssi&dl=1"As row Create(n:students) Set n = row, n.snum=toInteger(row.snum), n.ssn=toInteger(row.ssn),n.name = row.name, n.gender = row.gender, n.dob = datetime(row.dob), n.c_addr = row.c_addr, n.c_phone = row.c_phone, n.p_addr = row.p_addr, n.p_phone=toInteger(row.p_phone);
create constraint constraint2 for (n:students) require n.ssn is unique; 


//Departments
Load CSV with headers From "https://www.dropbox.com/scl/fi/rc80l7w1rxjqxxi21f5ak/departments.csv?rlkey=7qiy2tcsnfum1vhkeqvjsg54a&dl=1" As row Create(n:departments) Set n = row,n.dcode=toInteger(row.dcode),n.name = row.name,n.phone=toInteger(row.phone),n.college = row.college;
create constraint constraint3 for (n:departments) require n.code is unique; 


//Courses
Load CSV with headers From "https://www.dropbox.com/scl/fi/yj8b4spn6uuju7sys80l5/courses.csv?rlkey=ilhhuz6kftcq50zw8m76dyhol&dl=1"As row Create(m:Courses{number: toInteger(row.number),name:row.name, description: row.description, credithours: toInteger(row.credithours), level:row.level}) with m,row Match(dep:departments{dcode:toInteger(row.dcode)})  CREATE (m)<-[:offered]-(dep);
create constraint constraint1 for (n:Courses) require n.number is unique;

//degrees
Load CSV with headers From "https://www.dropbox.com/scl/fi/hijen8a9s34f5axien745/degrees.csv?rlkey=lzrat36ihevnyzy6zgkqvrsfj&dl=1" As row Create (n:degrees{name:row.name,level:row.level}) with n, row Match(dep:departments{dcode:toInteger(row.dcode)}) CREATE (n)<-[:administer]-(dep);
create constraint constraint4 for (n:degrees) require( n.name, n.level) is unique;

//register
Load CSV with headers from "https://www.dropbox.com/scl/fi/jih269kip8hfxks3682l0/register.csv?rlkey=1u5ruom1brm67d9c11wpv2ox9&dl=1" As row Create(n:register{regtime:row.regtime,grade:toInteger(row.grade)}) with n,row Match(stu:students{snum:toInteger(row.snum)}) Create(stu)-[:registered]->(n) with n,row Match(cou:Courses{number:toInteger(row.course_number)}) CREATE (n)-[:registered]->(cou);
create constraint constraint5 for (n:register) require(n.snum,n.course_number) is unique; 

//major
Load CSV with headers From "https://www.dropbox.com/scl/fi/ye9imcn7kmasnpch4t6u9/major.csv?rlkey=hx1sgsmkih81ehr8juewai9yo&dl=1" As row Create(n:major) with n, row Match(stu:students{snum:toInteger(row.snum)})CREATE (n)<-[:majoring]-(stu) with n,row Match(deg:degrees{name:row.name, level:row.level})CREATE (n)-[:majoring]->(deg);
create constraint constraint6 for (n:major) require(n.snum,n.name,n.level) is unique; 


//minor
Load CSV with headers From "https://www.dropbox.com/scl/fi/ckwqased76dedamflxv95/minor.csv?rlkey=z8zyl5ld7reip0a3tg70tjbk8&dl=1"As row Create(n:minor) with n, row Match(stu:students{snum:toInteger(row.snum)})CREATE (n)<-[:minoring]-(stu) with n,row Match(deg:degrees{name:row.name, level:row.level})CREATE (n)-[:minoring]->(deg);
create constraint constraint7 for (n:minor) require(n.snum,n.name,n.level) is unique;








