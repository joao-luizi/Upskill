USE [Upskill_EscolaDelite]
GO

/****** Object:  Table [dbo].[Relacoes]    Script Date: 30/01/2026 14:59:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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
GO

ALTER TABLE [dbo].[Relacoes]  WITH CHECK ADD  CONSTRAINT [FK_Relacoes_Pessoas] FOREIGN KEY([PessoaAID])
REFERENCES [dbo].[Pessoas] ([PessoaID])
GO

ALTER TABLE [dbo].[Relacoes] CHECK CONSTRAINT [FK_Relacoes_Pessoas]
GO

ALTER TABLE [dbo].[Relacoes]  WITH CHECK ADD  CONSTRAINT [FK_Relacoes_Pessoas1] FOREIGN KEY([PessoaBID])
REFERENCES [dbo].[Pessoas] ([PessoaID])
GO

ALTER TABLE [dbo].[Relacoes] CHECK CONSTRAINT [FK_Relacoes_Pessoas1]
GO

ALTER TABLE [dbo].[Relacoes]  WITH CHECK ADD  CONSTRAINT [FK_Relacoes_TiposRelacao] FOREIGN KEY([Tipo])
REFERENCES [dbo].[TiposRelacao] ([RelacaoID])
GO

ALTER TABLE [dbo].[Relacoes] CHECK CONSTRAINT [FK_Relacoes_TiposRelacao]
GO

