/*
3. Criar um relatório que mostre o cargo (Title) e o primeiro e último
nome de todos os representantes de vendas.
*/

USE Northwind
SELECT Title, FirstName, LastName FROM Employees
WHERE Title = 'Sales Representative'
