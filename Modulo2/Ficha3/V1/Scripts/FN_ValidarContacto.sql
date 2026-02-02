USE [UpSkill_EscolaDelite]
GO
/*
Esta função verifica um registo de contacto:
Telefone: 
- Precisa de ter exatamente 9 digitos
- Não pode ter nenhuma Letra
Email
- tem de ter pelo menos um @
*/
/****** Object:  UserDefinedFunction [dbo].[ValidarContacto]    Script Date: 01/02/2026 14:58:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[ValidarContacto]
(
    @PessoaID INT,
    @Tipo INT
)
RETURNS INT
AS
BEGIN
    DECLARE @Resultado INT;

    -- Contact does not exist
    IF NOT EXISTS (
        SELECT 1
        FROM Contactos
        WHERE PessoaID = @PessoaID
          AND Tipo = @Tipo
    )
        RETURN 0;

    -- Telefone
    IF @Tipo = 1
    BEGIN
        SELECT @Resultado =
            CASE
                WHEN LEN(Valor) = 9
                 AND Valor NOT LIKE '%[^0-9]%'
                THEN 1
                ELSE 0
            END
        FROM Contactos
        WHERE PessoaID = @PessoaID
          AND Tipo = @Tipo;

        RETURN @Resultado;
    END

    -- Email
    IF @Tipo = 2
    BEGIN
        SELECT @Resultado =
            CASE
                WHEN Valor LIKE '%@%'
                THEN 1
                ELSE 0
            END
        FROM Contactos
        WHERE PessoaID = @PessoaID
          AND Tipo = @Tipo;

        RETURN @Resultado;
    END

    RETURN 0;
END
GO

