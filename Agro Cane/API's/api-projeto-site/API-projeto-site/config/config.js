module.exports = {
<<<<<<< HEAD
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
=======
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
    username: 'agrocane',
    password: 'agrocane',
    database: 'agrocane',
=======
    username: 'XXXXXXX',
    password: 'XXXXXXX',
    database: 'XXXXXXX',
>>>>>>> 81a8abdc66f64f4f04bf1da1b1468b6d22be623b
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
>>>>>>> 238cc6fc1c4681db25c529403be6b8a7270cc9d0
};