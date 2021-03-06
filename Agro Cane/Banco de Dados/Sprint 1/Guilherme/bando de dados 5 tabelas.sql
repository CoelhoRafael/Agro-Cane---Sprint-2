create database agrocane;
use agrocane;
create table RankingRegioes(
idRegião varchar (30) primary key,
Safra2010 varchar (60),
ParticipaçãoEm2010 varchar (60)
);

insert into RankingRegioes values
('Sudeste',498884508,'69,53%'),
('Centro-Oeste',97430026,'13,58%'),
('Nordeste',68789726,'9,59%'),
('Sul',50286221,'7,01%'),
('Norte',2071620,'0,29%');


create table clientes 
(idclientes int primary key auto_increment,
cnpj varchar (20),
nome varchar (100),
estado varchar (30), 
fase varchar (20),
adesao date);

insert into clientes values
(null,'23564568022214', 'jorge aldhair', 'rio grande do sul', 'produçao', '2021-01-26'),
(null,'53314585000126', 'carlos almeida', 'santa catarina',  'execuçao', '2021-02-01'),
(null,'23568719254956', 'maria silva', 'parana', 'contrato', '2021-02-03'),
(null,'65234758000334', 'jorge fernandes', 'rio grande do sul', 'pagamento', '2021-02-07'),
(null,'52364257003665', 'fernanda santos', 'sao paulo', 'execuçao', '2021-02-15');

create table informaçoes 
(idclientes int primary key,
cnpj varchar (20), 
ectares varchar (5), 
qntsensores varchar (5)
);

insert into informaçoes values
(1,'23564568022214', '50', '10'),
(2,'53314585000126', '10', '7'),
(3,'23568719254956', '60', '14'),
(4,'65234758000334', '100', '30'),
(5,'52364257003665', '5', '3');

create table registro1
(horario varchar (20),
temperatura varchar (5),
humidade varchar (4)
);

insert into registro1 values
('05:00', '25°C', '50%'),
('08:00', '27°C', '40%'),
('11:00', '20°C', '60%'),
('14:00', '17°C', '70%'),
('17:00', '20°C', '100%'),
('20:00', '18°C', '60%'),
('23:00', '15°C', '40%');

create table registro2
(horario varchar (20),
temperatura varchar (5),
humidade varchar (4)
);

insert into registro2 values
('05:00', '22°C', '50%'),
('08:00', '20°C', '50%'),
('11:00', '20°C', '60%'),
('14:00', '17°C', '70%'),
('17:00', '14°C', '100%'),
('20:00', '19°C', '50%'),
('23:00', '15°C', '50%');

select * from registro2;


