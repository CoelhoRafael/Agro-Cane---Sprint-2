'use strict';

/* 
lista e explicação dos Datatypes:
https://codewithhugo.com/sequelize-data-types-a-practical-guide/
*/

module.exports = (sequelize, DataTypes) => {
    let dadoSensor = sequelize.define('dadoSensor',{	
		id: {
			field: 'idDado',
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},	
		temperatura: {
			field: 'temperatura',
			type: DataTypes.FLOAT, /* Estava REAL */
			allowNull: false
		},
		umidade: {
			field: 'umidade',
			type: DataTypes.FLOAT, /* Estava REAL */
			allowNull: false
		},
		dataDado: {
			field: 'dataDado',
			type: DataTypes.DATE, // NÃO existe DATETIME. O tipo DATE aqui já tem data e hora
			allowNull: false
		},
		nomeSensor: {
			field: 'nomeSensor',
			type: DataTypes.STRING, 
			allowNull: false
		},
		momento_grafico: {
			type: DataTypes.VIRTUAL, // campo 'falso' (não existe na tabela). Deverá ser preenchido 'manualmente' no select (O QUE É ISSO?)
			allowNull: true
		}
	}, 
	{
		tableName: 'dadoSensor', 
		freezeTableName: true, 
		underscored: true,
		timestamps: false,
	});

    return dadoSensor;
};
