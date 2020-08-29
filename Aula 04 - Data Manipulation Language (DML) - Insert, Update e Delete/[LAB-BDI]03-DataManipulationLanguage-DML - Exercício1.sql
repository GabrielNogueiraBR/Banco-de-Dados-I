USE BD2020_S2

CREATE TABLE GameServer(
	IDGameServer INT NOT NULL IDENTITY,
	IP VARCHAR(30),
	Type VARCHAR(100),
	CreationDate DATETIME,
	
	CONSTRAINT PK_IDGameServer PRIMARY KEY (IDGameServer)

	)

CREATE TABLE Player(
	IDPlayer INT NOT NULL IDENTITY,
	Name VARCHAR(200),
	UserName VARCHAR(200),
	Password VARCHAR(200),
	Points INT,
	IDGameServer INT,
	Age INT,

	CONSTRAINT PK_IDPlayer PRIMARY KEY (IDPlayer),
	CONSTRAINT FK_IDGameServer FOREIGN KEY (IDGameServer) REFERENCES GameServer (IDGameServer)

)

-- FORMATANDO O TIPO DE DATA
SET DATEFORMAT DMY

-- INSERINDO DADOS NA TABELA GameServer
INSERT INTO GameServer
VALUES	
	('192.168.0.1','Peer-to-Peer','01-01-2020'),
	('192.168.0.2','Servidor 01','02-02-2020'),
	('192.168.0.3','Servidor 02','03-03-2020'),
	('192.168.0.4','Peer-to-Peer','04-04-2010'),
	('192.168.0.5','Servidor 03',GETDATE())

-- INSERINDO DADOS NA TABELA Player

INSERT INTO Player
VALUES
	('Player 01','username01','321',500,1,18),
	('Player 02','username02','245',1500,2,18),
	('Player 03','username03','567',200,3,18),
	('Player 04','username04','245',340,4,18),
	('Player 05','username05','764',550,5,18)

-- Atualizar todos os GameServer com Type igual a ‘Peer-to-Peer’ para ‘P2P’
UPDATE GameServer SET
Type = 'P2P'
WHERE Type = 'Peer-to-Peer'

-- Dobrar o número de Points de todos os Players (atualizar)
UPDATE Player SET
Points *= 2

-- Atualizar o UserName do Player para conter as 5 (cinco) primeiras letras do Name.
UPDATE Player SET
UserName = LEFT(NAME,5)

-- Atualizar o Password de todos os Player para 123.
UPDATE Player SET 
PASSWORD = '123'

--Excluir todos os Player com Name igual a Cosme.
DELETE FROM Player
WHERE NAME = 'COSME'

--Excluir todos os GameServer com CreationDate dos anos de 2010 à 2013.
DELETE FROM GameServer
WHERE YEAR(CREATIONDATE) BETWEEN   2010  AND 2013

--Excluir todos os Player com points menor do que 750.
DELETE FROM Player
WHERE POINTS < 750

--Excluir todos os Player com Age maior que 50.
DELETE FROM Player
WHERE AGE > 50

-- COMANDOS AUXILIARES

SELECT * FROM GameServer
SELECT * FROM Player

DROP TABLE Player
DROP TABLE GameServer
