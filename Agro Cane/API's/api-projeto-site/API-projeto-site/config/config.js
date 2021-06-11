module.exports = {
    // Insira aqui seus dados do banco NA NUVEM AZURE
    production: {
        // altere APENAS username, password, database e host.
        username: 'bandtec',
        password: '#Gfgrupo9',
        database: '211-1a-grupo9',
        host: '2111agrupo9.database.windows.net',
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
        username: 'trabalhogrupo',
        password: 'urubu100',
        database: 'TrabalhoAgro',
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

  // Insira aqui seus dados do banco NA NUVEM AZURE
  production: {
    // altere APENAS username, password, database e host.
    username: 'XXXXXXX',
    password: 'XXXXXXX',
    database: 'XXXXXXX',
    host: 'XXXXXXX',
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
    username: 'apaga_hoje',
    password: 'eunaosei',
    database: 'agroCane',
=======
    username: 'xxx',
    password: 'xxx',
    database: 'xxx',
>>>>>>> dccbcdb1c18778e94cb246d8849fd37062898ec4
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