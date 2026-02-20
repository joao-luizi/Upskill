SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


SET IDENTITY_INSERT [dbo].[Marcas] ON 

INSERT [dbo].[Marcas] ([IDMarca], [Nome]) VALUES (1, N'Toyota')
INSERT [dbo].[Marcas] ([IDMarca], [Nome]) VALUES (2, N'Honda')
INSERT [dbo].[Marcas] ([IDMarca], [Nome]) VALUES (3, N'Ford')
INSERT [dbo].[Marcas] ([IDMarca], [Nome]) VALUES (4, N'BMW')
INSERT [dbo].[Marcas] ([IDMarca], [Nome]) VALUES (5, N'Mercedes')
INSERT [dbo].[Marcas] ([IDMarca], [Nome]) VALUES (6, N'Volkswagen')
INSERT [dbo].[Marcas] ([IDMarca], [Nome]) VALUES (7, N'Renault')
INSERT [dbo].[Marcas] ([IDMarca], [Nome]) VALUES (8, N'Peugeot')
INSERT [dbo].[Marcas] ([IDMarca], [Nome]) VALUES (9, N'Hyundai')
INSERT [dbo].[Marcas] ([IDMarca], [Nome]) VALUES (10, N'Kia')
SET IDENTITY_INSERT [dbo].[Marcas] OFF
GO
SET IDENTITY_INSERT [dbo].[Modelos] ON 

INSERT [dbo].[Modelos] ([IDModelos], [Modelos]) VALUES (1, N'Corolla')
INSERT [dbo].[Modelos] ([IDModelos], [Modelos]) VALUES (2, N'Honda')
INSERT [dbo].[Modelos] ([IDModelos], [Modelos]) VALUES (3, N'Focus')
INSERT [dbo].[Modelos] ([IDModelos], [Modelos]) VALUES (4, N'Serie 1')
INSERT [dbo].[Modelos] ([IDModelos], [Modelos]) VALUES (5, N'A180')
INSERT [dbo].[Modelos] ([IDModelos], [Modelos]) VALUES (6, N'Golf')
INSERT [dbo].[Modelos] ([IDModelos], [Modelos]) VALUES (7, N'Clio')
INSERT [dbo].[Modelos] ([IDModelos], [Modelos]) VALUES (8, N'208')
INSERT [dbo].[Modelos] ([IDModelos], [Modelos]) VALUES (9, N'i20')
INSERT [dbo].[Modelos] ([IDModelos], [Modelos]) VALUES (10, N'Rio')
SET IDENTITY_INSERT [dbo].[Modelos] OFF
GO
SET IDENTITY_INSERT [dbo].[Veiculos] ON 

INSERT [dbo].[Veiculos] ([VeiculoID], [MarcaID], [ModeloID], [Ano], [InspecaoID], [Vendido]) VALUES (1, 1, 1, 2020, NULL, 1)
INSERT [dbo].[Veiculos] ([VeiculoID], [MarcaID], [ModeloID], [Ano], [InspecaoID], [Vendido]) VALUES (2, 2, 2, 2019, NULL, 1)
INSERT [dbo].[Veiculos] ([VeiculoID], [MarcaID], [ModeloID], [Ano], [InspecaoID], [Vendido]) VALUES (3, 3, 3, 2021, NULL, 1)
INSERT [dbo].[Veiculos] ([VeiculoID], [MarcaID], [ModeloID], [Ano], [InspecaoID], [Vendido]) VALUES (4, 4, 4, 2018, NULL, 1)
INSERT [dbo].[Veiculos] ([VeiculoID], [MarcaID], [ModeloID], [Ano], [InspecaoID], [Vendido]) VALUES (5, 5, 5, 2020, NULL, 1)
INSERT [dbo].[Veiculos] ([VeiculoID], [MarcaID], [ModeloID], [Ano], [InspecaoID], [Vendido]) VALUES (6, 6, 6, 2017, NULL, 1)
INSERT [dbo].[Veiculos] ([VeiculoID], [MarcaID], [ModeloID], [Ano], [InspecaoID], [Vendido]) VALUES (7, 7, 7, 2022, NULL, 1)
INSERT [dbo].[Veiculos] ([VeiculoID], [MarcaID], [ModeloID], [Ano], [InspecaoID], [Vendido]) VALUES (8, 8, 8, 2021, NULL, 1)
INSERT [dbo].[Veiculos] ([VeiculoID], [MarcaID], [ModeloID], [Ano], [InspecaoID], [Vendido]) VALUES (9, 9, 9, 2019, NULL, 1)
INSERT [dbo].[Veiculos] ([VeiculoID], [MarcaID], [ModeloID], [Ano], [InspecaoID], [Vendido]) VALUES (10, 10, 10, 2020, NULL, 1)
SET IDENTITY_INSERT [dbo].[Veiculos] OFF
GO

SET IDENTITY_INSERT [dbo].[Inspecoes] ON 

INSERT [dbo].[Inspecoes] ([InspecoesID], [VeiculoID], [DataDeInspecao], [Resultado]) VALUES (1, 1, CAST(N'2025-01-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Inspecoes] ([InspecoesID], [VeiculoID], [DataDeInspecao], [Resultado]) VALUES (2, 2, CAST(N'2023-09-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Inspecoes] ([InspecoesID], [VeiculoID], [DataDeInspecao], [Resultado]) VALUES (3, 3, CAST(N'2024-02-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Inspecoes] ([InspecoesID], [VeiculoID], [DataDeInspecao], [Resultado]) VALUES (4, 4, CAST(N'2023-06-22T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Inspecoes] OFF
GO