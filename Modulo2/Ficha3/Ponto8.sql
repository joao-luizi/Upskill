
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Efetuar o registo de um novo professor
CREATE PROCEDURE AddProfessor
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
	INSERT INTO Pessoas (
	NIF,
	FirstName,
	LastName,
	MiddleName,
	DOB,
	LastUpdate
	) Values (
	@NIF,
	@FirstName,
	@LastName,
	@MiddleName,
	@DOB,
	GETDATE()
	)
	SET @PessoaID  =  SCOPE_IDENTITY();

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
END
GO
