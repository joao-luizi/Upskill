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
CREATE PROCEDURE ListarPedidosPorAno
	-- Add the parameters for the stored procedure here
	@Ano int
AS
BEGIN
	DECLARE @Table TABLE
	(
	OrderId int,
	OrderDate datetime
	)


	INSERT INTO @Table
	Select OrderID, OrderDate From Orders WHERE Year(OrderDate) = @Ano
	
	DECLARE @max int
	DECLARE @date datetime	
	DECLARE @id int = 1

	select @max = MAX(OrderId) from @Table


WHILE (@id <= @max)
BEGIN

SELECT @date = (SELECT OrderDate FROM Orders WHERE OrderId = @id)

PRINT(@date)  --COMMENT THIS LINE OUT AND COMMENT IN THE NEXT EXEC(@SQL) IF YOU SEE THE CORRECT OUTPUT
--EXEC(@SQL)
SET @id = @id +1
END

END
GO
