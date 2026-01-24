/*
13. Encontrar o número de representantes de vendas em cada cidade que
tenha pelo menos 2 representantes de vendas. Ordenar pelo número de
funcionários.


*/

USE Northwind

SELECT Count(*), City FROM Employees
WHERE Title = 'Sales Representative' 
GROUP BY City HAVING Count(*) > 2


