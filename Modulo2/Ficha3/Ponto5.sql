/*
Mostrar o numero de alunos por ano e curso
*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE AlunosPorAnoECurso
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Turmas.TurmaID,Turmas.CursoID,  YEAR(Turmas.Inicio) AS Ano ,COUNT(*) AS NrdeAlunos from Turmas
INNER JOIN AlunosdaTurma ON Turmas.TurmaID = AlunosdaTurma.TurmaID
GROUP BY Turmas.TurmaID, YEAR(Turmas.Inicio) , Turmas.CursoID
END
GO
