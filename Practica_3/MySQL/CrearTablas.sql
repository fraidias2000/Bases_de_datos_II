SET FOREIGN_KEY_CHECKS = 0; /* se dehabilita para poder borrar las tablas */

DROP TABLE IF EXISTS localidad;
CREATE TABLE localidad (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45)
);

DROP TABLE IF EXISTS pais;
CREATE TABLE pais (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45)
);

DROP TABLE IF EXISTS estudio;
CREATE TABLE IF NOT EXISTS estudio(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

DROP TABLE IF EXISTS centro;
CREATE TABLE centro (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_localidad INTEGER NOT NULL,
    FOREIGN KEY(id_localidad) REFERENCES localidad(id)
);

DROP TABLE IF EXISTS universidad;
CREATE TABLE universidad (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_pais INTEGER NOT NULL,
    FOREIGN KEY(id_pais) REFERENCES pais(id)
);

DROP TABLE IF EXISTS centro_estudio;
CREATE TABLE centro_estudio (
    curso INTEGER,
    id_centro INTEGER, 
    id_estudio INTEGER,
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
    PRIMARY KEY (curso, id_centro, id_estudio),
    FOREIGN KEY (id_centro) REFERENCES centro(id) ON DELETE CASCADE,
    FOREIGN KEY (id_estudio) REFERENCES estudio(id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS area_estudio;
CREATE TABLE area_estudio (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)

);

DROP TABLE IF EXISTS nivel_idioma;
CREATE TABLE nivel_idioma (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

DROP TABLE IF EXISTS convenio_movilidad;
CREATE TABLE convenio_movilidad (
    in_out VARCHAR(5),
    anyo INTEGER,
    id_universidad INTEGER,
    id_centro INTEGER,
    id_area_estudio INTEGER,
    id_nivel_idioma INTEGER,
    programa VARCHAR(10),
    plazas_ofertadas INTEGER,
    plazas_asignadas_out INTEGER,
    PRIMARY KEY (in_out, anyo, id_universidad, id_centro, id_area_estudio, id_nivel_idioma),
    FOREIGN KEY(id_centro) REFERENCES centro(id) ON DELETE CASCADE,
    FOREIGN KEY(id_universidad) REFERENCES universidad(id), 
    FOREIGN KEY (id_area_estudio) REFERENCES area_estudio(id),
    FOREIGN KEY (id_nivel_idioma) REFERENCES nivel_idioma(id)
);

SET FOREIGN_KEY_CHECKS = 1; /* Se vuelve a habilitar */