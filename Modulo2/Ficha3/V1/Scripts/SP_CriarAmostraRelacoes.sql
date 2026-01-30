USE [Upskill_EscolaDelite]
GO

/****** Object:  StoredProcedure [dbo].[SampleRelacoes]    Script Date: 30/01/2026 14:55:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SampleRelacoes]
	-- Add the parameters for the stored procedure here
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Relacoes (PessoaAID, PessoaBID, Tipo)
VALUES
-- João Silva (1) is father of Mariana Pereira (4) and Pedro Rocha (6)
(1, 4, 1),  -- LinhaVertical 1º grau
(1, 6, 1),

-- João Silva (1) is grandfather of Tiago Silva (32) and Ana Silva (33)
(1, 32, 2), -- LinhaVertical 2º grau ou +
(1, 33, 2),

-- Mariana Pereira (4) is mother of Laura Pereira (36)
(4, 36, 1),

-- Siblings example: Mariana Pereira (4) and Pedro Rocha (6)
(4, 6, 3),  -- LinhaHorizontal 1º grau
(6, 4, 3),

-- Cousins example: Tiago Silva (32) and Beatriz Costa (34)
(32, 34, 4), -- LinhaHorizontal 2º grau ou +
(34, 32, 4),

-- Vertical 1º grau: Filipe Ribeiro (12) is father of Tiago Sousa (10)
(12, 10, 1),

-- Horizontal 1º grau: siblings Sofia Almeida (5) and Pedro Rocha (6)
(5, 6, 3),
(6, 5, 3),

-- Vertical 2º grau ou +: grandparents of Sofia Almeida (5)
(30, 5, 2),
(31, 5, 2),

-- Horizontal 2º grau ou +: cousin
(33, 35, 4),
(35, 33, 4),

-- Parent-child for added people
(30, 1, 2),  -- José Manuel Silva is father of João Silva
(31, 2, 2),  -- Maria Helena Costa is mother of Ana Costa
(30, 32, 1), -- José Manuel Silva is father of Tiago Silva
(31, 34, 1), -- Maria Helena Costa is mother of Beatriz Costa

-- Sibling relationship for new people
(32, 33, 3),
(33, 32, 3),

-- Cousins: Pedro Costa (35) and Tiago Silva (32)
(32, 35, 4),
(35, 32, 4);


END
GO

