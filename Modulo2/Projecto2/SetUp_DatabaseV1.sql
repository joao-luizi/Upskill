
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[Criar_Tabelas]	
AS
BEGIN
		PRINT 'A criar as tabelas...';

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

		IF NOT EXISTS ( SELECT 1
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA = 'dbo'
		  AND TABLE_NAME = 'Leitores'
		)
		BEGIN
			CREATE TABLE [dbo].[Leitores](
				[ID_Leitor] [bigint] IDENTITY(1,1) NOT NULL,
				[Nome] [nvarchar](50) NOT NULL,
				[Ativo] [bit] NOT NULL,
				[Infracoes] [tinyint] NOT NULL,
			 CONSTRAINT [PK_Leitores] PRIMARY KEY CLUSTERED 
			(
				[ID_Leitor] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
			) ON [PRIMARY]
		END

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

		IF NOT EXISTS ( SELECT 1
		FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_SCHEMA = 'dbo'
		  AND TABLE_NAME = 'Requisicoes'
		)
		BEGIN
			CREATE TABLE [dbo].[Requisicoes](
				[ID_Requisicao] [bigint] IDENTITY(1,1) NOT NULL,
				[ID_Leitor] [bigint] NOT NULL,
				[ID_Exemplar] [bigint] NOT NULL,
				[DataRequisicao] [datetime] NOT NULL,
				[DataEntrega] [datetime] NULL,
			 CONSTRAINT [PK_Requisicoes] PRIMARY KEY CLUSTERED 
			(
				[ID_Requisicao] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
			) ON [PRIMARY]
		END
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

	-- FK_Exemplares_Nucleo_Exemplares
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

	-- FK_Obras_Assuntos
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

CREATE OR ALTER PROCEDURE [dbo].[Amostra_Criar_Leitores]
AS
BEGIN
	PRINT 'A criar amostra de Leitores...'
	IF EXISTS (SELECT 1 FROM [Leitores]
	WHERE [Nome] IN ('João Silva', 'Maria Santos', 'Ricardo Sousa', 'Ana Oliveira')
	)
		BEGIN
			PRINT 'As amostras de Leitores já se encontram na base de dados. Nenhum Registo adicionado.'
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[Leitores] ([Nome], [Ativo], [Infracoes]) VALUES 
			('João Silva', 1, 0),    -- Leitor regular
			('Maria Santos', 1, 0),  -- Leitora regular
			('Ricardo Sousa', 0, 4), -- Suspenso (mais de 3 infrações) 
			('Ana Oliveira', 1, 0);  -- Leitora para teste de inatividade
		END
END
GO

EXEC Amostra_Criar_Leitores
GO

CREATE OR ALTER PROCEDURE [dbo].[Amostra_Criar_Requisicoes]
AS
BEGIN
	PRINT 'A criar amostra de Requisicoes...'
	IF EXISTS (SELECT 1 FROM [Requisicoes]
	WHERE ([ID_Leitor] = 1 AND [ID_Exemplar] = 1 AND [DataRequisicao] = '2026-01-24'
	OR [ID_Leitor] = 1 AND [ID_Exemplar] = 4 AND [DataRequisicao] = '2026-01-22'
	OR [ID_Leitor] = 2 AND [ID_Exemplar] = 2 AND [DataRequisicao] = '2026-01-16'
	OR [ID_Leitor] = 2 AND [ID_Exemplar] = 5 AND [DataRequisicao] = '2025-12-01')
	)
		BEGIN
			PRINT 'As amostras de Requisicoes já se encontram na base de dados. Nenhum Registo adicionado.'
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[Requisicoes] ([ID_Leitor], [ID_Exemplar], [DataRequisicao], [DataEntrega]) VALUES 
			-- Leitor 1: Requisitado há 12 dias (Devolver em breve - falta < 5 dias)
			(1, 1, '2026-01-24', NULL), 
			-- Leitor 1: Requisitado há 14 dias (Devolução URGENTE - falta < 3 dias)
			(1, 4, '2026-01-22', NULL),
			-- Leitor 2: Requisitado há 20 dias (ATRASO - passou dos 15 dias) 
			(2, 2, '2026-01-16', NULL),
			-- Histórico: Obra já entregue
			(2, 5, '2025-12-01', '2025-12-10');
		END
END
GO

EXEC Amostra_Criar_Requisicoes
GO





