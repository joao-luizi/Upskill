
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[Criar_Tabelas]
	
AS
BEGIN
	PRINT 'A criar as tabelas...';
	-- Pessoa
	IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'dbo'
      AND TABLE_NAME = 'Pessoas'
	)
	BEGIN
		CREATE TABLE [dbo].[Pessoas](
			[PessoaID] [bigint] IDENTITY(1,1) NOT NULL,
			[NIF] [nchar](9) NOT NULL,
			[FirstName] [nvarchar](100) NOT NULL,
			[LastName] [nvarchar](100) NOT NULL,
			[MiddleName] [nvarchar](100) NULL,
			[DOB] [datetime] NOT NULL,
			[LastUpdate] [datetime] NOT NULL,
		 CONSTRAINT [PK_Pessoas] PRIMARY KEY CLUSTERED 
		(
			[PessoaID] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
		 CONSTRAINT [Pessoas_NIF] UNIQUE NONCLUSTERED 
		(
			[NIF] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
		) ON [PRIMARY]
	END
	-- TiposdeContactos
	IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'dbo'
      AND TABLE_NAME = 'TiposdeContactos'
	)
	BEGIN
		CREATE TABLE [dbo].[TiposdeContactos](
			[TipoID] [smallint] IDENTITY(1,1) NOT NULL,
			[NomeDoContacto] [nvarchar](50) NOT NULL,
		 CONSTRAINT [PK_TiposdeContactos] PRIMARY KEY CLUSTERED 
		(
			[TipoID] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
		) ON [PRIMARY]
	END

	-- Contactos
	IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'dbo'
      AND TABLE_NAME = 'Contactos'
	)
	BEGIN
		CREATE TABLE [dbo].[Contactos](
			[PessoaID] [bigint] NOT NULL,
			[Tipo] [smallint] NOT NULL,
			[Valor] [nvarchar](50) NOT NULL,
			[Ativo] [bit] NOT NULL,
		 CONSTRAINT [PK_Contactos_1] PRIMARY KEY CLUSTERED 
		(
			[PessoaID] ASC,
			[Tipo] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
		) ON [PRIMARY]
	END
	-- TiposRelacao
	IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'dbo'
      AND TABLE_NAME = 'TiposRelacao'
	)
	BEGIN
		CREATE TABLE [dbo].[TiposRelacao](
			[RelacaoID] [smallint] IDENTITY(1,1) NOT NULL,
			[RelacaoNome] [nvarchar](50) NOT NULL,
		 CONSTRAINT [PK_TipoRelacao] PRIMARY KEY CLUSTERED 
		(
			[RelacaoID] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
		) ON [PRIMARY]
	END
	-- Relacoes
	IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'dbo'
      AND TABLE_NAME = 'Relacoes'
	)
	BEGIN
		CREATE TABLE [dbo].[Relacoes](
			[PessoaAID] [bigint] NOT NULL,
			[PessoaBID] [bigint] NOT NULL,
			[Tipo] [smallint] NOT NULL,
		 CONSTRAINT [PK_Relacoes] PRIMARY KEY CLUSTERED 
		(
			[PessoaAID] ASC,
			[PessoaBID] ASC,
			[Tipo] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
		) ON [PRIMARY]
	END
	-- Alunos
	IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'dbo'
      AND TABLE_NAME = 'Alunos'
	)
	BEGIN
		CREATE TABLE [dbo].[Alunos](
			[AlunoID] [bigint] IDENTITY(1,1) NOT NULL,
			[PessoaID] [bigint] NOT NULL,
			[DataRegisto] [datetime] NOT NULL,
			[DataTransferencia] [datetime] NULL,
			[Ativo] [bit] NOT NULL,
		 CONSTRAINT [PK_Alunos] PRIMARY KEY CLUSTERED 
		(
			[AlunoID] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
		) ON [PRIMARY]
	END
	-- Professores
	IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'dbo'
      AND TABLE_NAME = 'Professores'
	)
	BEGIN
		CREATE TABLE [dbo].[Professores](
			[ProfessorID] [bigint] IDENTITY(1,1) NOT NULL,
			[PessoaID] [bigint] NOT NULL,
			[DataContratacao] [datetime] NOT NULL,
			[DataCessacao] [datetime] NULL,
			[Ativo] [bit] NOT NULL,
		 CONSTRAINT [PK_Professores] PRIMARY KEY CLUSTERED 
		(
			[ProfessorID] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
		) ON [PRIMARY]
	END
	-- Cursos
	IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'dbo'
      AND TABLE_NAME = 'Cursos'
	)
	BEGIN
		CREATE TABLE [dbo].[Cursos](
			[CursoID] [bigint] IDENTITY(1,1) NOT NULL,
			[Nome] [nvarchar](50) NOT NULL,
			[Duracao] [smallint] NOT NULL,
			[Ativo] [bit] NOT NULL,
		 CONSTRAINT [PK_Cursos] PRIMARY KEY CLUSTERED 
		(
			[CursoID] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
		) ON [PRIMARY]
	END
	-- AnoLetivo
	IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'dbo'
      AND TABLE_NAME = 'AnoLetivo'
	)
	BEGIN
		CREATE TABLE [dbo].[AnoLetivo](
			[AnoLetivoID] [bigint] IDENTITY(1,1) NOT NULL,
			[DataInicio] [datetime] NOT NULL,
			[DataFim] [datetime] NOT NULL,
			[Ativo] [bit] NOT NULL,
		 CONSTRAINT [PK_AnoLetivo] PRIMARY KEY CLUSTERED 
		(
			[AnoLetivoID] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
		) ON [PRIMARY]
	END
	-- Turmas
	IF NOT EXISTS (
	SELECT 1
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA = 'dbo'
	  AND TABLE_NAME = 'Turmas'
	)
	BEGIN
		CREATE TABLE [dbo].[Turmas](
			[TurmaID] [bigint] IDENTITY(1,1) NOT NULL,
			[AnoLetivoID] [bigint] NOT NULL,
			[CursoID] [bigint] NOT NULL,
			[AnoDoCurso] [smallint] NOT NULL,
		 CONSTRAINT [PK_Turmas] PRIMARY KEY CLUSTERED 
		(
			[TurmaID] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
		) ON [PRIMARY]
	END
	-- AlunosdaTurma
	IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'dbo'
      AND TABLE_NAME = 'AlunosdaTurma'
	)
	BEGIN
		CREATE TABLE [dbo].[AlunosdaTurma](
			[TurmaID] [bigint] NOT NULL,
			[AlunoID] [bigint] NOT NULL,
			[NotaFinal] [smallint] NULL,
			[DataAvaliacao] [datetime] NULL,
		 CONSTRAINT [PK_AlunosdaTurma] PRIMARY KEY CLUSTERED 
		(
			[TurmaID] ASC,
			[AlunoID] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
		) ON [PRIMARY]
	END
	-- ProfessoresdaTurma
	IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA = 'dbo'
      AND TABLE_NAME = 'ProfessoresdaTurma'
	)
	BEGIN
	CREATE TABLE [dbo].[ProfessoresdaTurma](
		[TurmaID] [bigint] NOT NULL,
		[ProfessorID] [bigint] NOT NULL,
	 CONSTRAINT [PK_ProfessoresdaTurma] PRIMARY KEY CLUSTERED 
	(
		[TurmaID] ASC,
		[ProfessorID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
	END
END
GO

EXEC Criar_Tabelas;
GO

CREATE OR ALTER PROCEDURE [dbo].[Criar_Relacoes_Tabelas]
AS
BEGIN
	PRINT 'A criar relacoes entre as tabelas...';
	-- FK_Alunos_Pessoas
	IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_Alunos_Pessoas'
	)
	BEGIN
		ALTER TABLE [dbo].[Alunos]  WITH CHECK ADD  CONSTRAINT [FK_Alunos_Pessoas] FOREIGN KEY([PessoaID])
		REFERENCES [dbo].[Pessoas] ([PessoaID])
		ALTER TABLE [dbo].[Alunos] CHECK CONSTRAINT [FK_Alunos_Pessoas]
	END

	-- FK_AlunosdaTurma_Alunos1
	IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_AlunosdaTurma_Alunos1'
	)
	BEGIN
		ALTER TABLE [dbo].[AlunosdaTurma]  WITH CHECK ADD  CONSTRAINT [FK_AlunosdaTurma_Alunos1] FOREIGN KEY([AlunoID])
		REFERENCES [dbo].[Alunos] ([AlunoID])
		ALTER TABLE [dbo].[AlunosdaTurma] CHECK CONSTRAINT [FK_AlunosdaTurma_Alunos1]
	END

	-- FK_AlunosdaTurma_Turmas
	IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_AlunosdaTurma_Turmas'
	)
	BEGIN
		ALTER TABLE [dbo].[AlunosdaTurma]  WITH CHECK ADD  CONSTRAINT [FK_AlunosdaTurma_Turmas] FOREIGN KEY([TurmaID])
		REFERENCES [dbo].[Turmas] ([TurmaID])
		ALTER TABLE [dbo].[AlunosdaTurma] CHECK CONSTRAINT [FK_AlunosdaTurma_Turmas]
	END

	-- FK_Contactos_Pessoas
	IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_Contactos_Pessoas'
	)
	BEGIN
		ALTER TABLE [dbo].[Contactos]  WITH CHECK ADD  CONSTRAINT [FK_Contactos_Pessoas] FOREIGN KEY([PessoaID])
		REFERENCES [dbo].[Pessoas] ([PessoaID])
		ALTER TABLE [dbo].[Contactos] CHECK CONSTRAINT [FK_Contactos_Pessoas]
	END

	-- FK_Contactos_TiposdeContactos
	IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_Contactos_TiposdeContactos'
	)
	BEGIN
		ALTER TABLE [dbo].[Contactos]  WITH CHECK ADD  CONSTRAINT [FK_Contactos_TiposdeContactos] FOREIGN KEY([Tipo])
		REFERENCES [dbo].[TiposdeContactos] ([TipoID])
		ALTER TABLE [dbo].[Contactos] CHECK CONSTRAINT [FK_Contactos_TiposdeContactos]
	END

	-- FK_Professores_Pessoas
	IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_Professores_Pessoas'
	)
	BEGIN
		ALTER TABLE [dbo].[Professores]  WITH CHECK ADD  CONSTRAINT [FK_Professores_Pessoas] FOREIGN KEY([PessoaID])
		REFERENCES [dbo].[Pessoas] ([PessoaID])
		ALTER TABLE [dbo].[Professores] CHECK CONSTRAINT [FK_Professores_Pessoas]
	END

	-- FK_Professores_Pessoas
	IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_ProfessoresdaTurma_Professores'
	)
	BEGIN
		ALTER TABLE [dbo].[ProfessoresdaTurma]  WITH CHECK ADD  CONSTRAINT [FK_ProfessoresdaTurma_Professores] FOREIGN KEY([ProfessorID])
		REFERENCES [dbo].[Professores] ([ProfessorID])
		ALTER TABLE [dbo].[ProfessoresdaTurma] CHECK CONSTRAINT [FK_ProfessoresdaTurma_Professores]
	END
	
	-- FK_ProfessoresdaTurma_Turmas
	IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_ProfessoresdaTurma_Turmas'
	)
	BEGIN
		ALTER TABLE [dbo].[ProfessoresdaTurma]  WITH CHECK ADD  CONSTRAINT [FK_ProfessoresdaTurma_Turmas] FOREIGN KEY([TurmaID])
		REFERENCES [dbo].[Turmas] ([TurmaID])
		ALTER TABLE [dbo].[ProfessoresdaTurma] CHECK CONSTRAINT [FK_ProfessoresdaTurma_Turmas]  
	END
	
	-- FK_Relacoes_Pessoas
	IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_Relacoes_Pessoas'
	)
	BEGIN
		ALTER TABLE [dbo].[Relacoes]  WITH CHECK ADD  CONSTRAINT [FK_Relacoes_Pessoas] FOREIGN KEY([PessoaAID])
		REFERENCES [dbo].[Pessoas] ([PessoaID])
		ALTER TABLE [dbo].[Relacoes] CHECK CONSTRAINT [FK_Relacoes_Pessoas]
	END

	-- FK_Relacoes_Pessoas1
	IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_Relacoes_Pessoas1'
	)
	BEGIN
		ALTER TABLE [dbo].[Relacoes]  WITH CHECK ADD  CONSTRAINT [FK_Relacoes_Pessoas1] FOREIGN KEY([PessoaBID])
		REFERENCES [dbo].[Pessoas] ([PessoaID])
		ALTER TABLE [dbo].[Relacoes] CHECK CONSTRAINT [FK_Relacoes_Pessoas1]
	END

	-- FK_Relacoes_TiposRelacao
	IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_Relacoes_TiposRelacao'
	)
	BEGIN
		ALTER TABLE [dbo].[Relacoes]  WITH CHECK ADD  CONSTRAINT [FK_Relacoes_TiposRelacao] FOREIGN KEY([Tipo])
		REFERENCES [dbo].[TiposRelacao] ([RelacaoID])
		ALTER TABLE [dbo].[Relacoes] CHECK CONSTRAINT [FK_Relacoes_TiposRelacao]
	END

	-- FK_Turmas_AnoLetivo
	IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_Turmas_AnoLetivo'
	)
	BEGIN
		ALTER TABLE [dbo].[Turmas]  WITH CHECK ADD  CONSTRAINT [FK_Turmas_AnoLetivo] FOREIGN KEY([AnoLetivoID])
		REFERENCES [dbo].[AnoLetivo] ([AnoLetivoID])
		ALTER TABLE [dbo].[Turmas] CHECK CONSTRAINT [FK_Turmas_AnoLetivo]
	END

	-- FK_Turmas_Cursos
	IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_Turmas_Cursos'
	)
	BEGIN
	ALTER TABLE [dbo].[Turmas]  WITH CHECK ADD  CONSTRAINT [FK_Turmas_Cursos] FOREIGN KEY([CursoID])
	REFERENCES [dbo].[Cursos] ([CursoID])
	ALTER TABLE [dbo].[Turmas] CHECK CONSTRAINT [FK_Turmas_Cursos]
	END

END
GO

EXEC Criar_Relacoes_Tabelas;
GO

CREATE OR ALTER PROCEDURE [dbo].[Amostra_Criar_Pessoas]
AS
BEGIN
/*
===============================================================================
Procedure:   Amostra_Criar_Pessoas
Author:      João Luizi
Created:     2026-02-05

AI Assistance:
- Tool: ChatGPT
- Approx. contribution: ~40%
- Role: Syntax verification, refactoring suggestions, documentation support,
        sample data creation

Description:
- Creates a predefined sample dataset of Pessoas
- Inserts multiple Pessoas records with realistic personal data
- Intended for development, testing, and academic demonstration purposes

Execution:
- Can be executed standalone
- Designed to be called as part of an initial database setup or seed process

Notes:
- Verifies existence of sample data based on a fixed set of NIFs
- If any of the sample NIFs already exist, no records are inserted
- Assumes NIF uniqueness constraint at the database level
- Uses GETDATE() for LastUpdate to reflect insertion time
- Not intended for production environments
===============================================================================
*/
PRINT 'A criar amostras de pessoas...';
IF EXISTS (
    SELECT 1
    FROM Pessoas
    WHERE NIF IN (
		'123456789', '987654321', '456789123','321654987','159753486', '741852963', 
		'852963741', '963852741', '369258147', '258147369','147258369', '789456123',
		'654123789', '951753852', '852741963', '753159846', '159846753','486159753', 
		'357159486', '951486357', '654987321', '789321654', '321789654', '963741852', 
		'147369258', '258369147', '369147258', '852147963', '741963852', '963258741', 
		'852147258', '741852147','369852741', '258741963', '147852369', '963147258'
		)
	)
	BEGIN
	PRINT 'A amostra de Pessoas já existe na base de dados. Nenhum registo adicionado'
	END
	ELSE
	BEGIN
		INSERT INTO Pessoas
		(NIF, FirstName, MiddleName, LastName, DOB, LastUpdate)
		VALUES
		('123456789', 'João', 'Miguel', 'Silva', '1990-04-12', GETDATE()),
		('987654321', 'Ana', NULL, 'Costa', '1982-09-30', GETDATE()),
		('456789123', 'Carlos', 'Eduardo', 'Silva', '1970-01-15', GETDATE()),
		('321654987', 'Mariana', NULL, 'Pereira', '2015-06-20', GETDATE()),
		('159753486', 'Sofia', 'Isabel', 'Almeida', '2008-02-03', GETDATE()),

		('741852963', 'Pedro', 'Henrique', 'Rocha', '2012-11-18', GETDATE()),
		('852963741', 'Inês', NULL, 'Ferreira', '1995-07-07', GETDATE()),
		('963852741', 'Rui', 'Manuel', 'Mendes', '1988-01-25', GETDATE()),
		('369258147', 'Cláudia', NULL, 'Lopes', '1979-05-14', GETDATE()),
		('258147369', 'Tiago', 'André', 'Sousa', '2006-09-02', GETDATE()),

		('147258369', 'Beatriz', NULL, 'Gomes', '2014-12-09', GETDATE()),
		('789456123', 'Filipe', 'José', 'Ribeiro', '1985-03-19', GETDATE()),
		('654123789', 'Helena', 'Maria', 'Martins', '1976-08-27', GETDATE()),
		('951753852', 'Daniel', NULL, 'Teixeira', '2009-04-05', GETDATE()),
		('852741963', 'Catarina', 'Sofia', 'Pinto', '1993-10-11', GETDATE()),

		('753159846', 'Miguel', NULL, 'Azevedo', '2016-01-30', GETDATE()),
		('159846753', 'Patrícia', 'Andreia', 'Faria', '1981-06-22', GETDATE()),
		('486159753', 'André', NULL, 'Correia', '2004-02-14', GETDATE()),
		('357159486', 'Vera', 'Lúcia', 'Barbosa', '1969-07-03', GETDATE()),
		('951486357', 'Bruno', 'Alexandre', 'Neves', '1998-11-29', GETDATE()),

		('654987321', 'Leonor', NULL, 'Cunha', '2013-05-17', GETDATE()),
		('789321654', 'Ricardo', 'Paulo', 'Moreira', '1974-09-08', GETDATE()),
		('321789654', 'Sara', 'Cristina', 'Antunes', '2007-12-01', GETDATE()),
		('963741852', 'Nuno', NULL, 'Carvalho', '1986-04-26', GETDATE()),
		('147369258', 'Matilde', NULL, 'Oliveira', '2018-08-15', GETDATE()),

		('258369147', 'Luís', 'Fernando', 'Batista', '1965-02-10', GETDATE()),
		('369147258', 'Marta', 'Rita', 'Pacheco', '1991-06-06', GETDATE()),
		('852147963', 'Gonçalo', NULL, 'Serra', '2005-10-21', GETDATE()),
		('741963852', 'Isabel', 'Teresa', 'Nogueira', '1972-01-04', GETDATE()),

		('963258741', 'José', 'Manuel', 'Silva', '1965-03-10', GETDATE()),
		('852147258', 'Maria', 'Helena', 'Costa', '1966-07-21', GETDATE()),
		('741852147', 'Tiago', NULL, 'Silva', '2010-09-12', GETDATE()),
		('369852741', 'Ana', 'Catarina', 'Silva', '2012-04-03', GETDATE()),
		('258741963', 'Beatriz', NULL, 'Costa', '2008-05-18', GETDATE()),
		('147852369', 'Pedro', NULL, 'Costa', '2014-06-20', GETDATE()),
		('963147258', 'Laura', 'Sofia', 'Pereira', '2016-11-02', GETDATE());
	END
END
GO

EXEC Amostra_Criar_Pessoas;
GO

CREATE OR ALTER PROCEDURE [dbo].[Amostra_Criar_TiposRelacoes]
AS
BEGIN
	/*
	===============================================================================
	Procedure:   Amostra_Criar_TiposRelacoes
	Author:      João Luizi
	Created:     2026-02-05

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~10%
	- Role: Syntax verification, refactoring suggestions, documentation support

	Description:
	- Creates a predefined lookup dataset for Tipos de Relação
	- Defines hierarchical and horizontal relationship types
	- Intended for use as a reference table across the data model

	Execution:
	- Can be executed standalone
	- Does not require any prior seed or sample data

	Notes:
	- Uses fixed RelacaoID values to ensure referential consistency
	- Prevents duplicate insertion by checking existing RelacaoID values
	- Designed as a static lookup table
	- Not intended for modification during normal application operation
	- Safe to execute multiple times
	===============================================================================
	*/
	PRINT 'A criar tipos de relaçao...'
	IF EXISTS (SELECT 1 FROM TiposRelacao
	WHERE TiposRelacao.RelacaoID IN (1, 2, 3, 4))
		BEGIN
			PRINT 'As relacoes de Amostra já se encontram na base de dados. Nenhum Registo adicionado.'
		END
	ELSE
		BEGIN
			INSERT INTO TiposRelacao (RelacaoNome)
			VALUES
			('LinhaVertical 1º grau'),
			('LinhaVertical 2º grau ou +'),
			('LinhaHorizontal 1º grau'),
			('LinhaHorizontal 2º grau ou +')
		END
END
GO

EXEC Amostra_Criar_TiposRelacoes;
GO

CREATE OR ALTER PROCEDURE [dbo].[Amostra_Criar_Relacoes]
AS
BEGIN
	/*
	===============================================================================
	Procedure:   Amostra_Criar_Relacoes
	Author:      João Luizi
	Created:     2026-02-05

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~40%
	- Role: Syntax verification, refactoring suggestions, documentation support,
			sample data creation

	Description:
	- Creates a predefined sample dataset of relationships between Pessoas
	- Links PessoaAID and PessoaBID via a specific Tipo (relationship type)
	- Intended for development, testing, and academic demonstration purposes

	Execution:
	- Must be executed after:
		1. Amostra_Criar_Pessoas
		2. Amostra_Criar_TiposRelacoes

	Notes:
	- Checks if at least one of the sample relationships already exists
	  to prevent duplicate inserts
	- PessoaID and Tipo values are hardcoded and must exist prior to execution
	- Uses full “all-or-nothing” logic: either all relations are inserted, or none
	- Not intended for production environments
	===============================================================================
	*/
    PRINT 'A criar relações pessoa para pessoa...';
    IF EXISTS (
        SELECT 1
        FROM Relacoes r
        WHERE
            (r.PessoaAID = 1  AND r.PessoaBID = 4  AND r.Tipo = 1) OR
            (r.PessoaAID = 1  AND r.PessoaBID = 6  AND r.Tipo = 1) OR
            (r.PessoaAID = 1  AND r.PessoaBID = 32 AND r.Tipo = 2) OR
            (r.PessoaAID = 1  AND r.PessoaBID = 33 AND r.Tipo = 2) OR
            (r.PessoaAID = 4  AND r.PessoaBID = 36 AND r.Tipo = 1) OR
            (r.PessoaAID = 4  AND r.PessoaBID = 6  AND r.Tipo = 3) OR
            (r.PessoaAID = 32 AND r.PessoaBID = 34 AND r.Tipo = 4) OR
            (r.PessoaAID = 12 AND r.PessoaBID = 10 AND r.Tipo = 1) OR
            (r.PessoaAID = 5  AND r.PessoaBID = 6  AND r.Tipo = 3) OR
            (r.PessoaAID = 30 AND r.PessoaBID = 5  AND r.Tipo = 2) OR
            (r.PessoaAID = 31 AND r.PessoaBID = 5  AND r.Tipo = 2) OR
            (r.PessoaAID = 33 AND r.PessoaBID = 35 AND r.Tipo = 4) OR
            (r.PessoaAID = 30 AND r.PessoaBID = 1  AND r.Tipo = 2) OR
            (r.PessoaAID = 31 AND r.PessoaBID = 2  AND r.Tipo = 2) OR
            (r.PessoaAID = 30 AND r.PessoaBID = 32 AND r.Tipo = 1) OR
            (r.PessoaAID = 31 AND r.PessoaBID = 34 AND r.Tipo = 1) OR
            (r.PessoaAID = 32 AND r.PessoaBID = 33 AND r.Tipo = 3) OR
            (r.PessoaAID = 32 AND r.PessoaBID = 35 AND r.Tipo = 4)
    )
    BEGIN
        PRINT 'As relações de Amostra já se encontram na base de dados. Nenhum registo adicionado.';
    END
    ELSE
    BEGIN
        INSERT INTO Relacoes (PessoaAID, PessoaBID, Tipo)
        VALUES
            (1, 4, 1), 
            (1, 6, 1),
            (1, 32, 2),
            (1, 33, 2),
            (4, 36, 1),
            (4, 6, 3), 
            (32, 34, 4), 
            (12, 10, 1),
            (5, 6, 3),
            (30, 5, 2),
            (31, 5, 2),
            (33, 35, 4),
            (30, 1, 2),  
            (31, 2, 2),  
            (30, 32, 1), 
            (31, 34, 1), 
            (32, 33, 3),
            (32, 35, 4);
    END
END
GO

EXEC Amostra_Criar_Relacoes;
GO

CREATE OR ALTER PROCEDURE [dbo].[Amostra_Criar_TiposContactos]
AS
BEGIN
	/*
	===============================================================================
	Procedure:   Amostra_Criar_TiposContactos
	Author:      João Luizi
	Created:     2026-02-05

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~40%
	- Role: Syntax verification, refactoring suggestions, documentation support

	Description:
	- Creates a predefined sample dataset of Tipos de Contactos
	- Defines basic contact methods such as Telefone and Email
	- Intended for development, testing, and academic demonstration purposes

	Execution:
	- Can be executed standalone
	- Does not require any prior seed data

	Notes:
	- Checks for existence of contact types by name to prevent duplicate inserts
	- Uses fixed contact type values for consistency
	- Not intended for production environments
	- Safe to execute multiple times
	===============================================================================
	*/
	PRINT 'A criar Tipos de contactos';
	IF EXISTS (SELECT 1 FROM TiposdeContactos
	WHERE NomeDoContacto IN ('Telefone', 'Email'))
		BEGIN
			PRINT 'As amostras de tipo de contactos já foram adicionadas'
		END
	ELSE
		BEGIN
			INSERT INTO TiposdeContactos 
			(NomeDoContacto)
			VALUES
			('Telefone'),
			('Email')
		END
END
GO

EXEC Amostra_Criar_TiposContactos;
GO

CREATE OR ALTER PROCEDURE [dbo].[Amostra_Criar_Contactos]
AS
BEGIN
	/*
	===============================================================================
	Procedure:   Amostra_Criar_Contactos
	Author:      João Luizi
	Created:     2026-02-05

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~40%
	- Role: Syntax verification, refactoring suggestions, documentation support,
			sample data creation

	Description:
	- Creates a predefined sample dataset of Contactos for Pessoas
	- Each contact has a PessoaID, Tipo (contact type), Valor, and Ativo status
	- Intended for development, testing, and academic demonstration purposes

	Execution:
	- Must be executed after:
		1. Amostra_Criar_Pessoas
		2. Amostra_Criar_TiposContactos

	Notes:
	- Checks for existence of each (PessoaID, Tipo) pair to prevent duplicates
	- Inserts all contacts in one go only if none of the pairs already exist
	- Uses fixed values for contact numbers and emails for consistency
	- Not intended for production environments
	- Safe to execute multiple times without creating duplicate entries
	===============================================================================
	*/

	PRINT 'A criar Amostra de contactos';
	IF EXISTS (
        SELECT 1
        FROM Contactos c
        WHERE
            (c.PessoaID = 1  AND c.Tipo = 1) OR
            (c.PessoaID = 1  AND c.Tipo = 2) OR
            (c.PessoaID = 2  AND c.Tipo = 1) OR
            (c.PessoaID = 2  AND c.Tipo = 2) OR
            (c.PessoaID = 3  AND c.Tipo = 1) OR
            (c.PessoaID = 3  AND c.Tipo = 2) OR
            (c.PessoaID = 4  AND c.Tipo = 2) OR
            (c.PessoaID = 5  AND c.Tipo = 1) OR
            (c.PessoaID = 5  AND c.Tipo = 2) OR
            (c.PessoaID = 6  AND c.Tipo = 1) OR
            (c.PessoaID = 6  AND c.Tipo = 2) OR
            (c.PessoaID = 7  AND c.Tipo = 2) OR
            (c.PessoaID = 8  AND c.Tipo = 1) OR
            (c.PessoaID = 8  AND c.Tipo = 2) OR
            (c.PessoaID = 9  AND c.Tipo = 1) OR
            (c.PessoaID = 9  AND c.Tipo = 2) OR
            (c.PessoaID = 10 AND c.Tipo = 1) OR
            (c.PessoaID = 11 AND c.Tipo = 2) OR
            (c.PessoaID = 12 AND c.Tipo = 1) OR
            (c.PessoaID = 12 AND c.Tipo = 2) OR
            (c.PessoaID = 13 AND c.Tipo = 1) OR
            (c.PessoaID = 13 AND c.Tipo = 2) OR
            (c.PessoaID = 14 AND c.Tipo = 1) OR
            (c.PessoaID = 15 AND c.Tipo = 2) OR
            (c.PessoaID = 16 AND c.Tipo = 1) OR
            (c.PessoaID = 16 AND c.Tipo = 2) OR
            (c.PessoaID = 17 AND c.Tipo = 2) OR
            (c.PessoaID = 18 AND c.Tipo = 1) OR
            (c.PessoaID = 19 AND c.Tipo = 1) OR
            (c.PessoaID = 19 AND c.Tipo = 2) OR
            (c.PessoaID = 20 AND c.Tipo = 1) OR
            (c.PessoaID = 20 AND c.Tipo = 2) OR
            (c.PessoaID = 21 AND c.Tipo = 2) OR
            (c.PessoaID = 22 AND c.Tipo = 1) OR
            (c.PessoaID = 23 AND c.Tipo = 2) OR
            (c.PessoaID = 24 AND c.Tipo = 1) OR
            (c.PessoaID = 25 AND c.Tipo = 2) OR
            (c.PessoaID = 26 AND c.Tipo = 1) OR
            (c.PessoaID = 26 AND c.Tipo = 2) OR
            (c.PessoaID = 27 AND c.Tipo = 2) OR
            (c.PessoaID = 28 AND c.Tipo = 1) OR
            (c.PessoaID = 29 AND c.Tipo = 1) OR
            (c.PessoaID = 29 AND c.Tipo = 2)
    )
    BEGIN
        PRINT 'Contactos de Amostra já se encontram na base de dados. Nenhum registo adicionado.';
    END
	ELSE
	BEGIN
		INSERT INTO Contactos (PessoaID, Tipo, Valor, Ativo)
		VALUES
		(1, 1, '912345678', 1),
		(1, 2, 'joao.silva@email.com', 1),
		(2, 1, '91987654', 1),                
		(2, 2, 'ana.costaemail.com', 1),   
		(3, 1, '91A456789', 1),       
		(3, 2, 'carlos.silva@email.com', 1),
		(4, 2, 'mariana.pereira@email.com', 1),
		(5, 1, '934567890', 1),
		(5, 2, 'sofia.almeidaemail.com', 0), 
		(6, 1, '965432109', 1),
		(6, 2, 'pedro.rocha@email.com', 1),
		(7, 2, 'ines.ferreira@email.com', 1),
		(8, 1, '91R345678', 1),      
		(8, 2, 'rui.mendes@email.com', 1),
		(9, 1, '92345678', 0),  
		(9, 2, 'claudia.lopes@email.com', 1),
		(10, 1, '936789012', 1),
		(11, 2, 'beatriz.gomesemail.com', 1),
		(12, 1, '919999999', 1),
		(12, 2, 'filipe.ribeiro@email.com', 1),
		(13, 1, '91HELENA9', 1),     
		(13, 2, 'helena.martins@email.com', 1),
		(14, 1, '91234567', 1),  
		(15, 2, 'catarina.pinto@email.com', 1),
		(16, 1, '934561234', 1),
		(16, 2, 'miguel.azevedo@email.com', 1),
		(17, 2, 'patricia.fariaemail.com', 0),
		(18, 1, '91ANDRE12', 1), 
		(19, 1, '912345678', 1),
		(19, 2, 'vera.barbosa@email.com', 1),
		(20, 1, '96BRUNO99', 0), 
		(20, 2, 'bruno.neves@email.com', 1),
		(21, 2, 'leonor.cunha@email.com', 1),
		(22, 1, '919876543', 1),
		(23, 2, 'sara.antunesemail.com', 1),
		(24, 1, '91234', 1), 
		(25, 2, 'matilde.oliveira@email.com', 1),
		(26, 1, '934567890', 1),
		(26, 2, 'luis.batista@email.com', 1),
		(27, 2, 'marta.pachecoemail.com', 1),
		(28, 1, '91GONCALO', 1),           
		(29, 1, '919123456', 1),
		(29, 2, 'isabel.nogueira@email.com', 1);
	END
END
GO

CREATE OR ALTER PROCEDURE [dbo].[Amostra_Criar_Alunos]
AS
BEGIN
	/*
	===============================================================================
	Procedure:   Amostra_Criar_Alunos
	Author:      João Luizi
	Created:     2026-02-05

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~40%
	- Role: Syntax verification, refactoring suggestions, documentation support,
			sample data creation

	Description:
	- Creates a predefined sample dataset of Alunos
	- Registers Pessoas as Alunos with enrollment date and active status
	- Intended for development, testing, and academic demonstration purposes

	Execution:
	- Must be executed after Amostra_Criar_Pessoas

	Notes:
	- Verifies existence of sample data based on a fixed set of PessoaID values
	- If any of the sample PessoaIDs already exist, no records are inserted
	- Assumes Pessoas sample data was previously created via Amostra_Criar_Pessoas
	- Uses fixed enrollment dates to simulate realistic academic timelines
	- Not intended for production environments
	===============================================================================
	*/
	PRINT 'A criar amostra de alunos...';
	IF EXISTS (SELECT 1 FROM Alunos
	WHERE PessoaID IN 
	(4, 5, 6, 10, 11, 14, 15, 16, 18, 21, 23, 25, 28))
		BEGIN
			PRINT 'Amostra de Alunos já se encontra inserida. Nenhum Registo foi adicionado.'
		END
	ELSE
		BEGIN
		INSERT INTO Alunos (PessoaID, DataRegisto, Ativo)
		VALUES
		(4,  '2023-09-15', 1),  -- Mariana Pereira
		(5,  '2022-09-01', 1),  -- Sofia Almeida
		(6,  '2021-09-01', 1),  -- Pedro Rocha
		(10, '2020-09-15', 1),  -- Tiago Sousa
		(11, '2024-09-01', 1),  -- Beatriz Gomes
		(14, '2021-09-15', 1),  -- Daniel Teixeira 
		(15, '2019-09-01', 1),  -- Catarina Pinto
		(16, '2018-09-01', 1),  -- Miguel Azevedo
		(18, '2022-02-01', 1),  -- André Correia
		(21, '2023-09-01', 1),  -- Leonor Cunha
		(23, '2020-09-01', 1),  -- Sara Antunes
		(25, '2024-09-01', 1),  -- Matilde Oliveira
		(28, '2019-09-15', 1);  -- Gonçalo Serra 
	END
END
GO

EXEC Amostra_Criar_Alunos;
GO

CREATE OR ALTER PROCEDURE [dbo].[Amostra_Criar_Professores]
AS
BEGIN
	/*
	===============================================================================
	Procedure:   Amostra_Criar_Professores
	Author:      João Luizi
	Created:     2026-02-05

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~40%
	- Role: Syntax verification, refactoring suggestions, documentation support,
			sample data creation

	Description:
	- Creates a predefined sample dataset of Professores
	- Links existing Pessoas records to the Professores entity
	- Registers hiring date and active employment status

	Execution:
	- Must be executed after Amostra_Criar_Pessoas

	Notes:
	- Depends on existing Pessoas records created by Amostra_Criar_Pessoas
	- PessoaID values are hardcoded and must exist prior to execution
	- If any of the sample PessoaIDs already exist in Professores, no records are inserted
	- Uses fixed hiring dates to simulate realistic employment timelines
	- Not intended for production environments
	===============================================================================
	*/
	PRINT 'A criar amostra de Professores...';
	IF EXISTS (SELECT 1 FROM Professores WHERE PessoaID IN (
	1, 2, 3, 12, 13, 22))
		BEGIN
			PRINT 'Amostra de Professores já se encontra inserida. Nenhum Registo foi adicionado.'
		END
	ELSE
		BEGIN
			INSERT INTO Professores (PessoaID, Ativo, DataContratacao)
			VALUES
			(1, 1, '2018-09-01'),   -- João Silva
			(2, 1, '2020-02-15'),   -- Ana Costa
			(3, 1, '2015-06-10'),   -- Carlos Silva
			(12, 1, '2019-08-01'),  -- Filipe Ribeiro
			(13, 1, '2017-03-20'),  -- Helena Martins
			(22, 1, '2021-01-05');  -- Ricardo Moreira
		END
END
GO

EXEC Amostra_Criar_Professores;
GO

CREATE OR ALTER PROCEDURE [dbo].[Amostra_Criar_Cursos]
AS
BEGIN
	/*
	===============================================================================
	Procedure:   Amostra_Criar_Cursos
	Author:      João Luizi
	Created:     2026-02-05

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~40%
	- Role: Syntax verification, refactoring suggestions, documentation support,
			sample data creation

	Description:
	- Creates a predefined sample dataset of Cursos
	- Each Curso includes a name, duration (in years), and active status
	- Intended for development, testing, and academic demonstration purposes

	Execution:
	- Can be executed standalone
	- No prior seed data required, safe to run independently

	Notes:
	- Checks for existence of Cursos by name to prevent duplicate inserts
	- Uses fixed durations and active status for all sample courses
	- Not intended for production environments
	- Safe to execute multiple times
	===============================================================================
	*/
	PRINT 'A criar amostra de Cursos...';
    IF EXISTS (
        SELECT 1
        FROM Cursos
        WHERE Nome IN (
            'Programação em C',
            'Programação em C++',
            'Programação em Java',
            'Desenvolvimento Web',
            'Engenharia de Software',
            'Bases de Dados',
            'Redes de Computadores',
            'Sistemas Operativos',
            'Cibersegurança',
            'Inteligência Artificial'
        )
    )
    BEGIN
        PRINT 'Cursos de Amostra já existem. Nenhum será inserido.';
    END
	ELSE
	BEGIN
	INSERT INTO Cursos (Nome,Duracao, Ativo)
	VALUES 
		('Programação em C', 3, 1),
		('Programação em C++', 3, 1),
		('Programação em Java', 3, 1),
		('Desenvolvimento Web', 2, 1),
		('Engenharia de Software', 3, 1),
		('Bases de Dados', 2, 1),
		('Redes de Computadores', 2, 1),
		('Sistemas Operativos', 2, 1),
		('Cibersegurança', 3, 1),
		('Inteligência Artificial', 3, 1);
	END
END
GO

EXEC Amostra_Criar_Cursos
GO

CREATE OR ALTER PROCEDURE [dbo].[Amostra_Criar_AlunosdaTurma]
AS
BEGIN
	/*
	===============================================================================
	Procedure:   Amostra_Criar_AlunosdaTurma
	Author:      João Luizi
	Created:     2026-02-05

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~80%
	- Role: Guidance on cursor usage, FETCH operations, loop logic,
			step-by-step implementation support

	Description:
	- Populates the AlunosdaTurma table with sample data linking Alunos to Turmas
	- Assigns NotaFinal and DataAvaliacao for each student
	- Data is distributed across Turmas according to Ciclo, using a cursor loop
	- Intended for academic demonstration and development/testing purposes

	Execution:
	- Must be executed **after** Amostra_Criar_AnoLetivo
	- Not designed to be called in isolation

	Notes:
	- Retrieves AnoLetivoID for the year 2000
	- Uses a table variable (@Seed) to store sample student data
	- Uses a CURSOR to iterate over Turmas of AnoDoCurso = 1
	- For each Turma, inserts the subset of students matching the current Ciclo
	- Demonstrates cursor control: OPEN, FETCH NEXT, WHILE @@FETCH_STATUS, CLOSE, DEALLOCATE
	- Safe for repeated execution assuming AnoLetivoID exists
	- Not intended for production environments; primarily for controlled seeding
	===============================================================================
	*/

	PRINT 'A criar amostra de AlunosdaTurma...';
	SET NOCOUNT ON;
	DECLARE @AnoLetivoID BIGINT = NULL
	SELECT @AnoLetivoID = AnoLetivoID FROM AnoLetivo WHERE YEAR(DataInicio) = 2000
	IF (@AnoLetivoID IS NULL)
	BEGIN
	PRINT 'Não foi possivel criar a amostra de alunos por turma'
	RETURN
	END
	DECLARE @TurmasID BIGINT
	DECLARE @Ciclo INT = 1;

	DECLARE @Seed TABLE (
    Ciclo INT,
    AlunoID BIGINT,
    NotaFinal INT,
    DataAvaliacao DATE
	);
	INSERT INTO @Seed VALUES
	(1, 2, 18, '2001-01-01'),
	(1, 3,  9, '2001-01-01'),
	(2, 4, 14, '2001-01-01'),
	(3, 6, 19, '2001-01-01'),
	(3, 7, 14, '2001-01-01'),
	(4, 8, 10, '2001-01-01'),
	(5, 10, 9, '2001-01-01'),
	(5, 11, 8, '2001-01-01'),
	(6, 12, 17, '2001-01-01'),
	(6, 13, 14, '2001-01-01'),
	(7, 1, 9, '2001-01-01'),
	(8, 9, 9, '2001-01-01'),
	(9, 5, 17, '2001-01-01');

	
	DECLARE Turmas_Cursor CURSOR
	FOR
	SELECT Turmas.TurmaID
	FROM Turmas 
	WHERE Turmas.AnoLetivoID = @AnoLetivoID AND Turmas.AnoDoCurso = 1

	OPEN Turmas_Cursor;
	FETCH NEXT
	FROM Turmas_Cursor
	INTO @TurmasID;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		
		INSERT INTO AlunosdaTurma (TurmaID, AlunoID, NotaFinal, DataAvaliacao)
		SELECT
			@TurmasID,
			AlunoID,
			NotaFinal,
			DataAvaliacao
		FROM @Seed
		WHERE Ciclo = @Ciclo;

		SET @Ciclo += 1;

		FETCH NEXT
		FROM Turmas_Cursor
		INTO @TurmasID;
	END;

	CLOSE Turmas_Cursor;
	DEALLOCATE Turmas_Cursor;
END
GO

CREATE OR ALTER PROCEDURE [dbo].[Alunos_ReprovarAnoLetivo]
    @AnoLetivoAnteriorID BIGINT,
    @AnoLetivoNovoID BIGINT
AS
BEGIN
	/*
	===============================================================================
	Procedure:   Alunos_ReprovarAnoLetivo
	Author:      João Luizi
	Created:     2026-02-05

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~20%
	- Role: Syntax verification, refactoring suggestions, documentation support
	- Notes on approach:
		The initial suggestions provided by the AI were technically advanced and would have bypassed meaningful learning opportunities for the author.
		Therefore, an iterative, step-by-step approach was preferred, aligned with the author's current knowledge.
		The AI guidance was used primarily for syntax checking, minor refactoring recommendations, and documentation support, 
		rather than implementing complex patterns that could reduce educational value.

	Description:
	- Inserts students who did not pass the previous AnoLetivo into appropriate Turmas for the new AnoLetivo
	- Ensures no duplicates in Turmas or in AlunosdaTurma
	- Preserves the AnoDoCurso of students (they remain in the same year)
	- Creates missing Turmas in the new AnoLetivo if necessary

	Execution:
	- Requires both AnoLetivoAnteriorID and AnoLetivoNovoID to exist
	- Typically called by AnoLetivo_InserirComSetup (formerly SetUpAnoLetivo)
	- Not intended to be executed in isolation

	Notes:
	1. Captures failing students into a table variable with their current CursoID and AnoDoCurso
	2. Creates missing Turmas in the new year if they do not exist
	3. Inserts the failing students into their corresponding Turmas in the new AnoLetivo, avoiding duplicates
	4. Designed for controlled seed data creation and academic demonstration
	===============================================================================
	*/

    SET NOCOUNT ON;

	
    ------------------------------------------------------------------
    -- 1. Capture Passing students
    ------------------------------------------------------------------
	 DECLARE @Aprovados TABLE (
		AlunoID BIGINT,
		CursoID BIGINT,
		AnoDoCurso INT
		);

	INSERT INTO @Aprovados (AlunoID, CursoID, AnoDoCurso)
	SELECT DISTINCT
		AlunosdaTurma.AlunoID,
		Turmas.CursoID,
		Turmas.AnoDoCurso + 1 AS AnoDoCurso
	FROM AlunosdaTurma 
	JOIN Turmas
		ON Turmas.TurmaID = AlunosdaTurma.TurmaID
	JOIN Cursos
		ON Cursos.CursoID = Turmas.CursoID
	WHERE Turmas.AnoLetivoID = @AnoLetivoAnteriorID
	  AND AlunosdaTurma.NotaFinal >= 10
	  AND Turmas.AnoDoCurso + 1 <= Cursos.Duracao;


    ------------------------------------------------------------------
    -- 2. Create missing Turmas for Aproved
    ------------------------------------------------------------------
    INSERT INTO Turmas (CursoID, AnoDoCurso, AnoLetivoID)
    SELECT DISTINCT
        A.CursoID,
        A.AnoDoCurso, 
        @AnoLetivoNovoID
    FROM @Aprovados A
    WHERE NOT EXISTS (
        SELECT 1
        FROM Turmas 
        WHERE Turmas.CursoID = A.CursoID
          AND Turmas.AnoDoCurso = A.AnoDoCurso 
          AND Turmas.AnoLetivoID = @AnoLetivoNovoID
    );

    ------------------------------------------------------------------
    -- 3. Insert students into the correct Turma
    ------------------------------------------------------------------
    INSERT INTO AlunosdaTurma (TurmaID, AlunoID)
    SELECT
        Turmas.TurmaID,
        A.AlunoID
    FROM @Aprovados A
    JOIN Turmas ON Turmas.CursoID = A.CursoID
                 AND Turmas.AnoDoCurso = A.AnoDoCurso 
                 AND Turmas.AnoLetivoID = @AnoLetivoNovoID
    WHERE NOT EXISTS (
        SELECT 1
        FROM AlunosdaTurma 
        WHERE AlunosdaTurma.TurmaID = Turmas.TurmaID
          AND AlunosdaTurma.AlunoID = A.AlunoID
    );
END
GO
CREATE OR ALTER    PROCEDURE [dbo].[Alunos_PromoverAnoLetivo]
    @AnoLetivoAnteriorID BIGINT,
    @AnoLetivoNovoID BIGINT
AS
BEGIN
	/*
	===============================================================================
	Procedure:   Alunos_PromoverAnoLetivo
	Author:      João Luizi
	Created:     2026-02-05

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~20%
	- Role: Syntax verification, refactoring suggestions, documentation support
	- Notes on approach:
    The initial suggestions provided by the AI were technically advanced and would have bypassed meaningful learning opportunities for the author. 
    Therefore, an iterative and step-by-step approach was preferred, aligned with the author's current knowledge and skill level.
    The AI guidance was used primarily to check syntax, recommend minor improvements, and support clear documentation, 
    rather than implementing complex patterns that might reduce the educational value of the exercise.


	Description:
	- Promotes students who have passed (NotaFinal >= 10) from the previous AnoLetivo
	- Inserts missing Turmas in the new AnoLetivo if necessary
	- Adds the promoted students into their corresponding Turmas in the new AnoLetivo
	- Ensures no duplicates are created during promotion

	Execution:
	- Requires both AnoLetivoAnteriorID and AnoLetivoNovoID to exist
	- Typically called by AnoLetivo_InserirComSetup (formerly SetUpAnoLetivo)
	- Not intended to be executed in isolation

	Notes:
	1. Captures passing students into a table variable (@Aprovados) with their target CursoID and next AnoDoCurso
	2. Creates missing Turmas in the new year if they do not exist
	3. Inserts the promoted students into the correct Turmas, avoiding duplicates
	4. Respects the maximum duration of each Curso
	5. Designed for controlled seed data creation and academic demonstration
	===============================================================================
	*/

    SET NOCOUNT ON;

	
    ------------------------------------------------------------------
    -- 1. Capture Passing students
    ------------------------------------------------------------------
	 DECLARE @Aprovados TABLE (
		AlunoID BIGINT,
		CursoID BIGINT,
		AnoDoCurso INT
		);

	INSERT INTO @Aprovados (AlunoID, CursoID, AnoDoCurso)
	SELECT DISTINCT
		AlunosdaTurma.AlunoID,
		Turmas.CursoID,
		Turmas.AnoDoCurso + 1 AS AnoDoCurso
	FROM AlunosdaTurma 
	JOIN Turmas
		ON Turmas.TurmaID = AlunosdaTurma.TurmaID
	JOIN Cursos
		ON Cursos.CursoID = Turmas.CursoID
	WHERE Turmas.AnoLetivoID = @AnoLetivoAnteriorID
	  AND AlunosdaTurma.NotaFinal >= 10
	  AND Turmas.AnoDoCurso + 1 <= Cursos.Duracao;


    ------------------------------------------------------------------
    -- 2. Create missing Turmas for Aproved
    ------------------------------------------------------------------
    INSERT INTO Turmas (CursoID, AnoDoCurso, AnoLetivoID)
    SELECT DISTINCT
        A.CursoID,
        A.AnoDoCurso, 
        @AnoLetivoNovoID
    FROM @Aprovados A
    WHERE NOT EXISTS (
        SELECT 1
        FROM Turmas 
        WHERE Turmas.CursoID = A.CursoID
          AND Turmas.AnoDoCurso = A.AnoDoCurso 
          AND Turmas.AnoLetivoID = @AnoLetivoNovoID
    );

    ------------------------------------------------------------------
    -- 3. Insert students into the correct Turma
    ------------------------------------------------------------------
    INSERT INTO AlunosdaTurma (TurmaID, AlunoID)
    SELECT
        Turmas.TurmaID,
        A.AlunoID
    FROM @Aprovados A
    JOIN Turmas ON Turmas.CursoID = A.CursoID
                 AND Turmas.AnoDoCurso = A.AnoDoCurso 
                 AND Turmas.AnoLetivoID = @AnoLetivoNovoID
    WHERE NOT EXISTS (
        SELECT 1
        FROM AlunosdaTurma 
        WHERE AlunosdaTurma.TurmaID = Turmas.TurmaID
          AND AlunosdaTurma.AlunoID = A.AlunoID
    );
END
GO

CREATE OR ALTER PROCEDURE [dbo].[Turmas_CriarPorAnoLetivo]
    @AnoLetivoID BIGINT
AS
BEGIN
	/*
	===============================================================================
	Procedure:   Turmas_CriarPorAnoLetivo
	Author:      João Luizi
	Created:     2026-02-05

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~40%
	- Role: Syntax verification, refactoring suggestions, documentation support

	Description:
	- Creates Turmas for a specified AnoLetivoID
	- Inserts a Turma for each active Curso in the system for AnoDoCurso = 1
	- Ensures no duplicate Turmas are created for the same Curso and AnoLetivo
	- Acts as a dependency for the overall AnoLetivo setup workflow

	Execution:
	- Must be executed **after** the AnoLetivo entry exists
	- Typically called by AnoLetivo_InserirComDependencias 
	- Handles creation of the first-year Turmas only

	Notes:
	- Verifies that the provided AnoLetivoID exists before inserting
	- Checks for existing Turmas to prevent duplicates
	- Uses a single INSERT...SELECT pattern for efficiency
	- Intended for controlled seeding; not recommended for production without review
	===============================================================================
	*/
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
        Cursos.CursoID,
        1 AS AnoDoCurso
    FROM Cursos
    WHERE Cursos.Ativo = 1
      AND NOT EXISTS (
          SELECT 1
          FROM Turmas 
          WHERE Turmas.AnoLetivoID = @AnoLetivoID
            AND Turmas.CursoID = Cursos.CursoID
            AND Turmas.AnoDoCurso = 1
      );
END
GO

CREATE OR ALTER PROCEDURE [dbo].[AnoLetivo_Desativar]
    @AnoLetivoAnteriorID BIGINT
AS
BEGIN
	/*
	===============================================================================
	Procedure:   AnoLetivo_Desativar
	Author:      João Luizi
	Created:     2026-02-05

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~20%
	- Role: Syntax verification, refactoring suggestions, documentation support
	- Notes on approach:
		The AI provided guidance mainly for syntax checks and minor refactoring suggestions.
		An iterative approach was preferred to ensure learning value for the author.
		The AI did not drive the main logic but supported clear documentation and best practices.

	Description:
	- Deactivates the previous AnoLetivo if all students' grades have been entered
	- Checks whether the AnoLetivo exists and whether it is already inactive
	- Verifies that all AlunosdaTurma have a NotaFinal before deactivation
	- Provides feedback messages for each step

	Execution:
	- Requires AnoLetivoAnteriorID as input
	- Typically called after setup of a new AnoLetivo and transfer of students
	- Not intended for standalone execution in production without prior context

	Notes:
	1. Queries the current active state of the AnoLetivo
	2. If the AnoLetivo is already inactive, exits early
	3. Prevents deactivation if any student has missing NotaFinal
	4. Updates the Ativo flag to 0 when safe
	===============================================================================
	*/

    SET NOCOUNT ON;

    DECLARE @AnoLetivoAnteriorAtivo BIT;

    ------------------------------------------------------------------
    -- 1. Check if AnoLetivo exists and get its active state
    ------------------------------------------------------------------
    SELECT 
        @AnoLetivoAnteriorAtivo = Ativo
    FROM AnoLetivo
    WHERE AnoLetivoID = @AnoLetivoAnteriorID;

    IF @AnoLetivoAnteriorAtivo IS NULL
    BEGIN
        PRINT 'Ano letivo anterior não existe.';
        RETURN;
    END

    ------------------------------------------------------------------
    -- 2. If already inactive, nothing to do
    ------------------------------------------------------------------
    IF @AnoLetivoAnteriorAtivo = 0
    BEGIN
        PRINT 'Ano letivo anterior já se encontra desativado.';
        RETURN;
    END

    ------------------------------------------------------------------
    -- 3. Check for students with grades not yet launched
    ------------------------------------------------------------------
    IF EXISTS (
        SELECT 1
        FROM AlunosdaTurma AT
        JOIN Turmas T
            ON T.TurmaID = AT.TurmaID
        WHERE T.AnoLetivoID = @AnoLetivoAnteriorID
          AND AT.NotaFinal IS NULL
    )
    BEGIN
        PRINT 'Ano letivo anterior não pode ser desativado: existem notas por lançar.';
        RETURN;
    END

    ------------------------------------------------------------------
    -- 4. Deactivate AnoLetivo
    ------------------------------------------------------------------
    UPDATE AnoLetivo
    SET Ativo = 0
    WHERE AnoLetivoID = @AnoLetivoAnteriorID;

    PRINT 'Ano letivo anterior desativado com sucesso.';
END
GO

CREATE OR ALTER PROCEDURE [dbo].[Ex_AnoLetivo_CriarComDependencias] 
	-- Add the parameters for the stored procedure here
	@Year INT 
AS
BEGIN
	/*
	===============================================================================
	Procedure:   AnoLetivo_InserirComSetup
	Author:      João Luizi
	Created:     2026-02-05

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~60%
	- Role: Guidance on cursor/fetch logic, dependency orchestration, documentation

	Description:
	- Creates a new academic year (AnoLetivo) for the specified @Year
	- Checks for existence of the year to avoid duplicates
	- Inserts the new AnoLetivo record and captures its ID
	- Orchestrates dependent setup procedures:
		1. SetupAnoLetivo_Turmas       -> creates classes for the new year
		2. SetUpPassingStudents        -> promotes students from the previous year
		3. SetUpFailedStudents         -> handles failed students
		4. UnsetAnoLetivo              -> deactivates previous year if all grades are entered

	Execution:
	- Entry point for new year-specific workflow
	- Requires AnoLetivo table to exist and optionally a previous year
	- Handles both creation and setup of related academic data

	Notes:
	- Ensures @Year does not already exist to prevent duplicates
	- Relies on auxiliary procedures for class creation and student promotion/retention
	- Prints informative messages during each step
	- Should be called **before** Amostra_Criar_AlunosdaTurma
	- Intended for controlled sample data creation; not recommended for production without review
	===============================================================================
	*/
	SET NOCOUNT ON;
	  DECLARE 
        @AnoLetivoNovoID BIGINT,
        @AnoLetivoAnteriorID BIGINT;

	  -- Previous year
    SELECT TOP 1
        @AnoLetivoAnteriorID = AnoLetivoID
    FROM AnoLetivo
    ORDER BY DataInicio DESC;
  
	-- Check if year exists
    SELECT
        @AnoLetivoNovoID = AnoLetivoID
    FROM AnoLetivo
    WHERE YEAR(DataInicio) = @Year;

	 IF @AnoLetivoNovoID IS NOT NULL
    BEGIN
        PRINT 'Ano ' + CAST(@Year AS NVARCHAR(10)) + ' já existe!';
        RETURN;
    END
	 -- Create year
    INSERT INTO AnoLetivo (DataInicio, DataFim, Ativo)
    VALUES (
        DATEFROMPARTS(@Year, 1, 1),
        DATEFROMPARTS(@Year, 12, 31),
        1
    );

    SET @AnoLetivoNovoID = SCOPE_IDENTITY();

    PRINT 'Ano ' + CAST(@Year AS NVARCHAR(10)) + ' Criado!';

    -- Year 1 classes
    EXEC Turmas_CriarPorAnoLetivo @AnoLetivoNovoID;
    -- Aprovados 
	EXEC Alunos_PromoverAnoLetivo  @AnoLetivoAnteriorID = @AnoLetivoAnteriorID, @AnoLetivoNovoID = @AnoLetivoNovoID;
    -- Reprovados 
	EXEC Alunos_ReprovarAnoLetivo @AnoLetivoAnteriorID = @AnoLetivoAnteriorID, @AnoLetivoNovoID = @AnoLetivoNovoID;
	-- Inativar se todas as notas estiverem lançadas
	EXEC AnoLetivo_Desativar @AnoLetivoAnteriorID = @AnoLetivoAnteriorID
END
GO

CREATE OR ALTER PROCEDURE [dbo].[Amostra_Criar_AnoLetivo]
AS
BEGIN
	/*
	===============================================================================
	Procedure:   Amostra_Criar_AnoLetivo
	Author:      João Luizi
	Created:     2026-02-05

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~40%
	- Role: Syntax verification, flow documentation, guidance on SP sequencing

	Description:
	- Creates a sample academic year (AnoLetivo) for the year 2000
	- Calls subordinate procedures to set up related data:
		1. SetUpAnoLetivo 2000
		2. Amostra_Criar_AlunosdaTurma
	- Intended for development, testing, and academic demonstration purposes

	Execution:
	- Checks for existence of sample AnoLetivo entries for 2000 and 2001
	- If the entries already exist, no action is taken
	- If they do not exist, executes SetUpAnoLetivo and then populates AlunosdaTurma

	Notes:
	- Must be executed after prerequisite Pessoas, Alunos, e Turmas have been seeded
	- Triggers the creation of dependent data, demonstrating SP chaining
	- Designed for controlled seed data creation; not intended for production environments
	- Provides a simple orchestration point for year-specific sample data
	===============================================================================
	*/
	PRINT 'A criar amostra de ano letivo...';
	IF EXISTS (SELECT 1 FROM AnoLetivo WHERE Year(DataInicio) = 2000 OR Year(DataInicio) = 2001)
	BEGIN 
	PRINT 'Anos de Amostra Já Existem'
	END
	ELSE
	BEGIN 
	EXEC Ex_AnoLetivo_CriarComDependencias 2000
	EXEC Amostra_Criar_AlunosdaTurma
	END
END
GO

EXEC Amostra_Criar_AnoLetivo
GO

CREATE OR ALTER FUNCTION [dbo].[Contacto_Validar]
(
    @PessoaID INT,
    @Tipo INT
)
RETURNS INT
AS
BEGIN
	/*
	===============================================================================
	Function:    Contacto_Validar
	Author:      João Luizi
	Created:     2026-02-05

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~20%
	- Role: Syntax verification, basic refactoring suggestions, documentation support

	Description:
	- Validates a contact entry for a given person (PessoaID) and type (Tipo)
	- Types supported:
		1 = Telefone (must be 9 digits, numeric only)
		2 = Email (must contain '@')
	- Returns 1 if the contact is valid, 0 otherwise
	- Intended for use in development, testing, or validation queries

	Execution:
	- Checks if the contact exists in the Contactos table
	- If the contact does not exist, immediately returns 0
	- For Tipo = 1 (Telefone), validates length and numeric content
	- For Tipo = 2 (Email), validates presence of '@' character
	- Returns the validation result as INT

	Notes:
	- Depends on the Contactos table
	- Can be used in SELECT statements, WHERE clauses, or inside SPs to enforce data integrity
	- Validation rules are basic and may be enhanced for production (e.g., regex for emails)
	- Provides a simple, reusable check for contact correctness within the database
	===============================================================================
	*/
    DECLARE @Resultado INT;

    -- Contact does not exist
    IF NOT EXISTS (
        SELECT 1
        FROM Contactos
        WHERE PessoaID = @PessoaID
          AND Tipo = @Tipo
    )
        RETURN 0;

    -- Telefone
    IF @Tipo = 1
    BEGIN
        SELECT @Resultado =
            CASE
                WHEN LEN(Valor) = 9
                 AND Valor NOT LIKE '%[^0-9]%'
                THEN 1
                ELSE 0
            END
        FROM Contactos
        WHERE PessoaID = @PessoaID
          AND Tipo = @Tipo;

        RETURN @Resultado;
    END

    -- Email
    IF @Tipo = 2
    BEGIN
        SELECT @Resultado =
            CASE
                WHEN Valor LIKE '%@%'
                THEN 1
                ELSE 0
            END
        FROM Contactos
        WHERE PessoaID = @PessoaID
          AND Tipo = @Tipo;

        RETURN @Resultado;
    END

    RETURN 0;
END
GO

CREATE OR ALTER PROCEDURE [dbo].[Ex_Contactos_VerificarInvalidos]
AS
BEGIN
	/*
	===============================================================================
	Procedure:   Ex_Contactos_VerificarInvalidos
	Author:      João Luizi
	Created:     2026-02-05

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~60-70%
	- Role: Guided implementation of dynamic SQL, pivoting logic, and integration with Contacto_Validar
	- Notes: Dynamic SQL portion lightly covered in class; AI suggested pivoting and CASE aggregation

	Description:
	- Generates a report of all people (Pessoas) with invalid contact information
	- Validates contacts using the scalar function dbo.Contacto_Validar
	- Supports multiple contact types dynamically defined in TiposdeContactos
	- Outputs a pivoted table with each contact type as a column showing 'Valido' or 'Invalido'

	Execution:
	- Builds column list (@cols), CASE statements (@cases), and a WHERE clause (@where) dynamically
	- Cross joins Pessoas with TiposdeContactos to validate every possible contact
	- Uses PIVOT to transform rows into columns, one per contact type
	- Filters only rows where all contact types are invalid
	- Executes the dynamic SQL using sp_executesql

	Notes:
	- Depends on dbo.Contacto_Validar, Pessoas, and TiposdeContactos tables
	- Can be adapted to include additional contact types without modifying static SQL
	- Intended for reporting and data quality verification in development or academic exercises
	- Demonstrates use of dynamic SQL, pivoting, and scalar function integration in T-SQL
	- Designed for controlled analysis; not intended for direct production use without additional validation
	===============================================================================
	*/
	SET NOCOUNT ON;
	DECLARE @cols NVARCHAR(MAX),
        @cases NVARCHAR(MAX),
		@where NVARCHAR(MAX),
        @sql NVARCHAR(MAX);

SELECT @cols = STRING_AGG(QUOTENAME(NomeDoContacto), ',')
FROM TiposdeContactos;

SELECT @cases = STRING_AGG(
    'CASE [' + NomeDoContacto + '] WHEN 1 THEN ''Valido'' WHEN 0 THEN ''Invalido'' END AS [' + NomeDoContacto + ']'
, ', ')
FROM TiposdeContactos;

SELECT @where = STRING_AGG(
    '[' + NomeDoContacto + '] = 0', 'AND ')
FROM TiposdeContactos;

SET @sql = N'
SELECT PessoaID, FirstName, LastName, ' + @cases + '
FROM (
    SELECT Pessoas.PessoaID, Pessoas.FirstName, Pessoas.LastName, TiposdeContactos.NomeDoContacto,
           dbo.Contacto_Validar(Pessoas.PessoaID, TiposdeContactos.TipoID) AS EstadoValidacao
    FROM Pessoas
    CROSS JOIN TiposdeContactos
) tblSource
PIVOT (
    MAX(EstadoValidacao)
    FOR NomeDoContacto IN (' + @cols + ')
) tbPivot
WHERE ' + @where +'
ORDER BY PessoaID;
';

--PRINT @sql

EXEC sp_executesql @sql;
END
GO

CREATE OR ALTER PROCEDURE [dbo].[Ex_Alunos_ObterIrmaos]
AS
BEGIN
	/*
	===============================================================================
	Procedure:   Ex_Alunos_ObterIrmaos
	Author:      João Luizi
	Created:     2026-02-05

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~20%
	- Role: Syntax verification, minor refactoring suggestions, documentation support

	Description:
	- Retrieves a list of students who have siblings enrolled in the institution
	- Identifies sibling relationships based on the Relacoes table
	- Considers only relationships of type "LinhaHorizontal 1º grau" (Tipo = 3)
	- Returns identifying information for students involved in sibling relationships

	Execution:
	- Joins Relacoes with Alunos to identify students linked by sibling relationships
	- Uses Pessoas to retrieve personal identification details
	- Applies DISTINCT to avoid duplicate rows caused by bidirectional relationships
	- Filters relationships by Tipo = 3 (siblings)

	Notes:
	- Depends on the Relacoes, Alunos, and Pessoas tables
	- Assumes that sibling relationships are stored with Tipo = 3
	- Designed for academic exercises and reporting purposes
	- Query logic prioritizes clarity and readability over advanced optimization
	===============================================================================
	*/
	SET NOCOUNT ON;
	SELECT DISTINCT 
	Pessoas.PessoaID, 
	Relacoes.PessoaBID AS [ID Irmão], 
	Alunos.AlunoID, 
	FirstName, 
	LastName FROM Relacoes
	INNER JOIN Alunos ON Alunos.PessoaID = Relacoes.PessoaAID OR  Alunos.PessoaID = Relacoes.PessoaBID
	LEFT JOIN Pessoas ON Alunos.PessoaID = Pessoas.PessoaID
	WHERE Relacoes.Tipo = 3
END
GO

CREATE OR ALTER PROCEDURE [dbo].[Ex_Alunos_ObterQuadroDeHonra]
	@Year INT
AS
BEGIN
	/*
	===============================================================================
	Procedure:   Ex_Alunos_ObterQuadroDeHonra
	Author:      João Luizi
	Created:     2026-02-05

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~20%
	- Role: Syntax verification, minor refactoring suggestions, documentation support

	Description:
	- Retrieves the honor roll (Quadro de Honra) for students in a given academic year
	- Lists students whose final grade meets or exceeds the excellence threshold
	- Returns basic identification and final grade information

	Execution:
	- Joins AlunosdaTurma, Turmas, AnoLetivo, Alunos, and Pessoas
	- Filters results by the academic year provided as parameter (@Year)
	- Applies a minimum grade threshold of NotaFinal >= 18
	- Outputs one row per qualifying student

	Notes:
	- Depends on AnoLetivo, Turmas, AlunosdaTurma, Alunos, and Pessoas tables
	- The grade threshold is fixed and intended for demonstration purposes
	- Designed for academic exercises and reporting scenarios
	- Can be extended to include ordering, ranking, or configurable thresholds
	===============================================================================
	*/
	SET NOCOUNT ON;

	SELECT Alunos.AlunoID, Pessoas.FirstName, Pessoas.LastName, AlunosdaTurma.NotaFinal
	FROM AlunosdaTurma
	INNER JOIN Turmas		ON Turmas.TurmaID = AlunosdaTurma.TurmaID
	INNER JOIN AnoLetivo	ON AnoLetivo.AnoLetivoID = Turmas.AnoLetivoID
	INNER JOIN Alunos		ON Alunos.AlunoID = AlunosdaTurma.AlunoID
	INNER JOIN Pessoas		ON Alunos.PessoaID = Pessoas.PessoaID
	WHERE YEAR(AnoLetivo.DataInicio) = @Year 
	AND AlunosdaTurma.NotaFinal >= 18;
END
GO

CREATE OR ALTER PROCEDURE [dbo].[Ex_Professores_ObterMaisAntigos]
	@N INT
AS
BEGIN
	/*
	===============================================================================
	Procedure:   Ex_Professores_ObterMaisAntigos
	Author:      João Luizi
	Created:     2026-02-05

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~20%
	- Role: Syntax verification, minor refactoring suggestions, documentation support

	Description:
	- Retrieves the N professors with the longest time in service
	- Calculates the number of years since hiring for each professor
	- Returns only active professors

	Execution:
	- Accepts a parameter (@N) defining the number of records to return
	- Filters professors by active status
	- Orders results by DataContratacao in ascending order (oldest first)
	- Computes years of service using DATEDIFF with the current date

	Notes:
	- Depends on Professores and Pessoas tables
	- The years of service calculation is approximate and based on calendar years
	- Intended for academic reporting and query practice
	- Suitable for extension with additional filters or ordering criteria
	===============================================================================
	*/
	SET NOCOUNT ON;
	SELECT TOP(@N) ProfessorID, FirstName, LastName, DATEDIFF(YEAR, DataContratacao, GETDATE()) AS Anos FROM Professores
	INNER JOIN Pessoas ON Pessoas.PessoaID = Professores.PessoaID
	WHERE Professores.Ativo = 1
	ORDER BY DataContratacao ASC

END
GO

CREATE OR ALTER PROCEDURE [dbo].[Ex_Alunos_ObterPorAnoECurso]
AS
BEGIN
	/*
	===============================================================================
	Procedure:   Ex_Alunos_ObterPorAnoECurso
	Author:      João Luizi
	Created:     2026-02-05

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~20%
	- Role: Syntax verification, minor refactoring suggestions, documentation support

	Description:
	- Retrieves the total number of students per academic year and course
	- Aggregates enrollment data across academic years and curricula
	- Provides a high-level overview of student distribution

	Execution:
	- Joins AnoLetivo, Turmas, Cursos, and AlunosdaTurma
	- Groups results by academic year and course name
	- Counts the number of student enrollments per group
	- Orders output chronologically by academic year

	Notes:
	- Depends on AnoLetivo, Turmas, Cursos, and AlunosdaTurma tables
	- Each record represents the number of students enrolled in a given course
	  during a specific academic year
	- Intended for academic exercises and reporting scenarios
	- Can be extended with filters (e.g., specific year or course) if needed
	===============================================================================
	*/
	SET NOCOUNT ON;
	SELECT 
	YEAR(AnoLetivo.DataInicio) AS Ano, Cursos.Nome, Count(*) AS [Numero de Alunos]
	FROM AnoLetivo
	INNER JOIN Turmas ON Turmas.AnoLetivoID = AnoLetivo.AnoLetivoID
	INNER JOIN Cursos ON Turmas.CursoID = Cursos.CursoID
	INNER JOIN AlunosdaTurma ON Turmas.TurmaID = AlunosdaTurma.TurmaID
	GROUP BY  AnoLetivo.AnoLetivoID, AnoLetivo.DataInicio, Cursos.Nome
	ORDER BY AnoLetivo.AnoLetivoID
END
GO

CREATE OR ALTER PROCEDURE [dbo].[Ex_Alunos_ObterHistoricoNotas]

	AS
BEGIN
	/*
	===============================================================================
	Procedure:   Ex_Alunos_ObterHistoricoNotas
	Author:      João Luizi
	Created:     2026-02-05

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~20%
	- Role: Syntax verification, minor refactoring suggestions, documentation support

	Description:
	- Retrieves a historical summary of student academic results per year
	- Calculates the number of approved and failed students for each academic year
	- Uses final grades to determine pass/fail status

	Execution:
	- Joins AlunosdaTurma with Turmas and AnoLetivo to associate grades with years
	- Groups results by academic year
	- Counts:
		- Approved students (NotaFinal >= 10)
		- Failed students (NotaFinal < 10)

	Output:
	- Ano: Academic year (derived from AnoLetivo start date)
	- Aprovados: Total number of students who passed
	- Reprovados: Total number of students who failed

	Notes:
	- Relies on the grading scale where 10 is the minimum passing grade
	- Provides an aggregated, year-level view (not per student)
	- Intended for academic analysis, reporting, and exercise purposes
	- Assumes NotaFinal is populated for all relevant records
	===============================================================================
	*/

	SET NOCOUNT ON;
	SELECT 
	Year(AnoLetivo.DataInicio) AS Ano,
	SUM(CASE WHEN NotaFinal >= 10 THEN 1 ELSE 0 END) AS Aprovados,
	SUM(CASE WHEN NotaFinal < 10 THEN 1 ELSE 0 END) AS Reprovados
	FROM AlunosdaTurma
	INNER JOIN Turmas ON AlunosdaTurma.TurmaID = Turmas.TurmaID
	INNER JOIN AnoLetivo ON AnoLetivo.AnoLetivoID = Turmas.AnoLetivoID
	GROUP BY Year(AnoLetivo.DataInicio)
END
GO

CREATE OR ALTER PROCEDURE [dbo].[Pessoa_Inserir] 
	@NIF NCHAR(9),
	@FirstName NVARCHAR(100),
	@LastName NVARCHAR(100),
	@MiddleName NVARCHAR(100) = NULL,
	@DOB DATETIME,
	@PessoaID BIGINT OUTPUT
AS
BEGIN
	/*
	===============================================================================
	Procedure:   Pessoa_Inserir
	Author:      João Luizi
	Created:     2026-02-02

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~10–15%
	- Role: Documentation support, minor logic review

	Description:
	- Inserts a new Pessoa record if it does not already exist
	- Retrieves existing PessoaID when a matching NIF is found
	- Acts as a shared dependency for Aluno and Professor workflows

	Execution:
	- Not intended to be executed directly by end users
	- Designed to be called by higher-level procedures (e.g. Ex_Aluno_Inserir, Ex_Professor_Inserir)

	Notes:
	- Assumes Pessoa uniqueness by NIF
	- Returns PessoaID via OUTPUT parameter
	- Guarantees idempotent behavior for repeated calls with the same NIF
	===============================================================================
	*/
	SET NOCOUNT ON;
	SELECT @PessoaID = PessoaID
    FROM Pessoas
    WHERE NIF = @NIF;

	IF @@ROWCOUNT = 0
    BEGIN
        INSERT INTO Pessoas (
            NIF,
            FirstName,
            LastName,
            MiddleName,
            DOB,
            LastUpdate
        )
        VALUES (
            @NIF,
            @FirstName,
            @LastName,
            @MiddleName,
            @DOB,
            GETDATE()
        );
        
        SET @PessoaID = SCOPE_IDENTITY();
        PRINT 'Nova Pessoa Adicionada'
    END
    ELSE
    PRINT 'Pessoa já registada'
END
GO

CREATE OR ALTER PROCEDURE [dbo].[Ex_Aluno_Inserir]

	@NIF NCHAR(9),
	@FirstName NVARCHAR(100),
	@LastName NVARCHAR(100),
	@MiddleName NVARCHAR(100) = NULL,
	@DOB DATETIME
AS
BEGIN
/*
===============================================================================
Procedure:   Ex_Aluno_Inserir
Author:      João Luizi
Created:     2026-02-02

AI Assistance:
- Tool: ChatGPT
- Approx. contribution: ~20%
- Role: Syntax verification, refactoring suggestions, documentation support

Description:
- Creates a new Aluno entity
- Internally inserts or retrieves Pessoa via Ex_Pessoa_Inserir
- Registers the student as active

Execution:
- Can be executed standalone
- Entry point for student creation workflow

Notes:
- Assumes Pessoa uniqueness by NIF
- Pessoa insertion logic is delegated to Pessoa_Inserir
- Designed to be safely called by UI or external services
===============================================================================
*/

	SET NOCOUNT ON;

	DECLARE @PessoaID BIGINT
    
	EXEC dbo.Pessoa_Inserir
        @NIF = @NIF,
        @FirstName = @FirstName,
        @LastName = @LastName,
        @MiddleName = @MiddleName,
        @DOB = @DOB,
        @PessoaID = @PessoaID OUTPUT; 

	INSERT INTO Alunos
	(
		PessoaID,
		DataRegisto,
		Ativo
	)
	VALUES
	(
	@PessoaID,
	GETDATE(),
	1
	)
	PRINT 'Estudante Adicionado'
END
GO

CREATE OR ALTER PROCEDURE [dbo].[Ex_Professor_Inserir]
	@NIF NCHAR(9),
	@FirstName NVARCHAR(100),
	@LastName NVARCHAR(100),
	@MiddleName NVARCHAR(100) = NULL,
	@DOB DATETIME
AS
BEGIN
/*
===============================================================================
Procedure:   Ex_Professor_Inserir
Author:      João Luizi
Created:     2026-02-02

AI Assistance:
- Tool: ChatGPT
- Approx. contribution: ~20%
- Role: Syntax verification, refactoring suggestions, documentation support

Description:
- Creates a new Professor entity
- Internally inserts or retrieves Pessoa via Pessoa_Inserir
- Registers the professor as active

Execution:
- Can be executed standalone
- Entry point for professor creation workflow

Notes:
- Assumes Pessoa uniqueness by NIF
- Pessoa insertion logic is delegated to Pessoa_Inserir
- Intended for direct use by administrative processes
===============================================================================
*/

	SET NOCOUNT ON;

	DECLARE @PessoaID BIGINT
	EXEC dbo.Pessoa_Inserir
        @NIF = @NIF,
        @FirstName = @FirstName,
        @LastName = @LastName,
        @MiddleName = @MiddleName,
        @DOB = @DOB,
        @PessoaID = @PessoaID OUTPUT;

	INSERT INTO Professores
	(
		PessoaID,
		DataContratacao,
		Ativo
	)
	VALUES
	(
	@PessoaID,
	GETDATE(),
	1
	)
	PRINT 'Professor Adicionado'
END
GO

CREATE OR ALTER PROCEDURE [dbo].[Ex_Professor_Cessar]
	@ProfessorID BIGINT
AS
BEGIN
	/*
	===============================================================================
	Procedure:   Ex_Professor_Cessar
	Author:      João Luizi
	Created:     2026-02-02

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~10–15%
	- Role: Syntax verification, documentation support

	Description:
	- Marks a Professor as inactive
	- Records the cessation date of the teaching activity
	- Prevents redundant deactivation of already inactive Professores

	Execution:
	- Can be executed standalone
	- Intended as an exercise-level operation on Professor lifecycle

	Notes:
	- Validates current active state before applying changes
	- Sets both Ativo flag and DataCessacao timestamp
	- Designed to preserve historical data rather than deleting records
	===============================================================================
	*/
	SET NOCOUNT ON;
	IF ((SELECT Ativo FROM Professores WHERE ProfessorID = @ProfessorID) = 0)
	BEGIN
	PRINT 'O Professor com ID ' + CAST(@ProfessorID AS NVARCHAR (MAX)) + ' já se encontra inativo.'
	RETURN 
	END
	UPDATE Professores
	SET DataCessacao = GETDATE(), Ativo = 0
	WHERE ProfessorID = @ProfessorID
	PRINT 'O Professor com ID ' + CAST(@ProfessorID AS NVARCHAR (MAX)) + ' foi marcado inativo.'
END
GO

CREATE OR ALTER PROCEDURE [dbo].[Ex_Aluno_Transferir]
	@AlunoID BIGINT
AS
BEGIN
	/*
	===============================================================================
	Procedure:   Ex_Aluno_Transferir
	Author:      João Luizi
	Created:     2026-02-02

	AI Assistance:
	- Tool: ChatGPT
	- Approx. contribution: ~10–15%
	- Role: Syntax verification, minor refactoring, documentation support

	Description:
	- Marks a student as transferred
	- Deactivates the Aluno record while preserving historical data
	- Registers the transfer date

	Execution:
	- Can be executed standalone
	- Intended as an exercise-level operation on student lifecycle

	Notes:
	- Validates existence of the Aluno before applying changes
	- Prevents redundant transfers of already inactive records
	- Uses logical deactivation instead of physical deletion
	- Transfer state is represented by Ativo flag and DataTransferencia timestamp
	===============================================================================
	*/
	SET NOCOUNT ON;
	DECLARE @Ativo BIT = NULL
	DECLARE @DataTransferencia DATETIME = NULL
	DECLARE @StrAlunoID NVARCHAR (MAX) = CAST(@AlunoID AS NVARCHAR (MAX))
	SELECT
    @Ativo = Alunos.Ativo,
    @DataTransferencia = Alunos.DataTransferencia
	FROM Alunos
	WHERE AlunoID = @AlunoID;
	IF @Ativo IS NULL
	BEGIN
		PRINT 'O Aluno com ID ' + @StrAlunoID + ' não foi encontrado.'
		RETURN
	END
	IF @Ativo = 0
	BEGIN
	PRINT  'O Aluno com ID ' + @StrAlunoID + ' já se encontra inativo desde ' + CAST(@DataTransferencia AS NVARCHAR(MAX))+'.'
	RETURN 
	END
	UPDATE Alunos
	SET DataTransferencia = GETDATE(), Ativo = 0
	WHERE AlunoID = @AlunoID;
	PRINT 'O Aluno com ID ' + @StrAlunoID + ' foi marcado transferido com sucesso.'
END
GO

