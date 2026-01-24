/*
5. Criar um relatório que mostre o primeiro e último nome de todos os
funcionários cujos apelidos começam com uma letra da segunda metade
do alfabeto. Ordenar por LastName de forma descendente.

*/

USE Northwind
SELECT FirstName, LastName FROM Employees
Where SUBSTRING(LastName, 1, 1) IN ('o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z')
