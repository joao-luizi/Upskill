USE [Upskill_EscolaDelite]
GO

/****** Object:  Table [dbo].[TiposdeContactos]    Script Date: 30/01/2026 15:00:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TiposdeContactos](
	[TipoID] [smallint] NOT NULL,
	[NomeDoContacto] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TiposdeContactos] PRIMARY KEY CLUSTERED 
(
	[TipoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

