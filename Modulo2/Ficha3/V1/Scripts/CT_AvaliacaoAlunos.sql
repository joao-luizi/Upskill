USE [Upskill_EscolaDelite]
GO

/****** Object:  Table [dbo].[AvaliacaoAlunos]    Script Date: 30/01/2026 14:57:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AvaliacaoAlunos](
	[TurmaID] [bigint] NOT NULL,
	[AlunoID] [bigint] NOT NULL,
	[Valor] [smallint] NOT NULL,
	[Data] [datetime] NOT NULL,
 CONSTRAINT [PK_AvaliacaoAlunos] PRIMARY KEY CLUSTERED 
(
	[TurmaID] ASC,
	[AlunoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[AvaliacaoAlunos]  WITH CHECK ADD  CONSTRAINT [FK_AvaliacaoAlunos_Alunos] FOREIGN KEY([AlunoID])
REFERENCES [dbo].[Alunos] ([AlunoID])
GO

ALTER TABLE [dbo].[AvaliacaoAlunos] CHECK CONSTRAINT [FK_AvaliacaoAlunos_Alunos]
GO

ALTER TABLE [dbo].[AvaliacaoAlunos]  WITH CHECK ADD  CONSTRAINT [FK_AvaliacaoAlunos_Turmas] FOREIGN KEY([TurmaID])
REFERENCES [dbo].[Turmas] ([TurmaID])
GO

ALTER TABLE [dbo].[AvaliacaoAlunos] CHECK CONSTRAINT [FK_AvaliacaoAlunos_Turmas]
GO

