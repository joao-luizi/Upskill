USE [Upskill_EscolaDelite]
GO

/****** Object:  StoredProcedure [dbo].[SampleAlunos]    Script Date: 30/01/2026 14:52:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SampleAlunos]
	-- Add the parameters for the stored procedure here
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Alunos (PessoaID, DatadeIngresso, Ativo)
VALUES
(4,  '2023-09-15', 1),  -- Mariana Pereira
(5,  '2022-09-01', 1),  -- Sofia Almeida
(6,  '2021-09-01', 1),  -- Pedro Rocha
(10, '2020-09-15', 1),  -- Tiago Sousa
(11, '2024-09-01', 1),  -- Beatriz Gomes
(14, '2021-09-15', 0),  -- Daniel Teixeira (inactive)
(15, '2019-09-01', 1),  -- Catarina Pinto
(16, '2018-09-01', 1),  -- Miguel Azevedo
(18, '2022-02-01', 1),  -- André Correia
(21, '2023-09-01', 1),  -- Leonor Cunha
(23, '2020-09-01', 1),  -- Sara Antunes
(25, '2024-09-01', 1),  -- Matilde Oliveira
(28, '2019-09-15', 0);  -- Gonçalo Serra (inactive)


END
GO

