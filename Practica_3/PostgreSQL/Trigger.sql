DROP TABLE IF EXISTS log_estudio;
CREATE TABLE log_estudio (
	id SERIAL PRIMARY KEY,
	operacion TEXT,
	usuario TEXT,
	fecha TIMESTAMP,
	cp_afectada INTEGER
);



CREATE OR REPLACE FUNCTION audit_estudio()
RETURNS TRIGGER
AS
$$
BEGIN
	INSERT INTO log_estudio(operacion, usuario, fecha, cp_afectada) VALUES(TG_OP, current_user, NOW(), OLD.id);
	RETURN NULL;
END
$$
Language plpgsql;

/* Se crea el trigger */
DROP TRIGGER IF EXISTS audit_log_estudio ON estudio;
CREATE TRIGGER audit_log_estudio
	AFTER UPDATE OR DELETE ON estudio
	FOR EACH ROW
	EXECUTE PROCEDURE audit_estudio();