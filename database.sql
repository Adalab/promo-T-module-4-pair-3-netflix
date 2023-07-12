-- T A B L A S
--crear tablas
CREATE TABLE `actors` (
  `idActor` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `year_birthday` date NOT NULL,
  PRIMARY KEY (`idActor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `movies` (
  `id_Movie` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `genre` varchar(45) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `category` varchar(45) NOT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Movie`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `idUsers` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `plan_details` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsers`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- V A L O R E S

--insertar valores en tablas
INSERT INTO `actors` (`idActor`,`name`,`lastname`,`country`,`year_birthday`) VALUES (1,'Tom','Hanks','Estados Unidos','1956-07-09');
INSERT INTO `actors` (`idActor`,`name`,`lastname`,`country`,`year_birthday`) VALUES (2,'Roberto','Benigni','Italia','1952-10-27');
INSERT INTO `actors` (`idActor`,`name`,`lastname`,`country`,`year_birthday`) VALUES (3,'John','Travolta','Estados Unidos','1954-02-18');

INSERT INTO `movies` (`id_Movie`,`title`,`genre`,`image`,`category`,`year`) VALUES (1,'Pulp fiction','Crimen.','https://pics.filmaffinity.com/pulp_fiction-210382116-large.jpg','Top 10',1994);
INSERT INTO `movies` (`id_Movie`,`title`,`genre`,`image`,`category`,`year`) VALUES (2,'La vita è bella','Comedia','https://pics.filmaffinity.com/la_vita_e_bella-646167341-mmed.jpg','Top 10',1994);
INSERT INTO `movies` (`id_Movie`,`title`,`genre`,`image`,`category`,`year`) VALUES (3,'Forrest Gump ','Comedia','https://pics.filmaffinity.com/forrest_gump-212765827-mmed.jpg','Top 10',NULL);

INSERT INTO `users` (`idUsers`,`user`,`password`,`name`,`email`,`plan_details`) VALUES (1,'laura_dev','laura','Laura','laura@gmail.com','Standard');
INSERT INTO `users` (`idUsers`,`user`,`password`,`name`,`email`,`plan_details`) VALUES (2,'maria_dev','maria','Maria','maria@gmail.com','Standard');
INSERT INTO `users` (`idUsers`,`user`,`password`,`name`,`email`,`plan_details`) VALUES (3,'ester_dev','ester','Ester','ester@gmail.com','Standard');


-- Q U E R I E S

--seleccionar todos los actores
Query: SELECT * FROM netflix.actors

--seleccionar nombre y apellido de actores de USA
Query: SELECT name, lastname FROM actors WHERE country = 'Estados Unidos'

--seleccionar todas las películas
Query: SELECT * FROM movies

--seleccionar todas las películas año mayor que 1990
Query: SELECT * FROM movies WHERE year > 1990

--seleccionar todas las películas con categoría 'Top 10'
Query: SELECT * FROM movies WHERE category = 'Top 10'

--seleccionar todos los usuarios con plan Standard
Query: SELECT * FROM users WHERE plan_details = 'Standard'

--borrar usuarios con nombre que empieza por M
DELETE FROM users WHERE name LIKE 'M%';


-- F O R E I G N   K E Y S 

--Crea una nueva tabla en tu base de datos que se llame rel_movies_users y que tenga los siguientes campos:
--id: ya sabes que debemos añadir la columna id a todas las tablas.
--idUsers: que debe ser del mismo tipo que el id de la tabla users.
--id_Movie: que debe ser del mismo tipo que el id de la tabla movies.
CREATE TABLE rel_movies_users (
id INT not null auto_increment primary key,
fkIdMovies INT,
fkIdUsers INT,
FOREIGN KEY (fkIdMovies) REFERENCES movies (id_Movie),
FOREIGN KEY (fkIdUsers) REFERENCES users (idUsers)
);

--A continuación rellena los datos de esta tabla para que por ejemplo:
--La usuaria con id 1 tenga como favoritas las películas con id 1 y 2.
--La usuaria con id 2 tenga como favorita solo la película con id 2.
INSERT INTO rel_movies_users (fkIdMovies, fkIdUsers)
VALUES ('1', '1'), ('2', '1'), ('2', '2');

--Crea una nueva tabla en tu base de datos que se llame rel_movies_actors y que tenga los siguientes campos:
--id: ya sabes que debemos añadir la columna id a todas las tablas.
--idActor: que debe ser del mismo tipo que el id de la tabla actors.
--id_Movie: que debe ser del mismo tipo que el id de la tabla movies.
CREATE TABLE rel_movies_actors (
id INT not null auto_increment primary key,
fkIdActor INT,
fkIdMovie INT,
FOREIGN KEY (fkIdActor) REFERENCES actors (idActor),
FOREIGN KEY (fkIdMovie) REFERENCES movies (id_Movie)
);

--A continuación rellena los datos de esta tabla.
INSERT INTO rel_movies_actors (fkIdActor, fkIdMovie)
VALUES ('1', '1'), ('2', '2'), ('3', '3');