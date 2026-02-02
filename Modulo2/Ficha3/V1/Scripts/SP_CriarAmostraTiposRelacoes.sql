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
CREATE PROCEDURE CriarAmostraTiposRelacoes
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF EXISTS (SELECT * FROM TiposRelacao
	WHERE TiposRelacao.RelacaoID IN (1, 2, 3, 4))
	PRINT 'As relacoes de Amostra já se econtram na base de dados. Nenhum Registo adicionado.'
	RETURN 
    -- Insert statements for procedure here
	INSERT INTO TiposRelacao (RelacaoID, RelacaoNome)
	VALUES
	(1, 'LinhaVertical 1º grau'),
	(2, 'LinhaVertical 2º grau ou +'),
	(3, 'LinhaHorizontal 1º grau'),
	(4, 'LinhaHorizontal 2º grau ou +')
END
GO
