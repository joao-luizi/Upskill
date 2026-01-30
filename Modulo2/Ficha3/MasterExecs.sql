
-- Obter uma listagem de alunos e professores com 
-- endereços de email e numeros de telefone incorretos
EXEC ContactCheck				
------------------------------------------------------

-- Obter uma listagem dos alunos que tenham irmãos inscritos
EXEC ListagemDeIrmaos			
------------------------------------------------------------

-- Obter uma listagem do quadro de honra dos alunos, 
-- para um dado ano
EXEC HonorBoardPerYear 2026		
-------------------------------------------------------------

-- Obter uma listagem dos N professores mais antigos em funções
EXEC ListarAntiguidadeN	5		
--------------------------------------------------------------

-- Manter um histórico com o registo de aprovação/reprovação dos 
-- alunos, para cada ano
EXEC GetStudentAprovalStateByYear   
-----------------------------------------------------------------

-- Mostrar o numero de alunos por ano e curso

EXEC AlunosPorAnoECurso			
-----------------------------------------------------------------

-- Efetuar o registo de um novo aluno

EXEC AddStudent	'1234754', 'João', 'Silva', NULL, '19900831'				
------------------------------------------------------------------
-- Efetuar o registo de um novo professor
EXEC AddProfessor				
------------------------------------------------------------------
-- Efetuar a cessação de funções de um professor
EXEC InactivateProfessor 8		
------------------------------------------------------------------
-- Efetuar a transferência de um aluno para outra escola

EXEC TransferStudent -2		
------------------------------------------------------------------

-- Introduz ou encontra uma pessoa e retorna o PessoaID 
-- (chamada no AddProfessor e AddStudent)
EXEC AddPessoa					
--------------------------------------------------------------------

								-- Proceder ao registo automático dos dados para o novo ano escolar
