//Made extra table for posted, since tweet has foreign key to User
// I wasn't sure if posted was datetime or not, but I picked datetime since the csv file was in datetime
//Used collect as the group_concat library

//Problem 1
Match(user:User)-[:Posted]->(twe:Tweet) where datetime({year:2016}) <= twe.posted < datetime({year:2017}) return twe.retweet_count, twe.textbody, user.Screen_name, user.category, user.sub_category order by twe.retweet_count desc limit 10;


//Problem 2
Match (user:User)-[:Posted]->(twe:Tweet)-[:hasTag]->(hash:Hashtag) where datetime({year: 2016}) <= twe.posted < datetime({year: 2017}) and not (user.ofstate = 'na') return hash.hastagname, count(distinct user.ofstate), collect(distinct user.ofstate) order by count(distinct user.ofstate) desc limit 10;


//Problem 3
Match(user:User)-[:Posted]->(twe:Tweet)-[:hasTag]->(hash:Hashtag) where hash.hastagname = "iowacaucus" or hash.hastagname = 'iacaucus' return user.Screen_name, user.ofstate order by user.numFollowers desc;


//problem 4, works seperately
Match(user:User{sub_category:'GOP'})  return user.Screen_name, user.category, user.numFollowers order by user.numFollowers desc limit 5;


Match(users:User{sub_category:'Democrat'}) return users.Screen_name, users.category, users.numFollowers order by users.numFollowers desc limit 5;


//Number five
Match(user:User)-[:Posted]->(twe:Tweet)-[:hasTag]->(hash:Hashtag) where user.ofstate in ['Iowa', 'IA'] and datetime(twe.posted).year = 2016 and datetime(twe.posted).month = 1 return distinct hash.hastagname, count(twe) order by count(twe) desc;


//Number 6
Match(user:User)-[:Posted]->(twe:Tweet)-[:hasTag]->(hash:Hashtag{hastagname: 'Iowa'}) where user.sub_category =  'GOP' or user.sub_category = 'Democrat' and datetime(twe.posted).year = 2016 and datetime(twe.posted).month = 2 return twe.textbody, hash.hastagname, user.Screen_name, user.sub_category;


//Number 7
Match(user:User {sub_category: 'GOP'})-[:Posted]->(twe:Tweet)-[:hasURL]->(u:URL) where datetime(twe.posted).year = 2016 and datetime(twe.posted).month = 1 return user.Screen_name, count(twe), collect(u.url) order by count(twe) desc;


//Number 8 
Match(twe:Tweet)-[:Mentions]->(user:User) return user.Screen_name, user.numFollowers, count(distinct twe) order by count(distinct twe) desc limit 10;

//Number 9
Match(user:User {sub_category: 'GOP'})-[:Posted]->(twe:Tweet)-[:hasURL]->(u:URL) where  datetime(twe.posted).year = 2016 and datetime(twe.posted).month in [1,2,3] return u.url, count(twe) order by count(twe) desc limit 10;



