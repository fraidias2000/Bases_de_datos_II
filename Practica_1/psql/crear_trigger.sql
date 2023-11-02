-- https://wiki.postgresql.org/wiki/Audit_trigger
DROP TABLE IF EXISTS log;
DROP TRIGGER IF EXISTS log_trigger ON acuerdo_movilidad;
DROP TRIGGER IF EXISTS log_trigger ON alumno_egresado;
DROP TRIGGER IF EXISTS log_trigger ON area_estudio;
DROP TRIGGER IF EXISTS log_trigger ON centro;
DROP TRIGGER IF EXISTS log_trigger ON convenio;
DROP TRIGGER IF EXISTS log_trigger ON estudio;
DROP TRIGGER IF EXISTS log_trigger ON idioma;
DROP TRIGGER IF EXISTS log_trigger ON localidad;
DROP TRIGGER IF EXISTS log_trigger ON nota_corte;
DROP TRIGGER IF EXISTS log_trigger ON ocupacion_oferta;
DROP TRIGGER IF EXISTS log_trigger ON pais;
DROP TRIGGER IF EXISTS log_trigger ON resultado;
DROP TRIGGER IF EXISTS log_trigger ON resultado_titulacion;
DROP TRIGGER IF EXISTS log_trigger ON universidad_acuerdo;

CREATE TABLE log(
  operacion VARCHAR(50),
  usuario VARCHAR(50),
  fecha DATE,
  clave_primaria_afectada VARCHAR(100)
);

CREATE OR REPLACE FUNCTION log() RETURNS trigger AS $body$
BEGIN
    IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN
        INSERT INTO log
        VALUES (TG_OP, session_user::TEXT, NOW(), ROW(NEW.*));
        RETURN NEW;

    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO log
        VALUES (TG_OP, session_user::TEXT, NOW(), ROW(OLD.*));
        RETURN OLD;
    ELSE
        RAISE WARNING '[LOG] - Other action occurred: %, at %',TG_OP,now();
        RETURN NULL;
    END IF;

END $body$
LANGUAGE plpgsql;

CREATE TRIGGER log_trigger
  BEFORE INSERT OR UPDATE OR DELETE ON acuerdo_movilidad
  FOR EACH ROW EXECUTE PROCEDURE log();

CREATE TRIGGER log_trigger
  BEFORE INSERT OR UPDATE OR DELETE ON alumno_egresado
  FOR EACH ROW EXECUTE PROCEDURE log();

CREATE TRIGGER log_trigger
  BEFORE INSERT OR UPDATE OR DELETE ON area_estudio
  FOR EACH ROW EXECUTE PROCEDURE log();

CREATE TRIGGER log_trigger
  BEFORE INSERT OR UPDATE OR DELETE ON centro
  FOR EACH ROW EXECUTE PROCEDURE log();

CREATE TRIGGER log_trigger
  BEFORE INSERT OR UPDATE OR DELETE ON convenio
  FOR EACH ROW EXECUTE PROCEDURE log();

CREATE TRIGGER log_trigger
  BEFORE INSERT OR UPDATE OR DELETE ON estudio
  FOR EACH ROW EXECUTE PROCEDURE log();

CREATE TRIGGER log_trigger
  BEFORE INSERT OR UPDATE OR DELETE ON idioma
  FOR EACH ROW EXECUTE PROCEDURE log();

CREATE TRIGGER log_trigger
  BEFORE INSERT OR UPDATE OR DELETE ON localidad
  FOR EACH ROW EXECUTE PROCEDURE log();

CREATE TRIGGER log_trigger
  BEFORE INSERT OR UPDATE OR DELETE ON nota_corte
  FOR EACH ROW EXECUTE PROCEDURE log();

CREATE TRIGGER log_trigger
  BEFORE INSERT OR UPDATE OR DELETE ON ocupacion_oferta
  FOR EACH ROW EXECUTE PROCEDURE log();

CREATE TRIGGER log_trigger
  BEFORE INSERT OR UPDATE OR DELETE ON pais
  FOR EACH ROW EXECUTE PROCEDURE log();

CREATE TRIGGER log_trigger
  BEFORE INSERT OR UPDATE OR DELETE ON resultado_titulacion
  FOR EACH ROW EXECUTE PROCEDURE log();

CREATE TRIGGER log_trigger
  BEFORE INSERT OR UPDATE OR DELETE ON universidad_acuerdo
  FOR EACH ROW EXECUTE PROCEDURE log();