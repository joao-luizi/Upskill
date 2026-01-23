--22.01.2026

-- Fazer procedimento para verificar se existe categoria e inserir se não

-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- CREATE PROCEDURE InsertCategoryIf @Categoria nvarchar(15), @DescricaoCategoria ntext
ALTER PROCEDURE InsertCategoryIf @Categoria nvarchar(15), @DescricaoCategoria ntext, @Picture image=NULL
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	if (SELECT Count(*) FROM Categories WHERE CategoryName = @Categoria) = 0
		INSERT INTO Categories (CategoryName, Description) VALUES (@Categoria, @DescricaoCategoria)
	ELSE
		PRINT ('A categoria ' + @Categoria + ' já existe')
END
GO

-- exec dbo.InsertCategoryIf BeveragesInsert, [Outras Bebidas] 



/*
Exercício 2 – Lógica condicional com dados de negócio (IF / ELSE)

Enunciado

Criar uma stored procedure chamada ClassificarProdutoPorStock que:

Receba:
@ProductID
Verifique se o produto existe
Se não existir:
Mostre "Produto não existe"
Se existir:
Classifique o produto conforme o stock:
UnitsInStock = 0 → "Sem stock"
UnitsInStock < 10 → "Stock baixo"
Caso contrário → "Stock normal"

-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE ClassificarProdutoPorStock
	-- Add the parameters for the stored procedure here
	@ProductID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if (SELECT COUNT(*) FROM Products WHERE ProductID = @ProductID) = 0
		PRINT 'Produto não existe'
	ELSE
	BEGIN
	DECLARE @UnitsInStock AS INT
	SET @UnitsInStock = (SELECT Products.UnitsInStock FROM Products WHERE Products.ProductID = @ProductID)
	IF @UnitsInStock = 0
		PRINT 'Sem stock'
	ELSE
	BEGIN
		IF @UnitsInStock < 10
			PRINT 'Stock baixo'
		ELSE
			PRINT 'Stock normal'
	END
	END
		
END
GO

SELECT * FROM Products

exec dbo.ClassificarProdutoPorStock 1
exec dbo.ClassificarProdutoPorStock 5
exec dbo.ClassificarProdutoPorStock 8


Exercício 3 – Uso de WHILE para processamento simples

Enunciado

Cria uma stored procedure chamada ListarPedidosPorAno que:

Receba:
@Ano
Liste os pedidos feitos nesse ano
Utilize:
Uma variável contador
Um ciclo WHILE
A cada iteração, mostre:
O número do pedido (OrderID)
A data do pedido
(Dica: usar uma tabela temporária ou variável de tabela)

*/



