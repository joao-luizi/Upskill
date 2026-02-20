-- Seed Marcas
INSERT INTO dbo.Marcas (Nome) VALUES 
(N'Toyota'),
(N'Honda'),
(N'Ford'),
(N'BMW'),
(N'Mercedes'),
(N'Volkswagen'),
(N'Renault'),
(N'Peugeot'),
(N'Hyundai'),
(N'Kia');

-- Seed Modelos
INSERT INTO dbo.Modelos (NomeModelo) VALUES
(N'Corolla'),
(N'Civic'),
(N'Focus'),
(N'Serie 1'),
(N'A180'),
(N'Golf'),
(N'Clio'),
(N'208'),
(N'i20'),
(N'Rio');

-- Seed Veiculos
INSERT INTO dbo.Veiculos (MarcaID, ModeloID, Ano, InspecaoID, Vendido) VALUES
(1, 1, 2020, NULL, 1),
(2, 2, 2019, NULL, 1),
(3, 3, 2021, NULL, 1),
(4, 4, 2018, NULL, 1),
(5, 5, 2020, NULL, 1),
(6, 6, 2017, NULL, 1),
(7, 7, 2022, NULL, 1),
(8, 8, 2021, NULL, 1),
(9, 9, 2019, NULL, 1),
(10, 10, 2020, NULL, 1);

-- Seed Inspecoes
INSERT INTO dbo.Inspecoes (VeiculoID, DataDeInspecao, Resultado) VALUES
(1, '2025-01-10', 1),
(2, '2023-09-05', 1),
(3, '2024-02-12', 1),
(4, '2023-06-22', 1);
