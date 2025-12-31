drop table if exists Business
--Create table Business
create table Business
(
ID int not null,
[NAME] varchar (50) null,
AGE int not null,
[ADDRESS] varchar (50) null,
SALARY int not null
)

--Load data
insert into Business
(
ID,
[NAME],
AGE,
[ADDRESS],
SALARY
)

values
(1, 'Ramesh', 32, 'Ahmedabad', 2000),
(2, 'Khilan', 25, 'Delhi', 1500),
(3, 'Kaushik', 23, 'Kota', 2000),
(4, 'Chaitali', 25, 'Mumbai', 6500),
(5, 'Hardik', 27, 'Bhopal', 8500),
(6, 'Komal', 22, 'MP', 4500),
(7, 'Muffy', 24, 'Indore', 10000)

 --display business table
select *
from Business

/**1 
if customer age > or = 25 then Senior Developer
if customer age < 25 then Intern
if customer age > and = 25 but also < and = 27 then Associate Engineer
Name field as JobPosition
**/

Select [ID], [NAME], [AGE], [ADDRESS], [SALARY],
Case
When [age] >= 25 Then 'Senior Developer'
When [age] < 25 Then 'Intern'
When [age] >= 25 and [age] <= 27 Then 'Associate Engineer'
End As JobPosition 
From Business 



/**2 
If customer age is more than 30 then Gen X
If customer age is 23,24,25 then Gen Z
If customer age is 22 then Gen Alpha
If customer age is 27 then Gen Y
name field as Generation
**/

Select [ID], [NAME], [AGE], [ADDRESS], [SALARY],
Case
When [age] > 30 Then 'Gen X'
When [age] >= 23 and [age] <= 25 Then 'Gen Z'
When [age] = 22 Then 'Gen Alpha'
When [age] = 27 Then 'Gen Y'
End As Generation
From Business
