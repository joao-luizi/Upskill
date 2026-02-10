
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE Ficha2_PIEx1
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte I. 1. Selecionar as colunas FirstName e LastName da tabela Employees.
Ordenar por LastName.
*/
SELECT OrderID, OrderDate, ShippedDate, CustomerID, Freight FROM Orders
ORDER BY Freight DESC
END
GO

CREATE OR ALTER PROCEDURE Ficha2_PIEx2
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte I. 2. Criar um relatório que mostre as encomendas da Northwind ordenadas
pelo valor do Freight, do mais caro para o mais barato. Mostrar
OrderID, OrderDate, ShippedDate, CustomerID e Freight
*/
SELECT OrderID, OrderDate, ShippedDate, CustomerID, Freight FROM Orders
ORDER BY Freight DESC
END
GO

CREATE OR ALTER PROCEDURE Ficha2_PIEx3
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte I. 3. Criar um relatório que mostre o cargo (Title) e o primeiro e último
nome de todos os representantes de vendas.
*/
SELECT Title, FirstName, LastName FROM Employees
WHERE Title = 'Sales Representative'
END
GO

CREATE OR ALTER PROCEDURE Ficha2_PIEx4
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte I. 4. Criar um relatório que mostre o primeiro e último nome de todos os
funcionários relacionados com determinada região.
*/
SELECT FirstName, LastName, Region FROM Employees
Where Region = 'WA'
END
GO

CREATE OR ALTER PROCEDURE Ficha2_PIEx5
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte I. 5. Criar um relatório que mostre o primeiro e último nome de todos os
funcionários cujos apelidos começam com uma letra da segunda metade
do alfabeto. Ordenar por LastName de forma descendente.
*/
SELECT FirstName, LastName FROM Employees
Where SUBSTRING(LastName, 1, 1) IN ('o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z')
END
GO

CREATE OR ALTER PROCEDURE Ficha2_PIEx6
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte I. 6. Criar um relatório que mostre o título de cortesia (TitleOfCourtesy)
e o primeiro e último nome de todos os funcionários cujo título de
cortesia começa por “M”.
*/
SELECT TitleOfCourtesy, FirstName, LastName FROM Employees
Where SUBSTRING(TitleOfCourtesy, 1, 1)= 'M'
END
GO

CREATE OR ALTER PROCEDURE Ficha2_PIEx7
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte I. 7. Criar um relatório que mostre o primeiro e último nome de todos os
representantes de vendas que são de Seattle ou Redmond.
*/
SELECT FirstName, LastName FROM Employees
Where City IN  ('Seattle', 'Redmond')
END
GO

CREATE OR ALTER PROCEDURE Ficha2_PIEx8
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte I. 8. Criar um relatório que mostre o nome da empresa (CompanyName), o
cargo do contacto (ContactTitle), a cidade e o país de todos os
clientes no México ou em qualquer cidade de Espanha, exceto Madrid.
*/
SELECT CompanyName, ContactTitle, City, Country FROM Customers
WHERE (Country = 'Mexico') OR (Country = 'Spain' AND City <> 'Madrid')
END
GO

CREATE OR ALTER PROCEDURE Ficha2_PIEx9
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte I. 9. Caso o custo do transporte (Freight) seja maior ou igual a 500$,
passará a ser taxado em 10%. Criar um relatório que mostre o OrderID
e o custo do transporte com esta taxa para todas as encomendas de
500$ ou mais.
*/
SELECT OrderID, Freight = (Freight * 1.1) FROM Orders
WHERE Freight >= 500
END
GO

CREATE OR ALTER PROCEDURE Ficha2_PIEx10
@ProductId INT
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte I. 10. Encontrar o número total de unidades encomendadas do produto, dado
um determinado ProductID.
*/
SELECT SUM(Quantity) AS [Sum]
    FROM [Order Details]
    WHERE ProductID = @ProductId;
END
GO

CREATE OR ALTER PROCEDURE Ficha2_PIEx11
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte I. 11. Obter o número de funcionários em cada cidade.
*/
SELECT Count(*), City AS EmployeesCount FROM Employees
GROUP BY City
END
GO

CREATE OR ALTER PROCEDURE Ficha2_PIEx12
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte I. 12. Obter o número de fornecedores em cada país.
*/
SELECT Count(*), Country AS SuppliersByCountry FROM Suppliers
GROUP BY Country
END
GO

CREATE OR ALTER PROCEDURE Ficha2_PIEx13
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte I. 13. Encontrar o número de representantes de vendas em cada cidade que
tenha pelo menos 2 representantes de vendas. Ordenar pelo número de
funcionários.
*/
SELECT Count(*), City FROM Employees
WHERE Title = 'Sales Representative' 
GROUP BY City HAVING Count(*) > 2
END
GO

CREATE OR ALTER PROCEDURE Ficha2_PIEx14
@OrderDate INT
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte I. 14. Encontrar as empresas (CompanyName) que fizeram encomendas num dado
ano
*/
SELECT CompanyName FROM Orders INNER JOIN
Customers ON Customers.CustomerID = Orders.CustomerID
WHERE YEAR(OrderDate) = @OrderDate
END
GO

CREATE OR ALTER PROCEDURE Ficha2_PIEx15
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte I. 15. Criar um relatório que mostre as encomendas por funcionário.
*/
SELECT COUNT(*) AS OrdersCount FROM Orders
GROUP BY EmployeeID
END
GO

CREATE OR ALTER PROCEDURE Ficha2_PIEx16
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte I. 16. Criar um relatório que mostre o OrderID, o nome da empresa que fez
a encomenda e o primeiro e último nome do funcionário associado.
Mostrar apenas as encomendas efetuadas após 01/01/1998 que foram
enviadas depois da data requerida. Ordenar por nome da empresa.
*/
SELECT OrderID, CompanyName, FirstName, LastName  FROM Orders
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
WHERE YEAR(OrderDate) >= 1998 AND ShippedDate > OrderDate
END
GO

CREATE OR ALTER PROCEDURE Ficha2_PIEx17
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte I. 17. Criar um relatório que mostre, por nome do produto, a quantidade
total de produtos (da tabela Order_Details) encomendada por produto.
Mostrar apenas os 5 registos correspondentes aos produtos menos
encomendados, cuja quantidade total encomendada seja inferior a 650.
*/
SELECT TOP 5 ProductName, SUM([Order Details].Quantity) AS [Soma] FROM Products
INNER JOIN [Order Details] ON [Order Details].ProductID = Products.ProductID
GROUP BY ProductName HAVING SUM([Order Details].Quantity) < 650
ORDER BY SUM([Order Details].Quantity)

END
GO

CREATE OR ALTER PROCEDURE Ficha2_PIEx18
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte I. 18. Criar um relatório que mostre todos os países distintos armazenados
na base de dados.
*/
SELECT Country FROM Employees
UNION
SELECT Country FROM Suppliers
UNION 
SELECT Country FROM Customers
UNION 
SELECT ShipCountry FROM Orders
END
GO

CREATE OR ALTER PROCEDURE Ficha2_PIEx19
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte I. 19. Alterar a base de dados de modo a que a tabela Products possa ser
uma tabela de pesquisa (lookup table).
*/
-- 1. Vamos verificar se a tabela historica de Product_Hist Existe
IF EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'dbo'
      AND TABLE_NAME = 'Product_Hist'
	)
	BEGIN
		PRINT 'Este exercicio já foi executado uma vez e provocou alterações à tabela productos.
		Não podendo ser corrido outra vez.'
		END
	ELSE
	BEGIN
	-- Criar tabela Historico
		SELECT *
		INTO [Product_Hist] 
		FROM Products

		CREATE TABLE [dbo].[Products_Details](
			[ProductID] [int] NOT NULL,
			[UnitPrice] [money] NULL,
			[UnitsInStock] [smallint] NULL,
			[UnitsOnOrder] [smallint] NULL,
			[ReorderLevel] [smallint] NULL
			);
		INSERT INTO [dbo].[Products_Details]
		SELECT [ProductID], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel] 
		FROM Products

		ALTER TABLE [dbo].[Products]
		DROP COLUMN [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel]
	END
END
GO

CREATE OR ALTER PROCEDURE Ficha2_PIExPI20
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte I. 20. Alterar a base de dados de modo a que a informação sobre países
seja armazenada numa tabela de pesquisa com três campos: CountryId,
CountryName e CountryCode. Modificar todas as consultas anteriores
em conformidade.
*/
IF EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'dbo'
      AND TABLE_NAME = 'Countries'
	)
	BEGIN
	PRINT 'Tabela countires já existe. A apagar.'
	DROP TABLE Countries
	END

	CREATE TABLE [dbo].[Countries](
		[CountryID] [bigint] IDENTITY(1,1) NOT NULL,
		[CountryName] [nvarchar](15) NULL,
		[CountryCode] [nvarchar](50) NULL,
	 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
	(
		[CountryID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY];

	WITH tbl AS (
		SELECT Country FROM Customers
		UNION
		SELECT Country FROM Suppliers
		UNION 
		SELECT ShipCountry FROM Orders
		UNION
		SELECT Country FROM Employees
	)
	INSERT INTO dbo.Countries (CountryName)
	SELECT Country
	FROM tbl
	WHERE Country IS NOT NULL;
END
GO

CREATE OR ALTER PROCEDURE ValorEncomenda
@OrderID INT 
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte II. 1. Criar uma função ValorEncomenda que receba o OrderID e devolva o
valor total da encomenda, calculado com base na tabela Order_Detail
*/
SELECT SUM((Quantity * UnitPrice)) AS ValorEncomenda FROM [Order Details]
	WHERE OrderID = @OrderID
END
GO

CREATE OR ALTER PROCEDURE NomeFuncionario
@EmployeeID INT 
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte II. 2. Criar uma função NomeFuncionario que receba o EmployeeID e devolva
o nome completo do funcionário, no formato Título de cortesia +
Primeiro Nome + Último Nome
*/
SELECT TitleOfCourtesy + ' ' + FirstName + ' ' + LastName AS NomeCompleto FROM Employees
	WHERE EmployeeID = @EmployeeID
END
GO

CREATE OR ALTER PROCEDURE ClienteEmPais
@CustomerID INT, 
@CountryId INT
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte II. 3. Criar uma função ClienteEmPais que receba o CustomerID e o CountryId
e devolva 1 se o cliente for do país ou 0 caso contrário
*/
DECLARE @CountryName NVARCHAR(15) = (SELECT CountryName FROM Countries WHERE Countries.CountryId = @CountryId)

   IF ((SELECT COUNT(*) FROM Customers WHERE CustomerID = @CustomerID AND Customers.Country = @CountryName) > 0)
	RETURN 1
	ELSE
	RETURN 0
END
GO

CREATE OR ALTER PROCEDURE ClienteValorGasto
@CustomerID INT
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte II. 4. Criar uma função ClienteValorGasto que receba o CustomerID e devolva
o valor total gasto por esse cliente em todas as suas encomendas.
*/
SELECT SUM(Quantity * UnitPrice) FROM [Order Details] INNER JOIN Orders ON Orders.OrderID = [Order Details].OrderID
	WHERE Orders.CustomerID = @CustomerID
END
GO

CREATE OR ALTER PROCEDURE TotalEncomendasPorAno
@EmployeeID INT, @Year INT
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte II. 5. Criar uma função TotalEncomendasPorAno que receba o EmployeeID e um
dado ano e devolva o número de encomendas registadas por esse
funcionário nesse ano

*/
SELECT COUNT(*) FROM Orders WHERE EmployeeID = @EmployeeID AND YEAR(OrderDate) = @Year
END
GO

CREATE OR ALTER PROCEDURE EncomendaEmFimDeSemana
@OrderID INT
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte II. 6. Criar uma função EncomendaEmFimDeSemana que receba o OrderID e
devolva 'Sim' se a OrderDate for sábado ou domingo, 'Não' caso
contrário
*/
SET DATEFIRST 1
    -- Insert statements for procedure here
	IF (SELECT DATEPART(weekday, OrderDate) FROM Orders WHERE ORDERS.OrderID = @OrderID) IN (7, 6)
	PRINT 'SIM'
	ELSE
	PRINT 'NÃO'
END
GO

CREATE OR ALTER PROCEDURE EmpregadoAnosServico
@EmployeeID INT
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte II. 7. Criar uma função EmpregadoAnosServico que receba o EmployeeID e
devolva o número de anos de serviço, com base no campo HireDate
*/
    -- Insert statements for procedure here
	SELECT DATEDIFF(YEAR, HireDate, GETDATE()) FROM Employees WHERE EmployeeID = @EmployeeID
END
GO

CREATE OR ALTER PROCEDURE ListaClienteResumoEncomenda
@CustomerID NCHAR(5)
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte II. 8. Criar uma função de tabela ListaClienteResumoEncomenda que receba o
CustomerID e devolva OrderID, OrderDate, ShippedDate e Freight.
*/
SELECT OrderID, OrderDate, ShippedDate, Freight FROM Orders WHERE CustomerID = @CustomerID
END
GO

CREATE OR ALTER PROCEDURE ListaProdutosNivelStock
@CustomerID NCHAR(5)
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte II. 9. Criar uma função de tabela ListaProdutosNivelStock que devolva todos
os produtos cujo UnitsInStock seja inferior a ReorderLevel. Deve
devolver ProductID, ProductName, UnitsInStock, ReorderLevel.
*/
SELECT  Products.ProductID, ProductName, UnitsInStock, ReorderLevel FROM Products
	INNER JOIN [Order Details] ON [Order Details].ProductID = Products.ProductID
	WHERE UnitsInStock < ReorderLevel
END
GO

CREATE OR ALTER PROCEDURE ListaEncomendasPorPeriodo
@StartDate datetime, @EndDate datetime
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte II. 10. Criar uma função de tabela ListaEncomendasPorPeriodo que receba
uma data inicial e uma data final e grave o valor total numa tabela
OrderTotals (a criar).
*/
INSERT INTO OrderTotals
	(StartDate, EndDate, Total) 
	VALUES (@StartDate, @EndDate, 
	(SELECT  COUNT(*) FROM Orders WHERE OrderDate BETWEEN @StartDate AND @EndDate))
END
GO

CREATE OR ALTER PROCEDURE InserirProduto
@ProductName NVARCHAR(40), @SupplierID INT, @CategoryID INT, @QuantityPerUnit NVARCHAR(20),
@UnitPrice money, @UnitsInStock smallint, @UnitsOnOrder smallint, @ReorderLevel smallint,
@Discontinued bit
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte III. 1. Criar um procedimento InserirProduto para inserir um novo produto.
*/
INSERT INTO Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock,
UnitsOnOrder, ReorderLevel) VALUES (@ProductName, @SupplierID, @CategoryID, @QuantityPerUnit, @UnitPrice, 
@UnitsInStock, @UnitsOnOrder, @ReorderLevel)
END
GO

CREATE OR ALTER PROCEDURE ModificarDadosProduto
@ProductID int, @ProductName NVARCHAR(40), @SupplierID INT, @CategoryID INT, @QuantityPerUnit NVARCHAR(20),
@UnitPrice money, @UnitsInStock smallint, @UnitsOnOrder smallint, @ReorderLevel smallint,
@Discontinued bit
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte III. 2. Criar um procedimento ModificarDadosProduto para atualizar os dados
de um produto existente.
*/
UPDATE Products SET ProductName = @ProductName, SupplierID = @SupplierID, CategoryID = @CategoryID, 
QuantityPerUnit = @QuantityPerUnit, UnitPrice = @UnitPrice, UnitsInStock = @UnitPrice,
UnitsOnOrder = @UnitsOnOrder, ReorderLevel = @ReorderLevel
WHERE ProductID = @ProductID
END
GO

CREATE OR ALTER PROCEDURE InserirCliente
@CompanyName NVARCHAR(40), @ContactName NVARCHAR(30), @ContactTitle NVARCHAR(30), @Address NVARCHAR(60),
@City NVARCHAR(15), @Region NVARCHAR(15), @PostalCode NVARCHAR(10),  @CountryID BIGINT, @Country NVARCHAR(15),
@Phone NVARCHAR(24), @Fax NVARCHAR(24)
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte III. 3. Criar um procedimento InserirCliente para inserir um novo cliente.
*/
INSERT INTO Customers (CompanyName, ContactName, ContactTitle, [Address], City, Region,
PostalCode, CountryID, Country, Phone, Fax) VALUES (@CompanyName, @ContactName, @ContactTitle, @Address, @City, 
@Region, @PostalCode, @CountryID, @Country, @Phone, @Fax)
END
GO

CREATE OR ALTER PROCEDURE ModificarDadosCliente
@CustomerID NCHAR(5), @CompanyName NVARCHAR(40), @ContactName NVARCHAR(30), @ContactTitle NVARCHAR(30), @Address NVARCHAR(60),
@City NVARCHAR(15), @Region NVARCHAR(15), @PostalCode NVARCHAR(10),  @CountryID BIGINT, @Country NVARCHAR(15),
@Phone NVARCHAR(24), @Fax NVARCHAR(24)
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte III. 4. Criar um procedimento ModificarDadosCliente para atualizar os dados
de um cliente existente.
*/
UPDATE Customers SET CompanyName = @CompanyName, ContactName = @ContactName, 
ContactTitle = @ContactTitle, [Address] = @Address, City = @City, Region = @Region,
PostalCode = @PostalCode, CountryID = @CountryID, Country = @Country, Phone = @Phone, Fax = @Fax 
END
GO

CREATE OR ALTER PROCEDURE EliminarProdutosNaoEncomendados
@CustomerID NCHAR(5), @CompanyName NVARCHAR(40), @ContactName NVARCHAR(30), @ContactTitle NVARCHAR(30), @Address NVARCHAR(60),
@City NVARCHAR(15), @Region NVARCHAR(15), @PostalCode NVARCHAR(10),  @CountryID BIGINT, @Country NVARCHAR(15),
@Phone NVARCHAR(24), @Fax NVARCHAR(24)
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte III. 5. Criar um procedimento EliminarProdutosNaoEncomendados para eliminar
todos os produtos que nunca foram encomendados e manter essa
informação numa tabela histórica.
*/

INSERT INTO ProdutosNaoEncomendados
SELECT *
FROM Products
WHERE ProductID IN (
    SELECT ProductID FROM Products
    EXCEPT
    SELECT ProductID FROM [Order Details]
);

-- Delete from original table
DELETE FROM Products
WHERE ProductID IN (
    SELECT ProductID FROM Products
    EXCEPT
    SELECT ProductID FROM [Order Details]
);
END
GO

CREATE OR ALTER PROCEDURE ParteIVEx1
@CustomerID nchar(5)
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte IV. 1. Criar uma função que receba um CustomerID e devolva a data da última
encomenda.
*/
SELECT TOP 1 OrderDate 
from Orders WHERE Orders.CustomerID = @CustomerID 
ORDER BY Orders.OrderDate DESC
END
GO

CREATE OR ALTER PROCEDURE ParteIVEx1
AS BEGIN
/*
********Must Use NorthWind DataBase******************
Parte IV. 2. Criar um procedimento que aplique um desconto de 5% no
Freight apenas a clientes com mais de 20 encomendas.
*/
SELECT CASE 
WHEN (SELECT COUNT(*) FROM Orders WHERE Orders.CustomerID = CustomerID) > 20 THEN Freight * 0.95
ELSE Freight
END AS Freight
FROM Orders
END
GO