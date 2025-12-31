

--1. Write queries to answer the questions below:

--Show total
--number of records for each file.

Select Count(*) AS Total_records
From [dbo].[Business]

Select Count(*) AS Total_records
From [dbo].[Customer]

Select Count(*) AS Total_records
From [dbo].[EmadeOrderItems]

Select Count(*) AS Total_records
From [dbo].[EmadeBrands]

Select Count(*) AS Total_records
From [dbo].[EmadeOrders]

Select Count(*) AS Total_records
From [dbo].[EmadeProducts]


Select Count(*) AS Total_records
From [dbo].[EmadeStaffs]

Select Count(*) AS Total_records
From [dbo].[EmadeStocks]

Select Count(*) AS Total_records
From [dbo].[EmadeStores]

--How many
--different categories of products are there?

Select Count (Distinct C.Category_Name) As Categoty_count
From [dbo].[EmadeProducts] P
Join [dbo].[EmadeCategories] C
On P.Category_ID =C.Category_ID





--List all the
--customers who are from New York city.



Select *
From [dbo].[EmadeCustomers]
Where City = 'New York'


--What are the
--top 5 products with the highest prices?

Select Top 5 *
from [dbo].[EmadeProducts]
order by List_price Desc



--What cities are
--the customers from? Note: show only unique values by removing duplicates in the
--results.

Select Distinct city --First_name,Last_name
From [dbo].[EmadeCustomers]


--Find the
--customer IDs who ordered the first 10 days in October 2018. Hint: Use the
--table: EmadeOrders


Select Distinct Customer_ID
from Emadeorders
Where Order_date >= '2018-10-01' and Order_date < '2018-10-11'


Select *
From Emadeorders
Where year(Order_date) = 2018
and Month (Order_date) = 10


--Find all the
--Trek bicycles from 2017 model. Hint: Use the table: EmadeProducts

Select *
From Emadeproducts
Where Product_Name Like '%Trek%'
and Model_year = 2017

--What are the
--total number of customers in the Customers table? Hint: Use the table:
--EmadeCustomers

Select Count (*) as Total_number
From Emadecustomers

Select Count (Customer_ID) as Total_number
From Emadecustomers


--What is the
--total quantity of the products sold? Hint: Use the table: EmadeOrderItems

Alter Table Emadeorderitems
Alter Column quantity Int

Select  Sum(quantity) as Total_quantity
From EmadeOrderitems

--Which product
--has the highest price? Hint: Use the table: EmadeOrderItems

Select  Max(List_Price) as Highest_Price
From EmadeOrderitems



