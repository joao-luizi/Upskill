/*
18. Criar um relatório que mostre todos os países distintos armazenados
na base de dados.
*/

USE Northwind

SELECT Country FROM Employees
UNION
SELECT Country FROM Suppliers
UNION 
SELECT Country FROM Customers
UNION 
SELECT ShipCountry FROM Orders
