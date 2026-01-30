USE [Upskill_EscolaDelite]
GO

/****** Object:  StoredProcedure [dbo].[SampleContactos]    Script Date: 30/01/2026 14:52:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SampleContactos]
	-- Add the parameters for the stored procedure here
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Contactos (PessoaID, Tipo, Valor, Ativo)
VALUES
-- Pessoa 1 – João Silva
(1, 1, '912345678', 1),
(1, 2, 'joao.silva@email.com', 1),

-- Pessoa 2 – Ana Costa
(2, 1, '91987654', 1),                -- ❌ less than 9 digits
(2, 2, 'ana.costaemail.com', 1),      -- ❌ missing @

-- Pessoa 3 – Carlos Silva
(3, 1, '91A456789', 1),               -- ❌ letters
(3, 2, 'carlos.silva@email.com', 1),

-- Pessoa 4 – Mariana Pereira
(4, 2, 'mariana.pereira@email.com', 1),

-- Pessoa 5 – Sofia Almeida
(5, 1, '934567890', 1),
(5, 2, 'sofia.almeidaemail.com', 0),  -- ❌ missing @, inactive

-- Pessoa 6 – Pedro Rocha
(6, 1, '965432109', 1),
(6, 2, 'pedro.rocha@email.com', 1),

-- Pessoa 7 – Inês Ferreira
(7, 2, 'ines.ferreira@email.com', 1),

-- Pessoa 8 – Rui Mendes
(8, 1, '91R345678', 1),               -- ❌ letters
(8, 2, 'rui.mendes@email.com', 1),

-- Pessoa 9 – Cláudia Lopes
(9, 1, '92345678', 0),                -- ❌ less than 9 digits
(9, 2, 'claudia.lopes@email.com', 1),

-- Pessoa 10 – Tiago Sousa
(10, 1, '936789012', 1),

-- Pessoa 11 – Beatriz Gomes
(11, 2, 'beatriz.gomesemail.com', 1), -- ❌ missing @

-- Pessoa 12 – Filipe Ribeiro
(12, 1, '919999999', 1),
(12, 2, 'filipe.ribeiro@email.com', 1),

-- Pessoa 13 – Helena Martins
(13, 1, '91HELENA9', 1),              -- ❌ letters
(13, 2, 'helena.martins@email.com', 1),

-- Pessoa 14 – Daniel Teixeira
(14, 1, '91234567', 1),               -- ❌ less than 9 digits

-- Pessoa 15 – Catarina Pinto
(15, 2, 'catarina.pinto@email.com', 1),

-- Pessoa 16 – Miguel Azevedo
(16, 1, '934561234', 1),
(16, 2, 'miguel.azevedo@email.com', 1),

-- Pessoa 17 – Patrícia Faria
(17, 2, 'patricia.fariaemail.com', 0), -- ❌ missing @, inactive

-- Pessoa 18 – André Correia
(18, 1, '91ANDRE12', 1),              -- ❌ letters

-- Pessoa 19 – Vera Barbosa
(19, 1, '912345678', 1),
(19, 2, 'vera.barbosa@email.com', 1),

-- Pessoa 20 – Bruno Neves
(20, 1, '96BRUNO99', 0),              -- ❌ letters, inactive
(20, 2, 'bruno.neves@email.com', 1),

-- Pessoa 21 – Leonor Cunha
(21, 2, 'leonor.cunha@email.com', 1),

-- Pessoa 22 – Ricardo Moreira
(22, 1, '919876543', 1),

-- Pessoa 23 – Sara Antunes
(23, 2, 'sara.antunesemail.com', 1),  -- ❌ missing @

-- Pessoa 24 – Nuno Carvalho
(24, 1, '91234', 1),                  -- ❌ too short

-- Pessoa 25 – Matilde Oliveira
(25, 2, 'matilde.oliveira@email.com', 1),

-- Pessoa 26 – Luís Batista
(26, 1, '934567890', 1),
(26, 2, 'luis.batista@email.com', 1),

-- Pessoa 27 – Marta Pacheco
(27, 2, 'marta.pachecoemail.com', 1), -- ❌ missing @

-- Pessoa 28 – Gonçalo Serra
(28, 1, '91GONCALO', 1),              -- ❌ letters

-- Pessoa 29 – Isabel Nogueira
(29, 1, '919123456', 1),
(29, 2, 'isabel.nogueira@email.com', 1);

END
GO

