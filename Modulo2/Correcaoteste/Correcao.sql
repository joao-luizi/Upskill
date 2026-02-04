-- Teste Parte II resposta 1
SELECT TOP 1 Nome, DATEDIFF(YEAR, DataNascimento, GETDATE()) AS IDADE 
FROM medicos WHERE Medicos.Ativo = 1
ORDER BY DataNascimento DESC
UNION
SELECT TOP 1 Nome, DATEDIFF(YEAR, DataNascimento, GETDATE()) AS IDADE 
FROM medicos WHERE Medicos.Ativo = 1
ORDER BY DataNascimento ASC

-- Esta versão dava a nota toda apesar de o union estar errado porque não se 
pode ter ordr by nos queryes do union
SELECT Nome, Idade
FROM (
    SELECT TOP (1) 
        Nome,
        DATEDIFF(YEAR, DataNascimento, GETDATE()) AS Idade
    FROM Medicos
    WHERE Ativo = 1
    ORDER BY DataNascimento DESC   -- youngest
) AS Youngest

UNION ALL

SELECT Nome, Idade
FROM (
    SELECT TOP (1) 
        Nome,
        DATEDIFF(YEAR, DataNascimento, GETDATE()) AS Idade
    FROM Medicos
    WHERE Ativo = 1
    ORDER BY DataNascimento ASC    -- oldest
) AS Oldest;
--Resposta correcta e total 

-- Parte II Ex 2.
SELECT MONTH(Consultas.DataConsulta) AS Mes, COUNT(*) AS NrConsultas FROM Consultas INNER JOIN Medicos
ON Consultas.Id_Medico = Medicos.Id
WHERE MEdicos.nome = 'Joao' AND YEAR(Consultas.DataConsulta) = 2000
GROUP BY Month(Consultas.DataConsulta);

-- Parte  II Ex 3.
SELECT Nome, DataConsulta FROM Consultas 
INNER JOIN Especialidades ON Especialidades.Id = Consultas.Id_Especialidade
WHERE DataConsulta > GETDATE()
AND YEAR(DataConsulta) = YEAR(GETDATE())
AND MONTH(DataConsulta) = MONTH(GETDATE())
ORDER By DataConsulta

-- Parte II Ex.4 
SELECT Nome FROM Medicos Where Ativo = 1 AND
Id NOT IN (SELECT Id_Medico FROM Consultas WHERE DataConsulta > DATEADD(MONTH, -6, GETDATE()))
-- esta versão apanha as conusltas no futuro também precisava de um cuttoff

SELECT Nome FROM Medicos WHERE Ativo = 1 
AND Id NOT IN (SELECT Id_Medico FROM Consultas WHERE DATEDIFF(month, Consultas.DataConsulta, GETDATE()) < 6)

-- Parte II Ex.5
DECLARE @TmpMes DATETIME
DECLARE @MinMes DATETIME
DECLARE @MaxMes DATETIME
 
SET @TmpMes = DATEADD(month, 1, GETDATE())
SET @MinMes = DATEFROMPARTS(YEAR(@TmpMes), MONTH(@TmpMes), 1)
 
SET @TmpMes = DATEADD(month, 2, GETDATE())
SET @MaxMes = DATEFROMPARTS(YEAR(@TmpMes), MONTH(@TmpMes), 1)
 
UPDATE Consultas SET IncluirTaxa = 0 WHERE Id_Paciente IN 
(SELECT Id FROM Pacientes WHERE Pacientes.Beneficiario <> 0) AND DataConsulta >= @MinMes AND DataConsulta < @MaxMes


-- Part II Ex.6
SELECT Count(*) FROM Consultas WHERE Year(DataConsulta) = 2026 
AND Id_Especialidade IN (Select TOP(3) Id_Especialidade FROM Consultas Group BY Id_Especialidade
Order by COUNT(*) DESC)

select sum(t.valor) from (SELECT TOP 3 COUNT(*) AS Valor FROM Consultas WHERE  YEAR(DataConsulta) = 2026 
GROUP BY Id_Especialidade ORDER BY COUNT(*) DESC) as t

INSERT INTO Hist_Consultas
(Id, Ano, NumConsultas, ValorComTaxa, ValorSemTaxa)
VALUES
(
(SELECT MAX(Id) FROM Hist_Consultas) + 1,
@Year,

)