-- Funciones eliminación tablas/tipos
-- 		Se ejecuta el DROP pero si la tabla no existe lanzará una excepción
--		   Para que esta excepción no se lance se capturará y así se evitará que se pare la ejecución
-- 		Si existe la tabla no se ejecutará la excepción y seguirá el flujo normal
-- Fuente de la que se ha sacado: https://stackoverflow.com/questions/11296361/how-to-create-id-with-auto-increment-on-oracle

-- Funciones eliminación tablas/tipos
-- 		Se ejecuta el DROP pero si la tabla no existe lanzará una excepción
--		Para que esta excepción no se lance se capturará y así se evitará que se pare la ejecución
-- 		Si existe la tabla no se ejecutará la excepción y seguirá el flujo normal

-- Eliminación de las tablas
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE participa';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE imparte';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE pdi';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE docente';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE investigador';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE proyectoInvestigador';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE empleado';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE asignatura';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;

BEGIN
   EXECUTE IMMEDIATE 'DROP TYPE docente_t';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -4043 THEN
         RAISE;
      END IF;
END;

BEGIN
   EXECUTE IMMEDIATE 'DROP TYPE investigador_t';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -4043 THEN
         RAISE;
      END IF;
END;

BEGIN
   EXECUTE IMMEDIATE 'DROP TYPE empleado_t';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -4043 OR SQLCODE != 2303 THEN
         RAISE;
      END IF;
END;

-- Eliminación de los tipos
BEGIN
   EXECUTE IMMEDIATE 'DROP TYPE Tipo_Docente';
   EXECUTE IMMEDIATE 'DROP TYPE Tipo_investigador';
   EXECUTE IMMEDIATE 'DROP TYPE Tipo_Empleado';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -4043 THEN
         RAISE;
      END IF;
END;

-- Vaciar la papelera
PURGE RECYCLEBIN;

-- Creación de la tabla ASIGNATURA
CREATE TABLE asignatura (
   codigo INT,
   nombre VARCHAR(200),
   PRIMARY KEY(codigo)
);


-- Creación del tipo EMPLEADO como objeto
CREATE TYPE empleado_t AS OBJECT (
   dni VARCHAR(9),
   nombre VARCHAR(100),
   apellido1 VARCHAR(100),
   apellido2 VARCHAR(100)
)NOT FINAL; -- Se pone el NOT FINAL para que puedan crearse subtipos porque por defecto es FINAL
-- Creación de la tabla EMPLEADO que es de tipo EMPLEADO_T
CREATE TABLE empleado OF empleado_t (
    PRIMARY KEY(dni)
);


-- Creación del tipo DOCENTE que HEREDA de EMPLEADO_T
CREATE TYPE docente_t UNDER empleado_t (
	puestoDocente VARCHAR(100)
); -- Como de este tipo NO se van a heredar más NO es necesario poner el NOT FINAL
-- Creación de la tabla DOCENTE que es de tipo DOCENTE_T
CREATE TABLE docente OF docente_t (
	PRIMARY KEY (DNI)
); 


-- Creación de la tipo INVESTIGADOR que HEREDA de EMPLEADO_T
CREATE TYPE investigador_t UNDER empleado_t (
	orcid VARCHAR(20)
);
-- Creación de la tabla INVESTIGADOR que es de tipo INVESTIGADOR_T
CREATE TABLE investigador OF investigador_t (
	PRIMARY KEY (DNI)
); -- Como de este tipo NO se van a heredar más NO es necesario poner el NOT FINAL


-- Oracle NO soporta herencia MÚLTIPLE, solo soporta herencia simple
-- Por lo tanto, no se puede crear pdi, y se va a poner que hereda de investigador aunque podría ponerse docente
-- Se iba a declarar codDocente como clave ajena a Docente para tratar de hacer la relación por ese lado ya que no se puede hacer la herencia
-- Creación del tipo PDI que HEREDA de INVESTIGADOR
CREATE TYPE pdi_t UNDER investigador_t (
	dniDocente VARCHAR(9)
)
-- Creación de la tabla PDI que es de tipo PDI_T
CREATE TABLE pdi OF pdi_t(
   PRIMARY KEY (dni, dniDocente),
   FOREIGN KEY (dniDocente) REFERENCES docente(dni)
);

-- Creación de la table PROYECTO INVESTIGADOR
CREATE TABLE proyectoInvestigador (
   refProyecto INT NOT NULL,
   titulo VARCHAR (100) NOT NULL,
   fechaInicio DATE NOT NULL,
   fechaFin DATE,
   PRIMARY KEY(refProyecto)
);

-- Creación de la table IMPARTE
CREATE TABLE imparte (
   codAsig INT NOT NULL,
   dniDocente VARCHAR(9) NOT NULL,
   PRIMARY KEY(codAsig, dniDocente),
   FOREIGN KEY (codAsig) REFERENCES asignatura(codigo),
   FOREIGN KEY (dniDocente) REFERENCES docente(dni)
);

-- Creación de la table PARTICIPA
CREATE TABLE participa (
   refProyecto INT NOT NULL,
   dniInvestigador VARCHAR(9) NOT NULL,
   PRIMARY KEY (refProyecto, dniInvestigador),
   CONSTRAINT refProyecto FOREIGN KEY (refProyecto) REFERENCES proyectoInvestigador(refProyecto),
   FOREIGN KEY (dniInvestigador) REFERENCES investigador(dni)
); 