/*
Obter uma listagem dos N professores mais antigos em funções
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE ListarAntiguidadeN 
	-- Add the parameters for the stored procedure here
	@N INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP(@N) FirstName, LastName, DATEDIFF(YEAR, DataDeContratacao, GETDATE()) AS [Antiguidade (Anos)] FROM Professores 
INNER JOIN Pessoas ON Professores.PessoaID = Pessoas.PessoaID
WHERE Ativo = 1
ORDER BY DataDeContratacao ASC
END
GO
