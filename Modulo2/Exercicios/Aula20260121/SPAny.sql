USE [Northwind]
GO
/****** Object:  StoredProcedure [dbo].[Ten Most Expensive Products]    Script Date: 21/01/2026 12:40:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Any Most Expensive Products] @RowCount int AS
SET ROWCOUNT @RowCount
SELECT Products.ProductName AS TenMostExpensiveProducts, Products.UnitPrice
FROM Products
ORDER BY Products.UnitPrice DESC