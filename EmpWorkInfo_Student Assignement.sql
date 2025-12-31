drop table if exists EmpWorkInfo
create table EmpWorkInfo
(
id int not null, 
Name varchar(50), 
Position varchar(50) null, 
SocialSecurity int not null, 
DistanceFromHome varchar(50), 
Department varchar(50)
) 

insert into EmpWorkInfo
(id,Name,Position,SocialSecurity,DistanceFromHome,Department)
 values
(1,'Usama','Junior Engineer',222222222,20,'Marketing'),
(2,'Safwan','Junior Engineer',333333333,8,'Finance'),
(3,'Gulraiz','Senior Engineer',444444444,15,'Finance'),
(4,'Ayesha','Intern',888888888,32,'Technical'),
(5,'Anas','Intern',987654321,25,'Marketing'),
(6,'Areeha','Junior Engineer',444444444,6,'Finance'),
(7,'Raza', 'Senior Engineer',123456789,23,'Technical'),
(8,'Eeman','Senior Engineer',080808080,53,'Technical'),
(9,'Faseeh', 'Senior Engineer',343434343,36,'Finance'),
(10,'Hassan','Junior Engineer',565665656,20,'Marketing')

SELECT *
FROM EmpWorkInfo;

--1 EMPLOYEES HAVING 0-10 , MILES FROM HOME SHOULD BE CATEGORIZED AS POOR, 20 AND BELOW AS GOOD,  BELOW 30 THEN BETTER, ELSE BEST

Select [id], [Name], [Position], [SocialSecurity], [DistanceFromHome], [Department],
Case 
When [DistanceFromHome] <= 10 Then 'POOR'
When [DistanceFromHome] <= 20 Then 'GOOD'
When [DistanceFromHome] <= 30 Then 'BETTER'
Else 'BEST'
End AS Grade
From EmpWorkInfo
Order By DistanceFromHome Asc


--2 Show records having position for all the Senior Engineer

Select[id], [Name], [Position], [SocialSecurity], [DistanceFromHome], [Department]
From EmpWorkInfo
Where Position = 'Senior Engineer'

--3 Write a query to show the people in the technical department

Select [Name] 
From EmpWorkInfo
Where Department = 'Technical'
Group by [Name]


--4 Write a query to show the highest distanceFromHome. 
--Note: Please include all the fields like ID, Name, Position, SocialSecurity, distanceFromHome, Department

Select  [id], [Name], [Position], [SocialSecurity], [DistanceFromHome], [Department]
From EmpWorkInfo
           Where DistanceFromHome = (select Max(DistanceFromHome) AS highest_distance 
		   From EmpWorkInfo )


--5 Write a query to show the highest distanceFromHome. 
--Note: Please include all the fields like ID, Name, Position, SocialSecurity, distanceFromHome, Department
