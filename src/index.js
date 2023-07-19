const express = require('express');
const cors = require('cors');
const mysql = require('mysql2/promise');

// create and config server
const server = express();
server.use(cors());
server.use(express.json());

//connect to DDBB

async function getConnection() {
  const connection = await mysql.createConnection({
    host: 'localhost',
    database: 'netflix',
    user: 'root',
    password: '99ttzzrrEEqq',
  });
  await connection.connect();

  console.log(`Conexión establecida con la base de datos (identificador=${connection.threadId})`);

  return connection;
}

//endpoint movies
server.get('/movies', async (req, res) => {
  console.log('Pidiendo a la base de datos información de las películas.');
  let sql = 'SELECT * FROM movies';

  const connection = await getConnection();
  const [results] = await connection.query(sql);
  res.json({ success: true, movies: results });
  connection.end();
});

// endpoint filter genre
server.get('/movies?filter=genre', async (req, res) => {
  console.log('Pidiendo a la base de datos información de las películas.');
  let sql = 'SELECT * FROM movies WHERE genre = req.genre';

  const connection = await getConnection();
  const [results] = await connection.query(sql);
  res.json({ success: true, movies: results });
  connection.end();
});

// init express aplication
const serverPort = 4000;
server.listen(serverPort, () => {
  console.log(`Server listening at http://localhost:${serverPort}`);
});

//servidores de estaticos
const staticServerPathWeb = 'src/public-react';
server.use(express.static(staticServerPathWeb));

const staticServerPathImages = 'src/public-movies-images/';
server.use(express.static(staticServerPathImages));