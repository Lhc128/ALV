INSERT INTO Plano (PlanoID, PrecoMensal, PlanoNome) VALUES
(1, 29.90, 'Plano Básico'),
(2, 39.90, 'Plano Intermediário'),
(3, 49.90, 'Plano Premium'),
(4, 19.90, 'Plano Econômico'),
(5, 59.90, 'Plano Plus');

INSERT INTO Usuario (UsuarioID, UsuarioNome, Email, Telefone, Senha, NumeroDoCartao, NomeDoProprietario, DataVencimento, CodigoDeSeguranca, Bairro, Municipio, Estado, Logradouro) VALUES
(1, 'João Silva', 'joao.silva@gmail.com', '55999991234', '123456', '1234567890123456', 'João Silva', '2024-04-01', '123', 'Centro', 'São Paulo', 'SP', 'Rua A'),
(2, 'Maria Souza', 'maria.souza@hotmail.com', '55998887777', '654321', '2345678901234567', 'Maria Souza', '2023-12-01', '456', 'Jardim', 'Campinas', 'SP', 'Rua B'),
(3, 'Pedro Oliveira', 'pedro.oliveira@yahoo.com.br', '55899990000', '987654', '3456789012345678', 'Pedro Oliveira', '2022-06-01', '789', 'Ipanema', 'Rio de Janeiro', 'RJ', 'Rua C'),
(4, 'Mariana Santos', 'mariana.santos@outlook.com', '55977776666', '111222', '4567890123456789', 'Mariana Santos', '2025-05-01', '246', 'Boa Vista', 'Porto Alegre', 'RS', 'Rua D'),
(5, 'José Alves', 'jose.alves@gmail.com', '55788889999', '333444', '5678901234567890', 'José Alves', '2024-12-01', '135', 'Santo Antônio', 'Recife', 'PE', 'Rua E');

INSERT INTO Filme (FilmeID, FilmeNome, Duracao, AnoDeLancamento, ValorRoyalty) VALUES
(1, 'Matrix', 136, 1999, 50000.00),
(2, 'Coringa', 122, 2019, 80000.00),
(3, 'Interestelar', 169, 2014, 90000.00),
(4, 'De Volta para o Futuro', 116, 1985, 40000.00),
(5, 'Batman: O Cavaleiro das Trevas', 152, 2008, 75000.00);

INSERT INTO Avaliacao (AvaliacaoID, Comentario, Nota, AvaliacaoData, UsuarioID, FilmeID) VALUES
(1, 'Ótimo filme, recomendo!', 4, '2023-04-05 10:30:00', 2, 1),
(2, 'Gostei muito da atuação dos atores', 3, '2023-04-06 14:45:00', 4, 1),
(3, 'Péssimo roteiro, perda de tempo', 1, '2023-04-07 16:20:00', 5, 2),
(4, 'O filme é bom, mas poderia ter sido melhor', 3, '2023-04-08 08:10:00', 3, 2),
(5, 'Amei o filme, um dos melhores que já vi', 5, '2023-04-09 19:55:00', 1, 3);

INSERT INTO Genero (GeneroID, GeneroNome) VALUES
(1, 'Ação'),
(2, 'Aventura'),
(3, 'Comédia'),
(4, 'Drama'),
(5, 'Ficção científica');

INSERT INTO Diretor (DiretorID, NomeProprio, Sobrenome) VALUES
(1, 'Steven', 'Spielberg'),
(2, 'Quentin', 'Tarantino'),
(3, 'Martin', 'Scorsese'),
(4, 'Christopher', 'Nolan'),
(5, 'David', 'Fincher');

INSERT INTO Ator (AtorID, NomeProprio, Sobrenome) VALUES
(1, 'Tom', 'Cruise'),
(2, 'Meryl', 'Streep'),
(3, 'Leonardo', 'DiCaprio'),
(4, 'Scarlett', 'Johansson'),
(5, 'Denzel', 'Washington');

INSERT INTO Produtora (ProdutoraID, ProdutoraNome) VALUES
(1, 'Warner Bros.'),
(2, 'Universal Pictures'),
(3, '20th Century Fox'),
(4, 'Paramount Pictures'),
(5, 'Columbia Pictures');

INSERT INTO Diretor (DiretorID, NomeProprio, Sobrenome) VALUES
(1, 'Christopher', 'Nolan'),
(2, 'Quentin', 'Tarantino'),
(3, 'Martin', 'Scorsese'),
(4, 'Steven', 'Spielberg'),
(5, 'David', 'Fincher');

INSERT INTO Ator (AtorID, NomeProprio, Sobrenome) VALUES
(1, 'Leonardo', 'DiCaprio'),
(2, 'Tom', 'Hanks'),
(3, 'Brad', 'Pitt'),
(4, 'Meryl', 'Streep'),
(5, 'Emma', 'Stone');

INSERT INTO Produtora (ProdutoraID, ProdutoraNome) VALUES
(1, 'Warner Bros.'),
(2, 'Universal Pictures'),
(3, 'Paramount Pictures'),
(4, '20th Century Fox'),
(5, 'Sony Pictures');

INSERT INTO Cargo (CargoID, CargoNome) VALUES
(1, 'Gerente de Marketing'),
(2, 'Gerente de Conteúdo'),
(3, 'Analista de Dados'),
(4, 'Gerente de TI'),
(5, 'Analista de Sistemas');

INSERT INTO Assiste (Data, UsuarioID, FilmeID) VALUES
('2022-01-01 08:30:00', 1, 2),
('2022-02-15 18:45:00', 3, 1),
('2022-03-10 14:20:00', 2, 4),
('2022-04-22 21:00:00', 4, 3),
('2022-05-05 12:00:00', 5, 1);

INSERT INTO Possui (GeneroNome, FilmeID) VALUES
(1, 1),
(3, 2),
(2, 3),
(4, 4),
(1, 5);

INSERT INTO Atua (FilmeID, AtorID) VALUES
(1, 3),
(3, 1),
(2, 5),
(5, 4),
(4, 2);

INSERT INTO Dirige (FilmeID, DiretorID) VALUES
(1, 2),
(2, 1),
(3, 5),
(5, 3),
(4, 4);

INSERT INTO Produz (FilmeID, ProdutoraID) VALUES
(1, 2),
(2, 4),
(3, 5),
(4, 1),
(5, 3);

INSERT INTO Assinatura (AssinaturaID, DataInicio, DataFim, Status, UsuarioID, PlanoID) VALUES
(1, '2022-01-01 08:30:00', '2022-02-01 08:30:00', 'Intiva', 1, 1),
(2, '2022-02-10 12:15:00', '2022-03-10 12:15:00', 'Inativa', 2, 2),
(3, '2022-03-20 16:45:00', '2022-04-20 16:45:00', 'Inativa', 3, 3),
(4, '2023-04-02 20:00:00', '2023-05-02 20:00:00', 'Ativa', 4, 1),
(5, '2023-04-06 10:30:00', '2023-05-06 10:30:00', 'Ativa', 5, 2);

INSERT INTO Funcionario (FuncionarioID, FuncionarioNome, Salario, NomeCargo) VALUES
(1, 'João Silva', 5000.00, 2),
(2, 'Pedro Santos', 3500.00, 3),
(3, 'Maria Oliveira', 4500.00, 1),
(4, 'Ana Souza', 4000.00, 2),
(5, 'José Pereira', 6000.00, 1);

INSERT INTO Modera (FuncionarioID, AvaliacaoID)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO GerenciaConteudo (FilmeID, FuncionarioID)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);