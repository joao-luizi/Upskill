/*
7. Criar uma função EmpregadoAnosServico que receba o EmployeeID e
devolva o número de anos de serviço, com base no campo HireDate.



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
CREATE PROCEDURE EmpregadoAnosServico
	-- Add the parameters for the stored procedure here
	@EmployeeID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here

	SELECT DATEDIFF(YEAR, HireDate, GETDATE()) FROM Employees WHERE EmployeeID = @EmployeeID
END
GO
