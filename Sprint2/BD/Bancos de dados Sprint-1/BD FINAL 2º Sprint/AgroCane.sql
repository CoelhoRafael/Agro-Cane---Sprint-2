create database AgroCane;

use AgroCane;

-- Criando tabela cliente (auto increment apartir de 1)
create table Cliente (
idCliente int primary key auto_increment,
nome varchar(100),
estado varchar(30),
cnpj char(14),
hectares int,
qntsensores int);

select * from Cliente;

-- Inserindo dados na tabela Cliente
insert into Cliente
values
(null, 'Raízen', 'São Paulo', '08070508000178', '860', '43'),
(null, 'Biosev', 'São Paulo', '15527906000136', '404', '20');


-- Criando tabela Area (auto increment apartir de 1000)
create table Areas (
idAreas int primary key auto_increment,
fkCliente int,
foreign key (fkCliente) references Cliente(idCliente)
)auto_increment = 1000;

select * from Areas;


-- Inserindo dados na tabela na Area
insert into Areas 
values
(null, '1'),
(null, '1'),
(null, '1'),
(null, '2'),
(null, '2'),
(null, '2');

-- Criando tabela DHT11 (auto increment apartir de 5000)
create table DHT11 (
idSensor int primary key auto_increment,
regiao varchar(20),
quadrante int,
fkAreas int,
foreign key (fkAreas) references Areas(idAreas),
statusSensor varchar(20)
check( statusSensor = 'Ideal' or statusSensor = 'Alerta' or statusSensor = 'Emergencia' or statusSensor = 'Critico')
)auto_increment = 5000;


select * from DHT11;

-- inserindo dados na tabela DHT11
insert into DHT11
values
(null, 'Norte', 286,'1000','Ideal'),
(null, 'Sul', 286,'1001','Alerta'),
(null, 'Leste', 286,'1002','Critico'),
(null, 'Oeste', 134,'1003','Ideal'),
(null, 'Suldeste', 134,'1004','Ideal'),
(null, 'CentroOeste', 134,'1005','Emergencia');


-- Criando tabela dadoDHT11 (auto increment apartir de 9000)
create table dadoDHT11 (
idDado int primary key auto_increment,
temp float,
umid float,
dataDado datetime,
fkSensor int,
foreign key (fkSensor) references DHT11(idSensor)
)auto_increment = 9000;

select * from dadoDHT11;

-- Inserindo dados na tabela dadoDHT11
insert into dadoDHT11
values
(null, '25.0', '51', '2021-04-19 12:00', '5000'),
(null, '23.3', '48', '2021-04-19 13:00', '5001'),
(null, '11.7', '19', '2021-04-19 14:00', '5002'),
(null, '27.0', '52', '2021-04-19 15:00', '5003'),
(null, '26.6', '50', '2021-04-19 16:00', '5004'),
(null, '34.2', '75', '2021-04-19 17:00', '5005');


-- Criando tabela Usuario (auto increment apartir de 12000)
create table Usuario (
idUsuario int primary key auto_increment,
email varchar(75),
senha varchar(15),
CPF char(11),
telCelular char(9),
telComercial char(8),
estado char(2),
CEP char(9),
fkCliente int,
foreign key (fkCliente) references Cliente(idCliente)
)auto_increment = 12000;

select * from Usuario;

-- Inserindo dados na tabela Usuario
insert into Usuario
values
(null, 'angelica.oliveira@raizen.com', '1234', '00077788803', '998765423', '38976960', 'SP', '01999-234', '1'),
(null, 'jeferson.trivelato@raizen.com ', 'raizen0', '00066677702', '998664312', '34238121', 'RJ', '00000-000', '1'),
(null, 'juan.blanchard@biosev.com', 'Biosev1', '11100044499', '912345678', '38976960', 'SP', '01444-000', '2'),
(null, 'ri@biosev.com', 'Bio4321', '22233355588', '987654321', '30925200 ', 'SP', '44444-111', '2');


-- Criando a tabela Acesso (auto increment apartir de 15000)
create table Acesso (
idAcesso int primary key auto_increment,
dataAcesso datetime,
fkUsuario int,
foreign key (fkUsuario) references Usuario(idUsuario)
)auto_increment = 15000;

select * from Acesso;

-- Inserindo dados na tabela Acesso
insert into Acesso
values
(null, '2021-04-19 12:10', '12000'),
(null, '2021-04-19 15:56', '12001'),
(null, '2020-04-19 14:00', '12002'),
(null, '2020-04-19 14:05', '12003');

select * from Cliente join Usuario on idCliente = fkCliente;


 

