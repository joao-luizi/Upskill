-- Ensure ANSI settings (can run once per connection)
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;

-- Create Marcas table
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Marcas')
BEGIN
    CREATE TABLE [dbo].[Marcas](
        [IDMarca] INT IDENTITY(1,1) NOT NULL,
        [Nome] NVARCHAR(50) NOT NULL,
        CONSTRAINT [PK_Marcas] PRIMARY KEY CLUSTERED ([IDMarca] ASC)
    );
END

-- Create Modelos table
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Modelos')
BEGIN
    CREATE TABLE [dbo].[Modelos](
        [IDModelos] INT IDENTITY(1,1) NOT NULL,
        [NomeModelo] NVARCHAR(50) NOT NULL,
        CONSTRAINT [PK_Modelos] PRIMARY KEY CLUSTERED ([IDModelos] ASC)
    );
END

-- Create Veiculos table
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Veiculos')
BEGIN
    CREATE TABLE [dbo].[Veiculos](
        [VeiculoID] BIGINT IDENTITY(1,1) NOT NULL,
        [MarcaID] INT NOT NULL,
        [ModeloID] INT NOT NULL,
        [Ano] INT NOT NULL,
        [Vendido] BIT NOT NULL CONSTRAINT [DF_Veiculos_Vendido] DEFAULT ((0)),
        CONSTRAINT [PK_Veiculos] PRIMARY KEY CLUSTERED ([VeiculoID] ASC)
    );
END

-- Create Inspecoes table
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Inspecoes')
BEGIN
    CREATE TABLE [dbo].[Inspecoes](
        [InspecoesID] BIGINT IDENTITY(1,1) NOT NULL,
        [VeiculoID] BIGINT NOT NULL,
        [DataDeInspecao] DATETIME NOT NULL,
        [Resultado] BIT NOT NULL,
        CONSTRAINT [PK_Inspecoes] PRIMARY KEY CLUSTERED ([InspecoesID] ASC)
    );
END

-- Add foreign keys (after all tables exist)
-- Veiculos -> Marcas
IF NOT EXISTS (
    SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Veiculos_Marcas'
)
BEGIN
    ALTER TABLE [dbo].[Veiculos] WITH CHECK ADD CONSTRAINT [FK_Veiculos_Marcas] 
        FOREIGN KEY([MarcaID]) REFERENCES [dbo].[Marcas]([IDMarca]);
    ALTER TABLE [dbo].[Veiculos] CHECK CONSTRAINT [FK_Veiculos_Marcas];
END

-- Veiculos -> Modelos
IF NOT EXISTS (
    SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Veiculos_Modelos'
)
BEGIN
    ALTER TABLE [dbo].[Veiculos] WITH CHECK ADD CONSTRAINT [FK_Veiculos_Modelos] 
        FOREIGN KEY([ModeloID]) REFERENCES [dbo].[Modelos]([IDModelos]);
    ALTER TABLE [dbo].[Veiculos] CHECK CONSTRAINT [FK_Veiculos_Modelos];
END

-- Inspecoes -> Veiculos
IF NOT EXISTS (
    SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_Inspecoes_Veiculos'
)
BEGIN
    ALTER TABLE [dbo].[Inspecoes] WITH CHECK ADD CONSTRAINT [FK_Inspecoes_Veiculos] 
        FOREIGN KEY([VeiculoID]) REFERENCES [dbo].[Veiculos]([VeiculoID]);
    ALTER TABLE [dbo].[Inspecoes] CHECK CONSTRAINT [FK_Inspecoes_Veiculos];
END
