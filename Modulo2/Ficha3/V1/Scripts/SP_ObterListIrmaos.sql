/*
Obter uma listagem dos alunos que tenham irmãos inscritos
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE ObterListIrmaos
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DISTINCT Pessoas.PessoaID, Relacoes.PessoaBID AS [ID Irmão],  Alunos.AlunoID, FirstName, LastName FROM Relacoes
INNER JOIN Alunos ON Alunos.PessoaID = Relacoes.PessoaAID OR  Alunos.PessoaID = Relacoes.PessoaBID
LEFT JOIN Pessoas ON Alunos.PessoaID = Pessoas.PessoaID
WHERE Relacoes.Tipo = 3
END
GO
