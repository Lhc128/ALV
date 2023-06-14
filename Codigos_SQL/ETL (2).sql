use DBVLT_ALV_CFB
go

DECLARE @myguid uniqueidentifier 
SET @myguid = NEWID()

-- Inserir dados em Produtora
INSERT INTO [DWVLT_ALV_CFB].[dbo].[PRODUTORA] 
select 
	newid(),
	p.ProdutoraID,
    p.ProdutoraNome
from
	Produtora p;

-- Inserir dados em Genero
INSERT INTO [DWVLT_ALV_CFB].[dbo].[GENERO] 
select 
	newid(),
	g.GeneroID,
    g.GeneroNome
from
	Genero g;

-- Inserir dados em Filme
INSERT INTO [DWVLT_ALV_CFB].[dbo].[FILME] 
select 
	newid(),
	f.FilmeID,
    f.FilmeNome
from
	Filme f;

-- Inserir dados em Usuario
INSERT INTO [DWVLT_ALV_CFB].[dbo].[USUARIO] 
select 
	newid(),
	u.UsuarioID,
    u.UsuarioNome,
    u.Logradouro,
    u.Bairro,
    u.Municipio,
    u.Estado
from
	Usuario u;

-- Inserir dados em Calendario
INSERT INTO [DWVLT_ALV_CFB].[dbo].[CALENDARIO]
select 
	newid(),
    a.DataInicio,
	'AS',
	DATEPART(WEEKDAY, a.DataInicio),
	day(a.DataInicio),
	month(a.DataInicio),
	DATEPART(quarter, a.DataInicio),
	year(a.DataInicio),
    DATEPART(hour, a.DataInicio),
    DATEPART(minute, a.DataInicio),
    DATEPART(second, a.DataInicio)
from
	Assinatura a;

INSERT INTO [DWVLT_ALV_CFB].[dbo].[CALENDARIO] 
select 
	newid(),
    av.AvaliacaoData,
    'AV',
	DATEPART(WEEKDAY, av.AvaliacaoData),
	day(av.AvaliacaoData),
	month(av.AvaliacaoData),
	DATEPART(quarter, av.AvaliacaoData),
	year(av.AvaliacaoData),
    DATEPART(hour, av.AvaliacaoData),
    DATEPART(minute, av.AvaliacaoData),
    DATEPART(second, av.AvaliacaoData)
from
	Avaliacao av;

INSERT INTO [DWVLT_ALV_CFB].[dbo].[RECEITA] 
select
	c.CalendarioChave,
	u.UsuarioChave,
	a.AssinaturaID,
	p.PrecoMensal
from
	Assinatura a inner join [DWVLT_ALV_CFB].[dbo].[USUARIO] u 
	on a.UsuarioID = u.UsuarioID
	inner join	[DWVLT_ALV_CFB].[dbo].[CALENDARIO] c
	on a.DataInicio = c.DataCompleta
	inner join Plano p
	on a.PlanoID = p.PlanoID;
	

INSERT INTO [DWVLT_ALV_CFB].[dbo].[AVALIACAO] 
select 
	u.UsuarioChave,
	g.GeneroChave,
	p.ProdutoraChave,
	c.CalendarioChave,
	f.FilmeChave,
	a.Nota
from
	Avaliacao a inner join [DWVLT_ALV_CFB].[dbo].[USUARIO] u
	on a.UsuarioID = u.UsuarioID
	inner join [DWVLT_ALV_CFB].[dbo].[FILME] f
	on f.FilmeID = a.FilmeID
	inner join Produz pr 
	on f.FilmeID = pr.FilmeID
	inner join [DWVLT_ALV_CFB].[dbo].[PRODUTORA] p
	on pr.ProdutoraID = p.ProdutoraID 
	inner join [DWVLT_ALV_CFB].[dbo].[CALENDARIO] c 
	on a.AvaliacaoData = c.DataCompleta
	inner join Possui po
	on po.FilmeID = f.FilmeID
	inner join [DWVLT_ALV_CFB].[dbo].[GENERO] g
	on g.GeneroNome = po.GeneroNome

INSERT INTO [DWVLT_ALV_CFB].[dbo].[CHURN]
select
	u.UsuarioChave,
	c.CalendarioChave
from
	Assinatura a inner join [DWVLT_ALV_CFB].[dbo].[USUARIO] u 
	on a.UsuarioID = u.UsuarioID
	inner join [DWVLT_ALV_CFB].[dbo].[CALENDARIO] c
	on a.DataFim = c.DataCompleta

use DWVLT_ALV_CFB
go

CREATE VIEW VIEW_AVALIACAO AS 

SELECT
	u.UsuarioNome,
	f.FilmeNome,
	p.ProdutoraNome,
	g.GeneroNome,
	a.AvaliacaoNota,
	c.DataCompleta,
	c.Ano,
	c.DiaDoMes,
	c.DiaDaSemana,
	c.Trimestre,
	c.Hora,
	c.Minuto,
	c.Segundo

FROM 

	Avaliacao a INNER JOIN  CALENDARIO c
		ON a.CalendarioChave = c.CalendarioChave
	INNER JOIN Usuario u
		ON u.UsuarioChave = a.ClienteChave
	INNER JOIN Filme f 
		ON f.FilmeChave = a.FilmeChave
	INNER JOIN Genero g
		ON g.GeneroChave = a.GeneroChave
	INNER JOIN PRODUTORA p
		ON p.ProdutoraChave = a.ProdutoraChave
	;