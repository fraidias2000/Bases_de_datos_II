/*INICIAMOS SESION COMO ROOT (mysql --local-infile=1 -u root -pbd23)*/

/* Creamos la BD*/
DROP DATABASE IF EXISTS practica1_780336;
CREATE DATABASE IF NOT EXISTS practica1_780336;

/* Creamos el usuario*/
DROP USER IF EXISTS '780336'@'localhost';
CREATE USER '780336'@'localhost' IDENTIFIED BY 'bd23';

/*Damos todos los privilegios de la base de datos "practica1_780336" al usuario "'780336'@'localhost'"*/
GRANT ALL PRIVILEGES ON practica1_780336.* TO '780336'@'localhost';
UPDATE mysql.user SET Super_Priv='Y' WHERE user='780336' AND host='localhost';
FLUSH PRIVILEGES;
/* Para poder importar los datos de los CSV */
set global local_infile=1;