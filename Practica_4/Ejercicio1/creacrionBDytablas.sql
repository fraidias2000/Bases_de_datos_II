DROP DATABASE IF EXISTS practica3;
CREATE DATABASE practica3;

/* Se conecta a la base de datos */
\c practica3; 

--TABLA EMPLEADO
CREATE TABLE empleado (
	dni VARCHAR(10) PRIMARY KEY,
	nombre VARCHAR(50),
	apellido1 VARCHAR(50),
	apellido2 VARCHAR(50)
);

--TABLA ASIGNATURA
CREATE TABLE asignatura (
	codigoAsig SERIAL PRIMARY KEY,
	nombreAsig VARCHAR(100)
);
--TABLA PROYECTO INVESTIGADOR
CREATE TABLE proyectoInvestigador (
	refProyeccto SERIAL PRIMARY KEY,
	titulo VARCHAR(100),
	fechaInicio TIMESTAMP,
	fechaFin TIMESTAMP
);

--TABLA DOCENTE
CREATE TABLE docente (
	puestodocente VARCHAR(20),
	PRIMARY KEY (dni)
) INHERITS (empleado);

--TABLA INVESTIGADOR
CREATE TABLE investigador (
	orcid INT,
	PRIMARY KEY (dni)
) INHERITS (empleado);

--TABLA PARTICIPA
CREATE TABLE participa (
	idProyecto INT,
	idInvestigador VARCHAR(10),
	PRIMARY KEY (idProyecto, idInvestigador),
	FOREIGN KEY (idProyecto) REFERENCES proyectoInvestigador,
	FOREIGN KEY (idInvestigador) REFERENCES investigador(dni)
);

--TABLA IMPARTE
CREATE TABLE imparte (
	idAsignatura INT,
	idDocente VARCHAR(10),
	PRIMARY KEY (idAsignatura, idDocente),
	FOREIGN KEY (idAsignatura) REFERENCES asignatura,
	FOREIGN KEY (idDocente) REFERENCES docente(dni) 
);

--TABLA PDI
CREATE TABLE pdi (
	PRIMARY KEY (dni)
) INHERITS(docente, investigador);