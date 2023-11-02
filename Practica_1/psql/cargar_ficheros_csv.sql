-- Eliminación de las tablas por si no se ha eliminado la BD correctamente o solo se quiere ejecutar este script
DROP TABLE IF EXISTS acuerdo_movilidad;
DROP TABLE IF EXISTS alumno_egresado;
DROP TABLE IF EXISTS nota_corte;
DROP TABLE IF EXISTS ocupacion_oferta;
DROP TABLE IF EXISTS resultado_titulacion;

DROP TYPE IF EXISTS enum_localidad;
DROP TYPE IF EXISTS enum_in_out;
DROP TYPE IF EXISTS enum_sexo;
DROP TYPE IF EXISTS enum_programa_movilidad;

CREATE TYPE enum_localidad AS ENUM ('Teruel','Huesca','Zaragoza','Almunia de Doña Godina (La)');
CREATE TYPE enum_in_out AS ENUM ('IN','OUT');
CREATE TYPE enum_sexo AS ENUM('Hombres','Mujeres','Desconocido');
CREATE TYPE enum_programa_movilidad AS ENUM('ERASMUS','SICUE');

-- Creación tabla ACUERDOS MOVILIDAD e insercción de sus datos
CREATE TABLE acuerdo_movilidad(
    curso_academico SMALLINT NOT NULL,
    nombre_programa enum_programa_movilidad NOT NULL,
    nombre_area_estudio VARCHAR(200) NOT NULL,
    centro VARCHAR(200) NOT NULL,
    in_out enum_in_out NOT NULL,
    nombre_idioma_nivel VARCHAR(100),
    pais_universidad VARCHAR(100),
    universidad_acuerdo VARCHAR(200),
    plazas_ofertadas SMALLINT,
    plazas_asignadas_out SMALLINT,
    fecha_actualizacion DATE
);
\copy acuerdo_movilidad FROM 'acuerdos_movilidad_2017.csv' DELIMITER ';' CSV HEADER;
\copy acuerdo_movilidad FROM 'acuerdos_movilidad_2018.csv' DELIMITER ';' CSV HEADER;
\copy acuerdo_movilidad FROM 'acuerdos_movilidad_2019.csv' DELIMITER ';' CSV HEADER;


-- Creación tabla ALUMNOS EGRESADOS e insercción de sus datos
CREATE TABLE alumno_egresado(
    curso_academico SMALLINT NOT NULL,
    localidad enum_localidad NOT NULL,
    estudio VARCHAR(200) NOT NULL,
    tipo_estudio VARCHAR(200),
    tipo_egreso VARCHAR(200),
    sexo enum_sexo,
    alumnos_graduados SMALLINT,
    alumnos_interrumpen_estudios SMALLINT,
    alumnos_interrumpen_estudios_primer_anyo SMALLINT,
    alumnos_traladados_universidad SMALLINT,
    duracion_media_graduados FLOAT,
    tasa_eficiencia FLOAT,
    fecha_actualizacion DATE
);
\copy alumno_egresado FROM 'alumnos_egresados_2017.csv' DELIMITER ';' CSV HEADER;
\copy alumno_egresado FROM 'alumnos_egresados_2018.csv' DELIMITER ';' CSV HEADER;
\copy alumno_egresado FROM 'alumnos_egresados_2019.csv' DELIMITER ';' CSV HEADER;


-- Creación tabla NOTAS CORTE e insercción de sus datos
CREATE TABLE nota_corte (
    curso_academico SMALLINT NOT NULL,
    estudio VARCHAR(200) NOT NULL,
    localidad enum_localidad NOT NULL,
    centro VARCHAR(200),
    prelacion_convocatoria FLOAT,
    nota_corte_junio FLOAT,
    nota_corte_septiembre FLOAT,
    fecha_actualizacion DATE
);
\copy nota_corte FROM 'notas_corte_2017.csv' DELIMITER ';' CSV HEADER;
\copy nota_corte FROM 'notas_corte_2018.csv' DELIMITER ';' CSV HEADER;
\copy nota_corte FROM 'notas_corte_2019.csv' DELIMITER ';' CSV HEADER;


-- Creación tabla OCUPACION OFERTA e insercción de sus datos
CREATE TABLE ocupacion_oferta(
    curso_academico SMALLINT NOT NULL,
    estudio VARCHAR(200) NOT NULL,
    localidad enum_localidad NOT NULL,
    centro VARCHAR(200) NOT NULL,
    tipo_centro VARCHAR(100),
    tipo_estudio VARCHAR(50),
    plazas_ofertadas SMALLINT,
    plazas_matriculadas SMALLINT,
    plazas_solicitadas SMALLINT,
    indice_ocupacion FLOAT,
    fecha_actualizacion DATE
);
\copy ocupacion_oferta FROM 'ocupacion_oferta_2017.csv' DELIMITER ';' CSV HEADER;
\copy ocupacion_oferta FROM 'ocupacion_oferta_2018.csv' DELIMITER ';' CSV HEADER;
\copy ocupacion_oferta FROM 'ocupacion_oferta_2019.csv' DELIMITER ';' CSV HEADER;


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
\copy resultado_titulacion FROM 'resultados_por_titulacion_2017.csv' DELIMITER ';' CSV HEADER;
\copy resultado_titulacion FROM 'resultados_por_titulacion_2018.csv' DELIMITER ';' CSV HEADER;
\copy resultado_titulacion FROM 'resultados_por_titulacion_2019.csv'DELIMITER ';' CSV HEADER;