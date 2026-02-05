
-- Criar Todas as Amostras
	EXEC CriarTodasAmostras
-- Criar Amostras Pessoas
	EXEC CriarAmostraPessoas
-- Criar Amostras TiposdeContactos
	EXEC CriarAmostraTiposContactos
-- Criar Amostras Contactos
	EXEC CriarAmostraContactos
-- Criar Amostras TiposdeRelacoes 
	EXEC CriarAmostraTiposRelacoes
-- Criar Amostras Relacoes
	EXEC CriarAmostraRelacoes
-- Criar Amostras de Alunos
	EXEC CriarAmostraAlunos
-- Criar Amostras de Professores 
	EXEC CriarAmostraProfessores
-- Criar Amostras de Cursos
	EXEC CriarAmostraCursos
-- Criar Amostra Ano Letivo
	EXEC CriarAmostraAnoLetivo
-- Iniciar um novo Ano Letivo
	EXEC SetUpAnoLetivo 
-- Inativar um Ano Letivo
	EXEC UnsetAnoLetivo 

-- Funcções que respondem à Ficha Base de Dados Escola D’ELITE
-- Ex.1 Obter uma listagem de alunos e professores com endereços de email e numeros de telefone incorretos
EXEC VerificarContactos

-- Ex.2 Obter uma listagem dos alunos que tenham irmãos inscritos
EXEC ObterListIrmaos

-- Ex.3 Obter uma listagem do quadro de honra dos alunos, para um dado ano
EXEC ObterQuadrodeHonra 2002

-- Ex.4 Obter uma listagem dos N professores mais antigos em funções
EXEC ObterNProfessoresMaisAntigos 2

-- Ex.5 Mostrar o numero de alunos por ano e curso
EXEC ObterAlunosPorAnoECurso

-- Ex.6 Manter um histórico com o registo de aprovação/reprovação dos alunos, para cada ano
EXEC ObterAprovacoesReprovacoes

-- Ex.7 Efetuar o registo de um novo aluno
EXEC AddStudent @NIF = '222333444', @FirstName = 'Jose', @LastNAme = 'Silva', @DOB = '2010-08-21'

-- Ex.8 Efetuar o registo de um novo professor
EXEC AddStudent @NIF = '333444555', @FirstName = 'Maria', @LastNAme = 'Grilo', @DOB = '1980-08-21'

-- Ex.9 Efetuar a cessação de funções de um professor
EXEC CessarFuncoesProfessor 2

-- Ex.10 Efetuar a transferência de um aluno para outra escola
EXEC TransferirAluno 2

-- Ex.11 Proceder ao registo automático dos dados para o novo ano escolar
EXEC SetUpAnoLetivo @Year = 2003
