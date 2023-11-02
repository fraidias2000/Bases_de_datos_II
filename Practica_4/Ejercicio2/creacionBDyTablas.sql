
/* Creación de tabla asignatura */
DROP TABLE asignatura CASCADE CONSTRAINTS;
CREATE TABLE asignatura (
	codigoAsig NUMBER,
	nombreAsig VARCHAR(100),
    PRIMARY KEY(codigoAsig)
);


/* Creación de tabla proyectoInvestigador */
DROP TABLE proyectoInvestigador CASCADE CONSTRAINTS;
CREATE TABLE proyectoInvestigador (
	refProyeccto NUMBER,
	titulo VARCHAR(100),
	fechaInicio TIMESTAMP,
	fechaFin TIMESTAMP,
    PRIMARY KEY (refProyeccto)
);

/* Creación del supertipo empleado */
DROP TYPE empleado FORCE;
CREATE OR REPLACE TYPE empleado AS OBJECT (
	dni VARCHAR(10),
	nombre VARCHAR(50),
	apellido1 VARCHAR(50),
	apellido2 VARCHAR(50)
) NOT FINAL;
/

/* Creación del subtipo docente que hereda del tipo empleado*/
DROP TYPE docente FORCE;
CREATE OR REPLACE TYPE docente UNDER empleado (
    puestodocente VARCHAR(20)
);
/

/* Creación del subtipo investigador  que hereda del tipo empleado */
DROP TYPE investigador FORCE;
CREATE OR REPLACE TYPE investigador UNDER empleado (
    orcid NUMBER
);
/

/* Creación de la tabla table_empleado */
DROP TABLE tabla_empleado CASCADE CONSTRAINTS;
CREATE TABLE tabla_empleado OF empleado(
    PRIMARY KEY (dni)
);

/* Creación de la tabla tabla_docente */
DROP TABLE tabla_docente CASCADE CONSTRAINTS;
CREATE TABLE tabla_docente OF docente(
    PRIMARY KEY (dni)
);

/* Creación de la tabla tabla_investigador */
DROP TABLE tabla_investigador CASCADE CONSTRAINTS;
CREATE TABLE tabla_investigador OF investigador(
    PRIMARY KEY (dni)
);

/* Creación de tabla participa */
DROP TABLE participa;
CREATE TABLE participa (
	idProyecto NUMBER,
	idInvestigador VARCHAR(10),
	PRIMARY KEY (idProyecto, idInvestigador),
	FOREIGN KEY (idProyecto) REFERENCES proyectoInvestigador,
	FOREIGN KEY (idInvestigador) REFERENCES tabla_investigador
);

/* Creación de tabla imparte */
DROP TABLE imparte;
CREATE TABLE imparte (
	idAsignatura NUMBER,
	idDocente VARCHAR(10),
	PRIMARY KEY (idAsignatura, idDocente),
	FOREIGN KEY (idAsignatura) REFERENCES asignatura,
	FOREIGN KEY (idDocente) REFERENCES tabla_docente
);

/* Creación de la tabla pdi
* Como oracle no soporta herencia multiple, pues se ha hecho la generalización/
* especialización tipica que se hace en las base de datos creando una relación 1 a 1 con las tablas padre
* y poniendo como clave primaria la clave ajena como si fuera una entidad débil */
DROP TABLE pdi;
CREATE TABLE pdi (
    dni VARCHAR(10),
    PRIMARY KEY(dni),
    FOREIGN KEY (dni) REFERENCES tabla_docente,
    FOREIGN KEY (dni) REFERENCES tabla_investigador
);