USE [Upskill_EscolaDelite]
GO

/****** Object:  Table [dbo].[ProfessoresdaTurma]    Script Date: 30/01/2026 14:59:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProfessoresdaTurma](
	[TurmaID] [bigint] NOT NULL,
	[ProfessorID] [bigint] NOT NULL,
 CONSTRAINT [PK_ProfessoresdaTurma] PRIMARY KEY CLUSTERED 
(
	[TurmaID] ASC,
	[ProfessorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProfessoresdaTurma]  WITH CHECK ADD  CONSTRAINT [FK_ProfessoresdaTurma_Professores] FOREIGN KEY([ProfessorID])
REFERENCES [dbo].[Professores] ([ProfessorID])
GO

ALTER TABLE [dbo].[ProfessoresdaTurma] CHECK CONSTRAINT [FK_ProfessoresdaTurma_Professores]
GO

ALTER TABLE [dbo].[ProfessoresdaTurma]  WITH CHECK ADD  CONSTRAINT [FK_ProfessoresdaTurma_Turmas] FOREIGN KEY([TurmaID])
REFERENCES [dbo].[Turmas] ([TurmaID])
GO

ALTER TABLE [dbo].[ProfessoresdaTurma] CHECK CONSTRAINT [FK_ProfessoresdaTurma_Turmas]
GO

