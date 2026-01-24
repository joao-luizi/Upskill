/*
11. Obter o número de funcionários em cada cidade.

*/

USE Northwind

SELECT Count(*), City AS EmployeesCount FROM Employees
GROUP BY City

