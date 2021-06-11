	'use strict';

/* 
lista e explicação dos Datatypes:
https://codewithhugo.com/sequelize-data-types-a-practical-guide/
*/

module.exports = (sequelize, DataTypes) => {
    let Quiz = sequelize.define('Quiz',{
		idQuiz: {
			field: 'idQuiz',
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},		
		Usuario: {
			field: 'Usuario',
			type: DataTypes.STRING(45),
			allowNull: false
		},
		Resposta: {
			field: 'Resposta',
			type: DataTypes.STRING(45),
			allowNull: true
		}
	}, 
	{
		tableName: 'Quiz', 
		freezeTableName: true, 
		underscored: true,
		timestamps: false,
	});

    return Quiz;
};
