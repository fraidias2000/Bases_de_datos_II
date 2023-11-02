/*CARGAR DATOS*/

/*Nos conectamos a la base de datos*/
use practica1_780336;

/*CARGAMOS LOS DATOS EN LA TABLA ACUERDO MOVILIDAD*/
/*2019*/
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/ficherosCSV/acuerdos_movilidad_2019.csv'
INTO TABLE ACUERDO_MOVILIDAD
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, nombre_programa_movilidad, nombre_area_estudios_mov, centro, in_out, nombre_idioma_nivel_movilidad, pais_universidad_acuerdo, universidad_acuerdo, plazas_ofertadas_alumnos, plazas_asignadas_alumnos_out, fecha_actualizacion);

/*2020*/
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/ficherosCSV/acuerdos_movilidad_2020.csv'
INTO TABLE ACUERDO_MOVILIDAD
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, nombre_programa_movilidad, nombre_area_estudios_mov, centro, in_out, nombre_idioma_nivel_movilidad, pais_universidad_acuerdo, universidad_acuerdo, plazas_ofertadas_alumnos, plazas_asignadas_alumnos_out, fecha_actualizacion);

/*2021*/
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/ficherosCSV/acuerdos_movilidad_2021.csv'
INTO TABLE ACUERDO_MOVILIDAD
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, nombre_programa_movilidad, nombre_area_estudios_mov, centro, in_out, nombre_idioma_nivel_movilidad, pais_universidad_acuerdo, universidad_acuerdo, plazas_ofertadas_alumnos, plazas_asignadas_alumnos_out, fecha_actualizacion);


/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*CARGAMOS LOS DATOS EN LA TABLA ALUMNO EGRESADO*/
/*2019*/
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/ficherosCSV/alumnos_egresados_2019.csv'
INTO TABLE ALUMNO_EGRESADO
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, localidad, estudio, tipo_estudio, tipo_egreso,sexo, alumnos_graduados, alumnos_interrumpen_estudios, alumnos_interrumpen_est_ano1, alumnos_trasladan_otra_univ, duracion_media_graduados, tasa_eficiencia, fecha_actualizacion);

/*2020*/
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/ficherosCSV/alumnos_egresados_2020.csv'
INTO TABLE ALUMNO_EGRESADO
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, localidad, estudio, tipo_estudio, tipo_egreso,sexo, alumnos_graduados, alumnos_interrumpen_estudios, alumnos_interrumpen_est_ano1, alumnos_trasladan_otra_univ, duracion_media_graduados, tasa_eficiencia, fecha_actualizacion);

/*2021*/
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/ficherosCSV/alumnos_egresados_2021.csv'
INTO TABLE ALUMNO_EGRESADO
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, localidad, estudio, tipo_estudio, tipo_egreso,sexo, alumnos_graduados, alumnos_interrumpen_estudios, alumnos_interrumpen_est_ano1, alumnos_trasladan_otra_univ, duracion_media_graduados, tasa_eficiencia, fecha_actualizacion);



/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*CARGAMOS LOS DATOS EN LA TABLA NOTA CORTE*/
/*2019*/
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/ficherosCSV/notas_corte_2019.csv'
INTO TABLE NOTA_CORTE
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, estudio, localidad, centro, prela_convo_nota_def, nota_corte_definitiva_julio,  nota_corte_definitiva_septiembre, fecha_actualizacion);

/*2020*/
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/ficherosCSV/notas_corte_2020.csv'
INTO TABLE NOTA_CORTE
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, estudio, localidad, centro, prela_convo_nota_def, nota_corte_definitiva_julio,  nota_corte_definitiva_septiembre, fecha_actualizacion);

/*2021*/
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/ficherosCSV/notas_corte_2021.csv'
INTO TABLE NOTA_CORTE
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, estudio, localidad, centro, prela_convo_nota_def, nota_corte_definitiva_julio,  nota_corte_definitiva_septiembre, fecha_actualizacion);


/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*CARGAMOS LOS DATOS EN LA TABLA OCUPACION OFERTA*/
/*2019*/
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/ficherosCSV/ocupacion_oferta_2019.csv'
INTO TABLE OCUPACION_OFERTA
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, estudio, localidad, centro, tipo_centro, tipo_estudio, plazas_ofertadas, plazas_matriculadas, plazas_solicitadas, indice_ocupacion, fecha_actualizacion);

/*2020*/
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/ficherosCSV/ocupacion_oferta_2020.csv'
INTO TABLE OCUPACION_OFERTA
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, estudio, localidad, centro, tipo_centro, tipo_estudio, plazas_ofertadas, plazas_matriculadas, plazas_solicitadas, indice_ocupacion, fecha_actualizacion);

/*2021*/
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/ficherosCSV/ocupacion_oferta_2021.csv'
INTO TABLE OCUPACION_OFERTA
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, estudio, localidad, centro, tipo_centro, tipo_estudio, plazas_ofertadas, plazas_matriculadas, plazas_solicitadas, indice_ocupacion, fecha_actualizacion);



/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*CARGAMOS LOS DATOS EN LA TABLA RESULTADO TITULACIÓN*/
/*2019*/
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/ficherosCSV/resultados_por_titulacion_2019.csv'
INTO TABLE RESULTADO_TITULACION
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, centro, estudio, tipo_estudio, alumnos_matriculados, alumnos_nuevo_ingreso, plazas_ofertadas, alumnos_graduados, alumnos_adapta_grado_matri, alumnos_adapta_grado_matri_ni, alumnos_adapta_grado_titulado, alumnos_con_reconocimiento, alumnos_movilidad_entrada, alumnos_movilidad_salida, creditos_matriculados, creditos_reconocidos, duracion_media_graduados, tasa_exito, tasa_rendimiento, tasa_eficiencia, tasa_abandono, tasa_graduacion, fecha_actualizacion);

/*2020*/
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/ficherosCSV/resultados_por_titulacion_2020.csv'
INTO TABLE RESULTADO_TITULACION
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, centro, estudio, tipo_estudio, alumnos_matriculados, alumnos_nuevo_ingreso, plazas_ofertadas, alumnos_graduados, alumnos_adapta_grado_matri,alumnos_adapta_grado_matri_ni, alumnos_adapta_grado_titulado, alumnos_con_reconocimiento, alumnos_movilidad_entrada, alumnos_movilidad_salida, creditos_matriculados, creditos_reconocidos, duracion_media_graduados, tasa_exito, tasa_rendimiento, tasa_eficiencia, tasa_abandono, tasa_graduacion, fecha_actualizacion);

/*2021*/
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/ficherosCSV/resultados_por_titulacion_2021.csv'
INTO TABLE RESULTADO_TITULACION
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, centro, estudio, tipo_estudio, alumnos_matriculados, alumnos_nuevo_ingreso, plazas_ofertadas, alumnos_graduados, alumnos_adapta_grado_matri, alumnos_adapta_grado_matri_ni, alumnos_adapta_grado_titulado, alumnos_con_reconocimiento, alumnos_movilidad_entrada, alumnos_movilidad_salida, creditos_matriculados, creditos_reconocidos, duracion_media_graduados, tasa_exito, tasa_rendimiento, tasa_eficiencia, tasa_abandono, tasa_graduacion, fecha_actualizacion);

/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*CARGAMOS LOS DATOS EN LA TABLA RENDIMIENTO POR ASIGNATURA Y TITULACIÓN*/
/*2019*/
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/ficherosCSV/rendimiento_asignatura_titulacion_2019.csv'
INTO TABLE RENDIMIENTO_ASIGNATURA_TITULACION
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, centro, estudio, localidad, centro, asignatura, tipo_asignatura, clase_asignatura, tasa_exito, tasa_rendimiento, tasa_evaluacion, alumnos_evaluados, alumnos_superados, alumnos_presentados, media_convocatorias_consumidas,fecha_actualizacion);


/*2020*/
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/ficherosCSV/rendimiento_asignatura_titulacion_2020.csv'
INTO TABLE RENDIMIENTO_ASIGNATURA_TITULACION
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, centro, estudio, localidad, centro, asignatura, tipo_asignatura, clase_asignatura, tasa_exito, tasa_rendimiento, tasa_evaluacion, alumnos_evaluados, alumnos_superados, alumnos_presentados, media_convocatorias_consumidas,fecha_actualizacion);


/*2021*/
LOAD DATA LOCAL INFILE '/home/alumno/Descargas/ficherosCSV/rendimiento_asignatura_titulacion_2021.csv'
INTO TABLE RENDIMIENTO_ASIGNATURA_TITULACION
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(curso_academico, centro, estudio, localidad, centro, asignatura, tipo_asignatura, clase_asignatura, tasa_exito, tasa_rendimiento, tasa_evaluacion, alumnos_evaluados, alumnos_superados, alumnos_presentados, media_convocatorias_consumidas,fecha_actualizacion);




