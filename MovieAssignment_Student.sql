--Week 3 Assignment – SQL -Movies

drop table if exists Movies
create table Movies
(No int not null,
Name varchar (50) null,
Type varchar (50) null,
Rating varchar (5) null,
Stars varchar (50) null,
Qty int not null, 
Price dec(10, 2) not null)

insert into Movies
(No,Name,Type,Rating,Stars,Qty,Price)
values
(1,'Gone With Wind','Drama','G','Gable',4,39.95),
(2,'Friday the 13th','Horror','R','Jason',2,60.95),
(3,'Top Gun','Drama','PG','Cruise',7,49.95),
(4,'Splash','Comedy','PG13','Hanks',3,29.95),
(5,'Independent Day','Drama','R','Turner',3,19.95),
(6,'Risk Business','Comedy','R','Cruise',2,44.95),
(7,'Cocoon','Sci-fi','PG','Ameche',2,31.95),
(8,'Crocodile','Comedy','PG13','Harris',2,69.95),
(9,'101 Dalmatians','Comedy','G','Hoffman',3,59.95),
(10,'Tootsie','Comedy','PG','Croft',1,29.95)

Select *
From Movies

--1 Find the total number of records available in the type which is Drama
Select Count (*) As TotalDrama
From Movies
Where [Type] = 'Drama'


--2 Display a list of all movies with price over 20 and sorted by price
Select *
From Movies 
Where [Price] > 20
Order by Price 


--3 Display all the movies sorted by QTY in decreasing order
Select *
From Movies 
Order by Qty Desc

--4 Display a report listing total by movie type, current value, and replacement value for each movie type.

Select 
        [Type], 
		Sum(Qty*Price) As Currentvalue,
		Sum(QTY*Price*1.15) As Replacementvalue
From Movies
Group by [Type]

			
--5 Calculate the replacement value for all movies as QTY*Price*1.15

Select [No], [Name], [Type], [Rating], [Stars], [Qty], [Price],
	   (QTY*Price*1.15) As 'Replacement value'
       From Movies 


--6 Count the number of movies where rating is not "G". 
Select Rating,
Count (*) As TotalCount 
From Movies
Where rating <> 'G'
Group by Rating 


--7 Insert a new movie in the table and make it Name:Nollywood, Type should be SuperStory, Ratings as R, Stars as Regina, Qty as 10 in Movie table were price > 30

Insert into Movies ([No],[Name],[Type],Rating,Stars,Qty,Price)
        Select Max([No]) + 1, 'Nollywood','SuperStory','R','Regina','10',Max(Price) + 1
		From Movies 
		Where [Price] > 30

Select *
From Movies