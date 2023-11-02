/*Nos conectamos a la base de datos*/
\c practica1_780336
/*----------------------------------------------------------*/
INSERT INTO LOCALIDAD(nombre)
SELECT DISTINCT localidad
FROM OCUPACION_OFERTA
WHERE tipo_estudio = 'Grado';
/*----------------------------------------------------------*/
INSERT INTO CENTRO(nombre, 
                   id_localidad)
SELECT DISTINCT o.centro, 
                l.id
FROM OCUPACION_OFERTA o, 
     LOCALIDAD l
WHERE o.tipo_estudio = 'Grado' AND 
      l.nombre = o.localidad;
/*----------------------------------------------------------*/
INSERT INTO ESTUDIO(nombre)
SELECT DISTINCT SUBSTRING(estudio, 8)
FROM OCUPACION_OFERTA 
WHERE tipo_estudio = 'Grado';
/*----------------------------------------------------------*/
INSERT INTO PAIS(nombre)
SELECT DISTINCT pais_universidad_acuerdo
FROM ACUERDO_MOVILIDAD;
/*----------------------------------------------------------*/
INSERT INTO UNIVERSIDAD(nombre, 
                        id_pais)
SELECT DISTINCT a.universidad_acuerdo, 
                p.id
FROM ACUERDO_MOVILIDAD a, 
     PAIS p
WHERE p.nombre = a.pais_universidad_acuerdo;
/*----------------------------------------------------------*/
INSERT INTO AREA_ESTUDIO(nombre)
SELECT distinct nombre_area_estudios_mov
FROM ACUERDO_MOVILIDAD;
/*----------------------------------------------------------*/
INSERT INTO NIVEL_IDIOMA(nombre)
SELECT distinct nombre_idioma_nivel_movilidad
FROM ACUERDO_MOVILIDAD;
/*----------------------------------------------------------*/
INSERT INTO CONVENIO (in_out, 
                      anyo, 
                      id_universidad, 
                      id_centro, 
                      id_area_estudio, 
                      id_nivel_idioma, 
                      programa, 
                      plazas_ofertadas, 
                      plazas_asignadas_out)
SELECT DISTINCT am.in_out, 
                am.curso_academico, 
                u.id, 
                c.id, 
                a.id, 
                n.id, 
                am.nombre_programa_movilidad, 
                am.plazas_ofertadas_alumnos, 
                am.plazas_asignadas_alumnos_out
FROM ACUERDO_MOVILIDAD am, 
     CENTRO c,  
     UNIVERSIDAD u, 
     AREA_ESTUDIO a, 
     NIVEL_IDIOMA n
WHERE am.centro = c.nombre AND 
      u.nombre = am.universidad_acuerdo AND 
      am.nombre_area_estudios_mov = a.nombre AND 
      n.nombre = am.nombre_idioma_nivel_movilidad;


/*----------------------------------------------------------*/
/* TABLA RESULTADO */
INSERT INTO RESULTADO(id_estudio, id_centro, curso, plazas_ofertadas, plazas_matriculadas, plazas_solicitadas, indice_ocupacion)
SELECT  DISTINCT e.id, c.id, o.curso_academico, o.plazas_ofertadas, o.plazas_matriculadas, o.plazas_solicitadas, O.indice_ocupacion
FROM OCUPACION_OFERTA o, ESTUDIO e, CENTRO c
WHERE o.tipo_estudio = 'Grado' AND e.nombre = SUBSTRING(o.estudio, 8) AND c.nombre = o.centro;
/*----------------------------------------------------------*/
/*INSERTAR RESULTADOS EN LA TABLA RESULTADO*/
UPDATE RESULTADO u
SET alumnos_graduados = r.alumnos_graduados, alumnos_con_reconocimiento = r.alumnos_con_reconocimiento, alumnos_movilidad_entrada = r.alumnos_movilidad_entrada,
alumnos_movilidad_salida = r.alumnos_movilidad_salida, creditos_matriculados = r.creditos_matriculados, creditos_reconocidos = r.creditos_reconocidos, 
duracion_media_graduados = r.duracion_media_graduados, tasa_exito = r.tasa_exito
FROM RESULTADO_TITULACION r, CENTRO c, ESTUDIO e
WHERE u.id_estudio = e.id AND u.id_centro = c.id AND u.curso = r.curso_academico AND tipo_estudio = 'Grado' AND SUBSTRING(r.estudio, 3) = e.nombre AND c.nombre = r.centro;


/*----------------------------------------------------------*/
/* INSERTAR NÚMERO DE ABANDONOS VOLUNTARIOS EN LA TABLA RESULTADO*/
UPDATE RESULTADO u
SET abandonos_voluntarios = t1.abandonos
FROM (SELECT  a.curso_academico as anyo, c.id as id_centro, e.id as id_estudio, SUM(a.alumnos_interrumpen_estudios) as abandonos
	  FROM ALUMNO_EGRESADO a, CENTRO c, ESTUDIO e, LOCALIDAD l, RESULTADO u
	  WHERE tipo_egreso = 'Abandono Voluntario' AND a.localidad = l.nombre AND l.id = c.id_localidad AND e.nombre = substring(a.estudio, 8)
	  AND c.id = u.id_centro AND e.id = u.id_estudio AND u.curso = a.curso_academico
	  GROUP BY c.id, e.id, a.curso_academico) as t1
WHERE u.id_centro = t1.id_centro AND u.id_estudio = t1.id_estudio AND u.curso = t1.anyo;

/*----------------------------------------------------------*/
/* INSERTAR NOTAS DE CORTE EN LA TABLA RESULTADO */

UPDATE RESULTADO u
SET nota_corte_julio = n.nota_corte_definitiva_julio, nota_corte_septiembre = n.nota_corte_definitiva_septiembre
FROM NOTA_CORTE n, CENTRO c, ESTUDIO e
WHERE u.id_centro = c.id AND u.id_estudio = e.id AND u.curso = n.curso_academico AND n.centro = c.nombre AND e.nombre = SUBSTRING(n.estudio, 8);
/*----------------------------------------------------------*/
/* INSERTAR RENDIMIENTO POR ASIGNATURA Y TITULACIÓN EN LA TABLA RESULTADO */

UPDATE RESULTADO u
SET tasa_rendimiento = n.tasa_rendimiento, 
    tasa_evaluacion = n.tasa_evaluacion,
    alumnos_evaluados = n.alumnos_evaluados,
    alumnos_superados = n.alumnos_superados,
    alumnos_presentados = n.alumnos_presentados,
    media_convocatorias_consumidas = n.media_convocatorias_consumidas
FROM RENDIMIENTO_ASIGNATURA_TITULACION n, 
         CENTRO c, 
         ESTUDIO e
WHERE u.id_centro = c.id AND u.id_estudio = e.id AND u.curso = n.curso_academico AND n.centro = c.nombre AND e.nombre = SUBSTRING(n.estudio, 8);



