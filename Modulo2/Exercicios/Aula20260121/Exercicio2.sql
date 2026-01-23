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
