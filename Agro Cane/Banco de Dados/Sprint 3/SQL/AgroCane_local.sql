create database AgroCane;
use AgroCane;

create table Cliente (
idCliente int primary key auto_increment,
nomeEmpresa varchar(100),
email varchar(40),
senha varchar(15),
estado char(2),
cnpj char(14),
hectares int,
qntSensores int
);

select * from Cliente;

create table Sensor (
	idSensor int primary key auto_increment,
    tipoSensor varchar(5),
    check (tipoSensor = "DHT11" or tipoSensor = "LM35"),
    nomeSensor char(1),
	fkCliente int,
	foreign key (fkCliente) references Cliente (idCliente)
);

insert into Sensor (tipoSensor, nomeSensor, fkCliente) values
('DHT11', 'A', 1),
('DHT11', 'B', 1),
('DHT11', 'C', 1),
('DHT11', 'D', 1);

insert into Sensor (tipoSensor, nomeSensor, fkCliente) values
('DHT11', 'A' ,2),
('DHT11', 'B' ,2),
('DHT11', 'C' ,2),
('DHT11', 'D' ,2),
('DHT11', 'E' ,2),
('DHT11', 'F' ,2),
('DHT11', 'G' ,2),
('DHT11', 'H' ,2);


create table dadoSensor (
idDado int primary key auto_increment,
temperatura float,
umidade float,
dataDado datetime,
fkSensor int,
foreign key (fkSensor) references Sensor (idSensor)
);

select * from Sensor;
select * from dadoSensor;

select nomeEmpresa, idSensor, tipoSensor, idDado, temperatura, umidade, dataDado from Cliente inner join Sensor on fkCliente = idCliente inner join dadoSensor on fkSensor = idSensor;

select min(temperatura) from dadoSensor; 


select distinct(temperatura), idSensor, tipoSensor from dadoSensor inner join Sensor on fkSensor = idSensor where temperatura < 11 or temperatura > 30 and fkCliente like 2;
																																						-- fkCliente like ${idCliente};

select sum(temperatura <= 11 or temperatura >= 30)Temperatura, sum(umidade <= 10 or umidade >= 90)Umidade from dadoSensor;
select sum(temperatura <= 11 or temperatura >= 30)Temperatura from dadoSensor;
select sum(umidade <= 10 or umidade >= 90)Umidade from dadoSensor;

-- instruçãoSQL gráfico pizza (teste - Lógica quase correta):
select sum(temperatura <= 11 or temperatura >= 30 and umidade <= 10 or umidade >= 90)naoOk, sum(temperatura > 11 or temperatura < 30 and umidade > 10 or umidade < 90)Ok from dadoSensor;
select sum(temperatura <= 11 or temperatura >= 30 and umidade <= 10 or umidade >= 90)naoOk, sum(temperatura > 11 or temperatura < 30 and umidade > 10 or umidade < 90)Ok from dadoSensor inner join Sensor on fkSensor = idSensor where fkCliente = 2;
																																																								-- fkCliente like ${idCliente};
                                                                                                                                                                                                                                
select sum(temperatura <= 11 or temperatura >= 30 and umidade <= 10 or umidade >= 90)naoOk from dadoSensor;

-- Exibindo sensores não ok (teste)
select distinct(idSensor) from Sensor inner join dadoSensor on idSensor = fkSensor where temperatura <= 11 or temperatura >= 30 and umidade <= 10 or umidade >= 90 and fkCliente like 2;
select distinct(idSensor), idCliente from Sensor inner join dadoSensor on idSensor = fkSensor inner join Cliente on fkCliente = idCliente where idCliente like 2 and temperatura <= 11 or temperatura >= 30 and umidade <= 10 or umidade >= 90;
select distinct(idSensor) from Sensor inner join dadoSensor on idSensor = fkSensor where fkCliente like 2 and temperatura <= 11 or temperatura >= 30 and umidade <= 10 or umidade >= 90;
select distinct(idSensor), fkCliente from Sensor inner join dadoSensor on idSensor = fkSensor where temperatura <= 11 or temperatura >= 30 and umidade <= 10 or umidade >= 90;


SELECT count(s.idSensor) / t.total * 100 as Percentual, idSensor from Sensor s, ( SELECT count(*) as total from Sensor ) t GROUP BY s.fkCliente;

select count(idSensor) / t.total * 100 as Percentual from Sensor s, (select count(*) as total from Sensor)t inner join dadoSensor on idSensor = fkSensor where temperatura <= 11 or temperatura >= 30 and umidade <= 10 or umidade >= 90;
select count(idSensor) / t.total * 100 as Percentual from Sensor, (select count(*) as total from Sensor)t inner join dadoSensor on idSensor = fkSensor where temperatura <= 11 or temperatura >= 30 and umidade <= 10 or umidade >= 90;
select count(idSensor) / t.total * 100 as Percentual from Sensor inner join dadoSensor on idSensor = fkSensor, (select count(*) as total from Sensor)t where temperatura <= 11 or temperatura >= 30 and umidade <= 10 or umidade >= 90;

select temperatura, umidade from dadoSensor inner join Sensor on fkSensor = idSensor where idSensor = 2;
select distinct(idSensor), fkCliente from Sensor inner join dadoSensor on idSensor = fkSensor where temperatura <= 11 or temperatura >= 30 and umidade <= 10 or umidade >= 90 and fkCliente = 2;


SELECT * FROM tabela WHERE data BETWEEN CURRENT_TIME()-1 AND CURRENT_TIME(); 

select * from dadoSensor;

-- Detalhamento da Ocorrência: (não ok)!!!
select distinct(idSensor), fkCliente from Sensor inner join dadoSensor on idSensor = fkSensor where temperatura <= 11 or temperatura >= 30 and umidade <= 10 or umidade >= 90 and fkCliente = 2;
select distinct(idSensor), fkCliente from Sensor inner join dadoSensor on idSensor = fkSensor where (temperatura <= 11 or temperatura >= 30 and umidade <= 10 or umidade >= 90) and fkCliente = 2;

select sum(temperatura <= 11 or temperatura >= 30 and umidade <= 10 or umidade >= 90)naoOk, sum(temperatura > 11 or temperatura < 30 and umidade > 10 or umidade < 90)Ok from dadoSensor inner join Sensor on fkSensor = idSensor where dataDado >= now() - interval 1 hour and fkCliente = 2;
select sum(temperatura <= 11 or temperatura >= 30 and umidade <= 10 or umidade >= 90)naoOk, sum(temperatura > 11 or temperatura < 30 and umidade > 10 or umidade < 90)Ok from dadoSensor inner join Sensor on fkSensor = idSensor where dataDado >= now() - interval(1) hour and fkCliente = 2;
select sum(temperatura <= 11 or temperatura >= 30 and umidade <= 10 or umidade >= 90)naoOk, sum(temperatura > 11 or temperatura < 30 and umidade > 10 or umidade < 90)Ok from dadoSensor inner join Sensor on fkSensor = idSensor where dataDado >= now() - interval(1) hour and fkCliente = 2;

SELECT  * FROM dadoSensor WHERE dataDado >= NOW() - INTERVAL 1 HOUR;

select * from dadoSensor where temperatura between 11 and 30;
select sum(temperatura <= 11 or temperatura >= 30 and umidade <= 10 or umidade >= 90)naoOk, sum(temperatura > 11 or temperatura < 30 and umidade > 10 or umidade < 90)Ok from dadoSensor inner join Sensor on fkSensor = idSensor where (dataDado >= now() - interval 1 hour) and fkCliente = 2;
                             
                             
select distinct(idSensor), nomeSensor, fkCliente from Sensor inner join dadoSensor on idSensor = fkSensor where (temperatura <= 11 or temperatura >= 30 and umidade <= 10 or umidade >= 90) and fkCliente = 2;
select idSensor, nomeSensor, fkCliente from Sensor where fkCliente = 2;


select temperatura, umidade, DATE_FORMAT(dataDado,'%H:%i:%s') as momento_grafico from dadoSensor inner join Sensor on fkSensor = idSensor where idSensor = 2;


select count(temperatura <= 11 or temperatura >= 30 or umidade <= 10 or umidade >= 90)naoOk, count(temperatura > 11 or temperatura < 30 and umidade > 10 or umidade < 90)Ok from dadoSensor inner join Sensor on fkSensor = idSensor where fkCliente = 2 and idDado in (select max(idDado) from dadoSensor group by fkSensor);

Select * from dadoSensor;

select idSensor, temperatura, umidade from dadoSensor inner join Sensor on fkSensor = idSensor where fkCliente = 2 and idDado in (select max(idDado) from dadoSensor group by fkSensor);