DROP DATABASE IF EXISTS bd21_p1_mysql;

CREATE DATABASE bd21_p1_mysql;

DROP USER IF EXISTS usuario@localhost;
CREATE USER 'usuario'@'localhost' IDENTIFIED BY 'P4sSw0Rd@';

GRANT ALL PRIVILEGES ON bd21_p1_mysql.* TO 'usuario'@'localhost';
UPDATE mysql.user SET Super_Priv='Y' WHERE user='usuario' AND host='localhost';
FLUSH PRIVILEGES;