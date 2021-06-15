select * from Cliente;
select * from Sensor;
select * from dadoSensor;
select * from dadoSensor, Sensor;
select * from dadoSensor where idDado > 25;
select * from dadoSensor where idDado > 50;
select * from dadoSensor where idDado > 75;
select * from dadoSensor where idDado > 100;
select * from dadoSensor where idDado > 125;

select top 1 temperatura, umidade, FORMAT(dataDado,'HH:mm:ss') as momento_grafico, fkSensor from dadoSensor where fkSensor = 1 order by idDado desc
select top 1 temperatura, umidade, FORMAT(dataDado,'HH:mm:ss') as momento_grafico, fkSensor from dadoSensor where fkSensor = 2 order by idDado desc

select idSensor, temperatura, umidade from dadoSensor inner join Sensor on fkSensor = idSensor where fkCliente = 1 and idDado in (select max(idDado) from dadoSensor group by fkSensor);
select idSensor, temperatura, umidade from dadoSensor inner join Sensor on fkSensor = idSensor where fkCliente = 2 and idDado in (select max(idDado) from dadoSensor group by fkSensor);

select idSensor, nomeSensor, fkCliente from Sensor where fkCliente = 1;
select idSensor, nomeSensor, fkCliente from Sensor where fkCliente = 2;

select distinct(idSensor), nomeSensor, fkCliente from Sensor inner join dadoSensor on idSensor = fkSensor where (temperatura <= 11 or temperatura >= 30 and umidade <= 10 or umidade >= 90) and fkCliente = 1;
select distinct(idSensor), nomeSensor, fkCliente from Sensor inner join dadoSensor on idSensor = fkSensor where (temperatura <= 11 or temperatura >= 30 and umidade <= 10 or umidade >= 90) and fkCliente = 2;

select temperatura, umidade, FORMAT(dataDado, 'HH:mm:ss') as momento_grafico from dadoSensor inner join Sensor on fkSensor = idSensor where idSensor = 1 order by idDado OFFSET 1 ROWS FETCH NEXT 10 ROWS ONLY;
select temperatura, umidade, FORMAT(dataDado, 'HH:mm:ss') as momento_grafico from dadoSensor inner join Sensor on fkSensor = idSensor where idSensor = 2 order by idDado OFFSET 1 ROWS FETCH NEXT 10 ROWS ONLY;