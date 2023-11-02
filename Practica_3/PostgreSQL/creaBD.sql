--Borramos todo
DROP DATABASE IF EXISTS practica1;
DROP USER IF EXISTS 780336;

--Creamos el usuario
CREATE USER 780336 WITH PASSWORD '780336';
CREATE DATABASE practica1 WITH OWNER 780336;

--Damos todos los privilegios al usuario
GRANT all privileges on database practica1 to 780336;

