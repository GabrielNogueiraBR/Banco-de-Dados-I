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


--1. LIKE: Selecionar o Nome e o UserName da tabela Player quando a senha (password) possuir 123 (em qualquer parte do texto).
SELECT NAME, USER_NAME
FROM PLAYER
WHERE PASSWORD LIKE '%123%'

--2. LIKE: Selecionar o Nome, Username e Password da tabela Player quando o Nome iniciar com “Anna”.
SELECT NAME, USER_NAME, PASSWORD
FROM PLAYER
WHERE NAME LIKE 'ANNA'

--3. LIKE + OR: Selecionar o Nome, Password da tabela Player quando o Nome terminar com “Silva” ou “Oliveira”.
SELECT NAME, PASSWORD
FROM PLAYER
WHERE NAME LIKE '%SILVA' OR NAME LIKE '%OLIVEIRA'

--4. LIKE + AND: Selecionar todas as informações da tabela GameServer quando o tipo (type) possuir a palavra “server” e o ano de cadastro seja maior ou igual 2019.
SELECT *
FROM GAME_SERVER
WHERE TYPE LIKE '%SERVER%' AND YEAR(CREATION_DATE) >= 2019

--5. LIKE: Selecionar o Nome e o UserName da tabela Player quando a senha (password) terminar com “mudar”
SELECT NAME, USER_NAME
FROM PLAYER
WHERE PASSWORD LIKE '%MUDAR'

--6. DISTINCT: Selecionar todos os Types distintos da tabela GameServer
SELECT  DISTINCT TYPE
FROM GAME_SERVER