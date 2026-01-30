USE [Upskill_EscolaDelite]
GO

/****** Object:  Table [dbo].[AlunosdaTurma]    Script Date: 30/01/2026 14:57:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AlunosdaTurma](
	[TurmaID] [bigint] NOT NULL,
	[AlunoID] [bigint] NOT NULL,
	[Valor] [smallint] NULL,
	[DataNota] [datetime] NULL,
	[AnoDoCurso] [smallint] NULL,
 CONSTRAINT [PK_AlunosdaTurma] PRIMARY KEY CLUSTERED 
(
	[TurmaID] ASC,
	[AlunoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[AlunosdaTurma]  WITH CHECK ADD  CONSTRAINT [FK_AlunosdaTurma_Alunos] FOREIGN KEY([AlunoID])
REFERENCES [dbo].[Alunos] ([AlunoID])
GO

ALTER TABLE [dbo].[AlunosdaTurma] CHECK CONSTRAINT [FK_AlunosdaTurma_Alunos]
GO

ALTER TABLE [dbo].[AlunosdaTurma]  WITH CHECK ADD  CONSTRAINT [FK_AlunosdaTurma_Turmas] FOREIGN KEY([TurmaID])
REFERENCES [dbo].[Turmas] ([TurmaID])
GO

ALTER TABLE [dbo].[AlunosdaTurma] CHECK CONSTRAINT [FK_AlunosdaTurma_Turmas]
GO

