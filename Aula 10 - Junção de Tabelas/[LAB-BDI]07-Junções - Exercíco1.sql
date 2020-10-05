CREATE DATABASE BD2020_AULA10

USE BD2020_AULA10

CREATE TABLE GAME_SERVER(
	ID_GAME_SERVER INT NOT NULL IDENTITY,
	IP VARCHAR(30),
	TYPE VARCHAR(100),
	CREATION_DATE DATETIME,
	
	CONSTRAINT PK_IDGameServer PRIMARY KEY (ID_GAME_SERVER)

	)

CREATE TABLE PLAYER(
	ID_PLAYER INT NOT NULL IDENTITY,
	NAME VARCHAR(200),
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

--1. Criar uma consulta para exibir o Name e o UserName do Player e os seus respectivos Type do GameServer utilizado por eles. (INNER)
SELECT 
	P.NAME, P.USER_NAME, G.TYPE
FROM 
	GAME_SERVER G INNER JOIN PLAYER P
		ON G.ID_GAME_SERVER = P.ID_GAME_SERVER

--2. Criar uma consulta para exibir o UserName e o Password do Player e o respectivo IP e CreationDate do GameServer utilizado por eles. (INNER)
SELECT 
	P.USER_NAME, P.PASSWORD, G.IP, G.CREATION_DATE
FROM
	PLAYER P INNER JOIN GAME_SERVER G
		ON P.ID_GAME_SERVER = G.ID_GAME_SERVER


--3. Criar uma consulta para exibir o IP de todos os GameSever e os Name dos respectivos Players quando existir associação. (LEFT)
SELECT
	G.IP, P.NAME
FROM
	GAME_SERVER G LEFT JOIN PLAYER P
		ON G.ID_GAME_SERVER = P.ID_GAME_SERVER

--4. Criar uma consulta para exibir o IP e CreationDate do GameServer e o Name do Player quando o seu Name possuir “Ana” em qualquer parte do texto. (INNER)
SELECT
	G.IP, G.CREATION_DATE, P.NAME
FROM 
	GAME_SERVER G INNER JOIN PLAYER P
		ON G.ID_GAME_SERVER = P.ID_GAME_SERVER
WHERE P.NAME LIKE ('%Ana%')

--5. Criar uma consulta para exibir o UserName e o Age do Player e o Creation Date do GameServer quando o Password do Player possuir 4 (inclusive) ou menos letras. (INNER)
SELECT
	P.USER_NAME, P.AGE, G.CREATION_DATE
FROM
	PLAYER P INNER JOIN GAME_SERVER G
		ON P.ID_GAME_SERVER = G.ID_GAME_SERVER
WHERE LEN(P.PASSWORD) <= 4


--6. Criar uma consulta para exibir o IP do GameServer e a quantidade de Players associados a cada GameServer (LEFT)
SELECT
	G.IP, COUNT(P.ID_PLAYER) AS QTD_PLAYERS
FROM
	GAME_SERVER G LEFT JOIN PLAYER P
		ON G.ID_GAME_SERVER = P.ID_GAME_SERVER
GROUP BY
	G.IP


--7. Criar uma consulta para exibir o Type do GameServer e a média de idade (Age) dos Players associados a eles (LEFT)
SELECT
	G.TYPE, AVG(P.AGE) AS MEDIA_IDADE
FROM
	GAME_SERVER G LEFT JOIN PLAYER P
		ON G.ID_GAME_SERVER = P.ID_GAME_SERVER
GROUP BY G.TYPE
