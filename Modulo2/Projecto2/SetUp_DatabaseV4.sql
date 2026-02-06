
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[Criar_Tabelas]	
AS
BEGIN
		PRINT 'A criar as tabelas...';
		-- Assuntos
		IF NOT EXISTS ( SELECT 1
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA = 'dbo'
		  AND TABLE_NAME = 'Assuntos'
		)
		BEGIN
			CREATE TABLE [dbo].[Assuntos](
				[ID_Assunto] [tinyint] IDENTITY(1,1) NOT NULL,
				[Assunto] [nvarchar](50) NOT NULL,
			 CONSTRAINT [PK_Assuntos] PRIMARY KEY CLUSTERED 
			(
				[ID_Assunto] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
			) ON [PRIMARY]
		END
		-- Exemplares
		IF NOT EXISTS ( SELECT 1
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA = 'dbo'
		  AND TABLE_NAME = 'Exemplares'
		)
		BEGIN
			CREATE TABLE [dbo].[Exemplares](
				[ID_Exemplar] [bigint] IDENTITY(1,1) NOT NULL,
				[ID_Obra] [bigint] NOT NULL,
			 CONSTRAINT [PK_Exemplares] PRIMARY KEY CLUSTERED 
			(
				[ID_Exemplar] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
			) ON [PRIMARY]
		END
		-- Exemplares_Nucleo
		IF NOT EXISTS ( SELECT 1
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA = 'dbo'
		  AND TABLE_NAME = 'Exemplares_Nucleo'
		)
		BEGIN
			CREATE TABLE [dbo].[Exemplares_Nucleo](
				[ID_Nucleo] [bigint] NOT NULL,
				[ID_Exemplar] [bigint] NOT NULL,
			 CONSTRAINT [PK_Exemplares_Nucleo] PRIMARY KEY CLUSTERED 
			(
				[ID_Nucleo] ASC,
				[ID_Exemplar] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
			) ON [PRIMARY]
		END
		-- TipoUtilizadores
		IF NOT EXISTS ( SELECT 1
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA = 'dbo'
		  AND TABLE_NAME = 'TipoUtilizadores'
		)
		BEGIN
			CREATE TABLE [dbo].[TipoUtilizadores](
				[ID_TipoUtilizador] [int] IDENTITY(1,1) NOT NULL,
				[Perfil] [nvarchar](50) NOT NULL,
			 CONSTRAINT [PK_TipoUtilizadores] PRIMARY KEY CLUSTERED 
			(
				[ID_TipoUtilizador] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
			) ON [PRIMARY]
		END
		-- Utilizadores
		IF NOT EXISTS ( SELECT 1
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA = 'dbo'
		  AND TABLE_NAME = 'Utilizadores'
		)
		BEGIN
			CREATE TABLE [dbo].[Utilizadores](
				[ID_Utilizador] [bigint] IDENTITY(1,1) NOT NULL,
				[Nome] [nvarchar](50) NOT NULL,
				[ID_TipoUtilizador] [int] NOT NULL,
				[Ativo] [bit] NOT NULL,
			 CONSTRAINT [PK_Utilizadores] PRIMARY KEY CLUSTERED 
			(
				[ID_Utilizador] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
			) ON [PRIMARY]
		END
		-- Infracoes
		IF NOT EXISTS ( SELECT 1
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA = 'dbo'
		  AND TABLE_NAME = 'Infracoes'
		)
		BEGIN
			CREATE TABLE [dbo].[Infracoes](
				[ID_Utilizador] [bigint] NOT NULL,
				[InfracoesTotal] [int] NOT NULL,
				[InfracoesAtuais] [int] NOT NULL,
			CONSTRAINT [PK_Infracoes] PRIMARY KEY CLUSTERED 
			(
				[ID_Utilizador] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
			) ON [PRIMARY]
		END
		-- Nucleos
		IF NOT EXISTS ( SELECT 1
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA = 'dbo'
		  AND TABLE_NAME = 'Nucleos'
		)
		BEGIN
			CREATE TABLE [dbo].[Nucleos](
				[ID_Nucleo] [bigint] IDENTITY(1,1) NOT NULL,
				[Nome] [nvarchar](50) NOT NULL,
				[Local] [nvarchar](50) NOT NULL,
				[ID_TipoNucleo] [tinyint] NOT NULL,
			 CONSTRAINT [PK_Nucleos] PRIMARY KEY CLUSTERED 
			(
				[ID_Nucleo] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
			) ON [PRIMARY]
		END
		-- Obras
		IF NOT EXISTS ( SELECT 1
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA = 'dbo'
		  AND TABLE_NAME = 'Obras'
		)
		BEGIN
			CREATE TABLE [dbo].[Obras](
				[ID_Obra] [bigint] IDENTITY(1,1) NOT NULL,
				[Autor] [nvarchar](50) NOT NULL,
				[ISBN] [nvarchar](50) NOT NULL,
				[Titulo] [nvarchar](50) NOT NULL,
				[Capa] [image] NULL,
				[ID_Assunto] [tinyint] NOT NULL,
			 CONSTRAINT [PK_Obras] PRIMARY KEY CLUSTERED 
			(
				[ID_Obra] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
			) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
		END
		-- Requisicoes
		IF NOT EXISTS ( SELECT 1
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA = 'dbo'
		  AND TABLE_NAME = 'Requisicoes'
		)
		BEGIN
			CREATE TABLE [dbo].[Requisicoes](
				[ID_Requisicao] [bigint] IDENTITY(1,1) NOT NULL,
				[ID_Utilizador] [bigint] NOT NULL,
				[ID_Exemplar] [bigint] NOT NULL,
				[DataRequisicao] [datetime] NOT NULL,
				[DataEntrega] [datetime] NULL,
			 CONSTRAINT [PK_Requisicoes] PRIMARY KEY CLUSTERED 
			(
				[ID_Requisicao] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
			) ON [PRIMARY]
		END
		-- TipoNucleos
		IF NOT EXISTS ( SELECT 1
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA = 'dbo'
		  AND TABLE_NAME = 'TipoNucleos'
		)
		BEGIN
			CREATE TABLE [dbo].[TipoNucleos](
				[ID_TipoNucleo] [tinyint] IDENTITY(1,1) NOT NULL,
				[Descricao] [nvarchar](50) NOT NULL,
			 CONSTRAINT [PK_TipoNucleos] PRIMARY KEY CLUSTERED 
			(
				[ID_TipoNucleo] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
			) ON [PRIMARY]
		END
END
GO

EXEC Criar_Tabelas
GO

CREATE OR ALTER PROCEDURE [dbo].[Criar_Relacoes_Tabelas]
AS
BEGIN
PRINT 'A criar relacoes entre as tabelas...';
	
	-- FK_Infracoes_Utilizadores
	IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_Infracoes_Utilizadores'
	)
	BEGIN
	ALTER TABLE [dbo].[Infracoes]  WITH CHECK ADD  CONSTRAINT [FK_Infracoes_Utilizadores] FOREIGN KEY([ID_Utilizador])
	REFERENCES [dbo].[Utilizadores] ([ID_Utilizador])
	ALTER TABLE [dbo].[Infracoes] CHECK CONSTRAINT [FK_Infracoes_Utilizadores]
	END

	-- FK_Utilizadores_TipoUtilizadores
	IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_Utilizadores_TipoUtilizadores'
	)
	BEGIN
		ALTER TABLE [dbo].[Utilizadores]  WITH CHECK ADD  CONSTRAINT [FK_Utilizadores_TipoUtilizadores] FOREIGN KEY([ID_TipoUtilizador])
		REFERENCES [dbo].[TipoUtilizadores] ([ID_TipoUtilizador])
		ALTER TABLE [dbo].[Utilizadores] CHECK CONSTRAINT [FK_Utilizadores_TipoUtilizadores]
	END
	
	-- FK_Exemplares_Obras
	IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_Exemplares_Obras'
	)
	BEGIN
		ALTER TABLE [dbo].[Exemplares]  WITH CHECK ADD  CONSTRAINT [FK_Exemplares_Obras] FOREIGN KEY([ID_Obra])
		REFERENCES [dbo].[Obras] ([ID_Obra])
		ALTER TABLE [dbo].[Exemplares] CHECK CONSTRAINT [FK_Exemplares_Obras]
	END

	-- FK_Exemplares_Nucleo_Exemplares
	IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_Exemplares_Nucleo_Exemplares'
	)
	BEGIN
		ALTER TABLE [dbo].[Exemplares_Nucleo]  WITH CHECK ADD  CONSTRAINT [FK_Exemplares_Nucleo_Exemplares] FOREIGN KEY([ID_Exemplar])
		REFERENCES [dbo].[Exemplares] ([ID_Exemplar])
		ALTER TABLE [dbo].[Exemplares_Nucleo] CHECK CONSTRAINT [FK_Exemplares_Nucleo_Exemplares]

	END

	-- FK_Exemplares_Nucleo_Nucleos
	IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_Exemplares_Nucleo_Nucleos'
	)
	BEGIN
		ALTER TABLE [dbo].[Exemplares_Nucleo]  WITH CHECK ADD  CONSTRAINT [FK_Exemplares_Nucleo_Nucleos] FOREIGN KEY([ID_Nucleo])
		REFERENCES [dbo].[Nucleos] ([ID_Nucleo])
		ALTER TABLE [dbo].[Exemplares_Nucleo] CHECK CONSTRAINT [FK_Exemplares_Nucleo_Nucleos]
	END
	
	-- FK_Nucleos_TipoNucleos
	IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_Nucleos_TipoNucleos'
	)
	BEGIN
		ALTER TABLE [dbo].[Nucleos]  WITH CHECK ADD  CONSTRAINT [FK_Nucleos_TipoNucleos] FOREIGN KEY([ID_TipoNucleo])
		REFERENCES [dbo].[TipoNucleos] ([ID_TipoNucleo])
		ALTER TABLE [dbo].[Nucleos] CHECK CONSTRAINT [FK_Nucleos_TipoNucleos]
	END

	-- FK_Obras_Assuntos
	IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_Obras_Assuntos'
	)
	BEGIN
		ALTER TABLE [dbo].[Obras]  WITH CHECK ADD  CONSTRAINT [FK_Obras_Assuntos] FOREIGN KEY([ID_Assunto])
		REFERENCES [dbo].[Assuntos] ([ID_Assunto])
		ALTER TABLE [dbo].[Obras] CHECK CONSTRAINT [FK_Obras_Assuntos]
	END

	-- FK_Requisicoes_Exemplares
	IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_Requisicoes_Exemplares'
	)
	BEGIN
		ALTER TABLE [dbo].[Requisicoes]  WITH CHECK ADD  CONSTRAINT [FK_Requisicoes_Exemplares] FOREIGN KEY([ID_Exemplar])
		REFERENCES [dbo].[Exemplares] ([ID_Exemplar])
		ALTER TABLE [dbo].[Requisicoes] CHECK CONSTRAINT [FK_Requisicoes_Exemplares]
	END
	
	-- FK_Requisicoes_Utilizadores
	IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_Requisicoes_Utilizadores'
	)
	BEGIN
		ALTER TABLE [dbo].[Requisicoes]  WITH CHECK ADD  CONSTRAINT [FK_Requisicoes_Utilizadores] FOREIGN KEY([ID_Utilizador])
		REFERENCES [dbo].[Utilizadores] ([ID_Utilizador])
		ALTER TABLE [dbo].[Requisicoes] CHECK CONSTRAINT [FK_Requisicoes_Utilizadores]
	END
END
GO

EXEC Criar_Relacoes_Tabelas
GO

CREATE OR ALTER PROCEDURE [dbo].[Amostra_Criar_Nucleos]
AS
BEGIN
	PRINT 'A criar amostra de nucleos...'
	IF EXISTS (SELECT 1 FROM [TipoNucleos]
	WHERE [Descricao] IN ('Sede Central','Núcleo Regional'))
		BEGIN
			PRINT 'As amostras de nucleos já se encontram na base de dados. Nenhum Registo adicionado.'
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[TipoNucleos] ([Descricao]) VALUES 
			('Sede Central'),
			('Núcleo Regional');
		END
END
GO

EXEC Amostra_Criar_Nucleos
GO

CREATE OR ALTER PROCEDURE [dbo].[Amostra_Criar_Assuntos]
AS
BEGIN
	PRINT 'A criar amostra de assuntos...'
	IF EXISTS (SELECT 1 FROM [Assuntos]
	WHERE [Assunto] IN ('Informática','Literatura', 'História', 'Ciências'))
		BEGIN
			PRINT 'As amostras de assuntos já se encontram na base de dados. Nenhum Registo adicionado.'
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[Assuntos] ([Assunto]) VALUES 
			('Informática'),
			('Literatura'),
			('História'),
			('Ciências');
		END
END
GO

EXEC Amostra_Criar_Assuntos
GO

CREATE OR ALTER PROCEDURE [dbo].[Amostra_Criar_Nucleos]
AS
BEGIN
	PRINT 'A criar amostra de Nucleos...'
	IF EXISTS (SELECT 1 FROM [Nucleos]
	WHERE ([Nome] = 'Biblioteca Central' AND [Local] = 'Lisboa' AND [ID_TipoNucleo] = 1)
	OR ([Nome] = 'Núcleo Norte' AND [Local] = 'Porto' AND [ID_TipoNucleo] = 2)
	OR ([Nome] = 'Núcleo Sul' AND [Local] = 'Faro' AND [ID_TipoNucleo] = 2))
		BEGIN
			PRINT 'As amostras de Nucleos já se encontram na base de dados. Nenhum Registo adicionado.'
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[Nucleos] ([Nome], [Local], [ID_TipoNucleo]) VALUES 
			('Biblioteca Central', 'Lisboa', 1),
			('Núcleo Norte', 'Porto', 2),
			('Núcleo Sul', 'Faro', 2);
		END
END
GO

EXEC Amostra_Criar_Nucleos
GO

CREATE OR ALTER PROCEDURE [dbo].[Amostra_Criar_Obras]
AS
BEGIN
	PRINT 'A criar amostra de Obras...'
	IF EXISTS (SELECT 1 FROM [Obras]
	WHERE [ISBN] IN ('978-1484230176', '978-0747532743', '978-9722100268', '978-0062316097'))
		BEGIN
			PRINT 'As amostras de Obras já se encontram na base de dados. Nenhum Registo adicionado.'
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[Obras] ([Autor], [ISBN], [Titulo], [Capa], [ID_Assunto]) VALUES 
			('Andrew Troelsen', '978-1484230176', 'Pro C# 10 with .NET 6', NULL, 1),
			('J.K. Rowling', '978-0747532743', 'Harry Potter e a Pedra Filosofal', NULL, 2),
			('Fernando Pessoa', '978-9722100268', 'Mensagem', NULL, 2),
			('Yuval Noah Harari', '978-0062316097', 'Sapiens', NULL, 3);
		END
END
GO

EXEC Amostra_Criar_Obras
GO

CREATE OR ALTER PROCEDURE [dbo].[Amostra_Criar_Exemplares]
AS
BEGIN
	PRINT 'A criar amostra de Exemplares...'
	IF EXISTS (SELECT 1 FROM [Exemplares]
	WHERE [ID_Obra] IN (1, 2, 3))
		BEGIN
			PRINT 'As amostras de Exemplares já se encontram na base de dados. Nenhum Registo adicionado.'
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[Exemplares] ([ID_Obra]) VALUES (1), (1), (1),
			(2), (2), (2),
			(3), (3);
		END
END
GO

EXEC Amostra_Criar_Exemplares
GO

CREATE OR ALTER PROCEDURE [dbo].[Amostra_Criar_Exemplares_Nucleos]
AS
BEGIN
	PRINT 'A criar amostra de Exemplares_Nucleos...'
	IF EXISTS (SELECT 1 FROM [Exemplares_Nucleo]
	WHERE ([ID_Nucleo] = 1 AND [ID_Exemplar] = 1)
	OR ([ID_Nucleo] = 1 AND [ID_Exemplar] = 4)
	OR ([ID_Nucleo] = 1 AND [ID_Exemplar] = 7)
	OR ([ID_Nucleo] = 2 AND [ID_Exemplar] = 2)
	OR ([ID_Nucleo] = 2 AND [ID_Exemplar] = 5)
	OR ([ID_Nucleo] = 2 AND [ID_Exemplar] = 8)
	OR ([ID_Nucleo] = 3 AND [ID_Exemplar] = 3)
	OR ([ID_Nucleo] = 3 AND [ID_Exemplar] = 6)
	)
		BEGIN
			PRINT 'As amostras de Exemplares_Nucleos já se encontram na base de dados. Nenhum Registo adicionado.'
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[Exemplares_Nucleo] ([ID_Nucleo], [ID_Exemplar]) VALUES 
			(1, 1), (2, 2), (3, 3), -- Obra 1 distribuída
			(1, 4), (2, 5), (3, 6), -- Obra 2 distribuída
			(1, 7), (2, 8);         -- Obra 3 distribuída
		END
END
GO

EXEC Amostra_Criar_Exemplares_Nucleos
GO

CREATE OR ALTER PROCEDURE [dbo].[Amostra_Criar_TipoUtilizadores]
AS
BEGIN
PRINT 'A criar amostra de TipoUtilizadores...'
	IF EXISTS (SELECT 1 FROM TipoUtilizadores
	WHERE ID_TipoUtilizador IN (1, 2)
	)
		BEGIN
			PRINT 'As amostras de TipoUtilizadores já se encontram na base de dados. Nenhum Registo adicionado.'
		END
	ELSE
	BEGIN
	INSERT INTO [dbo].[TipoUtilizadores] ([Perfil]) VALUES 
			('Leitor'), ('Admin')
	END
END
GO

EXEC Amostra_Criar_TipoUtilizadores
GO


CREATE OR ALTER PROCEDURE [dbo].[Amostra_Criar_Utilizadores]
AS
BEGIN
	PRINT 'A criar amostra de Utilizadores...'
	IF EXISTS (SELECT 1 FROM [Utilizadores]
	WHERE [Nome] IN ('João Silva', 'Maria Santos', 'Ricardo Sousa', 'Ana Oliveira', 'João Tomas', 'Jose Borrego')
	)
		BEGIN
			PRINT 'As amostras de Utilizadores já se encontram na base de dados. Nenhum Registo adicionado.'
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[Utilizadores] ([Nome], [ID_TipoUtilizador], [Ativo]) VALUES 
			('João Silva', 1, 1),    -- Utilizador Leitor regular
			('Maria Santos', 1, 1),  -- Utilizador Leitor regular
			('Ricardo Sousa', 1, 0), -- Suspenso (mais de 3 infrações) 
			('Ana Oliveira', 1, 1),  -- Utilizador Leitor para teste de inatividade
			('João Tomas', 1, 1), -- Utilizador Leitor com ultima requisição há mais de um ano
			('José Borrego', 2, 1);  -- Utilizador Admin
		END
END
GO

EXEC Amostra_Criar_Utilizadores
GO

CREATE OR ALTER PROCEDURE [dbo].[Amostra_Criar_Infracoes]
AS
BEGIN
	PRINT 'A criar amostra de Infracoes...'
	IF EXISTS (SELECT 1 FROM Infracoes
	WHERE ID_Utilizador IN (1, 2, 3, 4, 5, 6)
	)
		BEGIN
			PRINT 'As amostras de Infracoes já se encontram na base de dados. Nenhum Registo adicionado.'
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[Infracoes] ([ID_Utilizador], InfracoesTotal, InfracoesAtuais) VALUES 
			(1, 0, 0),    
			(2, 0, 0),  
			(3, 0, 4), 
			(4, 0, 0), 
			(5, 0, 0)
		END
END
GO

EXEC Amostra_Criar_Infracoes
GO

CREATE OR ALTER PROCEDURE [dbo].[Amostra_Criar_Requisicoes]
AS
BEGIN
	PRINT 'A criar amostra de Requisicoes...'
	IF EXISTS (SELECT 1 FROM [Requisicoes]
	WHERE ([ID_Utilizador] = 1 AND [ID_Exemplar] = 1 AND [DataRequisicao] = '2026-01-24'
	OR [ID_Utilizador] = 1 AND [ID_Exemplar] = 4 AND [DataRequisicao] = '2026-01-22'
	OR [ID_Utilizador] = 2 AND [ID_Exemplar] = 2 AND [DataRequisicao] = '2026-01-16'
	OR [ID_Utilizador] = 2 AND [ID_Exemplar] = 5 AND [DataRequisicao] = '2025-12-01')
	)
		BEGIN
			PRINT 'As amostras de Requisicoes já se encontram na base de dados. Nenhum Registo adicionado.'
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[Requisicoes] ([ID_Utilizador], [ID_Exemplar], [DataRequisicao], [DataEntrega]) VALUES 
			-- Leitor 1: Requisitado há 12 dias (Devolver em breve - falta < 5 dias)
			(1, 1, '2026-01-24', NULL), 
			-- Leitor 1: Requisitado há 14 dias (Devolução URGENTE - falta < 3 dias)
			(1, 4, '2026-01-22', NULL),
			-- Leitor 2: Requisitado há 20 dias (ATRASO - passou dos 15 dias) 
			(2, 2, '2026-01-16', NULL),
			-- Histórico: Obra já entregue
			(2, 5, '2025-12-01', '2025-12-10'),
			-- Leitor com ultima requisição há mais de 10 anos
			(5, 1, '2000-12-01', '2000-12-31');

		END
END
GO

EXEC Amostra_Criar_Requisicoes
GO

CREATE OR ALTER PROCEDURE Utilizadores_DesativarPorInfracoes
AS 
BEGIN
/*
Parte II - 9.
Suspender o acesso a requisicões a leitores que tenham procedido a
devoluções atrasadas em mais que três ocasiões
*/
SELECT Utilizadores.ID_Utilizador
INTO #Alvos
FROM Utilizadores
JOIN Infracoes 
    ON Infracoes.ID_Utilizador = Utilizadores.ID_Utilizador
WHERE Utilizadores.Ativo <> 0
  AND Infracoes.InfracoesAtuais > 3;

-- Update users
UPDATE Utilizadores
SET Ativo = 0
FROM Utilizadores
JOIN #Alvos A
    ON A.ID_Utilizador = Utilizadores.ID_Utilizador;

-- Update infractions
UPDATE Infracoes
SET 
    InfracoesTotal = ISNULL(InfracoesTotal,0) + InfracoesAtuais,
    InfracoesAtuais = 0
FROM Infracoes
JOIN #Alvos A 
    ON A.ID_Utilizador = Infracoes.ID_Utilizador;

DROP TABLE #Alvos;
END
GO

CREATE OR ALTER PROCEDURE Utilizadores_Reativar
@ID_Utilizador BIGINT
AS 
BEGIN
/*
Parte II - 10. 
Reativar o acesso a um leitor suspenso
*/
UPDATE Utilizadores
SET 
    Ativo = 1
WHERE Utilizadores.Ativo <> 0 
  AND Utilizadores.ID_Utilizador = @ID_Utilizador;
END
GO

CREATE OR ALTER PROCEDURE Utilizadores_Delete
    @ID_Utilizador BIGINT
AS
BEGIN
/*
Esta stored procedure realiza a eliminação de um leitor com base no @ID_Utilizador.

Foi intencionalmente isolada como ponto central de DELETE para:
- Garantir a ordem correta de eliminação entre tabelas relacionadas
- Permitir reutilização por outras SPs
- Criar um ponto único de manutenção para futuras extensões
  (ex.: histórico, logging, estatísticas ou anonimização)

Nota:
- Esta SP executa apenas a eliminação física dos dados.
- A validação de regras de negócio deve ser feita pela SP chamadora.
*/
    SET NOCOUNT ON;

    DELETE FROM Infracoes
    WHERE [ID_Utilizador] = @ID_Utilizador;
    PRINT '@ID_Utilizador ' + CAST(@ID_Utilizador AS NVARCHAR(MAX)) + ' foi removido de Infracoes.'
    DELETE FROM Requisicoes
    WHERE [ID_Utilizador] = @ID_Utilizador;
    PRINT '@ID_Utilizador ' + CAST(@ID_Utilizador AS NVARCHAR(MAX)) + ' foi removido de Requisiçoes.'
    DELETE FROM Utilizadores
    WHERE [ID_Utilizador] = @ID_Utilizador;
    PRINT '@ID_Utilizador ' + CAST(@ID_Utilizador AS NVARCHAR(MAX)) + ' foi removido de Utilizadores.'
END
GO

CREATE OR ALTER PROCEDURE Utilizador_ApagarInativos
AS
BEGIN
/*
Parte II - 11. Eliminar leitores que estejam há mais de um ano sem fazer qualquer
requisição, desde que não tenham nenhuma requisição ativa nesse
momento
*/
    SET NOCOUNT ON;

    DECLARE @ID_Utilizador BIGINT;

    DECLARE utilizador_cursor CURSOR FOR
        SELECT R.ID_Utilizador
		FROM Requisicoes R
		INNER JOIN Utilizadores U
			ON R.ID_Utilizador = U.ID_Utilizador
		WHERE U.ID_TipoUtilizador = 1
		GROUP BY R.ID_Utilizador
		HAVING 
		-- No requisicoes in the last year
		SUM(CASE WHEN R.DataRequisicao >= DATEADD(YEAR, -1, GETDATE()) THEN 1 ELSE 0 END) = 0
		-- No requisicoes with DataEntrega IS NULL
		AND SUM(CASE WHEN R.DataEntrega IS NULL THEN 1 ELSE 0 END) = 0;

    OPEN utilizador_cursor;
    FETCH NEXT FROM utilizador_cursor INTO @ID_Utilizador;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        EXEC Utilizadores_Delete @ID_Utilizador;
        FETCH NEXT FROM utilizador_cursor INTO @ID_Utilizador;
    END

    CLOSE utilizador_cursor;
    DEALLOCATE utilizador_cursor;
END



