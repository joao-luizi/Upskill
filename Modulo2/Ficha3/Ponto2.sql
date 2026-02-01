/*
Obter uma listagem dos alunos que tenham irmãos inscritos
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE ListarIrmaos
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
    Alunos.AlunoID,
    p.FirstName,
    p.MiddleName,
    p.LastName,
    Alunos.DataRegisto,
    Alunos.Ativo
FROM Alunos 
JOIN Pessoas
    ON Pessoas.PessoaID = Alunos.PessoaID
WHERE Alunos.Ativo = 1
  AND EXISTS (
      SELECT 1
      FROM Relacoes 
      WHERE Relacoes.Tipo = 1
        AND (Relacoes.PessoaAID = Alunos.PessoaID OR Relacoes.PessoaBID = Alunos.PessoaID)
  );
END
GO
