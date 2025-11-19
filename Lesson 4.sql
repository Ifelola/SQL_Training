--Lesson 4 
--Pivot 

Use EmadeDev

Select *
From Customer

-- Pivot (Tranpose Row to Column)
Select *
From
(
Select [CustomerID], [FirstName], [LastName], [Gender], [MaritalStatus], [Country]
From Customer
)Source
Pivot ( count (Gender)
For Gender in ([Male],[Female])
)As Target 
