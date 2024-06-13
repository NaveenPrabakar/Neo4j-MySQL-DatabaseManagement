//If nothing appears when all the queries are run, run the queries one by one and the results will appear

//Query one
Match(s:students {name:'Becky'}) Return s.snum, s.ssn;


//Query2
Match(s:students {ssn: 123097834})-[:majoring]->(:major)-[:majoring]->(deg:degrees) return deg.name, deg.level;


//Query3
Match(dep:departments{dcode:401})-[:offered]->(cou:Courses) return cou.name;

//Query 4
Match(dep:departments{dcode:401})-[:administer]->(deg:degrees) return deg.name, deg.level;

//Query 5
Match(stu:students)-[:minoring]->(m:minor) return stu.name;


//Query 6
Match(mi:minor) return Count(mi);

//Query 7
Match(cou:Courses{name:'Algorithm'})<-[:registered]-(reg:register)<-[:registered]-(stu:students) return stu.name, stu.snum;

//Query8
Match(n:students) return n.name,n.snum order by n.dob asc limit 1 ;

//Query9
Match(n:students) return n.name,n.snum order by n.dob desc limit 1 ;


//Query10
Match(stu:students) where stu.name contains 'n' or stu.name contains 'N' return stu.name,stu.snum,stu.ssn;



//Query11
Match(stu:students) where (not (stu.name contains 'n')) and (not (stu.name contains 'N' ))return stu.name,stu.snum,stu.ssn;


//Query12
Match(cou:Courses)<-[:registered]-(r:register)<-[:registered]-(s:students) return cou.name,cou.number,Count(cou.number);


//Query13
Match(reg:register{regtime:'Fall2020'})<-[:registered]-(stu:students) return stu.name;

//Query14
Match(dep:departments{dcode:401})-[:offered]->(c:Courses) return c.name,c.number;


//Query15
Match(dep:departments)-[:offered]->(cou:Courses) where dep.dcode = 401 or dep.dcode = 404 return cou.number, cou.name;

