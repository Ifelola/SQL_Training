--Lesson 3
--Data flow process
--Operators are or, and , between, Like
--Equality sign are <,>,<=,>=,!

use EmadeDev

Select *
from Noble

/**
--write a logic that shows winners from 1960 to 1962 as 'Good'
--Winners from 1963-1966 as 'better'
--winner that are beyond 1966 as best
--Show the result as category
**/

Select [Year], 
[Subject],
[Winner],
Case
 When [Year] between 1960 and 1962 Then 'Good'
 When [Year] > 1962 and [Year] <= 1966 Then 'Better'
 When [Year] > 1966 Then 'Best'
 End As Category
 From Noble

 --Another Approach

 Select [Year], 
[Subject],
[Winner],
Case
 When [Year] In ( 1960,1961,1962) Then 'Good'
 When [Year] not In (1960,1961,1962,1967,1968,1969) Then 'Better'
 Else 'Best'
 End As Category
 From Noble

 --Another Approach
 Select [Year], 
[Subject],
[Winner],
Case
 When [Year] < 1963 Then 'Good'
 When [Year] >= 1963 and [Year] <= 1966 Then 'Better'
 Else 'Best'
 End As Category
 From Noble

 --Create a View vwWinnercategory
 create View vwWinnercategory As
 Select [Year], 
[Subject],
[Winner],
Case
 When [Year] < 1963 Then 'Good'
 When [Year] >= 1963 and [Year] <= 1966 Then 'Better'
 Else 'Best'
 End As Category
 From Noble

-- Check the View 
Select *
From vwWinnercategory
Where category ='Good'