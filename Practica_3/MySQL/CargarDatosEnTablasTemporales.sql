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
    indice_ocupacion FLOAT,
    fecha_actualizacion TEXT
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
    CREDITOS_MATRICULADOS FLOAT,
    CREDITOS_RECONOCIDOS FLOAT,
    DURACION_MEDIA_GRADUADOS FLOAT,
    TASA_EXITO FLOAT,
    TASA_RENDIMIENTO FLOAT,
    TASA_EFICIENCIA FLOAT,
    TASA_ABANDONO FLOAT,
    TASA_GRADUACION FLOAT,
    FECHA_ACTUALIZACION TEXT
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
    FECHA_ACTUALIZACION TEXT
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
    DURACION_MEDIA_GRADUADOS FLOAT,
    TASA_EFICIENCIA FLOAT,
    FECHA_ACTUALIZACION TEXT
);


DROP TABLE IF EXISTS notas_corte_tmp;
CREATE TABLE notas_corte_tmp (
    año INTEGER,
    ESTUDIO TEXT,
    LOCALIDAD TEXT,
    CENTRO TEXT,
    PRELA_CONVO_NOTA_DEF TEXT,
    NOTA_CORTE_DEFINITIVA_JULIO FLOAT,
    NOTA_CORTE_DEFINITIVA_SEPTIEMBRE FLOAT,
    FECHA_ACTUALIZACION TEXT
);

-- CARGAMOS LOS DATOS EN LA TABLA ACUERDO MOVILIDAD
--2019
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/acuerdos_movilidad_2019.csv'
INTO TABLE ACUERDO_MOVILIDAD
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, nombre_programa_movilidad, nombre_area_estudios_mov, centro, in_out, nombre_idioma_nivel_movilidad, pais_universidad_acuerdo, universidad_acuerdo, plazas_ofertadas_alumnos, plazas_asignadas_alumnos_out, fecha_actualizacion);

--2020
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/acuerdos_movilidad_2020.csv'
INTO TABLE ACUERDO_MOVILIDAD
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, nombre_programa_movilidad, nombre_area_estudios_mov, centro, in_out, nombre_idioma_nivel_movilidad, pais_universidad_acuerdo, universidad_acuerdo, plazas_ofertadas_alumnos, plazas_asignadas_alumnos_out, fecha_actualizacion);

--2021
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/acuerdos_movilidad_2021.csv'
INTO TABLE ACUERDO_MOVILIDAD
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, nombre_programa_movilidad, nombre_area_estudios_mov, centro, in_out, nombre_idioma_nivel_movilidad, pais_universidad_acuerdo, universidad_acuerdo, plazas_ofertadas_alumnos, plazas_asignadas_alumnos_out, fecha_actualizacion);


--CARGAMOS LOS DATOS EN LA TABLA ALUMNO EGRESADO
--2019
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/alumnos_egresados_2019.csv'
INTO TABLE ALUMNO_EGRESADO
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, localidad, estudio, tipo_estudio, tipo_egreso,sexo, alumnos_graduados, alumnos_interrumpen_estudios, alumnos_interrumpen_estudios_est_ano1, alumnos_traladan_otra_univ, duracion_media_graduados, tasa_eficiencia, fecha_actualizacion);

--2020
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/alumnos_egresados_2020.csv'
INTO TABLE ALUMNO_EGRESADO
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, localidad, estudio, tipo_estudio, tipo_egreso,sexo, alumnos_graduados, alumnos_interrumpen_estudios, alumnos_interrumpen_estudios_est_ano1, alumnos_traladan_otra_univ, duracion_media_graduados, tasa_eficiencia, fecha_actualizacion);

--2021
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/alumnos_egresados_2021.csv'
INTO TABLE ALUMNO_EGRESADO
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, localidad, estudio, tipo_estudio, tipo_egreso,sexo, alumnos_graduados, alumnos_interrumpen_estudios, alumnos_interrumpen_estudios_est_ano1, alumnos_traladan_otra_univ, duracion_media_graduados, tasa_eficiencia, fecha_actualizacion);


--CARGAMOS LOS DATOS EN LA TABLA NOTA CORTE
--2019
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/notas_corte_2019.csv'
INTO TABLE NOTA_CORTE
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, estudio, localidad, centro, prela_convo_nota, nota_corte_definitiva_julio,  nota_corte_definitiva_septiembre, fecha_actualizacion);

--2020
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/notas_corte_2020.csv'
INTO TABLE NOTA_CORTE
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, estudio, localidad, centro, prela_convo_nota, nota_corte_definitiva_julio,  nota_corte_definitiva_septiembre, fecha_actualizacion);

--2021
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/notas_corte_2021.csv'
INTO TABLE NOTA_CORTE
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, estudio, localidad, centro, prela_convo_nota, nota_corte_definitiva_julio,  nota_corte_definitiva_septiembre, fecha_actualizacion);


--CARGAMOS LOS DATOS EN LA TABLA OCUPACION OFERTA
--2019
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/ocupacion_oferta_2019.csv'
INTO TABLE OCUPACION_OFERTA
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, estudio, localidad, centro, tipo_centro, tipo_estudio, plazas_ofertadas, plazas_matriculadas, plazas_solicitadas, indice_ocupacion, fecha_actualizacion);

--2020
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/ocupacion_oferta_2020.csv'
INTO TABLE OCUPACION_OFERTA
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, estudio, localidad, centro, tipo_centro, tipo_estudio, plazas_ofertadas, plazas_matriculadas, plazas_solicitadas, indice_ocupacion, fecha_actualizacion);

--2021
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/ocupacion_oferta_2021.csv'
INTO TABLE OCUPACION_OFERTA
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, estudio, localidad, centro, tipo_centro, tipo_estudio, plazas_ofertadas, plazas_matriculadas, plazas_solicitadas, indice_ocupacion, fecha_actualizacion);


--CARGAMOS LOS DATOS EN LA TABLA RESULTADO TITULACIÓN
--2019
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/resultados_por_titulacion_2019.csv'
INTO TABLE RESULTADO_TITULACION
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, centro, estudio, tipo_estudio, alumnos_matriculados, alumnos_nuevo_ingreso, plazas_ofertadas, alumnos_graduados, alumnos_adapta_grado_matri, alumnos_adaptados_grado_matri_ni, alumnos_adapta_grado_titulado, alumnos_con_reconocimiento, alumnos_movilidad_entrada, alumnos_movilidad_salida, creditos_matriculados, creditos_reconocidos, duracion_media_graduados, tasa_exito, tasa_rendimiento, tasa_eficiencia, tasa_abandono, tasa_graduacion, fecha_actualizacion);

--2020
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/resultados_por_titulacion_2020.csv'
INTO TABLE RESULTADO_TITULACION
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, centro, estudio, tipo_estudio, alumnos_matriculados, alumnos_nuevo_ingreso, plazas_ofertadas, alumnos_graduados, alumnos_adapta_grado_matri,alumnos_adaptados_grado_matri_ni, alumnos_adapta_grado_titulado, alumnos_con_reconocimiento, alumnos_movilidad_entrada, alumnos_movilidad_salida, creditos_matriculados, creditos_reconocidos, duracion_media_graduados, tasa_exito, tasa_rendimiento, tasa_eficiencia, tasa_abandono, tasa_graduacion, fecha_actualizacion);

--2021
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/resultados_por_titulacion_2021.csv'
INTO TABLE RESULTADO_TITULACION
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, centro, estudio, tipo_estudio, alumnos_matriculados, alumnos_nuevo_ingreso, plazas_ofertadas, alumnos_graduados, alumnos_adapta_grado_matri, alumnos_adaptados_grado_matri_ni, alumnos_adapta_grado_titulado, alumnos_con_reconocimiento, alumnos_movilidad_entrada, alumnos_movilidad_salida, creditos_matriculados, creditos_reconocidos, duracion_media_graduados, tasa_exito, tasa_rendimiento, tasa_eficiencia, tasa_abandono, tasa_graduacion, fecha_actualizacion);