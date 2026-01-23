use Northwind

/*
Select Country FROM Employees
union
select Country from Customers
union 
select Country from Suppliers
union
select ShipCountry from Orders
/*

*/
-- falta fazer u, SELECT que permite incluir os resultados na tabela

*/
/*
use Northwind

UPDATE Customers SET CountryID = (SELECT CountryID FROM Countries 
WHERE Countries.CountryName = Customers.Country)
*/

/*
use Northwind

UPDATE Employees SET CountryID = (SELECT CountryID FROM Countries 
WHERE Countries.CountryName = Employees.Country)
*/

/*

use Northwind

UPDATE Suppliers SET CountryID = (SELECT CountryID FROM Countries 
WHERE Countries.CountryName = Suppliers.Country)

/*

