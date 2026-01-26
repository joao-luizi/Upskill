/*
5. Criar uma função TotalEncomendasPorAno que receba o EmployeeID e um
dado ano e devolva o número de encomendas registadas por esse
funcionário nesse ano


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
CREATE PROCEDURE EncomendaEmFimDeSemana
	-- Add the parameters for the stored procedure here
	@OrderID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET DATEFIRST 1
    -- Insert statements for procedure here
	IF (SELECT DATEPART(weekday, OrderDate) FROM Orders WHERE ORDERS.OrderID = @OrderID) IN (7, 6)
	PRINT 'SIM'
	ELSE
	PRINT 'NÃO'
END
GO
