-- Drop child tables first
IF OBJECT_ID('dbo.Inspecoes', 'U') IS NOT NULL
BEGIN
    -- Drop FK constraint to Veiculos if it exists
    IF OBJECT_ID('FK_Inspecoes_Veiculos', 'F') IS NOT NULL
        ALTER TABLE dbo.Inspecoes DROP CONSTRAINT FK_Inspecoes_Veiculos;

    DROP TABLE dbo.Inspecoes;
END

IF OBJECT_ID('dbo.Veiculos', 'U') IS NOT NULL
BEGIN
    -- Drop FK constraints to Marcas and Modelos if they exist
    IF OBJECT_ID('FK_Veiculos_Marcas', 'F') IS NOT NULL
        ALTER TABLE dbo.Veiculos DROP CONSTRAINT FK_Veiculos_Marcas;

    IF OBJECT_ID('FK_Veiculos_Modelos', 'F') IS NOT NULL
        ALTER TABLE dbo.Veiculos DROP CONSTRAINT FK_Veiculos_Modelos;

    DROP TABLE dbo.Veiculos;
END

-- Then drop parent tables
IF OBJECT_ID('dbo.Modelos', 'U') IS NOT NULL
    DROP TABLE dbo.Modelos;

IF OBJECT_ID('dbo.Marcas', 'U') IS NOT NULL
    DROP TABLE dbo.Marcas;