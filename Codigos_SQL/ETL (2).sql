use DBVLT_ALV_CFB
go

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

INSERT INTO[DWVLT_ALV_CFB].[dbo].[RECEITA]
select
	c.CalendarioChave,
	u.UsuarioChave,
	a.AssinaturaID,
	p.PlanoMensal
from
	[DWVLT_ALV_CFB].[dbo].[CALENDARIO] c,
	[DWVLT_ALV_CFB].[dbo].[USUARIO] u,
	Assinatura a,
	Plano p

	