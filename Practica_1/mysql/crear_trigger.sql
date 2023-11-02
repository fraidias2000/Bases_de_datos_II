USE bd21_p1_mysql;
DROP TRIGGER IF EXISTS prevenir_eliminacion;
DELIMITER //

CREATE TRIGGER prevenir_eliminacion
	BEFORE DELETE ON estudio
	FOR EACH ROW
	BEGIN
		IF(@rows_being_deleted IS NULL)THEN
		SET @rows_being_deleted = 1;
	ELSE
		SET @rows_being_deleted = NULL;
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No es posible eliminar ningún contenido de la tabla Estudio';
	END IF;
END;//