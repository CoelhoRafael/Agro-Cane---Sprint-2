module.exports = {
  // Insira aqui seus dados do banco NA NUVEM AZURE
  production: {
    // altere APENAS username, password, database e host.
    username: 'SEU_USUARIO',
    password: 'SUA_SENHA',
    database: 'NOME DO SEU BD',
    host: 'LINK PARA SEU BD, ALGO COMO minhadatabase.database.windows.net',
    dialect: 'mssql',
    xuse_env_variable: 'DATABASE_URL',
    dialectOptions: {
      options: {
        encrypt: true
      }
    },
    pool: { 
      max: 5,
      min: 1,
      acquire: 5000,
      idle: 30000,
      connectTimeout: 5000
    }
  },

  // Insira aqui seus dados do banco LOCAL - MySQL Workbench
  dev: {
    // altere APENAS username, password e database.
<<<<<<< HEAD
<<<<<<< HEAD
    username: 'usuario teste pra api',
    password: 'urubu100*',
    database: 'AgroCane',
=======
    username: 'Dev',
    password: 'bandtec',
    database: 'agroCane',
>>>>>>> 1be3a89f786ad9875e6f2800bfcbf827a2ccb67d
=======
    username: 'Dev',
    password: 'bandtec',
    database: 'agroCane',
>>>>>>> 7ef3aaf09c96701e9c5b9a2d7bb0bd748751829b
    host: 'localhost',
    dialect: 'mysql',
    xuse_env_variable: 'DATABASE_URL',
    dialectOptions: {
      options: {
        encrypt: true
      }
    },
    pool: { 
      max: 5,
      min: 1,
      acquire: 5000,
      idle: 30000,
      connectTimeout: 5000
    }
  },
};