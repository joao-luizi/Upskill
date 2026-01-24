/*
10. Encontrar o número total de unidades encomendadas do produto, dado
um determinado ProductID.

*/

USE Northwind
DECLARE @ProductId INT
SET @ProductId = 1
SELECT SUM(Quantity) AS [Sum] FROM [Order Details] WHERE ProductID = @ProductId

-- OR 
CREATE PROCEDURE GetProductQuantitySum
    @ProductId INT
AS
BEGIN
    SELECT SUM(Quantity) AS [Sum]
    FROM [Order Details]
    WHERE ProductID = @ProductId;
END;