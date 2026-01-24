/*
14. Encontrar as empresas (CompanyName) que fizeram encomendas num dado
ano
*/

USE Northwind

DECLARE @OrderDate INT
SET @OrderDate = 1998
SELECT CompanyName FROM Orders INNER JOIN
Customers ON Customers.CustomerID = Orders.CustomerID
WHERE YEAR(OrderDate) = @OrderDate

USE Northwind
GO

/*

CREATE PROCEDURE GetCompanyDateFromOrderYear 
@OrderYear INT
AS
BEGIN
SELECT CompanyName FROM Orders INNER JOIN
Customers ON Customers.CustomerID = Orders.CustomerID
WHERE YEAR(OrderDate) = @OrderYear
END;

EXEC GetCompanyDateFromOrderYear 1998
*/
