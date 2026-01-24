/*
4. Criar um relatório que mostre o primeiro e último nome de todos os
funcionários relacionados com determinada região.

*/

USE Northwind
SELECT FirstName, LastName, Region FROM Employees
Where Region = 'WA'
