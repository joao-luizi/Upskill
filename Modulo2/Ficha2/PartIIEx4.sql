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
/*
4. Criar uma função ClienteValorGasto que receba o CustomerID e devolva
o valor total gasto por esse cliente em todas as suas encomendas.
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
CREATE PROCEDURE ClienteValorGasto
	-- Add the parameters for the stored procedure here
	@CustomerID NCHAR(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SUM(Quantity * UnitPrice) FROM [Order Details] INNER JOIN Orders ON Orders.OrderID = [Order Details].OrderID
	WHERE Orders.CustomerID = @CustomerID
END
GO
