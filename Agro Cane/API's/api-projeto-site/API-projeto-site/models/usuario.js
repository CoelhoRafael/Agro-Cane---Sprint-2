	'use strict';

/* 
lista e explicação dos Datatypes:
https://codewithhugo.com/sequelize-data-types-a-practical-guide/
*/

module.exports = (sequelize, DataTypes) => {
    let Usuario = sequelize.define('Usuario',{
		id: {
			field: 'idUsuario',
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},		
		email: {
			field: 'email',
			type: DataTypes.STRING(75),
			allowNull: false
		},
		senha: {
			field: 'senha',
			type: DataTypes.STRING(15),
			allowNull: false
		},
		CPF: {
			field: 'CPF',
			type: DataTypes.CHAR(11), /*VERIFICAR*/
			allowNull: false
		},
		telCelular: {
			field: 'telCelular',
			type: DataTypes.CHAR(11), /*VERIFICAR*/
			allowNull: false
		},
		telComercial: {
			field: 'telComercial',
			type: DataTypes.CHAR(10), /*VERIFICAR*/
			allowNull: false
		},
		estado: {
			field: 'estado',
			type: DataTypes.CHAR(2), /*VERIFICAR*/
			allowNull: false
		},
		CEP: {
			field: 'CEP',
			type: DataTypes.CHAR(9), /*VERIFICAR*/
			allowNull: false
		},
		nome: {
			field: 'nomeUsuario',
			type: DataTypes.STRING(45), /*VERIFICAR*/
			allowNull: false
		}
	}, 
	{
		tableName: 'usuario', 
		freezeTableName: true, 
		underscored: true,
		timestamps: false,
	});

    return Usuario;
};
