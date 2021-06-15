create table Cliente (
    idCliente int identity,
    nomeEmpresa varchar(100),
    nomeResp varchar(75),
    email varchar(60),
    senha varchar(20),
    estado varchar(30),
    cnpj char(14),
    hectares int,
    qntSensores INT
);

create table dadoSensor (
    idDado int identity,
    temperatura float,
    umidade float,
    dataDado DATE,
    momento_grafico TIME
);

select * from Cliente;
select * from leitura;
select * from usuario;


Select * From INFORMATION_SCHEMA.COLUMNS Where TABLE_NAME = 'leitura';