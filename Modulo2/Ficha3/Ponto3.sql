/*
Obter uma listagem do quadro de honra dos alunos, para um dado ano
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE HonorBoardPerYear
	-- Add the parameters for the stored procedure here
	@Year INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT FirstName, LastName, Nome AS Curso, Valor, YEAR (AlunosdaTurma.DataTermino) AS [Data de conclusao] 
	FROM AlunosdaTurma
INNER JOIN Turmas ON AlunosdaTurma.TurmaID = Turmas.TurmaID
INNER JOIN Cursos ON Cursos.CursoID = Turmas.CursoID
INNER JOIN Alunos ON AlunosdaTurma.AlunoID = Alunos.AlunoID
INNER JOIN Pessoas ON Pessoas.PessoaID = Alunos.PessoaID
WHERE YEAR(AlunosdaTurma.DataTermino) = @Year AND Valor > 17
END
GO
