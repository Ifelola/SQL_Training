-- How to create a Database
Create Database EmadeDev

-- Create another Database and call it EmadeTest and EmadeProd
Create Database EmadeTest

Create Database EmadeProd

--How to access a Database
use EmadeDev

use EmadeTest

--How to create a table that you can use inside a database

--Check data in a table
Select *
From Customer

--Show customer in USA
Select *
From Customer
Where Country = 'USA'

--Show custonerID 1 3 5
Select *
From Customer
Where CustomerID In (1,3,5)


--Show how may customer we have in the table
Select Count (*) As TotalCustomer
From Customer

--Show the highest ID we have in the table
Select Max (CustomerID) As highestCustomerID
From Customer

--Show the lowest ID we have in the table
Select Min (CustomerID) As highestCustomerID
From Customer

--Assignment 
--Show the gender that = male 
Select *
From Customer
Where Gender = 'Male'

--Show First name  - Jerry
Select *
From Customer
Where Firstname = 'Jerry'

--Show records of people that are single 
Select *
From Customer
Where MaritalStatus = 'Single'