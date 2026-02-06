-- 1. Inserir Tipos de Núcleos (Lisboa e Regionais)
INSERT INTO [dbo].[TipoNucleos] ([Descricao]) VALUES 
('Sede Central'),
('Núcleo Regional');

-- 2. Inserir Assuntos (Temas para pesquisa)
INSERT INTO [dbo].[Assuntos] ([Assunto]) VALUES 
('Informática'),
('Literatura'),
('História'),
('Ciências');

-- 3. Inserir Núcleos (Lisboa e outros)
INSERT INTO [dbo].[Nucleos] ([Nome], [Local], [ID_TipoNucleo]) VALUES 
('Biblioteca Central', 'Lisboa', 1),
('Núcleo Norte', 'Porto', 2),
('Núcleo Sul', 'Faro', 2);

-- 4. Inserir Obras (Incluindo suporte para imagem da capa)
INSERT INTO [dbo].[Obras] ([Autor], [ISBN], [Titulo], [Capa], [ID_Assunto]) VALUES 
('Andrew Troelsen', '978-1484230176', 'Pro C# 10 with .NET 6', NULL, 1),
('J.K. Rowling', '978-0747532743', 'Harry Potter e a Pedra Filosofal', NULL, 2),
('Fernando Pessoa', '978-9722100268', 'Mensagem', NULL, 2),
('Yuval Noah Harari', '978-0062316097', 'Sapiens', NULL, 3);

-- 5. Inserir Exemplares (Garantindo pelo menos um por núcleo para consulta presencial) 
-- Exemplares da Obra 1
INSERT INTO [dbo].[Exemplares] ([ID_Obra]) VALUES (1), (1), (1);
-- Exemplares da Obra 2
INSERT INTO [dbo].[Exemplares] ([ID_Obra]) VALUES (2), (2), (2);
-- Exemplares da Obra 3
INSERT INTO [dbo].[Exemplares] ([ID_Obra]) VALUES (3), (3);

-- 6. Associar Exemplares aos Núcleos
INSERT INTO [dbo].[Exemplares_Nucleo] ([ID_Nucleo], [ID_Exemplar]) VALUES 
(1, 1), (2, 2), (3, 3), -- Obra 1 distribuída
(1, 4), (2, 5), (3, 6), -- Obra 2 distribuída
(1, 7), (2, 8);         -- Obra 3 distribuída

-- 7. Inserir Leitores (Ativos, Suspensos e Inativos)
INSERT INTO [dbo].[Leitores] ([Nome], [Ativo], [Infracoes]) VALUES 
('João Silva', 1, 0),    -- Leitor regular
('Maria Santos', 1, 0),  -- Leitora regular
('Ricardo Sousa', 0, 4), -- Suspenso (mais de 3 infrações) 
('Ana Oliveira', 1, 0);  -- Leitora para teste de inatividade

-- 8. Inserir Requisições (Simulando atrasos e situações do enunciado)
-- Data de hoje: 2026-02-05
INSERT INTO [dbo].[Requisicoes] ([ID_Leitor], [ID_Exemplar], [DataRequisicao], [DataEntrega]) VALUES 
-- Leitor 1: Requisitado há 12 dias (Devolver em breve - falta < 5 dias)
(1, 1, '2026-01-24', NULL), 
-- Leitor 1: Requisitado há 14 dias (Devolução URGENTE - falta < 3 dias)
(1, 4, '2026-01-22', NULL),
-- Leitor 2: Requisitado há 20 dias (ATRASO - passou dos 15 dias) 
(2, 2, '2026-01-16', NULL),
-- Histórico: Obra já entregue
(2, 5, '2025-12-01', '2025-12-10');