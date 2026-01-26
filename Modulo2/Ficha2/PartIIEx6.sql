/*
6. Criar uma função EncomendaEmFimDeSemana que receba o OrderID e
devolva 'Sim' se a OrderDate for sábado ou domingo, 'Não' caso
contrário

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
