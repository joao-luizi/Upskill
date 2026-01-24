/*
16. Criar um relatório que mostre o OrderID, o nome da empresa que fez
a encomenda e o primeiro e último nome do funcionário associado.
Mostrar apenas as encomendas efetuadas após 01/01/1998 que foram
enviadas depois da data requerida. Ordenar por nome da empresa.
*/

USE Northwind

SELECT OrderID, CompanyName, FirstName, LastName  FROM Orders
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
WHERE YEAR(OrderDate) >= 1998 AND ShippedDate > OrderDate
