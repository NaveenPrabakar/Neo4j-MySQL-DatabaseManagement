use assingmentone;
SET GLOBAL local_infile = 1;

-- directly uploaded the csv files into the MySql uploads folder
-- Paste the CSV files in this directory, otherwise change as needed to make the loading work

Select @@secure_file_priv; -- put all csv files through this directory

-- 'C:/ProgramData/MySQL/MySQL Server 8.3/Uploads/user.csv' (How I imported the CSV files)

Load data local infile 'user.csv' -- change directory to whatever you need it to be
into table Users
fields terminated by ';'
enclosed by '"'
Lines terminated by '\n'
IGNORE 1 ROWS;

Load data local infile 'tweets.csv' -- change directory to whatever you need it to be
into table Tweet
fields terminated by ';'
enclosed by '"'
Lines terminated by '\n'
IGNORE 1 ROWS;

Load data local infile 'mentioned.csv' -- change directory to whatever you need it to be
into table Mentioned
fields terminated by ';'
enclosed by '"'
Lines terminated by '\n'
IGNORE 1 ROWS;

Load data local infile 'urlused.csv' -- change directory to whatever you need it to be
Ignore -- Ignores duplicates, since the data has duplicates
into table URL
fields terminated by ';'
enclosed by '"'
Lines terminated by '\n'
IGNORE 1 ROWS
(@dummy, address);

Load data local infile 'tagged.csv' -- change directory to whatever you need it to be
Ignore -- Ignores duplicates, since the data has duplicates
into table HashTag
fields terminated by ';'
enclosed by '"'
Lines terminated by '\n'
IGNORE 1 ROWS
(@dummy, hname);


Load data local infile 'urlused.csv' -- change directory to whatever you need it to be
into table hasURL
fields terminated by ';'
enclosed by '"'
Lines terminated by '\n'
IGNORE 1 ROWS
(tid, url);

Load data local infile 'tagged.csv' -- change directory to whatever you need it to be
into table hasTag
fields terminated by ';'
enclosed by '"'
Lines terminated by '\n'
IGNORE 1 ROWS
(tid, hastagname);




