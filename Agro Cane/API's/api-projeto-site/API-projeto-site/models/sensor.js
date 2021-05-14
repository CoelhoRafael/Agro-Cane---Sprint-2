'use strict';

/* 
lista e explicação dos Datatypes:
https://codewithhugo.com/sequelize-data-types-a-practical-guide/
*/

module.exports = (sequelize, DataTypes) => {
    let Sensor = sequelize.define('Sensor',{	
		id: {
			field: 'idSensor',
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},	
		regiao: {
			field: 'regiao',
			type: DataTypes.STRING(20), 
			allowNull: false
		},
		quadrante: {
			field: 'quadrante',
			type: DataTypes.INTEGER,
			allowNull: false
		},
        statusSensor: {
			field: 'statusSensor',
			type: DataTypes.STRING(20), /*CHECK*/
			allowNull: false
		},
		momento_grafico: {
			type: DataTypes.VIRTUAL, // campo 'falso' (não existe na tabela). Deverá ser preenchido 'manualmente' no select (O QUE É ISSO?)
			allowNull: true
		}
	}, 
	{
		tableName: 'Sensor', 
		freezeTableName: true, 
		underscored: true,
		timestamps: false,
	});

    return Sensor;
};