USE BD2020_S2

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
	('192.168.0.5','Servidor 03',GETDATE())

-- INSERINDO DADOS NA TABELA Player
INSERT INTO PLAYER
VALUES
	('Player 01','username01','321',500,1,18),
	('Player 02','username02','245',1500,2,18),
	('Player 03','username03','567',200,3,18),
	('Player 04','username04','245',340,4,30),
	('Player 05','username05','764',550,5,18),
	('Player 06','username06','123',650,5,20)


DROP TABLE PLAYER


--1. Selecionar todas as informações da tabela Player
SELECT * FROM PLAYER

--2. Selecionar todas as informações da tabela GameServer
SELECT * FROM GAME_SERVER

--3. Selecionar o Nome, UserName e Password da tabela Player
SELECT NAME, USER_NAME, PASSWORD FROM PLAYER

--4. Selecionar o IP e o Type da tabela GameServer
SELECT IP,TYPE FROM GAME_SERVER

--5. BETWEEN: Selecionar o IP, Type e CreationDate da tabela GameServer quando o ano de criação (CreationDate) estiver entre 2005 e 2018.
SELECT IP, TYPE, CREATION_DATE FROM GAME_SERVER
WHERE YEAR(CREATION_DATE) BETWEEN 2005 AND 2018

--6. IN: Selecionar o UserName, Password e Age da tabela Player quando a idade (age) for 15, 20,25 ou 30 anos.
SELECT USER_NAME, PASSWORD, AGE FROM PLAYER
WHERE AGE IN (15,20,25,30)


--7. AND: Selecionar o Name e o Password da tabela Player quando a idade (age) for 38 anos e o número de pontos (points) for maior ou igual a 650.
SELECT NAME, PASSWORD FROM PLAYER
WHERE AGE = 38 AND POINTS >= 650


--8. =: Selecionar o Nome e o UserName da tabela Player quando a senha (password) for 123
SELECT NAME, USER_NAME FROM PLAYER
WHERE PASSWORD = '123'


--9. <=: Selecionar o nome, username e Password da tabela player o ID for menor ou igual (<=) a 4.
SELECT NAME, USER_NAME, PASSWORD FROM PLAYER
WHERE ID_PLAYER <= 4


--10. AND: Selecionar todas as informações da tabela GameServer quando os pontos (points) possuírem valor (is not null) e o ano de cadastro (CreationDate) seja maior ou 2015.
SELECT GAME_SERVER.ID_GAME_SERVER , GAME_SERVER.IP, GAME_SERVER.TYPE, GAME_SERVER.CREATION_DATE
FROM GAME_SERVER, PLAYER
WHERE PLAYER.ID_GAME_SERVER = GAME_SERVER.ID_GAME_SERVER AND PLAYER.POINTS IS NOT NULL AND YEAR(CREATION_DATE) >= 2015


--11. LEN: Selecionar o Nome e o UserName da tabela Player a quantidade de caracteres do campo Password for menor que 8 (oito)
SELECT NAME, USER_NAME
FROM PLAYER
WHERE LEN(PASSWORD) < 8
