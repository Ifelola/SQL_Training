--Assignment 1 -  Week 2:

--Create table named Games
drop table if exists Games
create table Games
(
year int not null,
City varchar (50) null
)
 --Insert values to the Games table
insert into Games
(
year,
City
)
values
(2000, 'Sydney'),
(2004, 'Athens'),
(2008, 'Beijing'),
(2012, 'London')

--Display the Games table
select *
from Games

--Write SQL Queried to answer the questions below:


--1: Show the year 2004

Select *
From Games
where year ='2004'

--2: Show the city of london

Select *
From Games
where City ='London'


--3: Show the latest year in the games table

Select Max (year) AS latest_year
From Games 


--4: Add the next olympic games in the year 2024, which will be held in the city of Paris
Insert into Games
(year, City)
Values
(2004, 'Paris')

--5: Create a view named vwOldGames to only include records showing year before 2008

Create View vwOldGames As
Select * 
From Games 
Where year < 2008

--6: Check the view vwOldGames

Select *
from  vwOldGames

--7: Show the number of records in the Games table

Select Count (*) AS Numberofrecords
From Games

--8: Write a query which result to exclude London and Athens
Delete
From Games
Where City =('London' 'Athens')
 
