--Lesson 2
--How to remove a table from a database
Drop Table if exists Noble
--How to create a table 
Create Table Noble
(
[Year] int not Null,
[Subject] varchar (50) Null,
[Winner] varchar (50) Null
)

--Checking data from the table
Select *
From Noble

--How to Load data to a table
Insert into Noble 
(
[Year],
[Subject],
[Winner]
)
Values
(1960,'Chemistry','Bob'),
(1961,'Physics','Jude'),
(1962,'Geography','Jason'),
(1963,'Economics','Stella'),
(1964,'Mathematics','Joe'),
(1965,'English','Diana'),
(1966,'Law','Trump'),
(1967,'Medcine','Biden'),
(1968,'Commerce','Charles'),
(1969,'Literature','Ben')

Select *
From Noble


--Crud (Create, Read (Select), Update, Delete)

--How to update a record in a table
Update Noble
Set [Subject] = 'Biology'
Where Winner = 'Trump'

--How to Delete records in the table 
Delete
From Noble
Where Winner ='Trump'

Assignment
