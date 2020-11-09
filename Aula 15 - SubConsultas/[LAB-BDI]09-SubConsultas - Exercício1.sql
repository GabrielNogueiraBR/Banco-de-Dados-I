CREATE DATABASE BD2020_AULA15;

USE BD2020_AULA15

CREATE TABLE GAME_SERVER(
	ID_GAME_SERVER INT NOT NULL IDENTITY,
	IP VARCHAR(30),
	TYPE VARCHAR(100),
	CREATION_DATE DATETIME,
	
	CONSTRAINT PK_IDGameServer PRIMARY KEY (ID_GAME_SERVER)

	)

CREATE TABLE PLAYER(
	ID_PLAYER INT NOT NULL IDENTITY,
	NOME VARCHAR(200),
	USER_NAME VARCHAR(200),
	PASSWORD VARCHAR(200),
	POINTS INT,
	ID_GAME_SERVER INT,
	AGE INT,

	CONSTRAINT PK_ID_PLAYER PRIMARY KEY (ID_PLAYER),
	CONSTRAINT FK_ID_GAME_SERVER FOREIGN KEY (ID_GAME_SERVER) REFERENCES GAME_SERVER (ID_GAME_SERVER)

)

-- FORMATANDO O TIPO DE DATA
SET DATEFORMAT DMY

-- INSERINDO DADOS NA TABELA GameServer
INSERT INTO GAME_SERVER
VALUES	
	('192.168.0.1','Peer-to-Peer','01-01-2020'),
	('192.168.0.2','Servidor 01','02-02-2020'),
	('192.168.0.3','Servidor 02','03-03-2020'),
	('192.168.0.4','Peer-to-Peer','04-04-2010'),
	('192.168.0.5','Servidor 03',GETDATE()),
	('192.168.0.6','Servidor 04', GETDATE())

-- INSERINDO DADOS NA TABELA Player
INSERT INTO PLAYER
VALUES
	('Player 01','username01','321',500,1,18),
	('Player 02','username02','245',1500,2,18),
	('Player 03','username03','567',200,3,18),
	('Player 04','username04','245',340,4,30),
	('Player 05','username05','764',550,5,18),
	('Player 06','username06','123',650,5,20),
	('Player 07','username07','765',489,NULL,15),
	('Player Ana', 'anaplays','445',467,2,18),
	('Hulk Jedi', 'hjedi','821',1680,3,25),
	('Ace Monster', 'acemonster', '326', 869, 4, 20),
	('Procurando Nemo', 'nemo', '359', 145, 5, 12)


--1. Criar uma SubConsulta para exibir o Nome e UserName dos players que estão acima da média de idade.
SELECT
	P.NOME, P.USER_NAME
FROM
	PLAYER P
WHERE P.AGE > (SELECT 
					AVG(P.AGE)
				FROM
					PLAYER P)


--2. Criar uma SubConsulta para exibir o Nome e Password dos players que estão abaixo da média de idade.
SELECT
	P.NOME, P.PASSWORD
FROM 
	PLAYER P
WHERE P.AGE < (SELECT AVG(P.AGE) FROM PLAYER P)

--3. Criar uma SubConsulta para exibir o IP, Type e CreationDate que são utilizados pelos players.
SELECT
	G.IP, G.TYPE, G.CREATION_DATE
FROM
	GAME_SERVER G
WHERE G.ID_GAME_SERVER IN (SELECT	P.ID_GAME_SERVER FROM PLAYER P WHERE P.ID_GAME_SERVER IS NOT NULL)


--4. Criar uma SubConsulta para exibir o IP, Type e CreationDate que NÃO são utilizados pelos players.
SELECT
	G.IP, G.TYPE, G.CREATION_DATE
FROM
	GAME_SERVER G
WHERE G.ID_GAME_SERVER NOT IN(SELECT
									P.ID_GAME_SERVER
								FROM
									PLAYER P
								WHERE
									P.ID_GAME_SERVER IS NOT NULL
								)

--5. Criar uma SubConsulta para exibir todas as informações dos players que estão acima da pontuação (points) média.
SELECT 
	* 
FROM 
	PLAYER P
WHERE
	P.POINTS > (SELECT AVG(P.POINTS) FROM PLAYER P)

--6. Criar uma SubConsulta para exibir o Nome, UserName e Password dos players que possuem a idade maior que o “Hulk Jedi”.
SELECT
	P.NOME, P.USER_NAME, P.PASSWORD
FROM
	PLAYER P
WHERE P.AGE > (SELECT P.AGE FROM PLAYER P WHERE P.NOME = 'Hulk Jedi')



--7. Criar uma SubConsulta para exibir o Nome, UserName e Password e Poins dos players que utilizam os mesmos GameServers que o “Ace Monster” e o “Procurando Nemo”.
SELECT
	P.NOME, P.USER_NAME, P.PASSWORD
FROM
	PLAYER P
WHERE P.ID_GAME_SERVER IN (SELECT
								P.ID_GAME_SERVER
							FROM
								PLAYER P
							WHERE P.NOME IN ('Ace Monster', 'Procurando Nemo'))