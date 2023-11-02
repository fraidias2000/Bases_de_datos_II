-- Eliminación de las tablas
DROP TABLE IF EXISTS participa;
DROP TABLE IF EXISTS imparte;
DROP TABLE IF EXISTS pdi;
DROP TABLE IF EXISTS docente;
DROP TABLE IF EXISTS investigador;
DROP TABLE IF EXISTS empleado;
DROP TABLE IF EXISTS asignatura;
DROP TABLE IF EXISTS proyectoInvestigador;

-- Eliminación del tipo 
DROP TYPE IF EXISTS nombre_completo;

-- Creación de un dato estructurado para el almacén del nombre completo de un empleado
CREATE TYPE nombre_completo AS (
    nombre VARCHAR(100),
    apellido1 VARCHAR(100),
    apellido2 VARCHAR(100)
);

-- Creación de la tabla ASIGNATURA
CREATE TABLE asignatura (
    codigo SERIAL,
    nombre VARCHAR(200) NOT NULL,
    PRIMARY KEY(codigo)
);

-- Creación de la table EMPLEADO
CREATE TABLE empleado (
    dni VARCHAR(9) UNIQUE NOT NULL,
    nombre nombre_completo NOT NULL,
    PRIMARY KEY(dni)
);

-- Creación de la tabla DOCENTE que HEREDA de EMPLEADO
CREATE TABLE docente (
    -- Se debe duplicar la clave primaria a pesar de que se herede porque si no hay problemas para referenciar en la tabla imparte
    dni VARCHAR(9) NOT NULL,
    puestoDocente VARCHAR(100) NOT NULL,
    PRIMARY KEY (dni) 
) INHERITS (empleado); -- Se coloca INHERITS para indicar la HERENCIA

-- Creación de la tabla INVESTIGADOR que HEREDA de EMPLEADO
CREATE TABLE investigador (
    -- Se debe duplicar la clave primaria a pesar de que se herede porque si no hay problemas para referenciar en la tabla participa
    -- A pesar de tener que duplicarla no se puede poner que hace referencia a la tabla empleado porque se supone que ya se hace con la HERENCIA y si no se viola la clave foránea
    dni VARCHAR(9) NOT NULL,
    orcid VARCHAR(20) UNIQUE NOT NULL,
    PRIMARY KEY (dni)
) INHERITS (empleado); -- Se coloca INHERITS para indicar la HERENCIA

-- De la misma forma que como no se puede referenciar, si se añade un empleado tanto a docente como investigador sin añadirlo directamente a PDI saldrá duplicado en la tabla de Empleado y no saldrá en la de PDI

-- Creación de la tabla PDI que HEREDA de DOCENTE e INVESTIGADOR
CREATE TABLE pdi (
    dni VARCHAR(9) NOT NULL,
    PRIMARY KEY (dni)
) INHERITS (docente, investigador);

-- Creación de la table PROYECTO INVESTIGADOR
CREATE TABLE proyectoInvestigador (
    refProyecto SERIAL,
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
    FOREIGN KEY (refProyecto) REFERENCES proyectoInvestigador(refProyecto), 
    FOREIGN KEY (dniInvestigador) REFERENCES investigador(dni)
); 


-- INSERCIÓN DE JUEGO DE DATOS DE PRUEBA
-- 5 asignaturas
INSERT INTO asignatura (nombre) VALUES ('Matemáticas');
INSERT INTO asignatura (nombre) VALUES ('Lengua y Literatura');
INSERT INTO asignatura (nombre) VALUES ('Física');
INSERT INTO asignatura (nombre) VALUES ('Química');
INSERT INTO asignatura (nombre) VALUES ('Geografía e Historia');

-- 2 empleados
INSERT INTO empleado VALUES ('18444555B', ROW('Julia','Gracia','Perez'));
INSERT INTO empleado VALUES ('18444556C',ROW('Bruno','Marco','Linares'));

-- 2 docentes
INSERT INTO docente VALUES ('18444557D', ROW('Carlos','Gracia','Rodriguez'),'Profesor');
INSERT INTO docente VALUES ('18444558E',ROW('Estela','Gomez','Vicente'),'Catedrático');
INSERT INTO docente VALUES ('18444563K',ROW('Lucas','Herrero','Moya'),'Doctorado');
INSERT INTO docente VALUES ('18444562L',ROW('Rosaura','Gil','Fernandez'),'Catedrático');

-- 3 investigadores
INSERT INTO investigador VALUES ('18444559F',ROW('Lidia','Martin','Martinez'),'0000-0001-4624-8468');
INSERT INTO investigador VALUES ('18444560G',ROW('Ivan','Lopez','Sanchez'),'0000-0002-3513-7957');
INSERT INTO investigador VALUES ('18444562L',ROW('Rosaura','Gil','Fernandez'),'0000-0005-9845-5487');

-- 2 PDI
INSERT INTO pdi VALUES ('18444561H',ROW('Anastasia','Ruiz','Gonzalez'),'Democrático','0000-0003-9169-7537');
INSERT INTO pdi VALUES ('18444562J',ROW('Samuel','Alonso','Muñoz'),'Doctorado','0000-0004-2462-1241');

-- 5 proyectos de investigación
INSERT INTO proyectoInvestigador (titulo, fechaInicio, fechaFin) VALUES ('InventaTER','20-06-2001', '22-08-2020');
INSERT INTO proyectoInvestigador (titulo, fechaInicio, fechaFin) VALUES ('TERismo','16-07-2005', '03-07-2018');
INSERT INTO proyectoInvestigador (titulo, fechaInicio, fechaFin) VALUES ('SinTER','11-02-1998', '20-11-2000');
INSERT INTO proyectoInvestigador (titulo, fechaInicio, fechaFin) VALUES ('BuscaTER','13-01-2016', '24-12-2016');
INSERT INTO proyectoInvestigador (titulo, fechaInicio, fechaFin) VALUES ('ComparTER','25-09-2018', '14-11-2019');

-- 10 participa
INSERT INTO participa VALUES (1,'18444559F');
INSERT INTO participa VALUES (2,'18444559F');
INSERT INTO participa VALUES (3,'18444559F');
INSERT INTO participa VALUES (4,'18444559F');
INSERT INTO participa VALUES (5,'18444559F');
INSERT INTO participa VALUES (1,'18444560G');
INSERT INTO participa VALUES (2,'18444560G');
INSERT INTO participa VALUES (3,'18444560G');
INSERT INTO participa VALUES (4,'18444560G');
INSERT INTO participa VALUES (5,'18444562L');

-- 10 imparte
INSERT INTO imparte VALUES (1,'18444557D');
INSERT INTO imparte VALUES (1,'18444558E');
INSERT INTO imparte VALUES (1,'18444563K');
INSERT INTO imparte VALUES (2,'18444557D');
INSERT INTO imparte VALUES (2,'18444558E');
INSERT INTO imparte VALUES (2,'18444563K');
INSERT INTO imparte VALUES (2,'18444562L');
INSERT INTO imparte VALUES (3,'18444557D');
INSERT INTO imparte VALUES (3,'18444558E');
INSERT INTO imparte VALUES (4,'18444557D');
INSERT INTO imparte VALUES (5,'18444558E');

/* TRIGGER CON NECESIDAD DE MODIFICACIONES PARA PODER LOGRAR HACER REFERENCIACIÓN EN LAS CLAVES PRIMARIAS
Para su correcto funcionamiento, debería tener que eliminar elementos duplicados
-- Creación trigger para que no suponga un problema la referencia de docente o investigador a empleado
CREATE OR REPLACE FUNCTION doc_inv_trigger() RETURNS trigger AS $body$
    BEGIN
        -- Check that empname and salary are given
        IF (TG_OP = 'INSERT') THEN
            INSERT INTO empleado 
            VALUES (NEW.dni, NEW.nombre);
            RETURN NEW;
        END IF;
    END $body$
 LANGUAGE plpgsql;

CREATE TRIGGER doc_inv_trigger BEFORE INSERT ON docente
    FOR EACH ROW EXECUTE PROCEDURE doc_inv_trigger();

CREATE TRIGGER doc_inv_trigger BEFORE INSERT ON investigador
    FOR EACH ROW EXECUTE PROCEDURE doc_inv_trigger();

CREATE OR REPLACE FUNCTION pdi_trigger() RETURNS trigger AS $body$
    BEGIN
        -- Check that empname and salary are given
        IF (TG_OP = 'INSERT') THEN
            DROP TRIGGER IF EXISTS doc_inv_trigger ON investigador;
            INSERT INTO docente
            VALUES (NEW.dni, NEW.nombre, NEW.puestoDocente);
            INSERT INTO investigador
            VALUES (NEW.dni, NEW.nombre, NEW.orcid);
            CREATE TRIGGER doc_inv_trigger BEFORE INSERT ON investigador
                FOR EACH ROW EXECUTE PROCEDURE doc_inv_trigger();
            RETURN NEW;
        END IF;
        
    END $body$
 LANGUAGE plpgsql;

CREATE TRIGGER pdi_trigger BEFORE INSERT ON pdi
    FOR EACH ROW EXECUTE PROCEDURE pdi_trigger();*/