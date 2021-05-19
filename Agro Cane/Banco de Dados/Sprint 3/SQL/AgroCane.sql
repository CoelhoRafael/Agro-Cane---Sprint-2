create database AgroCane;
use AgroCane;

create table Cliente (
idCliente int primary key auto_increment,
nomeEmpresa varchar(100),
nomeResp varchar(75),
email varchar(60),
senha varchar(20),
estado varchar(30),
cnpj char(14),
hectares int,
qntSensores int
);

-- insert into Cliente values														
-- (Null, "Raízen", "São Paulo", "08070508000178", "860", "43"),
-- (Null, "Biosev", "São Paulo", "15527906000136", "404", "20");

select * from Cliente;

create table Areas (
idAreas int primary key auto_increment,
fkCliente int,
nome varchar (45),
localidade varchar (45),
foreign key (fkCliente) references Cliente(idCliente)
) auto_increment = 1000;

-- insert into Areas values
-- (Null, "1", 'H1', 'Leste'),
-- (Null, "1", 'H2', 'Oeste'),
-- (Null, "1", 'H3', 'Sul'),
-- (Null, "2", 'H1', 'Norte'),
-- (Null, "2", 'H2', 'Leste'),
-- (Null, "2", 'H3', 'Centro-Oeste');

select * from Areas;

select * from cliente inner join areas on idCliente=fkCliente;

create table Sensor (
idSensor int primary key auto_increment,
regiao varchar(20),
quadrante int,
fkAreas int,
foreign key (fkAreas) references Areas(idAreas),
statusSensor varchar(20)
check (statusSensor = "Ideal" or statusSensor = "Alerta" or statusSensor = "Emergência" or statusSensor = "Crítico")
) auto_increment = 5000;

-- insert into Sensor values
-- (Null, "Norte", 286, "1000", "Ideal"), 
-- (Null, "Sul", 286, "1001", "Alerta"), 
-- (Null, "Leste", 286, "1002", "Crítico"), 
-- (Null, "Oeste", 134, "1003", "Ideal"), 
-- (Null, "Sudeste", 134, "1004", "Ideal"), 
-- (Null, "CentroOeste", 134, "1005", "Emergência"); 

select * from Sensor;

create table dadoSensor (
idDado int primary key auto_increment,
temperatura float,
umidade float,
dataDado datetime,
fkSensor int,
foreign key (fkSensor) references Sensor (idSensor)
) auto_increment = 9000;

select * from dadoSensor where idDado > 9025;

-- insert into dadoSensor values
-- (Null, "25.0", "51", "2021-04-19 12:00", "5000"),
-- (Null, "23.3", "48", "2021-04-19 12:00", "5001"),
-- (Null, "11.7", "19", "2021-04-19 12:00", "5002"),
-- (Null, "27.0", "52", "2021-04-19 12:00", "5003"),
-- (Null, "26.6", "50", "2021-04-19 12:00", "5004"),
-- (Null, "34.2", "75", "2021-04-19 12:00", "5005");
-- (Null, "28.0", "57", "2021-04-19 13:00", "5000"),
-- (Null, "25.0", "51", "2021-04-19 14:00", "5000"),
-- (Null, "23.3", "48", "2021-04-19 13:00", "5001"),
-- (Null, "23.3", "48", "2021-04-19 14:00", "5001"),
-- (Null, "11.7", "19", "2021-04-19 13:00", "5002"),
-- (Null, "11.7", "19", "2021-04-19 14:00", "5002"),
-- (Null, "27.0", "52", "2021-04-19 13:00", "5003"),
-- (Null, "27.0", "52", "2021-04-19 14:00", "5003"),
-- (Null, "26.6", "50", "2021-04-19 13:00", "5004"),
-- (Null, "26.6", "50", "2021-04-19 14:00", "5004"),
-- (Null, "34.2", "75", "2021-04-19 13:00", "5005"),
-- (Null, "34.2", "75", "2021-04-19 14:00", "5005");

select * from dadoSensor; 

select * from Sensor inner join dadoSensor where idSensor = fkSensor;
select idSensor, regiao, quadrante statusSensor, temperatura, umidade, dataDado from Sensor inner join dadoSensor where idSensor = fkSensor;

create table Usuario (
idUsuario int primary key auto_increment,
email varchar(75),
senha varchar(15),
CPF char(11),
telCelular char(11),
telComercial char(10),
estado char(2),
CEP char(9),
fkCliente int,
nomeUsuario varchar(45),
foreign key (fkCliente) references Cliente (idCliente)
) auto_increment = 12000;

-- insert into Usuario values
-- (Null, "angelica.oliveira@raizen.com", "Angelica@1234", "00077788803", "11998765423", "1138976960", "SP", "01999-234", "1"),
-- (Null, "jeferson.trivelato@raizen.com", "Raizen!0", "00066677702", "11998664312", "1134238121", "RJ", "00000-000", "1"),
-- (Null, "juan.blanchard@biosev.com", "Biosev1!", "11100044499", "11912345678", "1138976960", "SP", "01444-000", "2"),
-- (Null, "ri@biosev.com", "BioRi@4565", "00077788803", "11987654321", "1130925200", "SP", "44444-111", "2");

select * from Usuario;

create table Acesso (
idAcesso int primary key auto_increment,
dataAcesso datetime,
fkUsuario int,
foreign key (fkUsuario) references Usuario (idUsuario)
) auto_increment = 15000;

-- insert into Acesso values 
-- (Null, "2021-04-19 12:10", "12000"),
-- (Null, "2021-04-19 15:56", "12001"),
-- (Null, "2021-04-19 14:00", "12002"),
-- (Null, "2021-04-19 14:05", "12003");

select * from Acesso;

select * from Cliente join Usuario on idCliente = fkCliente;

select * from Cliente inner join Areas on idCliente = fkCliente inner join Sensor on idAreas = fkAreas inner join dadoSensor on idSensor = fkSensor;

desc Cliente;
desc Usuario;


