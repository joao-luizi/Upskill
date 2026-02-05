
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Criar_Relacoes_Tabelas
	
AS
BEGIN

	ALTER TABLE [dbo].[Alunos]  WITH CHECK ADD  CONSTRAINT [FK_Alunos_Pessoas] FOREIGN KEY([PessoaID])
	REFERENCES [dbo].[Pessoas] ([PessoaID])

	ALTER TABLE [dbo].[AlunosdaTurma]  WITH CHECK ADD  CONSTRAINT [FK_AlunosdaTurma_Alunos1] FOREIGN KEY([AlunoID])
	REFERENCES [dbo].[Alunos] ([AlunoID])
	
	ALTER TABLE [dbo].[AlunosdaTurma]  WITH CHECK ADD  CONSTRAINT [FK_AlunosdaTurma_Turmas] FOREIGN KEY([TurmaID])
	REFERENCES [dbo].[Turmas] ([TurmaID])
	
	ALTER TABLE [dbo].[Contactos]  WITH CHECK ADD  CONSTRAINT [FK_Contactos_Pessoas] FOREIGN KEY([PessoaID])
	REFERENCES [dbo].[Pessoas] ([PessoaID])
	
	ALTER TABLE [dbo].[Contactos]  WITH CHECK ADD  CONSTRAINT [FK_Contactos_TiposdeContactos] FOREIGN KEY([Tipo])
	REFERENCES [dbo].[TiposdeContactos] ([TipoID])

	ALTER TABLE [dbo].[Professores]  WITH CHECK ADD  CONSTRAINT [FK_Professores_Pessoas] FOREIGN KEY([PessoaID])
	REFERENCES [dbo].[Pessoas] ([PessoaID])

	ALTER TABLE [dbo].[ProfessoresdaTurma]  WITH CHECK ADD  CONSTRAINT [FK_ProfessoresdaTurma_Professores] FOREIGN KEY([ProfessorID])
	REFERENCES [dbo].[Professores] ([ProfessorID])

	ALTER TABLE [dbo].[ProfessoresdaTurma]  WITH CHECK ADD  CONSTRAINT [FK_ProfessoresdaTurma_Turmas] FOREIGN KEY([TurmaID])
	REFERENCES [dbo].[Turmas] ([TurmaID])

	ALTER TABLE [dbo].[Relacoes]  WITH CHECK ADD  CONSTRAINT [FK_Relacoes_Pessoas] FOREIGN KEY([PessoaAID])
	REFERENCES [dbo].[Pessoas] ([PessoaID])
	
	ALTER TABLE [dbo].[Relacoes]  WITH CHECK ADD  CONSTRAINT [FK_Relacoes_Pessoas1] FOREIGN KEY([PessoaBID])
	REFERENCES [dbo].[Pessoas] ([PessoaID])
	
	ALTER TABLE [dbo].[Relacoes]  WITH CHECK ADD  CONSTRAINT [FK_Relacoes_TiposRelacao] FOREIGN KEY([Tipo])
	REFERENCES [dbo].[TiposRelacao] ([RelacaoID])

	ALTER TABLE [dbo].[Turmas]  WITH CHECK ADD  CONSTRAINT [FK_Turmas_AnoLetivo] FOREIGN KEY([AnoLetivoID])
	REFERENCES [dbo].[AnoLetivo] ([AnoLetivoID])
	
	ALTER TABLE [dbo].[Turmas]  WITH CHECK ADD  CONSTRAINT [FK_Turmas_Cursos] FOREIGN KEY([CursoID])
	REFERENCES [dbo].[Cursos] ([CursoID])

	ALTER TABLE [dbo].[AlunosdaTurma] CHECK CONSTRAINT [FK_AlunosdaTurma_Alunos1]

	ALTER TABLE [dbo].[AlunosdaTurma] CHECK CONSTRAINT [FK_AlunosdaTurma_Turmas]

	ALTER TABLE [dbo].[Alunos] CHECK CONSTRAINT [FK_Alunos_Pessoas]
	
	ALTER TABLE [dbo].[Contactos] CHECK CONSTRAINT [FK_Contactos_Pessoas]
	
	ALTER TABLE [dbo].[Contactos] CHECK CONSTRAINT [FK_Contactos_TiposdeContactos]
	
	ALTER TABLE [dbo].[Professores] CHECK CONSTRAINT [FK_Professores_Pessoas]

	ALTER TABLE [dbo].[ProfessoresdaTurma] CHECK CONSTRAINT [FK_ProfessoresdaTurma_Professores]

	ALTER TABLE [dbo].[ProfessoresdaTurma] CHECK CONSTRAINT [FK_ProfessoresdaTurma_Turmas]

	ALTER TABLE [dbo].[Relacoes] CHECK CONSTRAINT [FK_Relacoes_Pessoas]
	
	ALTER TABLE [dbo].[Relacoes] CHECK CONSTRAINT [FK_Relacoes_Pessoas1]
	
	ALTER TABLE [dbo].[Relacoes] CHECK CONSTRAINT [FK_Relacoes_TiposRelacao]

	ALTER TABLE [dbo].[Turmas] CHECK CONSTRAINT [FK_Turmas_AnoLetivo]

	ALTER TABLE [dbo].[Turmas] CHECK CONSTRAINT [FK_Turmas_Cursos]

END
GO
