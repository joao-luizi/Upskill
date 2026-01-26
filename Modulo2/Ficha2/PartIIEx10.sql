/*
10. Criar uma função de tabela ListaEncomendasPorPeriodo que receba
uma data inicial e uma data final e grave o valor total numa tabela
OrderTotals (a criar).

--Criar Tabela
USE [Northwind]
GO

/****** Object:  Table [dbo].[EncomendasPorPeriodo]    Script Date: 26/01/2026 15:57:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EncomendasPorPeriodo](
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Total] [int] NOT NULL,
 CONSTRAINT [PK_EncomendasPorPeriodo] PRIMARY KEY CLUSTERED 
(
	[StartDate] ASC,
	[EndDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE ListaEncomendasPorPeriodo
	-- Add the parameters for the stored procedure here
	@StartDate datetime, @EndDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	INSERT INTO EncomendasPorPeriodo
	(StartDate, EndDate, Total) VALUES (@StartDate, @EndDate, (SELECT  COUNT(*) FROM Orders WHERE OrderDate BETWEEN @StartDate AND @EndDate))
END
GO
