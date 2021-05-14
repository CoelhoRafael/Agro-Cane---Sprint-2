'use strict';

/* 
lista e explicação dos Datatypes:
https://codewithhugo.com/sequelize-data-types-a-practical-guide/
*/

module.exports = (sequelize, DataTypes) => {
    let Cliente = sequelize.define('Cliente',{	
		id: {
			field: 'idCliente',
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},	
		nomeEmpresa: {
			field: 'nomeEmpresa',
			type: DataTypes.STRING(100), 
			allowNull: false
		},
		nomeResp: {
			field: 'nomeResp',
			type: DataTypes.STRING(75), 
			allowNull: false
		},
		email: {
			field: 'email',
			type: DataTypes.STRING(60), 
			allowNull: false
		},
		senha: {
			field: 'senha',
			type: DataTypes.STRING(20), 
			allowNull: false
		},
		estado: {
			field: 'estado',
			type: DataTypes.STRING(30),
			allowNull: false
		},
        cnpj: {
			field: 'cnpj',
			type: DataTypes.CHAR(14),
			allowNull: false
		},
        hectares: {
			field: 'hectares',
			type: DataTypes.INTEGER,
			allowNull: false
		},
        qntSensores: {
			field: 'qntSensores',
			type: DataTypes.INTEGER,
			allowNull: false
		},
		momento_grafico: {
			type: DataTypes.VIRTUAL, // campo 'falso' (não existe na tabela). Deverá ser preenchido 'manualmente' no select (O QUE É ISSO?)
			allowNull: true
		}
	}, 
	{
		tableName: 'cliente', 
		freezeTableName: true, 
		underscored: true,
		timestamps: false,
	});

    return Leitura;
};