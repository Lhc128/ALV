CREATE TABLE USUARIO_Dimensao
(
  UsuarioID INT NOT NULL,
  UsuarioChave INT NOT NULL,
  UsuarioNome VARCHAR(100) NOT NULL,
  Logradouro VARCHAR(255) NOT NULL,
  Bairro VARCHAR(100) NOT NULL,
  Municipio VARCHAR(100) NOT NULL,
  Estado CHAR(2) NOT NULL,
  PRIMARY KEY (UsuarioChave)
);

CREATE TABLE FILME_Dimensao
(
  FilmeID INT NOT NULL,
  FilmeChave INT NOT NULL,
  FilmeNome VARCHAR(255) NOT NULL,
  Duracao INT NOT NULL,
  ValorRoyalty money NOT NULL,
  AnoDeLancamento INT NOT NULL,
  MediaAvaliacao DECIMAL(3,2),
  PRIMARY KEY (FilmeChave)
);

CREATE TABLE GENERO_Dimensao
(
  GeneroID INT NOT NULL,
  GeneroChave INT NOT NULL,
  GeneroNome VARCHAR(100) NOT NULL,
  PRIMARY KEY (GeneroChave)
);

CREATE TABLE CALENDARIO_Dimensao
(
  CalendarioChave INT NOT NULL,
  DataCompleta DATETIME NOT NULL,
  DiaDaSemana INT NOT NULL,
  DiaDoMes INT NOT NULL,
  Mes INT NOT NULL,
  Trimestre INT NOT NULL,
  Ano INT NOT NULL,
  PRIMARY KEY (CalendarioChave)
);

CREATE TABLE PRODUTORA_Dimensao
(
  ProdutoraChave INT NOT NULL,
  ProdutoraID INT NOT NULL,
  ProdutoraNome VARCHAR(255) NOT NULL,
  PRIMARY KEY (ProdutoraChave)
);

CREATE TABLE RECEITA
(
  AssinaturaID INT NOT NULL,
  ValorPago money NOT NULL,
  AssinaturaHora DATETIME NOT NULL,
  CalendarioChave INT NOT NULL,
  UsuarioChave INT NOT NULL,
  FilmeChave INT NOT NULL,
  PRIMARY KEY (AssinaturaID),
  FOREIGN KEY (CalendarioChave) REFERENCES CALENDARIO_Dimensao(CalendarioChave),
  FOREIGN KEY (UsuarioChave) REFERENCES USUARIO_Dimensao(UsuarioChave),
  FOREIGN KEY (FilmeChave) REFERENCES FILME_Dimensao(FilmeChave)
);

CREATE TABLE AVALIACAO
(
  AvaliacaoNota INT NOT NULL,
  AvaliacaoHora DATETIME NOT NULL,
  CalendarioChave INT NOT NULL,
  ClienteChave INT NOT NULL,
  FilmeChave INT NOT NULL,
  GeneroChave INT NOT NULL,
  ProdutoraChave INT NOT NULL,
  PRIMARY KEY (CalendarioChave, FilmeChave),
  FOREIGN KEY (CalendarioChave) REFERENCES CALENDARIO_Dimensao(CalendarioChave),
  FOREIGN KEY (ClienteChave) REFERENCES USUARIO_Dimensao(UsuarioChave),
  FOREIGN KEY (FilmeChave) REFERENCES FILME_Dimensao(FilmeChave),
  FOREIGN KEY (GeneroChave) REFERENCES GENERO_Dimensao(GeneroChave),
  FOREIGN KEY (ProdutoraChave) REFERENCES PRODUTORA_Dimensao(ProdutoraChave)
);
