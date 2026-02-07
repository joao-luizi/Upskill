-- 1. Total exemplares por obra
CREATE OR ALTER PROCEDURE [dbo].[Disponibilidade_Exemplares]
AS
BEGIN
    SET NOCOUNT ON;

    -------------------------------------------------------------------
    -- 1. Total exemplares por obra
    -------------------------------------------------------------------
    SELECT
        Exemplares.ID_Obra,
        COUNT(*) AS Total
    INTO #TotalExemplares
    FROM Exemplares_Nucleo
    INNER JOIN Exemplares
        ON Exemplares_Nucleo.ID_Exemplar = Exemplares.ID_Exemplar
    GROUP BY Exemplares.ID_Obra;

    -- SELECT * FROM #TotalExemplares

    -------------------------------------------------------------------
    -- 2. Exemplares atualmente requisitados (não entregues)
    -------------------------------------------------------------------
    SELECT
        Exemplares.ID_Obra,
        COUNT(*) AS Requisitadas
    INTO #Requisitadas
    FROM Requisicoes
    INNER JOIN Exemplares
        ON Requisicoes.ID_Exemplar = Exemplares.ID_Exemplar
    WHERE
        DataRequisicao IS NOT NULL
        AND DataEntrega IS NULL
    GROUP BY Exemplares.ID_Obra;

    SELECT * FROM #Requisitadas
    -------------------------------------------------------------------
    -- 3. Exemplares reservados para presença (1 por núcleo)
    -------------------------------------------------------------------
    SELECT
        Exemplares.ID_Obra,
        COUNT(DISTINCT Exemplares_Nucleo.ID_Nucleo) AS PresencaObrigatoria
    INTO #Presenca
    FROM Exemplares_Nucleo
    INNER JOIN Exemplares
        ON Exemplares_Nucleo.ID_Exemplar = Exemplares.ID_Exemplar
    GROUP BY Exemplares.ID_Obra;

    -------------------------------------------------------------------
    -- 4. Resultado final
    -------------------------------------------------------------------
    SELECT
        o.Titulo,
        o.Autor,
        t.Total,
        ISNULL(r.Requisitadas, 0) AS Requisitadas,
        p.PresencaObrigatoria,
        CASE
            WHEN t.Total
                 - ISNULL(r.Requisitadas, 0)
                 - p.PresencaObrigatoria < 0
            THEN 0
            ELSE
                t.Total
                - ISNULL(r.Requisitadas, 0)
                - p.PresencaObrigatoria
        END AS DisponiveisParaRequisicao
    FROM Obras o
    INNER JOIN #TotalExemplares t ON t.ID_Obra = o.ID_Obra
    LEFT JOIN #Requisitadas r ON r.ID_Obra = o.ID_Obra
    INNER JOIN #Presenca p ON p.ID_Obra = o.ID_Obra;

    -------------------------------------------------------------------
    -- 5. Limpeza das temp tables
    -------------------------------------------------------------------
    DROP TABLE #TotalExemplares;
    DROP TABLE #Requisitadas;
    DROP TABLE #Presenca;

END;
