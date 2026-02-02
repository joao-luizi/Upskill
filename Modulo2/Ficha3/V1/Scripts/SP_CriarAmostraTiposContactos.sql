
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE CriarAmostraTiposContactos
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF EXISTS (SELECT 1 FROM TiposdeContactos
	WHERE NomeDoContacto IN ('Telefone', 'Email'))
	PRINT 'As amostras de tipo de contactos já foram adicionadas'
	RETURN
	INSERT INTO TiposdeContactos 
	(NomeDoContacto)
	VALUES
	
	('Telefone'),
	('Email')
	
    -- Insert statements for procedure here

END
GO
