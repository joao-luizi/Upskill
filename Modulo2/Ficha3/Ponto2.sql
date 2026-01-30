/*
Obter uma listagem dos alunos que tenham irmãos inscritos
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE LIstagemDeIrmaos
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DISTINCT [AlunoID]
      ,FirstName
      ,MiddleName
      ,LastName
      ,[DatadeIngresso]
      ,[Ativo]
      ,[TiposdeRelacao].RelacaoNome
  FROM [Upskill_EscolaDelite].[dbo].[Alunos]
  INNER JOIN Relacoes ON Relacoes.PessoaAID = Alunos.PessoaID OR
  Relacoes.PessoaBID = Alunos.PessoaID
  INNER JOIN Pessoas ON Pessoas.PessoaID = Alunos.PessoaID
  INNER JOIN TiposdeRelacao ON Relacoes.Tipo = TiposdeRelacao.RelacaoID
  WHERE Ativo = 1
END
GO
