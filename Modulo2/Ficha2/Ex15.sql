/*
15. Criar um relatório que mostre as encomendas por funcionário.
*/

USE Northwind

SELECT COUNT(*) AS OrdersCount FROM Orders
GROUP BY EmployeeID
