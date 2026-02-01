/*
Objetivo:
Obter uma listagem de alunos e professores com endereços de email e números de telefone incorretos.

Metodologia:
O procedimento foi construído iterativamente:
1. Inicialmente usando JOIN simples
2. Exploração de CROSS JOIN
3. Utilização de PIVOT para organizar os tipos de contacto em colunas
4. Implementação de Dynamic SQL para permitir adaptação automática a novos tipos de contacto

Função ValidarContacto:
- Chamada neste procedimento
- Critérios de validade descritos na função

Assistência:
A maior parte da implementação prática do procedimento foi desenvolvida com apoio do ChatGPT, 
que forneceu sugestões, exemplos e explicações detalhadas para cada etapa (CROSS JOIN, PIVOT, Dynamic SQL). 
O autor realizou o estudo, testes e integração do código na base de dados, 
adaptando-o às necessidades do exercício seguindo as indicações recebidas e as referencias online.
*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE VerificarContactos
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @cols NVARCHAR(MAX),
        @cases NVARCHAR(MAX),
        @sql NVARCHAR(MAX);

SELECT @cols = STRING_AGG(QUOTENAME(NomeDoContacto), ',')
FROM TiposdeContactos;

SELECT @cases = STRING_AGG(
    'CASE [' + NomeDoContacto + '] WHEN 1 THEN ''Valido'' WHEN 0 THEN ''Invalido'' END AS [' + NomeDoContacto + ']'
, ', ')
FROM TiposdeContactos;

SET @sql = N'
SELECT PessoaID, FirstName, LastName, ' + @cases + '
FROM (
    SELECT Pessoas.PessoaID, Pessoas.FirstName, Pessoas.LastName, TiposdeContactos.NomeDoContacto,
           dbo.ValidarContacto(Pessoas.PessoaID, TiposdeContactos.TipoID) AS EstadoValidacao
    FROM Pessoas
    CROSS JOIN TiposdeContactos
) tblSource
PIVOT (
    MAX(EstadoValidacao)
    FOR NomeDoContacto IN (' + @cols + ')
) tbPivot
ORDER BY PessoaID;
';

--PRINT @sql

EXEC sp_executesql @sql;
END
GO
