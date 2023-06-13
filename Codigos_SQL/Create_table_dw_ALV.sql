use DWVLT_ALV_CFB
go
CREATE TABLE USUARIO
(
  UsuarioChave uniqueidentifier NOT NULL,
  UsuarioID INT NOT NULL,
  UsuarioNome VARCHAR(100) NOT NULL,
  Logradouro VARCHAR(255) NOT NULL,
  Bairro VARCHAR(100) NOT NULL,
  Municipio VARCHAR(100) NOT NULL,
  Estado CHAR(2) NOT NULL,
  PRIMARY KEY (UsuarioChave)
);

CREATE TABLE FILME
(
  FilmeChave uniqueidentifier NOT NULL,
  FilmeID INT NOT NULL,
  FilmeNome VARCHAR(255) NOT NULL,
  PRIMARY KEY (FilmeChave)
);

CREATE TABLE GENERO
(
  GeneroChave uniqueidentifier NOT NULL,
  GeneroID INT NOT NULL,
  GeneroNome VARCHAR(100) NOT NULL,
  PRIMARY KEY (GeneroChave)
);

CREATE TABLE CALENDARIO
(
  CalendarioChave uniqueidentifier NOT NULL,
  DataCompleta DATETIME NOT NULL,
  DataOrigem VARCHAR(2) NOT NULL,
  DiaDaSemana VARCHAR(20) NOT NULL,
  DiaDoMes INT NOT NULL,
  Mes INT NOT NULL,
  Trimestre INT NOT NULL,
  Ano INT NOT NULL,
  Hora INT NOT NULL,
  Minuto INT NOT NULL,
  Segundo INT NOT NULL,
  PRIMARY KEY (CalendarioChave)
);

CREATE TABLE PRODUTORA
(
  ProdutoraChave uniqueidentifier NOT NULL,
  ProdutoraID INT NOT NULL,
  ProdutoraNome VARCHAR(255) NOT NULL,
  PRIMARY KEY (ProdutoraChave)
);

CREATE TABLE RECEITA
(
  AssinaturaID INT NOT NULL,
  ValorPago INT NOT NULL,
  CalendarioChave uniqueidentifier NOT NULL,
  UsuarioChave uniqueidentifier NOT NULL,
  FOREIGN KEY (CalendarioChave) REFERENCES CALENDARIO(CalendarioChave),
  FOREIGN KEY (UsuarioChave) REFERENCES USUARIO(UsuarioChave)
);

CREATE TABLE AVALIACAO
(
  AvaliacaoNota INT NOT NULL,
  CalendarioChave uniqueidentifier NOT NULL,
  ClienteChave uniqueidentifier NOT NULL,
  FilmeChave uniqueidentifier NOT NULL,
  GeneroChave uniqueidentifier NOT NULL,
  ProdutoraChave uniqueidentifier NOT NULL,
  PRIMARY KEY (CalendarioChave, FilmeChave),
  FOREIGN KEY (CalendarioChave) REFERENCES CALENDARIO(CalendarioChave),
  FOREIGN KEY (ClienteChave) REFERENCES USUARIO(UsuarioChave),
  FOREIGN KEY (FilmeChave) REFERENCES FILME(FilmeChave),
  FOREIGN KEY (GeneroChave) REFERENCES GENERO(GeneroChave),
  FOREIGN KEY (ProdutoraChave) REFERENCES PRODUTORA(ProdutoraChave)
);

CREATE TABLE CHURN
(
	CalendarioChave uniqueidentifier NOT NULL,
	UsuarioChave uniqueidentifier NOT NULL,
	FOREIGN KEY(CalendarioChave) REFERENCES Calendario(CalendarioChave),
	FOREIGN KEY(UsuarioChave) REFERENCES Usuario(UsuarioChave),
);
