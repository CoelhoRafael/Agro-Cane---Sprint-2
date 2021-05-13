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
		nome: {
			field: 'nome',
			type: DataTypes.STRING(100), 
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
        qtdSensores: {
			field: 'qtdSensores',
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