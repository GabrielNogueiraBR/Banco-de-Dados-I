CREATE DATABASE BD2020_AULA12

USE BD2020_AULA12
--DROP DATABASE BD2020_AULA12

CREATE TABLE MARCA(
	ID_MARCA INT NOT NULL IDENTITY PRIMARY KEY,
	NOME VARCHAR(200) NOT NULL,
	DESCRICAO VARCHAR(250),
	DATA_FUNDACAO DATE NOT NULL
	)

CREATE TABLE PROPRIETARIO(
	ID_PROPRIETARIO INT NOT NULL IDENTITY PRIMARY KEY,
	NOME VARCHAR(200) NOT NULL,
	ENDERECO VARCHAR(250) NOT NULL,
	BAIRRO VARCHAR(250),
	CIDADE VARCHAR(200) NOT NULL,
	DATA_NASCIMENTO DATETIME NOT NULL,
	RENDA_MENSAL DECIMAL(18,2) NOT NULL
	)

CREATE TABLE VEICULO(
	ID_VEICULO INT IDENTITY NOT NULL,
	PLACA VARCHAR(20) NOT NULL,
	ANO_FABRICACAO DATE NOT NULL,
	ID_MARCA INT NOT NULL,
	ID_PROPRIETARIO INT NOT NULL,
	VALOR DECIMAL(18,2) NOT NULL,
	DATA_COMPRA DATETIME NOT NULL,

	CONSTRAINT PK_ID_VEICULO PRIMARY KEY (ID_VEICULO),
	CONSTRAINT FK_ID_MARCA FOREIGN KEY (ID_MARCA) REFERENCES MARCA (ID_MARCA),
	CONSTRAINT FK_ID_PROPRIETARIO FOREIGN KEY (ID_PROPRIETARIO) REFERENCES PROPRIETARIO (ID_PROPRIETARIO)
	)

SET DATEFORMAT YMD

--SELECT * FROM Marca
INSERT INTO MARCA VALUES
	('Audi', null, '1932-06-29'),
	('BMW', null, '1916-03-07'),
	('Chevrolet', null, '1911-11-03'),
	('Ford', null, '1903-06-16'),
	('Hyundai', null, '1967-12-29'),
	('Chery', null, '1997-03-18')

--SELECT * FROM Proprietario
INSERT INTO PROPRIETARIO VALUES
	('Vitor Hugo Oliveira', 'Rua das Papoulas, 765', NULL, 'Brasília', '1999-06-25', 12000),
	('Levi Gael Benício Freitas', 'Rua Pitombeira, 312', 'Três Andares', 'Teresina', '1971-09-09', 5000),
	('Allana Stella Jennifer Carvalho', 'Quadra SHCES Quadra 305 Bloco H, 849', 'Cruzeiro Novo', 'Brasília', '1968-02-26', 7000),
	('Evelyn Aparecida Pereira', 'Rua Um Mil e Sete, 198', 'Planalto Formosa', 'Timon', '1969-03-03', 9000),
	('Rosa Olivia Vieira', 'Quadra 6 MR 11', 'Setor Oeste', 'Planaltina', '1963-06-22', 10000),
	('Luana Emilly Gomes', 'Área Especial QSE Área Especial 3', 'Taguatinga Sul', 'Brasília', '1960-07-12', 12000),
	('Kevin Enzo Ferreira', 'Rua Jabora, 217', 'Novo Aleixo', 'Manaus', '1985-06-04', 15000),
	('Henry Anderson Thales Dias', 'Travessa Chagas Ferreira, 819', 'Dois Unidos', 'Recife', '1995-08-21', 2000),
	('Bryan Ryan Moura', 'Rua José Leandro Ramos, 643', NULL, 'Cariacica', '1994-06-25', 3000)


--SELECT * FROM Veiculo
INSERT INTO VEICULO VALUES
	('RTT 1A89', '01-01-2015', 1, 3, 25000, '2017-02-02'),
	('EPB 1A80', '01-01-2015', 4, 3, 25000, '2018-02-02'),
	('FLL 8E15', '01-01-2016', 1, 5, 35000, '2019-03-03'),
	('XPT OE30', '01-01-2017', 3, 1, 45000, '2017-04-05'),
	('ABC 3E13', '01-01-2010', 2, 4, 15000, '2012-09-05'),
	('MMA 9B17', '01-01-2019', 5, 2, 50000, '2020-10-15')

--1. Criar uma consulta para exibir Placa e Ano de Fabricação do Veículo, o Nome da Marca e o o Nome, Cidade e Renda Mensal do Proprietário.
SELECT
	V.PLACA, V.ANO_FABRICACAO, M.NOME AS NOME_MARCA, P.NOME AS NOME_PROPRIETARIO, P.CIDADE AS CIDADE_PROPRIETARIO, P.RENDA_MENSAL AS RENDA_PROPRIETARIO
FROM
	VEICULO V INNER JOIN PROPRIETARIO P
		ON V.ID_PROPRIETARIO = P.ID_PROPRIETARIO
	INNER JOIN MARCA M
		ON V.ID_MARCA = M.ID_MARCA

--2. Criar uma consulta para exibir o Nome do Proprietário e a quantidade de veículos que possui.
SELECT
	P.NOME AS NOME_PROPRIETARIO, COUNT(*) AS QUANTIDADE_VEICULOS
FROM
	VEICULO V INNER JOIN PROPRIETARIO P
		ON V.ID_PROPRIETARIO = P.ID_PROPRIETARIO
GROUP BY P.NOME

--3. Criar uma consulta para exibir o Nome de TODAS as marcas e a quantidade de veículo de cada uma delas.


--4. Criar uma consulta para exibir o Nome do Proprietário, o Nome da Marca e a quantidade a respectiva quantidade de veículos que possui.


--5. Criar uma consulta para exibir o Nome do Proprietário e o valor total gasto (soma) com os veículos que possui.


