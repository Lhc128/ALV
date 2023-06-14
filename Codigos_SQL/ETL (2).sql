use DBVLT_ALV_CFB
go

-- Inserir dados em Produtora
INSERT INTO [DWVLT_ALV_CFB].[dbo].[PRODUTORA]
select 
	p.ProdutoraID,
    p.ProdutoraNome
from
	Produtora p;

-- Inserir dados em Genero
INSERT INTO [DWVLT_ALV_CFB].[dbo].[GENERO]
select 
	g.GeneroID,
    g.GeneroNome
from
	Genero g

-- Inserir dados em Filme
INSERT INTO [DWVLT_ALV_CFB].[dbo].[FILME]
select 
	f.FilmeID,
    f.FilmeNome
from
	Filme f;

-- Inserir dados em Usuario
INSERT INTO [DWVLT_ALV_CFB].[dbo].[USUARIO]
select 
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
	a.AvaliacaoNota
from
		Avaliacao a 
	inner join [DWVLT_ALV_CFB].[dbo].[USUARIO] u
		on a.UsuarioID = u.UsuarioID
	inner join [DWVLT_ALV_CFB].[dbo].[FILME] f
		on f.FilmeID = a.FilmeID
	inner join Produz pr 
		on f.FilmeID = pr.FilmeID
	inner join Produtora p
		on pr.ProdutoraID = p.ProdutoraID 
	inner join [DWVLT_ALV_CFB].[dbo].[CALENDARIO] c 
		on a.AvaliacaoData = c.DataCompleta
	inner join Possui po
		on po.FilmeID = f.FilmeID
	inner join Genero g
		on g.GeneroNome = po.GeneroNome