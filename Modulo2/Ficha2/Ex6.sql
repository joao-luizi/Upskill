/*
6. Criar um relatório que mostre o título de cortesia (TitleOfCourtesy)
e o primeiro e último nome de todos os funcionários cujo título de
cortesia começa por “M”.

*/

USE Northwind
SELECT TitleOfCourtesy, FirstName, LastName FROM Employees
Where SUBSTRING(TitleOfCourtesy, 1, 1)= 'M'
