/*
8. Criar uma função de tabela ListaClienteResumoEncomenda que receba o
CustomerID e devolva OrderID, OrderDate, ShippedDate e Freight.
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
ALTER PROCEDURE ListaClienteResumoEncomenda
	-- Add the parameters for the stored procedure here
	@CustomerID NCHAR(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here

	SELECT OrderID, OrderDate, ShippedDate, Freight FROM Orders WHERE CustomerID = @CustomerID
END
GO
