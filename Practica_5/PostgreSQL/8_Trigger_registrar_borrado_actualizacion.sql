DROP TABLE IF EXISTS log_actualizacion_borrado;
DROP TRIGGER IF EXISTS log_trigger ON AREA_ESTUDIO;
DROP TRIGGER IF EXISTS log_trigger ON CENTRO;
DROP TRIGGER IF EXISTS log_trigger ON CONVENIO;
DROP TRIGGER IF EXISTS log_trigger ON ESTUDIO;
DROP TRIGGER IF EXISTS log_trigger ON NIVEL_IDIOMA;
DROP TRIGGER IF EXISTS log_trigger ON LOCALIDAD;
DROP TRIGGER IF EXISTS log_trigger ON PAIS;
DROP TRIGGER IF EXISTS log_trigger ON RESULTADO;
DROP TRIGGER IF EXISTS log_trigger ON UNIVERSIDAD;

CREATE TABLE log_actualizacion_borrado(
  operacion VARCHAR(100),
  usuario VARCHAR(100),
  fecha DATE,
  clave_primaria_afectada VARCHAR(100)
);

CREATE OR REPLACE FUNCTION log() RETURNS trigger AS $body$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO log_actualizacion_borrado
        VALUES (TG_OP, session_user::TEXT, NOW(), ROW(OLD.*));
        RETURN OLD;
    ELSIF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN
        INSERT INTO log_actualizacion_borrado
        VALUES (TG_OP, session_user::TEXT, NOW(), ROW(NEW.*));
        RETURN NEW;
    ELSE
        RAISE WARNING '[LOG] - Other action occurred: %, at %',TG_OP,now();
        RETURN NULL;
    END IF;

END $body$
LANGUAGE plpgsql;

/*Trigger registro actualización y borrado en la tabla AREA ESTUDIO*/
CREATE TRIGGER log_trigger
  BEFORE INSERT OR UPDATE OR DELETE ON AREA_ESTUDIO
  FOR EACH ROW EXECUTE PROCEDURE log();


/*Trigger registro actualización y borrado en la tabla CENTRO*/
CREATE TRIGGER log_trigger
  BEFORE INSERT OR UPDATE OR DELETE ON CENTRO
  FOR EACH ROW EXECUTE PROCEDURE log();


/*Trigger registro actualización y borrado en la tabla CONVENIO*/
CREATE TRIGGER log_trigger
  BEFORE INSERT OR UPDATE OR DELETE ON CONVENIO
  FOR EACH ROW EXECUTE PROCEDURE log();


/*Trigger registro actualización y borrado en la tabla ESTUDIO*/
CREATE TRIGGER log_trigger
  BEFORE INSERT OR UPDATE OR DELETE ON ESTUDIO
  FOR EACH ROW EXECUTE PROCEDURE log();


/*Trigger registro actualización y borrado en la tabla NIVEL IDIOMA*/
CREATE TRIGGER log_trigger
  BEFORE INSERT OR UPDATE OR DELETE ON NIVEL_IDIOMA
  FOR EACH ROW EXECUTE PROCEDURE log();


/*Trigger registro actualización y borrado en la tabla LOCALIDAD*/
CREATE TRIGGER log_trigger
  BEFORE INSERT OR UPDATE OR DELETE ON LOCALIDAD
  FOR EACH ROW EXECUTE PROCEDURE log();


/*Trigger registro actualización y borrado en la tabla PAIS*/
CREATE TRIGGER log_trigger
  BEFORE INSERT OR UPDATE OR DELETE ON PAIS
  FOR EACH ROW EXECUTE PROCEDURE log();


/*Trigger registro actualización y borrado en la tabla RESULTADO*/
CREATE TRIGGER log_trigger
  BEFORE INSERT OR UPDATE OR DELETE ON RESULTADO
  FOR EACH ROW EXECUTE PROCEDURE log();


/*Trigger registro actualización y borrado en la tabla UNIVERSIDAD*/
CREATE TRIGGER log_trigger
  BEFORE INSERT OR UPDATE OR DELETE ON UNIVERSIDAD
  FOR EACH ROW EXECUTE PROCEDURE log();