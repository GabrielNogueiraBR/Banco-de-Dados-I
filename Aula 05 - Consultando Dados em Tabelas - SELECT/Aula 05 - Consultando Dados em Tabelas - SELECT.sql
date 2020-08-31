USE BD2020_S2

CREATE TABLE USUARIO(
	USUARIO_ID INT NOT NULL IDENTITY,
	NOME VARCHAR(200) NOT NULL,
	LOGIN_USUARIO VARCHAR(15) NOT NULL,
	ULTIMO_ACESSO DATETIME,

	CONSTRAINT PK_USUARIO_ID PRIMARY KEY (USUARIO_ID)
	
	)

CREATE TABLE ARTIGO(
ARTIGO_ID INT NOT NULL IDENTITY,
	TITULO VARCHAR(500) NOT NULL,
	TEXTO VARCHAR(MAX),
	USUARIO_ID INT NOT NULL,
	DATA_CADASTRO DATETIME,
	URL VARCHAR(150),

	CONSTRAINT PK_ARTIGO_ID PRIMARY KEY (ARTIGO_ID),
	CONSTRAINT FK_USUARIO_ID FOREIGN KEY (USUARIO_ID) REFERENCES USUARIO (USUARIO_ID)

	)

--FORMATANDO O FORMATO DE DATA
SET DATEFORMAT YMD

-- INSERINDO VALORES PARA A TABELA USUARIO
INSERT INTO Usuario(Nome, LOGIN_USUARIO)
VALUES
	('Ronaldo Fenômeno', 'r9'),
	('Roberto Carlos', 'rc6'),
	('Vera Fischer', 'vfis'),
	('Roberta Close', 'rclose'),
	('Neimar Junior', 'njr'),
	('Edson Arantes do Nascimento', 'pele')
INSERT INTO Usuario
VALUES
	('Paola Oliveira', 'paola', '2020-08-24'),
	('Bart Simpson', 'bsimpson', null)


-- INSERINDO VALORES PARA A TABELA ARTIGO
INSERT INTO Artigo(Titulo, Texto, USUARIO_ID, DATA_CADASTRO)
VALUES
	('Meus Joelhos', 'Historia sobre minhas...', 1, getdate()),
	('Força', 'Minha famosa perna esquerda...', 2, getdate()),
	('Pele', 'Olha o gol.. Olha o gol... ', 6, getdate()),
	('Neymar', 'De menino a homem.... ', 5, '2020-08-23')--1. Consultar todas as informações da tabela Usuário
SELECT * FROM USUARIO

--2. Consultar todas as informações da tabela Artigo
SELECT * FROM ARTIGO
--3. Consultar todas as informações da tabela Usuário e exibir apenas os campos obrigatórios
SELECT USUARIO_ID, NOME, LOGIN_USUARIO
FROM USUARIO

--4. Consultar todas as informações da tabela Artigo e exibir apenas os campos obrigatórios
SELECT ARTIGO_ID,TITULO, USUARIO_ID FROM ARTIGO

--5. Consultar os Usuários com ID entre 5 e 10
SELECT * FROM USUARIO
WHERE USUARIO_ID BETWEEN 5 AND 10

--6. Consultar os Artigos com IDs iguais a 1, 3, 5 e 7
SELECT * FROM ARTIGO
WHERE ARTIGO_ID IN (1,3,5,7)

--7. Consultar os Usuários que realizaram acesso no mês de agosto de 2020
SELECT * FROM USUARIO
WHERE MONTH(ULTIMO_ACESSO) IN (8) AND YEAR(ULTIMO_ACESSO) IN (2020)

--8. Consultar os Artigos que foram cadastrados em Agosto ou no ano de 2020
SELECT * FROM ARTIGO
WHERE MONTH(DATA_CADASTRO) IN (8) OR MONTH(DATA_CADASTRO) IN (2020)

--9. Consultar os Usuários e exibir o Nome e Login do Usuário onde o ID for maior ou iguais (>=) a 5.
SELECT NOME, LOGIN_USUARIO FROM USUARIO
WHERE USUARIO_ID >= 5

--10. Consultar os Artigos e exibir a URL, Título e Texto quando a URL possuir informação (is not null)
SELECT URL, TITULO, TEXTO FROM ARTIGO
WHERE URL IS NOT NULL
-- WHERE URL != NULL

