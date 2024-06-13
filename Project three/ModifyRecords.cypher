//problem1
Match(stu:students{ssn:746897816}) set stu.name = 'Scott';

//problem2
Match(stu:students{name: 'Scott'})-[:majoring]->(m:major)-[:majoring]->(deg:degrees) set deg.level = 'MS', deg.name = 'computer science';

//problem3
Match(reg:register{regtime:'Spring2021'}) detach Delete (reg);

