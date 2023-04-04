CREATE TABLE Filme
(
	ID_filme INT NOT NULL,
	Nome_filme VARCHAR NOT NULL,
	ano_lancamento INT,
	Produtora VARCHAR NOT NULL,
	Royaltie FLOAT NOT NULL,
	Duracao FLOAT NOT NULL,
	PRIMARY KEY (ID_filme)
);

CREATE TABLE Genero
(
	ID_genero INT NOT NULL,
	Nome_genero CHAR NOT NULL,
	PRIMARY KEY (ID_genero)
);

CREATE TABLE Ator
(
	ID_ator INT NOT NULL,
	Nome_ator CHAR NOT NULL,
	Sobrenome_ator CHAR NOT NULL,
	PRIMARY KEY (ID_ator)
);

CREATE TABLE Diretor
(
	ID_diretor INT NOT NULL,
	Nome_diretor CHAR NOT NULL,
	Sobrenome_diretor CHAR,
	PRIMARY KEY (ID_diretor)
);

CREATE TABLE Cobranca
(
	ID_cobranca INT NOT NULL,
	valor_cobranca FLOAT NOT NULL,
	data_pago DATE NOT NULL,
	data_pagar DATE NOT NULL,
	PRIMARY KEY (ID_cobranca)
);

CREATE TABLE Assinatura
(
	ID_plano INT NOT NULL,
	Nome_plano CHAR NOT NULL,
	Ativo CHAR,
	ID_cobranca INT NOT NULL,
	PRIMARY KEY (ID_plano),
	FOREIGN KEY (ID_cobranca) REFERENCES Cobranca(ID_cobranca)
);

CREATE TABLE Dirige
(
	ID_filme INT NOT NULL,
	ID_diretor INT NOT NULL,
	FOREIGN KEY (ID_filme) REFERENCES Filme(ID_filme),
	FOREIGN KEY (ID_diretor) REFERENCES Diretor(ID_diretor)
);

CREATE TABLE Possui
(
	ID_filme INT NOT NULL,
	ID_genero INT NOT NULL,
	FOREIGN KEY (ID_filme) REFERENCES Filme(ID_filme),
	FOREIGN KEY (ID_genero) REFERENCES Genero(ID_genero)
);

CREATE TABLE Atua_em
(
	ID_filme INT NOT NULL,
	ID_ator INT NOT NULL,
	FOREIGN KEY (ID_filme) REFERENCES Filme(ID_filme),
	FOREIGN KEY (ID_ator) REFERENCES Ator(ID_ator)
);

CREATE TABLE Usuario
(
	ID_usuario INT NOT NULL,
	Nome_usuario CHAR NOT NULL,
	Sobrenome_usuario CHAR,
	Cartao INT NOT NULL,
	Email_usuario VARCHAR NOT NULL,
	senha VARCHAR NOT NULL,
	ID_plano INT NOT NULL,
	PRIMARY KEY (ID_usuario),
	FOREIGN KEY (ID_plano) REFERENCES Assinatura(ID_plano)
);

CREATE TABLE Comenta
(
	ID_comentario INT NOT NULL,
	Comentario CHAR NOT NULL,
	Data_comentario DATE NOT NULL,
	ID_usuario INT NOT NULL,
	ID_filme INT NOT NULL,
	PRIMARY KEY (ID_comentario),
	FOREIGN KEY (ID_usuario) REFERENCES Usuario(ID_usuario),
	FOREIGN KEY (ID_filme) REFERENCES Filme(ID_filme)
);

CREATE TABLE Avalia
(
	ID_nota INT NOT NULL,
	Nota INT NOT NULL,
	ID_filme INT NOT NULL,
	ID_usuario INT NOT NULL,
	PRIMARY KEY (ID_nota),
	FOREIGN KEY (ID_filme) REFERENCES Filme(ID_filme),
	FOREIGN KEY (ID_usuario) REFERENCES Usuario(ID_usuario)
);
