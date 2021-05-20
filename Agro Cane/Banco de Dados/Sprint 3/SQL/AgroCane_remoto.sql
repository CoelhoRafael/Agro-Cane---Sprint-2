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

select * from Cliente;

Select * From INFORMATION_SCHEMA.COLUMNS Where TABLE_NAME = 'Cliente';