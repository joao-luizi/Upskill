USE [Upskill_EscolaDelite]
GO

/****** Object:  StoredProcedure [dbo].[AddProfessor]    Script Date: 30/01/2026 14:50:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Efetuar o registo de um novo professor
CREATE PROCEDURE [dbo].[AddProfessor]
	-- Add the parameters for the stored procedure here
	@NIF NCHAR(9),
	@FirstName NVARCHAR(100),
	@LastName NVARCHAR(100),
	@MiddleName NVARCHAR(100),
	@DOB DATETIME
	--LastUpdate
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @PessoaID BIGINT
    -- Insert statements for procedure here
	EXEC dbo.AddPessoa
        @NIF = @NIF,
        @FirstName = @FirstName,
        @LastName = @LastName,
        @MiddleName = @MiddleName,
        @DOB = @DOB,
        @PessoaID = @PessoaID OUTPUT;
	 

	INSERT INTO Professores
	(
		PessoaID,
		DataDeContratacao,
		Ativo
	)
	VALUES
	(
	@PessoaID,
	GETDATE(),
	1
	)
	PRINT 'Professor Adicionado'
END
GO

