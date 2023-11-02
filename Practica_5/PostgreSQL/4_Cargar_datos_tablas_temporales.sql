/*CARGAR DATOS*/

/*OCUPACION OFERTA*/
\copy ocupacion_oferta FROM '/home/alumno/Descargas/ficherosCSV/ocupacion_oferta_2019.csv' DELIMITER ';' CSV HEADER;
\copy ocupacion_oferta FROM '/home/alumno/Descargas/ficherosCSV/ocupacion_oferta_2020.csv' DELIMITER ';' CSV HEADER;
\copy ocupacion_oferta FROM '/home/alumno/Descargas/ficherosCSV/ocupacion_oferta_2021.csv' DELIMITER ';' CSV HEADER;


/*RESULTADOS POR TITULACION*/
\copy resultado_titulacion FROM '/home/alumno/Descargas/ficherosCSV/resultados_por_titulacion_2019.csv' DELIMITER ';' CSV HEADER;
\copy resultado_titulacion FROM '/home/alumno/Descargas/ficherosCSV/resultados_por_titulacion_2020.csv' DELIMITER ';' CSV HEADER;
\copy resultado_titulacion FROM '/home/alumno/Descargas/ficherosCSV/resultados_por_titulacion_2021.csv'DELIMITER ';' CSV HEADER;


/*NOTAS DE CORTE*/
\copy nota_corte FROM '/home/alumno/Descargas/ficherosCSV/notas_corte_2019.csv' DELIMITER ';' CSV HEADER;
\copy nota_corte FROM '/home/alumno/Descargas/ficherosCSV/notas_corte_2020.csv' DELIMITER ';' CSV HEADER;
\copy nota_corte FROM '/home/alumno/Descargas/ficherosCSV/notas_corte_2021.csv' DELIMITER ';' CSV HEADER;


/*ACUERDOS MOVILIDAD*/
\copy acuerdo_movilidad FROM '/home/alumno/Descargas/ficherosCSV/acuerdos_movilidad_2019.csv' DELIMITER ';' CSV HEADER;
\copy acuerdo_movilidad FROM '/home/alumno/Descargas/ficherosCSV/acuerdos_movilidad_2020.csv' DELIMITER ';' CSV HEADER;
\copy acuerdo_movilidad FROM '/home/alumno/Descargas/ficherosCSV/acuerdos_movilidad_2021.csv' DELIMITER ';' CSV HEADER;


/*ALUMNOS EGRESADOS*/
\copy alumno_egresado FROM '/home/alumno/Descargas/ficherosCSV/alumnos_egresados_2019.csv' DELIMITER ';' CSV HEADER;
\copy alumno_egresado FROM '/home/alumno/Descargas/ficherosCSV/alumnos_egresados_2020.csv' DELIMITER ';' CSV HEADER;
\copy alumno_egresado FROM '/home/alumno/Descargas/ficherosCSV/alumnos_egresados_2021.csv' DELIMITER ';' CSV HEADER;


/*RENDIMIENTO POR ASIGNATURA Y TITULACIÓN*/
\copy rendimiento_asignatura_titulacion FROM '/home/alumno/Descargas/ficherosCSV/rendimiento_asignatura_titulacion_2019.csv' DELIMITER ';' CSV HEADER;
\copy rendimiento_asignatura_titulacion FROM '/home/alumno/Descargas/ficherosCSV/rendimiento_asignatura_titulacion_2020.csv' DELIMITER ';' CSV HEADER;
\copy rendimiento_asignatura_titulacion FROM '/home/alumno/Descargas/ficherosCSV/rendimiento_asignatura_titulacion_2021.csv' DELIMITER ';' CSV HEADER;