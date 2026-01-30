USE [Upskill_EscolaDelite]
GO

/****** Object:  StoredProcedure [dbo].[SampleProfessors]    Script Date: 30/01/2026 14:54:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SampleProfessors]
	-- Add the parameters for the stored procedure here
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
INSERT INTO Professores (PessoaID, Ativo, DataDeContratacao)
VALUES
(1, 1, '2018-09-01'),   -- João Silva
(2, 1, '2020-02-15'),   -- Ana Costa
(3, 1, '2015-06-10'),   -- Carlos Silva
(12, 1, '2019-08-01'),  -- Filipe Ribeiro
(13, 1, '2017-03-20'),  -- Helena Martins
(22, 1, '2021-01-05');  -- Ricardo Moreira

END
GO

