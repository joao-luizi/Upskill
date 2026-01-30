USE [Upskill_EscolaDelite]
GO

/****** Object:  StoredProcedure [dbo].[SamplePessoal]    Script Date: 30/01/2026 14:53:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SamplePessoal]
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Pessoas
    (NIF, FirstName, MiddleName, LastName, DOB, LastUpdate)
VALUES
('123456789', 'João', 'Miguel', 'Silva', '1990-04-12', GETDATE()),
('987654321', 'Ana', NULL, 'Costa', '1982-09-30', GETDATE()),
('456789123', 'Carlos', 'Eduardo', 'Silva', '1970-01-15', GETDATE()),
('321654987', 'Mariana', NULL, 'Pereira', '2015-06-20', GETDATE()),
('159753486', 'Sofia', 'Isabel', 'Almeida', '2008-02-03', GETDATE()),

('741852963', 'Pedro', 'Henrique', 'Rocha', '2012-11-18', GETDATE()),
('852963741', 'Inês', NULL, 'Ferreira', '1995-07-07', GETDATE()),
('963852741', 'Rui', 'Manuel', 'Mendes', '1988-01-25', GETDATE()),
('369258147', 'Cláudia', NULL, 'Lopes', '1979-05-14', GETDATE()),
('258147369', 'Tiago', 'André', 'Sousa', '2006-09-02', GETDATE()),

('147258369', 'Beatriz', NULL, 'Gomes', '2014-12-09', GETDATE()),
('789456123', 'Filipe', 'José', 'Ribeiro', '1985-03-19', GETDATE()),
('654123789', 'Helena', 'Maria', 'Martins', '1976-08-27', GETDATE()),
('951753852', 'Daniel', NULL, 'Teixeira', '2009-04-05', GETDATE()),
('852741963', 'Catarina', 'Sofia', 'Pinto', '1993-10-11', GETDATE()),

('753159846', 'Miguel', NULL, 'Azevedo', '2016-01-30', GETDATE()),
('159846753', 'Patrícia', 'Andreia', 'Faria', '1981-06-22', GETDATE()),
('486159753', 'André', NULL, 'Correia', '2004-02-14', GETDATE()),
('357159486', 'Vera', 'Lúcia', 'Barbosa', '1969-07-03', GETDATE()),
('951486357', 'Bruno', 'Alexandre', 'Neves', '1998-11-29', GETDATE()),

('654987321', 'Leonor', NULL, 'Cunha', '2013-05-17', GETDATE()),
('789321654', 'Ricardo', 'Paulo', 'Moreira', '1974-09-08', GETDATE()),
('321789654', 'Sara', 'Cristina', 'Antunes', '2007-12-01', GETDATE()),
('963741852', 'Nuno', NULL, 'Carvalho', '1986-04-26', GETDATE()),
('147369258', 'Matilde', NULL, 'Oliveira', '2018-08-15', GETDATE()),

('258369147', 'Luís', 'Fernando', 'Batista', '1965-02-10', GETDATE()),
('369147258', 'Marta', 'Rita', 'Pacheco', '1991-06-06', GETDATE()),
('852147963', 'Gonçalo', NULL, 'Serra', '2005-10-21', GETDATE()),
('741963852', 'Isabel', 'Teresa', 'Nogueira', '1972-01-04', GETDATE()),

('963258741', 'José', 'Manuel', 'Silva', '1965-03-10', GETDATE()),
('852147258', 'Maria', 'Helena', 'Costa', '1966-07-21', GETDATE()),
('741852147', 'Tiago', NULL, 'Silva', '2010-09-12', GETDATE()),
('369852741', 'Ana', 'Catarina', 'Silva', '2012-04-03', GETDATE()),
('258741963', 'Beatriz', NULL, 'Costa', '2008-05-18', GETDATE()),
('147852369', 'Pedro', NULL, 'Costa', '2014-06-20', GETDATE()),
('963147258', 'Laura', 'Sofia', 'Pereira', '2016-11-02', GETDATE());
END
GO

