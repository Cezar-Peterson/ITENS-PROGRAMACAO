create database exe_bruno_15_03_2021;

-- exe1-----------------------------------------

-- criar database e table
use exe_bruno_15_03_2021;
create table conta(
	idconta int primary key auto_increment,
    nome varchar(100),
    sobrenome varchar(100),
    celular varchar(20),
    email varchar(100),
    senha varchar(100),
    dt_nascimento date,
    sexo char(1)
);

-- inserts
insert into conta(nome, sobrenome, celular, email, senha, dt_nascimento, sexo) values("cezar", "peterson", "48 99998888"
,"cezar@gmail.com", "123456789", "2004-08-05", "m");

insert into conta(nome, sobrenome, celular, email, senha, dt_nascimento, sexo) values("sofia", "seixas", "48 88889999"
,"sofia@gmail.com", "987654321", "2004-05-08", "f");

insert into conta(nome, sobrenome, celular, email, senha, dt_nascimento, sexo) values("jonata", "silva", "48 15987423"
,"jonata@gmail.com", "258741369", "2004-3-30", "m");

-- select da table
SELECT * FROM exe_bruno_15_03_2021.conta;

-- exe2-----------------------------------------

-- create table
create table escola(
	idaluno int primary key auto_increment,
    nome varchar(100)
);
-- inserts
insert into escola(nome) values("rafael");
insert into escola(nome) values("cezar");
insert into escola(nome) values("sofia");
insert into escola(nome) values("marcia");
insert into escola(nome) values("jonata");
insert into escola(nome) values("emili");

-- select da table
SELECT * FROM exe_bruno_15_03_2021.escola;

-- exe3-----------------------------------------

-- criar table
create table estacionamento(
	idcarro int primary key auto_increment,
    marca varchar(100),
    modelo varchar(100),
    ano_de_fabricacao int,
    ano_do_modelo int,
    placa char(7),
    cor varchar(50),
    numero_do_chassi char(17)
);

-- insert
insert into estacionamento(marca, modelo, ano_de_fabricacao, ano_do_modelo, placa, cor, numero_do_chassi)
values ("chevrolet", "opala", 1979, 1979, "abc1234", "azul xingu", "4BC5R87HX24060831");

insert into estacionamento(marca, modelo, ano_de_fabricacao, ano_do_modelo, placa, cor, numero_do_chassi)
values ("chevrolet", "opala", 1992, 1992, "abc1235", "azul gythion", "9BGVN15FGHB000001");

-- deletar idcarro = 3
delete from estacionamento where idcarro = 3;

-- select da table
SELECT * FROM exe_bruno_15_03_2021.estacionamento;

-- exe4-----------------------------------------

-- criar table
create table biblioteca(
	idlivro int primary key auto_increment,
    titulo varchar(100),
    autor varchar(100),
    editora varchar(100),
    ano_de_publicacao int
);

-- inserts
insert into biblioteca(titulo, autor, editora, ano_de_publicacao) values("as aventuras de cezar", "cezar", "saraiva", 2021);
insert into biblioteca(titulo, autor, editora, ano_de_publicacao) values("joao, o maniaco", "jeremias", "alguma coisa", 2021);

-- select da table
SELECT * FROM exe_bruno_15_03_2021.biblioteca;







