/*
2. Criar um relatório que mostre as encomendas da Northwind ordenadas
pelo valor do Freight, do mais caro para o mais barato. Mostrar
OrderID, OrderDate, ShippedDate, CustomerID e Freight
*/

USE Northwind
SELECT OrderID, OrderDate, ShippedDate, CustomerID, Freight FROM Orders
ORDER BY Freight DESC