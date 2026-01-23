USE Northwind

SELECT ProductName, CategoryName FROM Products 
LEFT Join Categories ON Products.CategoryID = Categories.CategoryID

--Ex2
use Northwind

/* Mostra empregados com compras e data */

SELECT  Employees.EmployeeID, FirstName, LastName, OrderID, Orders.OrderDate from Employees 
Full Join Orders ON Employees.EmployeeID = Orders.EmployeeID AND Orders.EmployeeID <> 5
