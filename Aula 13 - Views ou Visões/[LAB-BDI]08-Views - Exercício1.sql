CREATE DATABASE BD2020_AULA13
-- DROP DATABASE BD2020_AULA13
USE BD2020_AULA13


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
	('Player Ana', 'anaplays','445',467,2,18)


--1. Criar uma view para exibir o Nome, UserName e Password dos Players com idade (Age) maior ou igual a 30.
CREATE VIEW vwDetalhesPlayer
AS
	SELECT 
		NOME, USER_NAME, PASSWORD
	FROM
		PLAYER
	WHERE 
		AGE >= 30

--SELECT * FROM vwDetalhesPlayer

--2. Criar uma view para exibir o IP, Type e CreationDate dos GameServer.
CREATE VIEW vwDetalhesGameServer
AS
	SELECT
		IP, TYPE, CREATION_DATE
	FROM
		GAME_SERVER

--SELECT * FROM vwDetalhesGameServer

--3. Criar uma view para exibir o Nome e UserName do Player e o IP e Type do GameServer.
CREATE VIEW vwPlayerGameServer
AS
	SELECT
		P.NOME AS NOME_PLAYER,
		P.USER_NAME AS USERNAME_PLAYER,
		G.IP AS IP_GAME_SERVER,
		G.TYPE TYPE_GAME_SERVER
	FROM
		PLAYER P INNER JOIN GAME_SERVER G
			ON P.ID_GAME_SERVER = G.ID_GAME_SERVER

--SELECT * FROM vwPlayerGameServer


--4. Criar uma view para exibir a quantidade de Players por GameServer. Exibir o IP do GameServer e a quantidade de players.
CREATE VIEW vwPlayerPorGameServer
AS
	SELECT
		G.IP AS IP_GAME_SERVER,
		COUNT(P.ID_GAME_SERVER) AS QUANTIDADE_PLAYER
	FROM
		GAME_SERVER G LEFT JOIN PLAYER P
			ON G.ID_GAME_SERVER = P.ID_GAME_SERVER
	GROUP BY
		G.IP

--SELECT * FROM vwPlayerPorGameServer



--5. Criar uma view para exibir a quantidade de GameServer criados por ano (CreationDate).
CREATE VIEW vwGameServerPorAno
AS
	SELECT
		YEAR(G.CREATION_DATE) AS ANO,
		COUNT(*) AS QUANTIDADE_SERVERS_CRIADOS
	FROM
		GAME_SERVER G
	GROUP BY
		YEAR(G.CREATION_DATE)

--SELECT * FROM vwGameServerPorAno

--6. Criar uma view para exibir o Type do GameServer, a média e a soma de pontos dos players que estão associados ao Game Server
CREATE VIEW vwPontosPorGameServer
AS
	SELECT
		G.TYPE AS TYPE_SERVER,
		AVG(P.POINTS) AS MEDIA_PONTOS,
		SUM(P.POINTS) AS SOMA_PONTOS
	FROM
		GAME_SERVER G LEFT JOIN PLAYER P
			ON G.ID_GAME_SERVER = P.ID_GAME_SERVER
	GROUP BY
		G.TYPE

--SELECT * FROM vwPontosPorGameServer
