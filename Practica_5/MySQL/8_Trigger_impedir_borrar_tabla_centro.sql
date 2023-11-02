/*Nos conectamos a la base de datos*/
use practica1_780336;

DROP TRIGGER IF EXISTS trg_impedir_borrado_centro; 
DELIMITER //
CREATE TRIGGER trg_impedir_borrado_centro BEFORE DELETE ON CENTRO
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pueden borrar registros de la tabla CENTRO.';
END;//
