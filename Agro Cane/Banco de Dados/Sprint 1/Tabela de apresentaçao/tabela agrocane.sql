create database agrocane;
use agrocane;

create table clientes 
(idclientes int primary key auto_increment,
cnpj varchar (30),
nome varchar (100),
estado varchar (30), 
adesao date,
hectares int, 
qntsensores int
);

insert into clientes values
(null,'23.564.568/0222-14', 'jorge aldhair', 'rio grande do sul', '2021-01-26',50, 10),
(null,'53.314.585/0001-26', 'carlos almeida', 'santa catarina', '2021-02-01', 10, 7),
(null,'23.568.719/2549-56', 'maria silva', 'parana',  '2021-02-03',60, 14),
(null,'65.234.758/0003-34', 'jorge fernandes', 'rio grande do sul', '2021-02-07',100, 30),
(null,'52.364.257/0036-65', 'fernanda santos', 'sao paulo', '2021-02-15', 5, 3);


create table sensor1
(datatemp datetime default current_timestamp,
idsensor int primary key auto_increment,
temperatura float,
umidade float,

regiao varchar (20),
quadrante int,
status_sensor varchar (20)
);


insert into sensor1 (idsensor, temperatura, umidade, regiao, quadrante, status_sensor) values
(null,'25.25', '50', 'sul', 4, 'ativo'),
(null,'27.31', '40', 'norte', 1,'ativo'),
(null,'20.21', '60', 'leste', 3, 'ativo'),
(null,'17.40', '70', 'oeste', 2, 'ativo');

create table sensor2
(datatemp datetime default current_timestamp,
idsensor int primary key auto_increment,
temperatura float,
umidade float,

regiao varchar (20),
quadrante int,
status_sensor varchar (20)
);


insert into sensor2 (idsensor, temperatura, umidade, regiao, quadrante, status_sensor) values
(null,'25.25', '50', 'norte', 4, 'ativo'),
(null,'27.31', '40', 'leste', 1, 'ativo'),
(null,'20.21', '60', 'oeste', 3, 'ativo'),
(null,'17.40', '70', 'sul', 2, 'ativo');


create table producao (
idproducao int primary key auto_increment,
Pais varchar (40),
ProduçaoTonelada float,
AreaHA float,
Produtividade float
);

insert into producao values
(null,'Brasil',719.157, 9.081, 79.1),
(null,'India', 277.750, 4200, 66.1),
(null,'China',111.454, 1695, 657 );

create table ultima_safra
(
idsafra int primary key auto_increment,
ano varchar (20),
toneladas varchar(40)
);

insert into  ultima_safra values
(null,'2015', ' 571,34 milhões de toneladas'),
(null,'2017', '633,26 milhões de toneladas'),
(null,'2019', '665,105 milhões de toneladas');

select * from ultima_safra;









