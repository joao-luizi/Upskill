/*
9. Criar uma função de tabela ListaProdutosNivelStock que devolva todos
os produtos cujo UnitsInStock seja inferior a ReorderLevel. Deve
devolver ProductID, ProductName, UnitsInStock, ReorderLevel.

*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE ListaProdutosNivelStock
	-- Add the parameters for the stored procedure here
	@CustomerID NCHAR(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here

	SELECT  Products.ProductID, ProductName, UnitsInStock, ReorderLevel FROM Products
	INNER JOIN [Order Details] ON [Order Details].ProductID = Products.ProductID
	WHERE UnitsInStock < ReorderLevel
END
GO
