-- apagar database caso já exista com esse nome
DROP DATABASE IF EXISTS DBDELEGACIA;

-- create database and use
CREATE DATABASE DBDELEGACIA;

USE DBDELEGACIA;

-- create tables
CREATE TABLE CRIME (
	IDCRIME INT NOT NULL,
	DESCRICAO VARCHAR(255),
	RUA VARCHAR(100),
	NUMERO INT,
	COMPLEMENTO VARCHAR(255),
	BAIRRO VARCHAR(100),
	CEP VARCHAR(8),
	CIDADE VARCHAR(100),
	ESTADO CHAR(2)
);

CREATE TABLE CRIMINOSO(
  RUA VARCHAR(100),
  NUMERO INT,
  COMPLEMENTO VARCHAR(255),
  BAIRRO VARCHAR(100),
  CEP CHAR(8),
  CIDADE VARCHAR(100),
  ESTADO CHAR(2),
  DTNASCIMENTO DATE,
  TELEFONE VARCHAR(15)
);

CREATE TABLE OCORRENCIA (
	IDOCORRENCIA INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	DT_OCORRENCIA DATE
);

CREATE TABLE ITEM_OCORRENCIA (
	IDITEM INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	IDOCORRENCIA INT NOT NULL,
	DESCRICAO VARCHAR (100),
	CONSTRAINT FK_ITEM_OCORRENCIA_OCORRENCIA FOREIGN KEY (IDOCORRENCIA) REFERENCES OCORRENCIA(IDOCORRENCIA)
);

CREATE TABLE VITIMA (
  RUA VARCHAR(100),
  NUMERO INT,
  COMPLEMENTO VARCHAR(255),
  BAIRRO VARCHAR(100),
  CEP VARCHAR(8),
  CIDADE VARCHAR(100),
  ESTADO CHAR(2),
  DTNASCIMENTO DATE
);

CREATE TABLE COMETE(
	IDCRIME INT NOT NULL,
	IDCRIMINOSO INT NOT NULL
);

CREATE TABLE ATACA (
	OBSERVACAO CHAR(1)
);

CREATE TABLE SOFRE (
	IDCRIME INT NOT NULL,
	IDVITIMA INT NOT NULL
);

CREATE TABLE ARMA (
	IDARMA INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	MARCA VARCHAR(110)
);

CREATE TABLE USADA (
	IDARMA INT NOT NULL,
	IDCRIME INT NOT NULL
);

-- drop database caso já exista com esse nome (parte 2 da tarefa)

DROP DATABASE IF EXISTS DBALUNO;

-- create database and use
CREATE DATABASE DBALUNO;
USE DBALUNO;

-- create tables
CREATE TABLE ALUNO (
	IDALUNO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(20) NOT NULL,
	SEXO ENUM ('M', 'F'),
	IDADE int,
	CIDADE VARCHAR(20)
);

-- use database
USE dbdelegacia;

-- alter tables

-- CRIMINOSO

ALTER TABLE CRIMINOSO DROP COLUMN RUA;
ALTER TABLE CRIMINOSO DROP COLUMN NUMERO;
ALTER TABLE CRIMINOSO DROP COLUMN BAIRRO;
ALTER TABLE CRIMINOSO DROP COLUMN COMPLEMENTO;
ALTER TABLE CRIMINOSO DROP COLUMN CEP;
ALTER TABLE CRIMINOSO DROP COLUMN CIDADE;
ALTER TABLE CRIMINOSO DROP COLUMN ESTADO;
ALTER TABLE CRIMINOSO ADD COLUMN IDCRIMINOSO INT NOT NULL AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE CRIMINOSO ADD COLUMN NOME VARCHAR(45);
ALTER TABLE CRIMINOSO DROP COLUMN TELEFONE;

-- VITIMA

ALTER TABLE VITIMA DROP COLUMN RUA;
ALTER TABLE VITIMA DROP COLUMN NUMERO;
ALTER TABLE VITIMA DROP COLUMN BAIRRO;
ALTER TABLE VITIMA DROP COLUMN COMPLEMENTO;
ALTER TABLE VITIMA DROP COLUMN CEP;
ALTER TABLE VITIMA DROP COLUMN CIDADE;
ALTER TABLE VITIMA DROP COLUMN ESTADO;
ALTER TABLE VITIMA ADD COLUMN IDVITIMA INT NOT NULL AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE VITIMA ADD COLUMN NOME VARCHAR(45);

-- CRIME

ALTER TABLE CRIME DROP COLUMN RUA;
ALTER TABLE CRIME DROP COLUMN NUMERO;
ALTER TABLE CRIME DROP COLUMN COMPLEMENTO;
ALTER TABLE CRIME DROP COLUMN BAIRRO;
ALTER TABLE CRIME DROP COLUMN CEP;
ALTER TABLE CRIME DROP COLUMN CIDADE;
ALTER TABLE CRIME DROP COLUMN ESTADO;
ALTER TABLE CRIME DROP COLUMN IDCRIME;

ALTER TABLE CRIME ADD COLUMN DTCRIME DATETIME;
ALTER TABLE CRIME ADD COLUMN IDCRIME INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE CRIME DROP COLUMN DESCRICAO;
-- APAGUEI DESCRICAO POIS PEDIA VARCHAR(200) E TINHA (255)
ALTER TABLE CRIME ADD COLUMN DESCRICAO VARCHAR(200);

-- ARMA 

ALTER TABLE ARMA DROP COLUMN MARCA;

ALTER TABLE ARMA ADD COLUMN DESCRICAO VARCHAR(45);
ALTER TABLE ARMA ADD COLUMN IDENTIFICACAO VARCHAR(15);
 ALTER TABLE ARMA ADD COLUMN TIPO ENUM("tipo1", "tipo2", "tipo3", "tipo4");

-- USAR
-- drop e create table ++ alter tables
DROP TABLE USADA;
CREATE TABLE USAR(
	IDARMA INT NOT NULL UNIQUE,
	IDCRIME INT NOT NULL UNIQUE,
    PRIMARY KEY (IDCRIME, IDARMA)
);

ALTER TABLE USAR ADD FOREIGN KEY (IDCRIME) REFERENCES CRIME(IDCRIME);
ALTER TABLE USAR ADD FOREIGN KEY (IDARMA) REFERENCES ARMA(IDARMA);



-- SOFRE

DROP TABLE SOFRE;
CREATE TABLE SOFRE(
	IDCRIME INT NOT NULL,
	IDVITIMA INT NOT NULL,
    PRIMARY KEY (IDCRIME, IDVITIMA),
    FOREIGN KEY (IDCRIME) REFERENCES CRIME (IDCRIME),
    FOREIGN KEY (IDVITIMA) REFERENCES VITIMA(IDVITIMA)
);

-- ATACA
DROP TABLE ATACA;

CREATE TABLE ATACA(
	IDCRIMINOSO INT NOT NULL
    , IDVITIMA INT NOT NULL
    , PRIMARY KEY(IDCRIMINOSO, IDVITIMA)
    , FOREIGN KEY (IDCRIMINOSO) REFERENCES CRIMINOSO(IDCRIMINOSO)
    , FOREIGN KEY (IDVITIMA) REFERENCES VITIMA(IDVITIMA)
);

-- COMETE

DROP TABLE COMETE;
CREATE TABLE COMETE(
	IDCRIMINOSO INT NOT NULL
    , IDCRIME INT NOT NULL
    , PRIMARY KEY(IDCRIMINOSO, IDCRIME)
    , FOREIGN KEY (IDCRIMINOSO) REFERENCES CRIMINOSO(IDCRIMINOSO)
    , FOREIGN KEY (IDCRIME) REFERENCES CRIME(IDCRIME)
);

-- use and insert

USE DBALUNO;
INSERT INTO ALUNO (NOME, SEXO, IDADE, CIDADE) VALUES ("ANDERSON", "M", 17, "PALHOCA");
INSERT INTO ALUNO (NOME, SEXO, IDADE, CIDADE) VALUES ("CESAR","M",21,"SAO JOSE");
INSERT INTO ALUNO (NOME, SEXO, IDADE, CIDADE) VALUES ("DANIEL","M",19,"PALHOCA" );
INSERT INTO ALUNO (NOME, SEXO, IDADE, CIDADE) VALUES ("DIEGO","M",19,"BLUMENAU" );
INSERT INTO ALUNO (NOME, SEXO, IDADE, CIDADE) VALUES ("EDUARDO","M",20,"");
INSERT INTO ALUNO (NOME, SEXO, IDADE, CIDADE) VALUES ("GABRIEL","M",20,"TUBARAO" );
INSERT INTO ALUNO (NOME, SEXO, IDADE, CIDADE) VALUES ("JOAO","M",18,"SAO JOSE" );
INSERT INTO ALUNO (NOME, SEXO, IDADE, CIDADE) VALUES ("LEONARDO","M",19,"" );
INSERT INTO ALUNO (NOME, SEXO, IDADE, CIDADE) VALUES ("LUCAS","M",20,"BLUMENAU" );
INSERT INTO ALUNO (NOME, SEXO, IDADE, CIDADE) VALUES ("PRISCILA","F",19,"PALHOÇA" );
INSERT INTO ALUNO (NOME, SEXO, IDADE, CIDADE) VALUES ("RENATA","F",21,"TUBARAO" );
INSERT INTO ALUNO (NOME, SEXO, IDADE, CIDADE) VALUES ("MARIA","F",22,"BLUMENAU" );
INSERT INTO ALUNO (NOME, SEXO, IDADE, CIDADE) VALUES ("TANIA","F",19,"SAO JOSE" );
INSERT INTO ALUNO (NOME, SEXO, IDADE, CIDADE) VALUES ("CARLOS", "M",22,"TUBARAO" );
INSERT INTO ALUNO (NOME, SEXO, IDADE, CIDADE) VALUES ("JOSE","M",19,"PALHOCA" );
INSERT INTO ALUNO (NOME, SEXO, IDADE, CIDADE) VALUES ("MARISA","F",19,"" );
INSERT INTO ALUNO (NOME, SEXO, IDADE, CIDADE) VALUES ("AMANDA","F",19,"" );
INSERT INTO ALUNO (NOME, SEXO, IDADE, CIDADE) VALUES ("JOANA","F",19,"" );
INSERT INTO ALUNO (NOME, SEXO, IDADE, CIDADE) VALUES ("ALICE","F",21,"SAO JOSE" );
INSERT INTO ALUNO (NOME, SEXO, IDADE, CIDADE) VALUES ("TADEU","M",18,"TUBARAO" );

-- select geral 
SELECT * FROM ALUNO;











  
