/*Nos conectamos a la base de datos*/
use practica1_780336;

SET FOREIGN_KEY_CHECKS = 0; /* se dehabilita para poder borrar las tablas */
DROP TABLE IF EXISTS LOCALIDAD;
DROP TABLE IF EXISTS PAIS;
DROP TABLE IF EXISTS ESTUDIO;
DROP TABLE IF EXISTS CENTRO;
DROP TABLE IF EXISTS UNIVERSIDAD;
DROP TABLE IF EXISTS AREA_ESTUDIO;
DROP TABLE IF EXISTS NIVEL_IDIOMA;
DROP TABLE IF EXISTS CONVENIO;
DROP TABLE IF EXISTS RESULTADO;

SET FOREIGN_KEY_CHECKS = 1; /* Se vuelve a habilitar */

/*----------------------------------------------------------*/
CREATE TABLE LOCALIDAD(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45)
);

/*----------------------------------------------------------*/
CREATE TABLE CENTRO (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_LOCALIDAD INTEGER NOT NULL,
    FOREIGN KEY(id_localidad) REFERENCES LOCALIDAD(id)
);

/*----------------------------------------------------------*/
CREATE TABLE ESTUDIO(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

/*----------------------------------------------------------*/
CREATE TABLE PAIS (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45)
);

/*----------------------------------------------------------*/
CREATE TABLE UNIVERSIDAD (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_PAIS INTEGER NOT NULL,
    FOREIGN KEY(id_PAIS) REFERENCES PAIS(id)
);

/*----------------------------------------------------------*/
CREATE TABLE AREA_ESTUDIO (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)

);

/*----------------------------------------------------------*/
CREATE TABLE NIVEL_IDIOMA (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

/*----------------------------------------------------------*/
CREATE TABLE CONVENIO (
    in_out VARCHAR(5),
    anyo INTEGER,
    id_UNIVERSIDAD INTEGER,
    id_CENTRO INTEGER,
    id_AREA_ESTUDIO INTEGER,
    id_NIVEL_IDIOMA INTEGER,
    programa VARCHAR(10),
    plazas_ofertadas INTEGER,
    plazas_asignadas_out INTEGER,
    PRIMARY KEY (in_out, anyo, id_UNIVERSIDAD, id_CENTRO, id_AREA_ESTUDIO, id_NIVEL_IDIOMA),
    FOREIGN KEY(id_CENTRO) REFERENCES CENTRO(id) ON DELETE CASCADE,
    FOREIGN KEY(id_UNIVERSIDAD) REFERENCES UNIVERSIDAD(id), 
    FOREIGN KEY (id_AREA_ESTUDIO) REFERENCES AREA_ESTUDIO(id),
    FOREIGN KEY (id_NIVEL_IDIOMA) REFERENCES NIVEL_IDIOMA(id)
);

/*----------------------------------------------------------*/
CREATE TABLE RESULTADO (
    curso INTEGER,
    id_CENTRO INTEGER, 
    id_ESTUDIO INTEGER,
    plazas_ofertadas INTEGER,
    plazas_matriculadas INTEGER,
    plazas_solicitadas INTEGER,
    indice_ocupacion FLOAT,
    alumnos_graduados INTEGER,
    alumnos_con_reconocimiento INTEGER,
    alumnos_movilidad_entrada INTEGER,
    alumnos_movilidad_salida INTEGER,
    creditos_matriculados FLOAT,
    creditos_reconocidos FLOAT,
    duracion_media_graduados FLOAT,
    tasa_exito FLOAT,
    nota_corte_julio FLOAT,
    nota_corte_septiembre FLOAT,
    abandonos_voluntarios INTEGER,
    tasa_rendimiento FLOAT,
    tasa_evaluacion FLOAT,
    alumnos_evaluados INTEGER,
    alumnos_superados INTEGER,
    alumnos_presentados INTEGER,
    media_convocatorias_consumidas FLOAT,
    PRIMARY KEY (curso, id_CENTRO, id_ESTUDIO),
    FOREIGN KEY (id_CENTRO) REFERENCES CENTRO(id) ON DELETE CASCADE,
    FOREIGN KEY (id_ESTUDIO) REFERENCES ESTUDIO(id) ON DELETE CASCADE
);







