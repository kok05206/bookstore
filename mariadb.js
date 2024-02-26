import mariadb from 'mysql2/promise';

const createConnection = async () => {
  return await mariadb.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'Book Store',
    dateStrings: true,
  });
};

export default createConnection;
