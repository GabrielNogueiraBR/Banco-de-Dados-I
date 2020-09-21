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


--1. COUNT: Exibir a quantidade de GameServer cadastrados
SELECT COUNT(*) AS GAME_SERVERS FROM GAME_SERVER

--2. SUM: Exibir a soma de todos os Points dos Players
SELECT SUM(POINTS) AS SOMA_POINTS FROM PLAYER

--3. AVG: Exibir a média dos Points dos Players
SELECT AVG(POINTS) AS MEDIA_POINTS FROM PLAYER

--4. MAX e MIN: Exibir o GameServer mais novo e mais velho
SELECT
	MAX(CREATION_DATE) AS NOVO,
	MIN(CREATION_DATE) AS VELHO
FROM GAME_SERVER

--5. SUM + WHERE: Exibir a soma da idade (Age) dos Players com mais de 100 pontos (points)
SELECT SUM(AGE)
FROM PLAYER
WHERE POINTS > 100

--6. COUNT + GROUP BY: Exibir a quantidade de GameServer agrupados por Tipo (Type)
SELECT 
	TYPE, 
	COUNT(TYPE) AS QUANTIDADE
FROM 
	GAME_SERVER
GROUP BY
	TYPE

--7. Exibir a média de pontos (points) agrupados por idade (age)
SELECT AGE, AVG(POINTS) AS MEDIA_POINTS
FROM PLAYER
GROUP BY AGE

--8. Exibir a quantidade de GameServer agrupados por Tipo (Type). Somente os GameServer com quantidade entre 1 e 3 devem ser exibidos.
SELECT TYPE, COUNT(*) AS QUANTIDADE
FROM GAME_SERVER
GROUP BY TYPE
HAVING COUNT(TYPE) BETWEEN 1 AND 3

--9. Exibir a média de pontos (points) agrupados por idade (age). Somente os players com média superior a 100 devem ser exibidos.
SELECT AGE, AVG(POINTS) AS MEDIA_POINTS
FROM PLAYER
GROUP BY AGE
HAVING AVG(POINTS) > 100

--10. Exibir a quantidade de Players agrupados por idade (age). Somente as idades com mais de 1 player devem ser exibidas.
SELECT AGE, COUNT(AGE) AS QUANTIDADE_PLAYERS
FROM PLAYER
GROUP BY AGE
HAVING COUNT(AGE) > 1