/*
9. Caso o custo do transporte (Freight) seja maior ou igual a 500$,
passará a ser taxado em 10%. Criar um relatório que mostre o OrderID
e o custo do transporte com esta taxa para todas as encomendas de
500$ ou mais.

*/

USE Northwind
SELECT OrderID, Freight = (Freight * 1.1) FROM Orders
WHERE Freight >= 500
