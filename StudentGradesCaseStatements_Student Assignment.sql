--Week 3 Assignment – SQL -StudentGradesCaseStatements
drop table if exists [Results]
create table [Results]
(
ID int not null,
NAME varchar (50) null,
SCORE int not null
)

insert into [Results]
(
ID,
NAME,
SCORE
)
values
(1, 'Simisola', 60),
(2, 'Ivan', 80),
(3, 'Metodija', 52),
(4, 'Callum', 98),
(5, 'Leia', 84),
(6, 'Aparecida', 82),
(7, 'Ursula', 69),
(8, 'Ramazan', 78),
(9, 'Corona', 87),
(10, 'Alise', 57),
(11, 'Galadriel', 89),
(12, 'Merel', 99),
(13, 'Cherice', 55),
(14, 'Nithya', 81),
(15, 'Elsad', 71),
(16, 'Liisi', 90),
(17, 'Johanna', 90),
(18, 'Anfisa', 90),
(19, 'Ryosuke', 97),
(20, 'Sakchai', 61),
(21, 'Elbert', 63),
(22, 'Katelyn', 51)
;

Select *
From Results


--Create queries that return the following
/**1
When score is 94 or higher, the row will have the value of A. 
If  score is  94 gets an  A, If  score is  90 gets an  A- ,
If  score is  87 gets an  B+  ,If  score is  83 gets an  B  ,
If  score is  80 gets an  B- ,If  score is  77 gets an  C+ ,
If  score is  73 gets an  C , If  score is  70 gets an  C- ,
If  score is  67 gets an  D+ ,If  score is  60 gets an  D,
If students get none of these scores, you should assign an F.
Give each student a grade, which we will add in a new column named grade. 
You can show the grades from highest to lowest
**/

 Select *,
 --[ID], [NAME], [SCORE],
 Case
 When [Score] >= 94 Then 'A'
 When [Score] >= 90 Then 'A-'
 When [Score] >= 87 Then 'B+'
 When [Score] >= 83 Then 'B'
 When [Score] >= 80 Then 'B-'
 When [Score] >= 77 Then 'C+'
 When [Score] >= 73 Then 'C'
 When [Score] >= 70 Then 'C-'
 When [Score] >= 67 Then 'D+'
 When [Score] >= 60 Then 'D'
 Else 'F'
 End As Grade 
 From Results
 Order by Score Desc



/**2
Do analysis on the above data to show how many students passed or failed. 
If a student scores 60 or higher, that student passed but if they scored lower than 60, they have failed
**/

SELECT 
    CASE 
        WHEN SCORE >= 60 THEN 'Passed'
        ELSE 'Failed'
    END AS Status 
	from ( Select *,
	Case
 When [Score] >= 94 Then 'A'
 When [Score] >= 90 Then 'A-'
 When [Score] >= 87 Then 'B+'
 When [Score] >= 83 Then 'B'
 When [Score] >= 80 Then 'B-'
 When [Score] >= 77 Then 'C+'
 When [Score] >= 73 Then 'C'
 When [Score] >= 70 Then 'C-'
 When [Score] >= 67 Then 'D+'
 When [Score] >= 60 Then 'D'
 Else 'F'
 End As Grade 
 From Results) X
    Order by SCORE  Desc
  

  Select
  case 
  when Score >= 60 Then 'Passed'
  else 'Failed'
  End As Status,
  Count (*) as Total_Students
  From Results
  Group by
  case 
  when Score >= 60 Then 'Passed'
  else 'Failed'
  End


--3 create view and name it vwResult for question 1 
Create View vwResult AS
Select *
,Case
 When [Score] >= 94 Then 'A'
 When [Score] >= 90 Then 'A-'
 When [Score] >= 87 Then 'B+'
 When [Score] >= 83 Then 'B'
 When [Score] >= 80 Then 'B-'
 When [Score] >= 77 Then 'C+'
 When [Score] >= 73 Then 'C'
 When [Score] >= 70 Then 'C-'
 When [Score] >= 67 Then 'D+'
 When [Score] >= 60 Then 'D'
 Else 'F'
 End As Grade 
 From Results
 --Order by Score Desc
    
Select *
From VwResult



--4 create view and name it vwResultAnalysis for question 2 
Create View VwResultAnalysis AS 
Select
  case 
  when Score >= 60 Then 'Passed'
  else 'Failed'
  End As Status,
  Count (*) as Total_Students
  From Results
  Group by
  case 
  when Score >= 60 Then 'Passed'
  else 'Failed'
  End

Select *
from vwResultAnalysis


