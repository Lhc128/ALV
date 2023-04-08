CREATE TABLE Usuario
(
  UsuarioID INT NOT NULL,
  UsuarioChave INT NOT NULL,
  UsuarioNome INT NOT NULL,
  Logradouro INT NOT NULL,
  Bairro INT NOT NULL,
  Municipio INT NOT NULL,
  Estado INT NOT NULL,
  PRIMARY KEY (UsuarioChave)
);

CREATE TABLE Filme
(
  FilmeID INT NOT NULL,
  FilmeChave INT NOT NULL,
  FilmeNome INT NOT NULL,
  Duracao INT NOT NULL,
  ValorRoyalty INT NOT NULL,
  AnoDeLancamento INT NOT NULL,
  PRIMARY KEY (FilmeChave)
);

CREATE TABLE Genero
(
  GeneroID INT NOT NULL,
  GeneroChave INT NOT NULL,
  GeneroNome INT NOT NULL,
  PRIMARY KEY (GeneroChave)
);

CREATE TABLE Calendario
(
  CalendarioChave INT NOT NULL,
  DataCompleta INT NOT NULL,
  DiaDaSemana INT NOT NULL,
  DiaDoMes INT NOT NULL,
  Mes INT NOT NULL,
  Trimestre INT NOT NULL,
  Ano INT NOT NULL,
  PRIMARY KEY (CalendarioChave)
);

CREATE TABLE Produtora
(
  ProdutoraChave INT NOT NULL,
  ProdutoraID INT NOT NULL,
  ProdutoraNome INT NOT NULL,
  PRIMARY KEY (ProdutoraChave)
);

CREATE TABLE Avaliacao
(
  AvaliacaoID INT NOT NULL,
  AvaliacaoNota INT NOT NULL,
  AvaliacaoHora INT NOT NULL,
  CalendárioChave INT NOT NULL,
  ClienteChave INT NOT NULL,
  FilmeChave INT NOT NULL,
  GêneroChave INT NOT NULL,
  ProdutoraChave INT NOT NULL,
  PRIMARY KEY (AvaliacaoID),
  FOREIGN KEY (CalendárioChave) REFERENCES Calendario(CalendarioChave),
  FOREIGN KEY (ClienteChave) REFERENCES Usuario(UsuarioChave),
  FOREIGN KEY (FilmeChave) REFERENCES Filme(FilmeChave),
  FOREIGN KEY (GêneroChave) REFERENCES Genero(GeneroChave),
  FOREIGN KEY (ProdutoraChave) REFERENCES Produtora(ProdutoraChave)
);