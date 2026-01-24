/*
17. Criar um relatório que mostre, por nome do produto, a quantidade
total de produtos (da tabela Order_Details) encomendada por produto.
Mostrar apenas os 5 registos correspondentes aos produtos menos
encomendados, cuja quantidade total encomendada seja inferior a 650.
*/

USE Northwind

SELECT TOP 5 ProductName, SUM([Order Details].Quantity) AS [Soma] FROM Products
INNER JOIN [Order Details] ON [Order Details].ProductID = Products.ProductID
GROUP BY ProductName HAVING SUM([Order Details].Quantity) < 650
ORDER BY SUM([Order Details].Quantity)
