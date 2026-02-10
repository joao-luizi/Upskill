
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE Ficha1_Ex1
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Select the FirstName and LastName columns from the Employees table. Sort by LastName.
*/
SELECT FirstName, LastName FROM Employees ORDER BY LastName ASC
END
GO


CREATE OR ALTER PROCEDURE Ficha1_Ex2
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Create a report showing Northwind's orders sorted by Freight from most expensive to cheapest.
Show OrderID, OrderDate, ShippedDate, CustomerID and Freight
*/
SELECT OrderID, OrderDate, ShippedDate, CustomerID, Freight FROM Orders ORDER BY Freight DESC

END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex3
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Create a report showing the title and the first and last name of all sales representatives.
*/
SELECT Title, FirstName, LastName, Region FROM Employees WHERE Title LIKE 'Sales Representative';
END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex4
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Create a report showing the first and last names of all employees who have a region specified.
*/
SELECT FirstName, LastName, Region FROM Employees WHERE Region IS NOT NULL;
END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex5
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Create a report showing the first and last name of all employees whose last names start with
a letter in the last half of the alphabet. Sort by LastName in descending order
*/
SELECT FirstName, LastName  FROM Employees WHERE SUBSTRING(LastName, 1, 1) IN 
('m', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'x', 'y', 'z')
ORDER BY LastName DESC
END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex6
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Create a report showing the title of courtesy and the first and last name of all employees whose
title of courtesy begins with "M"
*/
SELECT TitleOfCourtesy, FirstName, LastName  FROM Employees WHERE SUBSTRING(TitleOfCourtesy, 1, 1) = 'M'
END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex7
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Create a report showing the first and last name of all sales representatives who are from Seattle
or Redmond,
*/
SELECT FirstName, LastName  FROM Employees 
WHERE Title = 'Sales Representative' AND (City = 'Seattle' OR City = 'Redmond')
END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex8
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Create a report that shows the company name, contact title, city and country of all customers
in Mexico or in any city in Spain except Madrid.
*/
SELECT CompanyName, ContactTitle, City, Country  FROM Customers 
WHERE Country = 'Mexico' OR (Country = 'Spain' AND City <> 'Madrid')
END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex9
AS BEGIN
/*
********Must Use NorthWind DataBase******************
If the cost of freight is greater than or equal to $500.00, it will now be taxed by 10%. Create a
report that shows the order id and freight cost with this tax for all orders of $500 or more.
*/
SELECT OrderID,  (Freight * 1.1) AS FreightCost  FROM Orders WHERE Freight >= 500
END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex10
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Find the Total Number of Units Ordered of Product ID 3
*/
SELECT SUM(Quantity) AS [ Total Number of Units Ordered ]  FROM [Order Details] WHERE ProductID = 3
END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex11
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Retrieve the number of employees in each city
*/
SELECT COUNT(*) As EmployeeCount   FROM Employees Group By  City
END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex12
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Retrieve the number of suppliers in each country
*/
SELECT COUNT(*) As SupplierCount   FROM Suppliers Group By  Country
END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex13
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Find the number of sales representatives in each city that contains at least 2 sales
representatives. Order by the number of employees.
*/
SELECT Count(*) AS NumberEmployees, City FROM Employees 
WHERE Title = 'Sales Representative'
Group By City HAVING Count(*) >= 2
ORDER BY NumberEmployees
END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex14
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Find the Companies (CompanyName) that placed orders in 1997
*/
SELECT  CompanyName FROM Orders
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE YEAR(OrderDate) = 1997
END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex15
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Create a report showing employee orders.
*/
SELECT  Employees.EmployeeID, FirstName, LastName, OrderID from Employees
INNER Join Orders ON Employees.EmployeeID = Orders.EmployeeID
END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex16
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Create a report showing the Order ID, the name of the company that placed the order and the
first and last name of the associated employee. Only show orders placed after January 1, 1998
that shipped after they were required. Sort by Company Name.
*/
SELECT  Orders.OrderID, Customers.CompanyName, Employees.FirstName, Employees.LastName from Employees 
INNER Join Orders ON Employees.EmployeeID = Orders.EmployeeID 
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderDate > '19810101' AND (Orders.RequiredDate > Orders.OrderDate) 
ORDER By Customers.CompanyName
END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex17
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Create a report that shows, by product name, the total quantity of products (from the
Order_Details table) ordered by product. Only show the 5 records corresponding to the
products which were less ordered for which the quantity ordered is fewer than 650.
*/
SELECT TOP (5)ProductName, SUM ([Order Details].Quantity) As QTDY from [Order Details] 
INNER JOIN Products ON Products.ProductID = [Order Details].ProductID 
GROUP BY ProductName HAVING SUM ([Order Details].Quantity) < 650
Order BY QTDY, ProductName
END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex18
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Create a report showing all distinct countries stored in database
*/
SELECT  Country FROM Customers
UNION
SELECT  Country FROM Suppliers
UNION 
SELECT ShipCountry FROM Orders
UNION
SELECT Country FROM Employees
END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex19
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Change the database so that the table Products can be a lookup table
*/
-- 1. Vamos verificar se a tabela historica de Product_Hist Existe
IF EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'dbo'
      AND TABLE_NAME = 'Product_Hist'
	)
	BEGIN
		PRINT 'Este exercicio já foi executado uma vez e provocou alterações à tabela productos.
		Não podendo ser corrido outra vez.'
		END
	ELSE
	BEGIN
	-- Criar tabela Historico
		SELECT *
		INTO [Product_Hist] 
		FROM Products

		CREATE TABLE [dbo].[Products_Details](
			[ProductID] [int] NOT NULL,
			[UnitPrice] [money] NULL,
			[UnitsInStock] [smallint] NULL,
			[UnitsOnOrder] [smallint] NULL,
			[ReorderLevel] [smallint] NULL
			);
		INSERT INTO [dbo].[Products_Details]
		SELECT [ProductID], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel] 
		FROM Products

		ALTER TABLE [dbo].[Products]
		DROP COLUMN [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel]
	END
END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex20
@CustomerID nchar(5), @CompanyName nvarchar(40), @ContactName nvarchar(30), @ContactTitle nvarchar(30),
@Address nvarchar(60), @City nvarchar(15), @Region nvarchar(15), @PostalCode nvarchar(10),
@Country nvarchar(15), @Phone nvarchar(24), @Fax nvarchar(24)
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Create a procedure for inserting a new customer
*/
INSERT INTO [dbo].[Customers]
           ([CustomerID], [CompanyName], [ContactName] ,[ContactTitle] ,[Address]
           ,[City] ,[Region] ,[PostalCode] ,[Country] ,[Phone] ,[Fax])
     VALUES
           (@CustomerID, @CompanyName, @ContactName, @ContactTitle, @Address, @City, @Region
           ,@PostalCode, @Country, @Phone, @Fax)
END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex21
@CustomerID nchar(5), @CompanyName nvarchar(40), @ContactName nvarchar(30), @ContactTitle nvarchar(30),
@Address nvarchar(60), @City nvarchar(15), @Region nvarchar(15), @PostalCode nvarchar(10),
@Country nvarchar(15), @Phone nvarchar(24), @Fax nvarchar(24)
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Create a procedure for updating data on an existing customer
*/
UPDATE Customers
SET CustomerID = @CustomerID, CompanyName = @CompanyName, ContactName = @ContactName, ContactTitle = @ContactTitle,
[Address] = @Address, City = @City, Region = @Region, PostalCode = @PostalCode, Country = @Country,
Phone = @Phone, Fax = @Fax
END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex22
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Create a procedure for deleting all products never ordered and keep the information on a
historic table
*/
SELECT * INTO NoOrder_Products FROM Products WHERE ProductID NOT IN (SELECT ProductID FROM Orders)
DELETE Products WHERE ProductID NOT IN (SELECT ProductID FROM Orders)

END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex23
@ProductName nvarchar(40), @SupplierID int, @CategoryID int, @QuantityPerUnit nvarchar(20), @UnitPrice money,
@UnitsInStock smallint, @UnitsOnOrder smallint, @ReorderLevel smallint, @Discontinued bit
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Create a procedure for inserting a new product
*/
INSERT INTO [dbo].[Products]
           ([ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice]
           ,[UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued])
     VALUES
           (@ProductName, @SupplierID, @CategoryID, @QuantityPerUnit
           ,@UnitPrice, @UnitsInStock, @UnitsOnOrder, @ReorderLevel, @Discontinued)
END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex24
@ProductID int,  @ProductName nvarchar(40), @SupplierID int, @CategoryID int, @QuantityPerUnit nvarchar(20), @UnitPrice money,
@UnitsInStock smallint, @UnitsOnOrder smallint, @ReorderLevel smallint, @Discontinued bit
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Create a procedure for updating data on an existing product
*/
UPDATE Products SET ProductName = @ProductName, SupplierID = @SupplierID, CategoryID = @CategoryID, 
QuantityPerUnit = @QuantityPerUnit, UnitPrice = @UnitPrice, UnitsInStock = @UnitsInStock, 
UnitsOnOrder = @UnitsOnOrder, ReorderLevel = @ReorderLevel, Discontinued = @Discontinued
WHERE ProductID = @ProductID
END
GO

CREATE OR ALTER PROCEDURE Ficha1_Ex25
AS
BEGIN
/*
********Must Use NorthWind DataBase******************
Change the database so that information about countries is stored in a lookup table with three
fields: Country Id, Country Name and Country Code. Modify all the previous queries
accordingly.
*/
IF EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'dbo'
      AND TABLE_NAME = 'Countries'
	)
	BEGIN
	PRINT 'Tabela countires já existe. A apagar.'
	DROP TABLE Countries
	END

	CREATE TABLE [dbo].[Countries](
		[CountryID] [bigint] IDENTITY(1,1) NOT NULL,
		[CountryName] [nvarchar](15) NULL,
		[CountryCode] [nvarchar](50) NULL,
	 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
	(
		[CountryID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY];

	WITH tbl AS (
		SELECT Country FROM Customers
		UNION
		SELECT Country FROM Suppliers
		UNION 
		SELECT ShipCountry FROM Orders
		UNION
		SELECT Country FROM Employees
	)
	INSERT INTO dbo.Countries (CountryName)
	SELECT Country
	FROM tbl
	WHERE Country IS NOT NULL;
END
GO
