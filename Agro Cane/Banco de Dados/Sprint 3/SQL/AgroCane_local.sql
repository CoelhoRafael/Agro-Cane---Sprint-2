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

select * from Cliente;

create table Sensor (
	idSensor int primary key auto_increment,
	fkCliente int,
	statusSensor varchar(20),
    check (statusSensor = "Ideal" or statusSensor = "Alerta" or statusSensor = "Emergência" or statusSensor = "Crítico"),
	foreign key (fkCliente) references Cliente(idCliente)
) auto_increment = 5000;

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

select min(temperatura) from dadoSensor; 

select * from Sensor inner join dadoSensor where idSensor = fkSensor;
select idSensor, regiao, quadrante statusSensor, temperatura, umidade, dataDado from Sensor inner join dadoSensor where idSensor = fkSensor;

select * from Usuario;

select * from Acesso;

select * from Cliente join Usuario on idCliente = fkCliente;
select * from Cliente;
select * from Usuario;

select * from Cliente inner join Areas on idCliente = fkCliente inner join Sensor on idAreas = fkAreas inner join dadoSensor on idSensor = fkSensor;

desc Cliente;
desc Usuario;