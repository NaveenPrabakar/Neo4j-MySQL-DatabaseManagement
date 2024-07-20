-- author: Naveen Prabakar
-- Assignment 3.2

-- drops database if it already exists
drop database if exists assingmentone;
create database assingmentone;
use assingmentone;


-- Create table for users
Create Table Users(

Screen_name varchar(200),
name varchar(30),
subcategory varchar(50),
category varchar(50),
ofstate varchar(20),
numFollowers integer,
numFollowing integer,


primary key(Screen_name)
);

-- Create table for Tweet
Create Table Tweet(
tid varCHar(100),
textbody varChar(200),
retweet_count integer,
retweeted integer,
posted datetime,
posting_user varChar(30),
primary key(tid)
);

-- Create table for HashTag
Create Table HashTag(
hname varchar(300),
primary key(hname)
);

-- Create table for URL
Create Table URL(
address varchar(500),
primary key(address)
);

-- Create table for mention
Create Table Mentioned(
tid varchar(300),
screen_name varchar(300),
primary key(tid, screen_name),
foreign key(screen_name) references Users(Screen_name),
foreign key(tid) references Tweet(tid)
);

Create Table hasURL(
tid varchar(200),
url varchar(500),
primary key(tid, url),
foreign key(tid) references Tweet(tid),
foreign key(url) references URL(address)
);

Create Table hasTag(
tid varchar(200),
hastagname varchar(400),
primary key(tid, hastagname),
foreign key(tid) references Tweet(tid),
foreign key(hastagname) references HashTag(hname)
);







