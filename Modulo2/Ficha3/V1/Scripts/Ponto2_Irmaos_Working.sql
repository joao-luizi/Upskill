SELECT p1.PessoaID AS IrmaoAID, p1.FirstName + ' ' + p1.LastName AS IrmaoA,
p2.PessoaID AS IrmaoBID, p2.FirstName + ' ' + p2.LastName AS IrmaoB,
TiposRelacao.RelacaoNome
FROM Relacoes r
INNER JOIN Pessoas p1
ON p1.PessoaID = r.PessoaAID
INNER JOIN Pessoas p2
ON p2.PessoaID = r.PessoaBID
INNER JOIN TiposRelacao
ON TiposRelacao.RelacaoID = r.Tipo
WHERE EXISTS (SELECT 1 FROM Alunos 
WHERE ((Alunos.Ativo = 1 AND Alunos.PessoaID = p1.PessoaID) OR (Alunos.Ativo = 1 AND Alunos.PessoaID = p2.PessoaID)))