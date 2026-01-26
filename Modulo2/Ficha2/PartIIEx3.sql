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
3. Criar uma função ClienteEmPais que receba o CustomerID e o CountryId
e devolva 1 se o cliente for do país ou 0 caso contrário
---Primeiro Migramos todos os registos com MigrateCoutnries
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
This procedure migrates all known countries to a table Countires
--First we union every uniques cpuntriy found
CREATE PROCEDURE MigrateCountries
AS
BEGIN


INSERT INTO Countries (CountryName)
SELECT Country FROM Employees
UNION
SELECT Country FROM Suppliers
UNION 
SELECT Country FROM Customers
UNION 
SELECT ShipCountry FROM Orders

END
GO

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
ALTER PROCEDURE ClienteEmPais
	-- Add the parameters for the stored procedure here
	@CustomerID NCHAR(5), @CountryId INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   DECLARE @CountryName NVARCHAR(15) = (SELECT CountryName FROM Countries WHERE Countries.CountryId = @CountryId)

   IF ((SELECT COUNT(*) FROM Customers WHERE CustomerID = @CustomerID AND Customers.Country = @CountryName) > 0)
	RETURN 1
	ELSE
	RETURN 0
	
END
GO
