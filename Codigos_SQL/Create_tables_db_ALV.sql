CREATE TABLE Plano
(
  PlanoID INT NOT NULL,
  PrecoMensal money NOT NULL,
  PlanoNome VARCHAR(100) NOT NULL,
  PRIMARY KEY (PlanoID)
);

CREATE TABLE Usuario
(
  UsuarioID INT NOT NULL,
  UsuarioNome VARCHAR(100) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Telefone VARCHAR(20) NOT NULL,
  Senha VARCHAR(255) NOT NULL,
  NumeroDoCartao VARCHAR(16) NOT NULL,
  NomeDoProprietario VARCHAR(100) NOT NULL,
  DataVencimento DATE NOT NULL,
  CodigoDeSeguranca VARCHAR(4) NOT NULL,
  Bairro VARCHAR(100) NOT NULL,
  Municipio VARCHAR(100) NOT NULL,
  Estado VARCHAR(2) NOT NULL,
  Logradouro VARCHAR(255) NOT NULL,
  PRIMARY KEY (UsuarioID)
);

CREATE TABLE Filme
(
  FilmeID INT NOT NULL,
  FilmeNome VARCHAR(255) NOT NULL,
  Duracao INT NOT NULL,
  AnoDeLancamento INT NOT NULL,
  ValorRoyalty money NOT NULL,
  PRIMARY KEY (FilmeID)
);

CREATE TABLE Avaliacao
(
  Comentario TEXT,
  Nota INT,
  AvaliacaoData DATE NOT NULL,
  AvaliacaoID INT NOT NULL,
  UsuarioID INT NOT NULL,
  FilmeID INT NOT NULL,
  PRIMARY KEY (AvaliacaoID),
  FOREIGN KEY (UsuarioID) REFERENCES Usuario(UsuarioID),
  FOREIGN KEY (FilmeID) REFERENCES Filme(FilmeID)
);

CREATE TABLE Genero
(
  GeneroID INT NOT NULL,
  GeneroNome VARCHAR(100) NOT NULL,
  PRIMARY KEY (GeneroID)
);

CREATE TABLE Diretor
(
  DiretorID INT NOT NULL,
  NomeProprio VARCHAR(100) NOT NULL,
  Sobrenome VARCHAR(100) NOT NULL,
  PRIMARY KEY (DiretorID)
);

CREATE TABLE Ator
(
  AtorID INT NOT NULL,
  NomeProprio VARCHAR(100) NOT NULL,
  Sobrenome VARCHAR(100) NOT NULL,
  PRIMARY KEY (AtorID)
);

CREATE TABLE Produtora
(
  ProdutoraID INT NOT NULL,
  ProdutoraNome VARCHAR(255) NOT NULL,
  PRIMARY KEY (ProdutoraID)
);

CREATE TABLE Cargo
(
  CargoID INT NOT NULL,
  CargoNome VARCHAR(100) NOT NULL,
  PRIMARY KEY (CargoID)
);

CREATE TABLE Assiste
(
  Data DATE NOT NULL,
  UsuarioID INT NOT NULL,
  FilmeID INT NOT NULL,
  PRIMARY KEY (UsuarioID, FilmeID, Data),
  FOREIGN KEY (UsuarioID) REFERENCES Usuario(UsuarioID),
  FOREIGN KEY (FilmeID) REFERENCES Filme(FilmeID)
);

CREATE TABLE Possui
(
  GeneroNome INT NOT NULL,
  FilmeID INT NOT NULL,
  PRIMARY KEY (GeneroNome, FilmeID),
  FOREIGN KEY (GeneroNome) REFERENCES Genero(GeneroID),
  FOREIGN KEY (FilmeID) REFERENCES Filme(FilmeID)
);

CREATE TABLE Atua
(
  FilmeID INT NOT NULL,
  AtorID INT NOT NULL,
  PRIMARY KEY (FilmeID, AtorID),
  FOREIGN KEY (FilmeID) REFERENCES Filme(FilmeID),
  FOREIGN KEY (AtorID) REFERENCES Ator(AtorID)
);

CREATE TABLE Dirige
(
  FilmeID INT NOT NULL,
  DiretorID INT NOT NULL,
  PRIMARY KEY (FilmeID, DiretorID),
  FOREIGN KEY (FilmeID) REFERENCES Filme(FilmeID),
  FOREIGN KEY (DiretorID) REFERENCES Diretor(DiretorID)
);

CREATE TABLE Produz
(
  FilmeID INT NOT NULL,
  ProdutoraID INT NOT NULL,
  PRIMARY KEY (FilmeID, ProdutoraID),
  FOREIGN KEY (FilmeID) REFERENCES Filme(FilmeID),
  FOREIGN KEY (ProdutoraID) REFERENCES Produtora(ProdutoraID)
);

CREATE TABLE Assinatura
(
  AssinaturaID INT NOT NULL,
  DataInicio DATE NOT NULL,
  DataFim DATE NOT NULL,
  Status VARCHAR(20) NOT NULL,
  UsuarioID INT NOT NULL,
  PlanoID INT NOT NULL,
  PRIMARY KEY (AssinaturaID),
  FOREIGN KEY (UsuarioID) REFERENCES Usuario(UsuarioID),
  FOREIGN KEY (PlanoID) REFERENCES Plano(PlanoID)
);

CREATE TABLE Funcionario
(
  FuncionarioID INT NOT NULL,
  FuncionarioNome VARCHAR(100) NOT NULL,
  Salario money NOT NULL,
  NomeCargo INT NOT NULL,
  PRIMARY KEY (FuncionarioID),
  FOREIGN KEY (NomeCargo) REFERENCES Cargo(CargoID)
);

CREATE TABLE Modera
(
  FuncionarioID INT NOT NULL,
  AvaliacaoID INT NOT NULL,
  PRIMARY KEY (FuncionarioID, AvaliacaoID),
  FOREIGN KEY (FuncionarioID) REFERENCES Funcionario(FuncionarioID),
  FOREIGN KEY (AvaliacaoID) REFERENCES Avaliacao(AvaliacaoID)
);

CREATE TABLE GerenciaConteudo
(
  FilmeID INT NOT NULL,
  FuncionarioID INT NOT NULL,
  PRIMARY KEY (FilmeID, FuncionarioID),
  FOREIGN KEY (FilmeID) REFERENCES Filme(FilmeID),
  FOREIGN KEY (FuncionarioID) REFERENCES Funcionario(FuncionarioID)
);