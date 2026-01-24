/*
12. Obter o número de fornecedores em cada país.


*/

USE Northwind

SELECT Count(*), Country AS SuppliersByCountry FROM Suppliers
GROUP BY Country

