/*
19. Alterar a base de dados de modo a que a tabela Products possa ser
uma tabela de pesquisa (lookup table).

*/

/*-- Criar Uma tabela Produtos (Alterar a Tabela Existente)
USE Northwind
GO

/****** Object:  Table [dbo].[Products]    Script Date: 23/01/2026 13:15:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Products2](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	
 CONSTRAINT [PK_Products2] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



ALTER TABLE [dbo].[Products2]  WITH NOCHECK ADD  CONSTRAINT [FK_Products2_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO

ALTER TABLE [dbo].[Products2] CHECK CONSTRAINT [FK_Products2_Categories]
GO

ALTER TABLE [dbo].[Products2]  WITH NOCHECK ADD  CONSTRAINT [FK_Products2_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO

ALTER TABLE [dbo].[Products2] CHECK CONSTRAINT [FK_Products2_Suppliers]
GO

--Create The Products Detail Table

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProductsDetail](
	[ProductDetailID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID]		[int] NOT NULL,
	[QuantityPerUnit] [nvarchar](20) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[ReorderLevel] [smallint] NULL,
	[Discontinued] [bit] NOT NULL,
 CONSTRAINT [PK_ProductsDetail] PRIMARY KEY CLUSTERED 
(
	ProductDetailID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProductsDetail] ADD  CONSTRAINT [DF_ProductsDetail_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
GO

ALTER TABLE [dbo].[ProductsDetail] ADD  CONSTRAINT [DF_ProductsDetail_UnitsInStock]  DEFAULT ((0)) FOR [UnitsInStock]
GO

ALTER TABLE [dbo].[ProductsDetail] ADD  CONSTRAINT [DF_ProductsDetail_UnitsOnOrder]  DEFAULT ((0)) FOR [UnitsOnOrder]
GO

ALTER TABLE [dbo].[ProductsDetail] ADD  CONSTRAINT [DF_ProductsDetail_ReorderLevel]  DEFAULT ((0)) FOR [ReorderLevel]
GO

ALTER TABLE [dbo].[ProductsDetail] ADD  CONSTRAINT [DF_ProductsDetail_Discontinued]  DEFAULT ((0)) FOR [Discontinued]
GO




ALTER TABLE [dbo].[ProductsDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductsDetail_Products2] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products2] ([ProductID])
GO

ALTER TABLE [dbo].[ProductsDetail] CHECK CONSTRAINT [FK_ProductsDetail_Products2]
GO

ALTER TABLE [dbo].[ProductsDetail]  WITH NOCHECK ADD  CONSTRAINT [CK_ProductsDetail_UnitPrice] CHECK  (([UnitPrice]>=(0)))
GO

ALTER TABLE [dbo].[ProductsDetail] CHECK CONSTRAINT [CK_ProductsDetail_UnitPrice]
GO

ALTER TABLE [dbo].[ProductsDetail]  WITH NOCHECK ADD  CONSTRAINT [CK_ProductsDetail_ReorderLevel] CHECK  (([ReorderLevel]>=(0)))
GO

ALTER TABLE [dbo].[ProductsDetail] CHECK CONSTRAINT [CK_ProductsDetail_ReorderLevel]
GO

ALTER TABLE [dbo].[ProductsDetail]  WITH NOCHECK ADD  CONSTRAINT [CK_ProductsDetail_UnitsInStock] CHECK  (([UnitsInStock]>=(0)))
GO

ALTER TABLE [dbo].[ProductsDetail] CHECK CONSTRAINT [CK_ProductsDetail_UnitsInStock]
GO

ALTER TABLE [dbo].[ProductsDetail]  WITH NOCHECK ADD  CONSTRAINT [CK_ProductsDetail_UnitsOnOrder] CHECK  (([UnitsOnOrder]>=(0)))
GO

ALTER TABLE [dbo].[ProductsDetail] CHECK CONSTRAINT [CK_ProductsDetail_UnitsOnOrder]
GO



*/
