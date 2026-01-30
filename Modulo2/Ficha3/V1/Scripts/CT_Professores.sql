USE [Upskill_EscolaDelite]
GO

/****** Object:  Table [dbo].[Professores]    Script Date: 30/01/2026 14:58:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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
GO

ALTER TABLE [dbo].[Professores]  WITH CHECK ADD  CONSTRAINT [FK_Professores_Pessoas] FOREIGN KEY([PessoaID])
REFERENCES [dbo].[Pessoas] ([PessoaID])
GO

ALTER TABLE [dbo].[Professores] CHECK CONSTRAINT [FK_Professores_Pessoas]
GO

