--DDL

CREATE DATABASE RpgOnlineBD

USE RpgOnlineBD

CREATE TABLE Usuarios(
	UsuarioID INT PRIMARY KEY IDENTITY
	,Email VARCHAR(100) UNIQUE NOT NULL
	,Senha VARCHAR(255) NOT NULL
)

CREATE TABLE Classes(
	ClasseID INT PRIMARY KEY IDENTITY
	,Nome VARCHAR(50) UNIQUE NOT NULL
	,Descricao VARCHAR (255)
)

CREATE TABLE Personagens(
	PersonagemID INT PRIMARY KEY IDENTITY
	,NomePersonagem VARCHAR(15) UNIQUE NOT NULL
	,UsuaioID INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioID)
	,ClasseID INT FOREIGN KEY REFERENCES Classes(ClasseID)
)

CREATE TABLE Habilidades(
	HabilidadeID INT PRIMARY KEY IDENTITY
	,Nome VARCHAR(100) UNIQUE NOT NULL
)

CREATE TABLE ClasseHabilidade(
	ClasseID INT FOREIGN KEY REFERENCES Classes(ClasseID)
	,HabilidadeID INT FOREIGN KEY REFERENCES Habilidades(HabilidadeID)
)

ALTER TABLE Personagens 
ALTER COLUMN NomePersonagem VARCHAR(100)

INSERT INTO Usuarios VALUES ('lucas@lucas.com', '123456')
INSERT INTO Classes VALUES ('Barbaro','ele é realmente barbaro')
INSERT INTO Usuarios (Email, Senha) VALUES ('lucas@email.com', HASHBYTES('SHA2_512','654321'))
INSERT INTO Habilidades VALUES('Muquetada na costela'), ('Dedo molhado no ouvido'), ('Cuecao'), ('Pedala Robinho')
INSERT INTO Personagens (NomePersonagem, UsuaioID, ClasseID) VALUES ('Klebin', 1 , 2)
INSERT INTO ClasseHabilidade (ClasseID, HabilidadeID) VALUES (2,3), (2, 2), (2, 1)
INSERT INTO Personagens (NomePersonagem, UsuaioID, ClasseID) VALUES ('Klebin_Cabeca_de_Lampada', 2 , 2)

UPDATE Usuarios
SET Senha = '987654321'
WHERE UsuarioID = 1

SELECT * FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Personagens
SELECT * FROM Habilidades
SELECT * FROM ClasseHabilidade

SELECT * FROM Personagens
INNER JOIN Classes
ON Personagens.ClasseID = Classes.ClasseID

