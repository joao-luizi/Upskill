USE [Upskill_EscolaDelite]
GO

/****** Object:  StoredProcedure [dbo].[AddStudent]    Script Date: 30/01/2026 14:51:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Efetuar o registo de um novo aluno
CREATE PROCEDURE [dbo].[AddStudent]
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
    
	EXEC dbo.AddPessoa
        @NIF = @NIF,
        @FirstName = @FirstName,
        @LastName = @LastName,
        @MiddleName = @MiddleName,
        @DOB = @DOB,
        @PessoaID = @PessoaID OUTPUT; 

	INSERT INTO Alunos
	(
		PessoaID,
		DataRegisto,
		Ativo
	)
	VALUES
	(
	@PessoaID,
	GETDATE(),
	1
	)
	PRINT 'Estudante Adicionado'
END




GO

