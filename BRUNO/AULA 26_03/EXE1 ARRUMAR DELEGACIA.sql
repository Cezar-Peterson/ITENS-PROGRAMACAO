USE dbdelegacia;

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












  
