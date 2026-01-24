/*
8. Criar um relatório que mostre o nome da empresa (CompanyName), o
cargo do contacto (ContactTitle), a cidade e o país de todos os
clientes no México ou em qualquer cidade de Espanha, exceto Madrid.
*/

USE Northwind
SELECT CompanyName, ContactTitle, City, Country FROM Customers
WHERE (Country = 'Mexico') OR (Country = 'Spain' AND City <> 'Madrid')
