'use strict';

/* 
lista e explicação dos Datatypes:
https://codewithhugo.com/sequelize-data-types-a-practical-guide/
*/

module.exports = (sequelize, DataTypes) => {
    let Areas = sequelize.define('Areas',{	
		id: {
			field: 'idAreas',
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},	
		nome: {
			field: 'nome',
			type: DataTypes.STRING(45), 
			allowNull: false
		},
		localidade: {
			field: 'localidade',
			type: DataTypes.STRING(45),
			allowNull: false
		},
		momento_grafico: {
			type: DataTypes.VIRTUAL, // campo 'falso' (não existe na tabela). Deverá ser preenchido 'manualmente' no select (O QUE É ISSO?)
			allowNull: true
		}
	}, 
	{
		tableName: 'areas', 
		freezeTableName: true, 
		underscored: true,
		timestamps: false,
	});

    return Areas;
};