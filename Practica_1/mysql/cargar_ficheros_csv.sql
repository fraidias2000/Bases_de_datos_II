-- SET GLOBAL local_infile = 1;
-- SET GLOBAL log_bin_trust_function_creators=1;

USE bd21_p1_mysql;

-- Eliminación de las tablas por si no se ha eliminado la BD correctamente o solo se quiere ejecutar este script
DROP TABLE IF EXISTS acuerdo_movilidad;
DROP TABLE IF EXISTS alumno_egresado;
DROP TABLE IF EXISTS nota_corte;
DROP TABLE IF EXISTS ocupacion_oferta;
DROP TABLE IF EXISTS resultado_titulacion;


-- Creación tabla ACUERDOS MOVILIDAD e insercción de sus datos
CREATE TABLE acuerdo_movilidad(
    curso_academico SMALLINT NOT NULL,
    nombre_programa VARCHAR(50) NOT NULL,
    nombre_area_estudio VARCHAR(200) NOT NULL,
    centro VARCHAR(200) NOT NULL,
    in_out ENUM('IN','OUT') NOT NULL,
    nombre_idioma_nivel VARCHAR(100),
    pais_universidad VARCHAR(100),
    universidad_acuerdo VARCHAR(200),
    plazas_ofertadas SMALLINT,
    plazas_asignadas_out SMALLINT,
    fecha_actualizacion DATE
);

LOAD DATA LOCAL INFILE '/home/alumno/bd21/mysql/ficheros_csv/acuerdos_movilidad_2017.csv'
INTO TABLE acuerdo_movilidad
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, nombre_programa, nombre_area_estudio, centro, in_out, nombre_idioma_nivel, pais_universidad, universidad_acuerdo, plazas_ofertadas, plazas_asignadas_out, @fecha_actualizacion)
SET fecha_actualizacion = STR_TO_DATE(@fecha_actualizacion, '%d/%m/%Y');

LOAD DATA LOCAL INFILE '/home/alumno/bd21/mysql/ficheros_csv/acuerdos_movilidad_2018.csv'
INTO TABLE acuerdo_movilidad
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, nombre_programa, nombre_area_estudio, centro, in_out, nombre_idioma_nivel, pais_universidad, universidad_acuerdo, plazas_ofertadas, plazas_asignadas_out, @fecha_actualizacion)
SET fecha_actualizacion = STR_TO_DATE(@fecha_actualizacion, '%d/%m/%Y');

LOAD DATA LOCAL INFILE '/home/alumno/bd21/mysql/ficheros_csv/acuerdos_movilidad_2019.csv'
INTO TABLE acuerdo_movilidad
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, nombre_programa, nombre_area_estudio, centro, in_out, nombre_idioma_nivel, pais_universidad, universidad_acuerdo, plazas_ofertadas, plazas_asignadas_out, @fecha_actualizacion)
SET fecha_actualizacion = STR_TO_DATE(@fecha_actualizacion, '%d/%m/%Y');


-- Creación tabla ALUMNOS EGRESADOS e insercción de sus datos
CREATE TABLE alumno_egresado(
    curso_academico SMALLINT NOT NULL,
    localidad ENUM('Teruel','Huesca','Zaragoza','Almunia de Doña Godina (La)') NOT NULL,
    estudio VARCHAR(200) NOT NULL,
    tipo_estudio VARCHAR(200),
    tipo_egreso VARCHAR(200),
    sexo ENUM('Hombres','Mujeres'),
    alumnos_graduados SMALLINT,
    alumnos_interrumpen_estudios SMALLINT,
    alumnos_interrumpen_estudios_primer_anyo SMALLINT,
    alumnos_traladados_universidad SMALLINT,
    duracion_media_graduados FLOAT,
    tasa_eficiencia FLOAT,
    fecha_actualizacion DATE
);

LOAD DATA LOCAL INFILE '/home/alumno/bd21/mysql/ficheros_csv/alumnos_egresados_2017.csv'
INTO TABLE alumno_egresado
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, localidad, estudio, tipo_estudio, tipo_egreso,sexo, alumnos_graduados, alumnos_interrumpen_estudios, alumnos_interrumpen_estudios_primer_anyo, alumnos_traladados_universidad, duracion_media_graduados, tasa_eficiencia, @fecha_actualizacion)
SET fecha_actualizacion = STR_TO_DATE(@fecha_actualizacion, '%d/%m/%Y');

LOAD DATA LOCAL INFILE '/home/alumno/bd21/mysql/ficheros_csv/alumnos_egresados_2018.csv'
INTO TABLE alumno_egresado
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, localidad, estudio, tipo_estudio, tipo_egreso,sexo, alumnos_graduados, alumnos_interrumpen_estudios, alumnos_interrumpen_estudios_primer_anyo, alumnos_traladados_universidad, duracion_media_graduados, tasa_eficiencia, @fecha_actualizacion)
SET fecha_actualizacion = STR_TO_DATE(@fecha_actualizacion, '%d/%m/%Y');

LOAD DATA LOCAL INFILE '/home/alumno/bd21/mysql/ficheros_csv/alumnos_egresados_2019.csv'
INTO TABLE alumno_egresado
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, localidad, estudio, tipo_estudio, tipo_egreso,sexo, alumnos_graduados, alumnos_interrumpen_estudios, alumnos_interrumpen_estudios_primer_anyo, alumnos_traladados_universidad, duracion_media_graduados, tasa_eficiencia, @fecha_actualizacion)
SET fecha_actualizacion = STR_TO_DATE(@fecha_actualizacion, '%d/%m/%Y');


-- Creación tabla NOTAS CORTE e insercción de sus datos
CREATE TABLE nota_corte (
    curso_academico SMALLINT NOT NULL,
    estudio VARCHAR(200) NOT NULL,
    localidad ENUM('Teruel','Huesca','Zaragoza','Almunia de Doña Godina (La)') NOT NULL,
    centro VARCHAR(200),
    prelacion_convocatoria FLOAT,
    nota_corte_junio FLOAT,
    nota_corte_septiembre FLOAT,
    fecha_actualizacion DATE
);

LOAD DATA LOCAL INFILE '/home/alumno/bd21/mysql/ficheros_csv/notas_corte_2017.csv'
INTO TABLE nota_corte
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, estudio, localidad, centro, prelacion_convocatoria, nota_corte_junio,  nota_corte_septiembre, @fecha_actualizacion)
SET fecha_actualizacion = STR_TO_DATE(@fecha_actualizacion, '%d/%m/%Y');

LOAD DATA LOCAL INFILE '/home/alumno/bd21/mysql/ficheros_csv/notas_corte_2018.csv'
INTO TABLE nota_corte
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, estudio, localidad, centro, prelacion_convocatoria, nota_corte_junio,  nota_corte_septiembre, @fecha_actualizacion)
SET fecha_actualizacion = STR_TO_DATE(@fecha_actualizacion, '%d/%m/%Y');

LOAD DATA LOCAL INFILE '/home/alumno/bd21/mysql/ficheros_csv/notas_corte_2019.csv'
INTO TABLE nota_corte
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, estudio, localidad, centro, prelacion_convocatoria, nota_corte_junio,  nota_corte_septiembre, @fecha_actualizacion)
SET fecha_actualizacion = STR_TO_DATE(@fecha_actualizacion, '%d/%m/%Y');


-- Creación tabla OCUPACION OFERTA e insercción de sus datos
CREATE TABLE ocupacion_oferta(
    curso_academico SMALLINT NOT NULL,
    estudio VARCHAR(200) NOT NULL,
    localidad VARCHAR(200) NOT NULL,
    centro VARCHAR(200) NOT NULL,
    tipo_centro VARCHAR(100),
    tipo_estudio VARCHAR(50),
    plazas_ofertadas SMALLINT,
    plazas_matriculadas SMALLINT,
    plazas_solicitadas SMALLINT,
    indice_ocupacion FLOAT,
    fecha_actualizacion DATE
);

LOAD DATA LOCAL INFILE '/home/alumno/bd21/mysql/ficheros_csv/ocupacion_oferta_2017.csv'
INTO TABLE ocupacion_oferta
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, estudio, localidad, centro, tipo_centro, tipo_estudio, plazas_ofertadas, plazas_matriculadas, plazas_solicitadas, indice_ocupacion, @fecha_actualizacion)
SET fecha_actualizacion = STR_TO_DATE(@fecha_actualizacion, '%d/%m/%Y');

LOAD DATA LOCAL INFILE '/home/alumno/bd21/mysql/ficheros_csv/ocupacion_oferta_2018.csv'
INTO TABLE ocupacion_oferta
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, estudio, localidad, centro, tipo_centro, tipo_estudio, plazas_ofertadas, plazas_matriculadas, plazas_solicitadas, indice_ocupacion, @fecha_actualizacion)
SET fecha_actualizacion = STR_TO_DATE(@fecha_actualizacion, '%d/%m/%Y');

LOAD DATA LOCAL INFILE '/home/alumno/bd21/mysql/ficheros_csv/ocupacion_oferta_2019.csv'
INTO TABLE ocupacion_oferta
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, estudio, localidad, centro, tipo_centro, tipo_estudio, plazas_ofertadas, plazas_matriculadas, plazas_solicitadas, indice_ocupacion, @fecha_actualizacion)
SET fecha_actualizacion = STR_TO_DATE(@fecha_actualizacion, '%d/%m/%Y');


-- Creación tabla RESULTADOS TITULACIONES e insercción de sus datos
CREATE TABLE resultado_titulacion(
    curso_academico SMALLINT NOT NULL,
    centro VARCHAR(200) NOT NULL,
    estudio VARCHAR(200) NOT NULL,
    tipo_estudio VARCHAR(100),
    alumnos_matriculados SMALLINT,
    alumnos_nuevo_ingreso SMALLINT,
    plazas_ofertadas SMALLINT,
    alumnos_graduados SMALLINT,
    alumnos_adaptados_grado SMALLINT,
    alumnos_adaptados_grado_ni SMALLINT,
    alumnos_grado_titulado SMALLINT,
    alumnos_reconocimiento SMALLINT,
    alumnos_movilidad_entrada SMALLINT,
    alumnos_movilidad_salida SMALLINT,
    creditos_matriculados INT,
    creditos_reconocidos INT,
    duracion_media_graduados FLOAT,
    tasa_exito FLOAT,
    tasa_rendimiento FLOAT,
    tasa_eficiencia FLOAT,
    tasa_abandono FLOAT,
    tasa_graduacion FLOAT,
    fecha_actualizacion DATE
);

LOAD DATA LOCAL INFILE '/home/alumno/bd21/mysql/ficheros_csv/resultados_por_titulacion_2017.csv'
INTO TABLE resultado_titulacion
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, centro, estudio, tipo_estudio, alumnos_matriculados, alumnos_nuevo_ingreso, plazas_ofertadas, alumnos_graduados, alumnos_adaptados_grado, 
alumnos_adaptados_grado_ni, alumnos_grado_titulado, alumnos_reconocimiento, alumnos_movilidad_entrada, alumnos_movilidad_salida, creditos_matriculados, creditos_reconocidos, 
duracion_media_graduados, tasa_exito, tasa_rendimiento, tasa_eficiencia, tasa_abandono, tasa_graduacion, @fecha_actualizacion)
SET fecha_actualizacion = STR_TO_DATE(@fecha_actualizacion, '%d/%m/%Y');

LOAD DATA LOCAL INFILE '/home/alumno/bd21/mysql/ficheros_csv/resultados_por_titulacion_2018.csv'
INTO TABLE resultado_titulacion
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, centro, estudio, tipo_estudio, alumnos_matriculados, alumnos_nuevo_ingreso, plazas_ofertadas, alumnos_graduados, alumnos_adaptados_grado, alumnos_adaptados_grado_ni, alumnos_grado_titulado, alumnos_reconocimiento, alumnos_movilidad_entrada, alumnos_movilidad_salida, creditos_matriculados, creditos_reconocidos, duracion_media_graduados, tasa_exito, tasa_rendimiento, tasa_eficiencia, tasa_abandono, tasa_graduacion, @fecha_actualizacion)
SET fecha_actualizacion = STR_TO_DATE(@fecha_actualizacion, '%d/%m/%Y');

LOAD DATA LOCAL INFILE '/home/alumno/bd21/mysql/ficheros_csv/resultados_por_titulacion_2019.csv'
INTO TABLE resultado_titulacion
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, centro, estudio, tipo_estudio, alumnos_matriculados, alumnos_nuevo_ingreso, plazas_ofertadas, alumnos_graduados, alumnos_adaptados_grado, alumnos_adaptados_grado_ni, alumnos_grado_titulado, alumnos_reconocimiento, alumnos_movilidad_entrada, alumnos_movilidad_salida, creditos_matriculados, creditos_reconocidos, duracion_media_graduados, tasa_exito, tasa_rendimiento, tasa_eficiencia, tasa_abandono, tasa_graduacion, @fecha_actualizacion)
SET fecha_actualizacion = STR_TO_DATE(@fecha_actualizacion, '%d/%m/%Y');