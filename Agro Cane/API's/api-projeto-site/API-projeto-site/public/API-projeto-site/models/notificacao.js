'use strict';

/* 
lista e explicação dos Datatypes:
https://codewithhugo.com/sequelize-data-types-a-practical-guide/
*/

module.exports = (sequelize, DataTypes) => {
    let Notificacao = sequelize.define('Notificacao',{
		idNotificacao: {
			field: 'idNotificacao',
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},		
		Assunto: {
			field: 'Assunto',
			type: DataTypes.STRING(45),
			allowNull: false
		},
		Acessos: {
			field: 'Acessos',
			type: DataTypes.STRING(20),
			allowNull: true
		}
	}, 
	{
		tableName: 'Notificacao', 
		freezeTableName: true, 
		underscored: true,
		timestamps: false,
	});

    return Notificacao;
};
