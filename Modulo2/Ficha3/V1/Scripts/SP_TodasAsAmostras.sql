
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE CriarTodasAmostras
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	EXEC CriarAmostraPessoas
	EXEC CriarAmostraAlunos
	EXEC CriarAmostraProfessores
	EXEC CriarAmostraTiposContactos
	EXEC CriarAmostraContactos
	EXEC CriarAmostraTiposRelacoes
	EXEC CriarAmostraRelacoes
    
END
GO
