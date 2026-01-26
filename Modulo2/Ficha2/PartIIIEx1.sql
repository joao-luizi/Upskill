/*
1. Criar um procedimento InserirProduto para inserir um novo produto.
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
CREATE PROCEDURE InserirProduto
	-- Add the parameters for the stored procedure here
	@ProductName INT
      ,@SupplierID INT
      ,@CategoryID INT
      ,@QuantityPerUnit NVARCHAR(20)
      ,@UnitPrice money
      ,@UnitsInStock smallint
      ,@UnitsOnOrder smallint
      ,@ReorderLevel smallint
      ,@Discontinued bit 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	INSERT INTO Products
	([ProductName]
      ,[SupplierID]
      ,[CategoryID]
      ,[QuantityPerUnit]
      ,[UnitPrice]
      ,[UnitsInStock]
      ,[UnitsOnOrder]
      ,[ReorderLevel]
      ,[Discontinued]) 
	  VALUES (
	  @ProductName
      ,@SupplierID
      ,@CategoryID
      ,@QuantityPerUnit
      ,@UnitPrice
      ,@UnitsInStock
      ,@UnitsOnOrder
      ,@ReorderLevel
      ,@Discontinued) 
END
GO
