/* Primer cerramos todas las sesiones para poder borrar la base de datos */
SELECT 
    pg_terminate_backend(pid) 
FROM 
    pg_stat_activity 
WHERE 
    pid <> pg_backend_pid()
    AND datname = 'practica1_780336';

/*Creamos la BD*/
DROP DATABASE IF EXISTS practica1_780336;
CREATE DATABASE practica1_780336;

/*Creamos el usuario*/
DROP USER IF EXISTS usuario_780336;
CREATE USER usuario_780336 WITH PASSWORD 'bd23';
GRANT ALL PRIVILEGES ON DATABASE practica1_780336 TO usuario_780336;
GRANT pg_read_server_files TO usuario_780336;


