/*
Obter uma listagem de alunos e professores com endereços de email e numeros de
telefone incorretos
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
ALTER PROCEDURE ContactCheck 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ContactoID, Contactos.PessoaID, FirstName, LastName, NomeDoContacto, Valor FROM Contactos 
	INNER JOIN Pessoas ON Pessoas.PessoaID = Contactos.PessoaID
	INNER JOIN TiposdeContactos ON Contactos.Tipo = TiposdeContactos.TipoID
	WHERE Contactos.Ativo = 1
	AND (Contactos.Tipo = 1 AND (LEN(Contactos.Valor) <> 9 
	OR ISNUMERIC(Contactos.Valor) = 0))
	OR (Contactos.Ativo = 1 AND (Contactos.Tipo = 2 AND CHARINDEX('@', Contactos.Valor) = 0))


END
GO
