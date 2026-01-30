USE [Upskill_EscolaDelite]
GO

/****** Object:  Table [dbo].[Alunos]    Script Date: 30/01/2026 14:56:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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
GO

ALTER TABLE [dbo].[Alunos]  WITH CHECK ADD  CONSTRAINT [FK_Alunos_Pessoas] FOREIGN KEY([PessoaID])
REFERENCES [dbo].[Pessoas] ([PessoaID])
GO

ALTER TABLE [dbo].[Alunos] CHECK CONSTRAINT [FK_Alunos_Pessoas]
GO

