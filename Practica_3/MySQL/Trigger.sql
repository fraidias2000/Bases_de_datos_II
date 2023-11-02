DROP TRIGGER IF EXISTS on_borrar_centro;

delimiter $$
CREATE TRIGGER on_borrar_centro BEFORE DELETE ON centro
FOR EACH ROW  
BEGIN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede borrar en la tabla centro';
END $$
delimiter ;