'use strict';

/* 
lista e explicação dos Datatypes:
https://codewithhugo.com/sequelize-data-types-a-practical-guide/
*/

module.exports = (sequelize, DataTypes) => {
    let Acesso = sequelize.define('Acesso',{	
		id: {
			field: 'idAcesso',
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},	
        dataAcesso: {
			field: 'dataAcesso',
			type: DataTypes.DATE, // NÃO existe DATETIME. O tipo DATE aqui já tem data e hora
			allowNull: false
		},
		momento_grafico: {
			type: DataTypes.VIRTUAL, // campo 'falso' (não existe na tabela). Deverá ser preenchido 'manualmente' no select (O QUE É ISSO?)
			allowNull: true
		}
	}, 
	{
		tableName: 'acesso', 
		freezeTableName: true, 
		underscored: true,
		timestamps: false,
	});

    return Acesso;
};