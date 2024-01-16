const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root',
  database: 'Book Store',
  dateStrings: true,
});

module.exports = connection;
