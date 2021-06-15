-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/* para sql server - remoto - produção */

CREATE TABLE leitura (
	id INT IDENTITY,
	temperatura DECIMAL,
	umidade DECIMAL,
	momento DATETIME,
	fkSensor INT
);

CREATE TABLE usuario (
	id INT IDENTITY,
	nome VARCHAR(50),
	login VARCHAR(50),
	senha VARCHAR(50)
);

/* para workbench - local - desenvolvimento */

create database enviaDados;

use enviaDados;

CREATE TABLE Cliente (
	idCliente INT PRIMARY KEY auto_increment,
	nomeEmpresa VARCHAR(100),
	email VARCHAR(40),
	senha VARCHAR(15),	
	estado CHAR(2),
	cnpj CHAR(14),
	hectares int,
	qtdSensores int
);

CREATE TABLE Sensor (
	idSensor INT PRIMARY KEY auto_increment,
	tipoSensor VARCHAR(5),
	CHECK (tipoSensor = "DHT11" OR tipoSensor = "LM35"),
	nomeSensor CHAR(1),
	fkCliente INT,
	FOREIGN KEY (fkCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE leitura (
	id INT PRIMARY KEY AUTO_INCREMENT,
	temperatura FLOAT,	
	umidade FLOAT,
	momento DATETIME,
	fkSensor INT
);

