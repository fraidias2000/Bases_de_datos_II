DROP TABLE IF EXISTS oferta_ocupacion_plazas_tmp;
CREATE TABLE oferta_ocupacion_plazas_tmp (
    año INTEGER,
    estudio TEXT,
    localidad TEXT,
    centro TEXT,
    tipo_centro TEXT,
    tipo_estudio TEXT,
    plazas_ofertadas INTEGER,
    plazas_matriculadas INTEGER,
    plazas_solicitadas INTEGER,
    indice_ocupacion numeric,
    fecha_actualizacion DATE
);

DROP TABLE IF EXISTS resultados_titulaciones_tmp;
CREATE TABLE resultados_titulaciones_tmp (
    año INTEGER,
    centro TEXT,
    estudio TEXT,
    TIPO_ESTUDIO TEXT,
    ALUMNOS_MATRICULADOS INTEGER,
    ALUMNOS_NUEVO_INGRESO INTEGER,
    PLAZAS_OFERTADAS INTEGER,
    ALUMNOS_GRADUADOS INTEGER,
    ALUMNOS_ADAPTA_GRADO_MATRI INTEGER,
    ALUMNOS_ADAPTA_GRADO_MATRI_NI INTEGER,
    ALUMNOS_ADAPTA_GRADO_TITULADO INTEGER,
    ALUMNOS_CON_RECONOCIMIENTO INTEGER,
    ALUMNOS_MOVILIDAD_ENTRADA INTEGER,
    ALUMNOS_MOVILIDAD_SALIDA INTEGER,
    CREDITOS_MATRICULADOS NUMERIC,
    CREDITOS_RECONOCIDOS NUMERIC,
    DURACION_MEDIA_GRADUADOS NUMERIC,
    TASA_EXITO NUMERIC,
    TASA_RENDIMIENTO NUMERIC,
    TASA_EFICIENCIA NUMERIC,
    TASA_ABANDONO NUMERIC,
    TASA_GRADUACION NUMERIC,
    FECHA_ACTUALIZACION DATE
);

DROP TABLE IF EXISTS movilidad_tmp;
CREATE TABLE movilidad_tmp (
    año Integer,
    NOMBRE_PROGRAMA_MOVILIDAD TEXT,
    NOMBRE_AREA_ESTUDIOS_MOV  TEXT,
    CENTRO TEXT,
    IN_OUT TEXT,
    NOMBRE_IDIOMA_NIVEL_MOVILIDAD TEXT,
    PAIS_UNIVERSIDAD_ACUERDO TEXT,
    UNIVERSIDAD_ACUERDO TEXT,
    PLAZAS_OFERTADAS_ALUMNOS INTEGER,
    PLAZAS_ASIGNADAS_ALUMNOS_OUT INTEGER,
    FECHA_ACTUALIZACION DATE
);

DROP TABLE IF EXISTS alumnos_egresados_tmp;
CREATE TABLE alumnos_egresados_tmp (
    año INTEGER,
    LOCALIDAD TEXT,
    ESTUDIO TEXT,
    TIPO_ESTUDIO TEXT,
    TIPO_EGRESO TEXT,
    SEXO TEXT,
    ALUMNOS_GRADUADOS INTEGER,
    ALUMNOS_INTERRUMPEN_ESTUDIOS INTEGER,
    ALUMNOS_INTERRUMPEN_EST_ANO1 INTEGER,
    ALUMNOS_TRASLADAN_OTRA_UNIV INTEGER,
    DURACION_MEDIA_GRADUADOS NUMERIC,
    TASA_EFICIENCIA NUMERIC,
    FECHA_ACTUALIZACION DATE
);

DROP TABLE IF EXISTS notas_corte_tmp;
CREATE TABLE notas_corte_tmp (
    año INTEGER,
    ESTUDIO TEXT,
    LOCALIDAD TEXT,
    CENTRO TEXT,
    PRELA_CONVO_NOTA_DEF TEXT,
    NOTA_CORTE_DEFINITIVA_JULIO NUMERIC,
    NOTA_CORTE_DEFINITIVA_SEPTIEMBRE NUMERIC,
    FECHA_ACTUALIZACION DATE
);

--TABLA OCUPACION OFERTA
\copy ocupacion_oferta FROM '/home/alumno/Descargas/ocupacion_oferta_2019.csv' DELIMITER ';' CSV HEADER;
\copy ocupacion_oferta FROM '/home/alumno/Descargas/ocupacion_oferta_2020.csv' DELIMITER ';' CSV HEADER;
\copy ocupacion_oferta FROM '/home/alumno/Descargas/ocupacion_oferta_2021.csv' DELIMITER ';' CSV HEADER;


--TABLA RESULTADOS POR TITULACION
\copy resultado_titulacion FROM '/home/alumno/Descargas/resultados_por_titulacion_2019.csv' DELIMITER ';' CSV HEADER;
\copy resultado_titulacion FROM '/home/alumno/Descargas/resultados_por_titulacion_2020.csv' DELIMITER ';' CSV HEADER;
\copy resultado_titulacion FROM '/home/alumno/Descargas/resultados_por_titulacion_2021.csv'DELIMITER ';' CSV HEADER;

--TABLA NOTAS CORTE
\copy nota_corte FROM '/home/alumno/Descargas/notas_corte_2019.csv' DELIMITER ';' CSV HEADER;
\copy nota_corte FROM '/home/alumno/Descargas/notas_corte_2020.csv' DELIMITER ';' CSV HEADER;
\copy nota_corte FROM '/home/alumno/Descargas/notas_corte_2021.csv' DELIMITER ';' CSV HEADER;

--TABLA ACUERDOS MOVILIDAD
\copy acuerdo_movilidad FROM '/home/alumno/Descargas/acuerdos_movilidad_2019.csv' DELIMITER ';' CSV HEADER;
\copy acuerdo_movilidad FROM '/home/alumno/Descargas/acuerdos_movilidad_2020.csv' DELIMITER ';' CSV HEADER;
\copy acuerdo_movilidad FROM '/home/alumno/Descargas/acuerdos_movilidad_2021.csv' DELIMITER ';' CSV HEADER;

--TABLA ALUMNOS EGRESADOS
\copy alumno_egresado FROM '/home/alumno/Descargas/alumnos_egresados_2019.csv' DELIMITER ';' CSV HEADER;
\copy alumno_egresado FROM '/home/alumno/Descargas/alumnos_egresados_2020.csv' DELIMITER ';' CSV HEADER;
\copy alumno_egresado FROM '/home/alumno/Descargas/alumnos_egresados_2021.csv' DELIMITER ';' CSV HEADER;
