var express = require('express');
var router = express.Router();
var sequelize = require('../models').sequelize;
var Leitura = require('../models').dadoSensor;
var env = process.env.NODE_ENV || 'development';

/* Recuperar as últimas N leituras */
router.get('/ultimas/:idcaminhao', function (req, res, next) {

	// quantas são as últimas leituras que quer? 7 está bom?

	const limite_linhas = 7;

	var idcaminhao = req.params.idcaminhao;

	console.log(`Recuperando as ultimas ${limite_linhas} leituras`);

	let instrucaoSql = "";
	// let instrucaoSql2 = "";

	if (env == 'dev') {
		// abaixo, escreva o select de dados para o Workbench
		instrucaoSql = `select 
		temperatura, 
		umidade, 
		momento,
		DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico
		from leitura
		where fkcaminhao = ${idcaminhao}
		order by id desc limit ${limite_linhas}`;

		// instrucaoSql2 = `select 
		// temperatura, 
		// umidade, 
		// momento,
		// DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico
		// from leitura
		// where fkcaminhao = ${idcaminhao}
		// order by id desc limit ${limite_linhas}`;

	} else if (env == 'production') {
		// abaixo, escreva o select de dados para o SQL Server
		instrucaoSql = `select top ${limite_linhas} 
		temperatura, 
		umidade, 
		momento,
		FORMAT(momento,'HH:mm:ss') as momento_grafico
		from leitura
		where fkcaminhao = ${idcaminhao}
		order by id desc`;
	} else {
		console.log("\n\n\n\nproduction\n\n\n\n")
	}

	sequelize.query(instrucaoSql, {
		model: Leitura,
		mapToModel: true
	})
		.then(resultado => {
			console.log(`Encontrados: ${resultado.length}`);
			res.json(resultado);
		}).catch(erro => {
			console.error(erro);
			res.status(500).send(erro.message);
		});
});


router.get('/tempo-real/:sensores_diversos', function (req, res, next) {
	console.log('Recuperando caminhões');

	//var sensores_diversos = req.body.sensores_diversos; // depois de .body, use o nome (name) do campo em seu formulário de login
	var sensores_diversos = req.params.sensores_diversos;

	let instrucaoSql = "";

	if (env == 'dev') {
		// abaixo, escreva o select de dados para o Workbench
		instrucaoSql = `select temperatura, umidade, DATE_FORMAT(dataDado,'%H:%i:%s') as momento_grafico, fkSensor from dadoSensor where fkSensor = ${sensores_diversos} order by idDado desc limit 1`;
	} else if (env == 'production') {
		// abaixo, escreva o select de dados para o SQL Server
		instrucaoSql = `select top 1 temperatura, umidade, FORMAT(dataDado,'HH:mm:ss') as momento_grafico, fkSensor from dadoSensor where fkSensor = ${sensores_diversos} order by idDado desc`;
	} else {
		console.log("\n\n\n\nVERIFIQUE O VALOR DE LINHA 1 EM APP.JS!\n\n\n\n")
	}

	console.log(instrucaoSql);

	sequelize.query(instrucaoSql, { type: sequelize.QueryTypes.SELECT })
		.then(resultado => {
			res.json(resultado[0]);
		}).catch(erro => {
			console.error(erro);
			res.status(500).send(erro.message);
		});
});

// estatísticas (max, min, média, mediana, quartis etc)
router.get('/estatisticas', function (req, res, next) {

	console.log(`Recuperando as estatísticas atuais`);

	const instrucaoSql = `select 
							max(temperatura) as temp_maxima, 
							min(temperatura) as temp_minima, 
							avg(temperatura) as temp_media,
							max(umidade) as umidade_maxima, 
							min(umidade) as umidade_minima, 
							avg(umidade) as umidade_media 
						from leitura`;


	sequelize.query(instrucaoSql, { type: sequelize.QueryTypes.SELECT })
		.then(resultado => {
			res.json(resultado[0]);
		}).catch(erro => {
			console.error(erro);
			res.status(500).send(erro.message);
		});

});

// GRAFICO ESTATICO PIZZA -- DASHBOARD INICIAL

router.get('/dashboard/:idCliente', function (req, res, next) {
	
	console.log('Recuperando as estatísticas atuais');

	const limite_linhas = 1;

	var idCliente = req.params.idCliente;

	let instrucaoSql = "";
	if (env == 'dev') {
		instrucaoSql = `select idSensor, temperatura, umidade from dadoSensor inner join Sensor on fkSensor = idSensor where fkCliente = ${idCliente} and idDado in (select max(idDado) from dadoSensor group by fkSensor);`;
	}


	sequelize.query(instrucaoSql, { type: sequelize.QueryTypes.SELECT })
		.then(resultado => {
			res.json(resultado);
		}).catch(erro => {
			console.error(erro);
			res.status(500).send(erro.message);
		});
});

router.get('/selec_sensores/:idCliente', function (req, res, next) {
	
	console.log('Recuperando as estatísticas atuais');

	var idCliente = req.params.idCliente;
	var nomeSensor = req.params.nomeSensor;

	let instrucaoSql = "";
	if (env == 'dev') {
		instrucaoSql = `select idSensor, nomeSensor, fkCliente from Sensor where fkCliente = ${idCliente};`;
	}


	sequelize.query(instrucaoSql, { type: sequelize.QueryTypes.SELECT })
		.then(resultado => {
			res.json(resultado);
		}).catch(erro => {
			console.error(erro);
			res.status(500).send(erro.message);
		});
});

router.get('/ocorrencia/:idCliente', function (req, res, next) {
	
	console.log('Recuperando as estatísticas atuais');

	var idCliente = req.params.idCliente;
	var nomeSensor = req.params.nomeSensor;

	let instrucaoSql = "";
	if (env == 'dev') {
		instrucaoSql = `select distinct(idSensor), nomeSensor, fkCliente from Sensor inner join dadoSensor on idSensor = fkSensor where (temperatura <= 11 or temperatura >= 30 and umidade <= 10 or umidade >= 90) and fkCliente = ${idCliente};`;
	}


	sequelize.query(instrucaoSql, { type: sequelize.QueryTypes.SELECT })
		.then(resultado => {
			res.json(resultado);
		}).catch(erro => {
			console.error(erro);
			res.status(500).send(erro.message);
		});
});

router.get('/detalhamento_sensor/:idSensor', function (req, res, next) {
	
	console.log('Recuperando as estatísticas atuais');

	const limite_linhas = 10;

	var idSensor = req.params.idSensor;
	var nomeSensor = req.params.nomeSensor;

	let instrucaoSql = "";
	if (env == 'dev') {
		instrucaoSql = `select temperatura, umidade, DATE_FORMAT(dataDado,'%H:%i:%s') as momento_grafico from dadoSensor inner join Sensor on fkSensor = idSensor where idSensor = ${idSensor} order by idDado desc limit ${limite_linhas};`;
	}


	sequelize.query(instrucaoSql, { type: sequelize.QueryTypes.SELECT })
		.then(resultado => {
			res.json(resultado);
		}).catch(erro => {
			console.error(erro);
			res.status(500).send(erro.message);
		});
});

module.exports = router;
