/*
7. Criar um relatório que mostre o primeiro e último nome de todos os
representantes de vendas que são de Seattle ou Redmond.


*/

USE Northwind
SELECT FirstName, LastName FROM Employees
Where City IN  ('Seattle', 'Redmond')
