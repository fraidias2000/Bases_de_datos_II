DROP DATABASE IF EXISTS practica1;
CREATE DATABASE IF NOT EXISTS practica1;

DROP USER IF EXISTS '780336'@'%';

CREATE USER '780336'@'%' IDENTIFIED BY '780336';

GRANT ALL PRIVILEGES ON practica1.* TO '780336'@'%';
FLUSH PRIVILEGES;

SET GLOBAL log_bin_trust_function_creators=1; --Para poder crear triggers
SET GLOBAL local_infile=1; --Para poder importar CSV