
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE SetUpAnoLetivo_Turmas
    @AnoLetivoID BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (
        SELECT 1
        FROM AnoLetivo
        WHERE AnoLetivoID = @AnoLetivoID
    )
    BEGIN
        PRINT 'Ano Letivo com ID: ' + CAST (@AnoLetivoID AS NVARCHAR(MAX)) + 'não encontrado.'
        RETURN;
    END;

    INSERT INTO Turmas (AnoLetivoID, CursoID, AnoDoCurso)
    SELECT
        @AnoLetivoID,
        c.CursoID,
        1 AS AnoDoCurso
    FROM Cursos c
    WHERE c.Ativo = 1
      AND NOT EXISTS (
          SELECT 1
          FROM Turmas t
          WHERE t.AnoLetivoID = @AnoLetivoID
            AND t.CursoID = c.CursoID
            AND t.AnoDoCurso = 1
      );
END;
GO
