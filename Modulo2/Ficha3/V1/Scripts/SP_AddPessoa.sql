USE [Upskill_EscolaDelite]
GO

/****** Object:  StoredProcedure [dbo].[AddPessoa]    Script Date: 30/01/2026 14:50:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddPessoa] 
	-- Add the parameters for the stored procedure here
	@NIF NCHAR(9),
	@FirstName NVARCHAR(100),
	@LastName NVARCHAR(100),
	@MiddleName NVARCHAR(100),
	@DOB DATETIME,
	@PessoaID BIGINT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT @PessoaID = PessoaID
    FROM Pessoas
    WHERE NIF = @NIF;

	IF @@ROWCOUNT = 0
    BEGIN
        INSERT INTO Pessoas (
            NIF,
            FirstName,
            LastName,
            MiddleName,
            DOB,
            LastUpdate
        )
        VALUES (
            @NIF,
            @FirstName,
            @LastName,
            @MiddleName,
            @DOB,
            GETDATE()
        );
        
        SET @PessoaID = SCOPE_IDENTITY();
        PRINT 'Nova Pessoa Adicionada'
    END
    ELSE
    PRINT 'Pessoa já registada'
END
GO

