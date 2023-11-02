/*Nos conectamos a la base de datos*/
use practica1_780336;
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
INSERT INTO RESULTADO(id_estudio, 
                      id_centro, 
                      curso, 
                      plazas_ofertadas, 
                      plazas_matriculadas, 
                      plazas_solicitadas, 
                      indice_ocupacion)
SELECT  DISTINCT e.id, 
                 c.id, 
                 o.curso_academico, 
                 o.plazas_ofertadas, 
                 o.plazas_matriculadas, 
                 o.plazas_solicitadas, 
                 o.indice_ocupacion
FROM OCUPACION_OFERTA o, 
     ESTUDIO e, 
     CENTRO c
WHERE o.tipo_estudio = 'Grado' AND 
      e.nombre = SUBSTRING(o.estudio, 8) AND 
      c.nombre = o.centro;
/*----------------------------------------------------------*/
/*INSERTAR RESULTADOS EN LA TABLA RESULTADO*/
UPDATE RESULTADO u,
    (SELECT c.id as id_centro, 
            e.id as id_estudio, 
            r.curso_academico as anyo, 
            r.alumnos_graduados as graduados, 
            r.alumnos_con_reconocimiento as reconocimiento, 
            r.alumnos_movilidad_entrada as alumnos_entrada, 
            r.alumnos_movilidad_salida as alumnos_salida, 
            r.creditos_matriculados as creditos_matriculados, 
            r.creditos_reconocidos as creaditos_reconocidos, 
            r.duracion_media_graduados as duracion, 
            r.tasa_exito as exito
    FROM RESULTADO_TITULACION r, 
         CENTRO c, 
         ESTUDIO e
    WHERE tipo_estudio = 'Grado' AND 
          SUBSTRING(r.estudio, 3) = e.nombre AND 
          c.nombre = r.centro) AS t1
SET u.alumnos_graduados = t1.graduados, 
    u.alumnos_con_reconocimiento = t1.reconocimiento, 
    u.alumnos_movilidad_entrada = t1.alumnos_entrada, 
    u.alumnos_movilidad_salida = t1.alumnos_salida, 
    u.creditos_matriculados = t1.creditos_matriculados, 
    u.creditos_reconocidos = t1.creaditos_reconocidos,
    duracion_media_graduados = t1.duracion, 
    tasa_exito = t1.exito
WHERE u.id_centro = t1.id_centro AND 
      u.id_estudio = t1.id_estudio AND 
      u.curso = t1.anyo;
/*----------------------------------------------------------*/
/* INSERTAR NÚMERO DE ABANDONOS VOLUNTARIOS EN LA TABLA RESULTADO*/
UPDATE RESULTADO u,
    (SELECT  a.curso_academico as anyo, 
             c.id as id_centro, 
             e.id as id_estudio, 
             SUM(a.alumnos_interrumpen_estudios) as abandonos
    FROM ALUMNO_EGRESADO a, 
         CENTRO c, 
         ESTUDIO e, 
         LOCALIDAD l, 
         RESULTADO u
    WHERE tipo_egreso = 'Abandono Voluntario' AND 
          a.localidad = l.nombre AND 
          l.id = c.id_localidad AND 
          e.nombre = substring(a.estudio, 8) AND 
          c.id = u.id_centro AND 
          e.id =+ u.id_estudio AND 
          u.curso = a.curso_academico
    GROUP BY c.id, 
             e.id, 
             a.curso_academico) as t1
SET u.abandonos_voluntarios = t1.abandonos
WHERE u.id_centro = t1.id_centro AND 
      u.id_estudio = t1.id_estudio AND 
      u.curso = t1.anyo;
/*----------------------------------------------------------*/
/* INSERTAR NOTAS DE CORTE EN LA TABLA RESULTADO */
UPDATE RESULTADO u,
    (SELECT c.id as id_centro, 
            e.id as id_estudio, 
            n.curso_academico as anyo, 
            n.nota_corte_definitiva_julio as nota_julio, 
            n.nota_corte_definitiva_septiembre as nota_sep
    FROM NOTA_CORTE n, 
         CENTRO c, 
         ESTUDIO e
    WHERE n.centro = c.nombre AND 
          e.nombre = SUBSTRING(n.estudio, 8)) as t1
SET u.nota_corte_julio = t1.nota_julio, 
    u.nota_corte_septiembre = t1.nota_sep
WHERE u.id_centro = t1.id_centro AND 
      u.id_estudio = t1.id_estudio AND 
      u.curso = t1.anyo;

/*----------------------------------------------------------*/
/* INSERTAR RENDIMIENTO POR ASIGNATURA Y TITULACIÓN EN LA TABLA RESULTADO */

UPDATE RESULTADO r,
    (SELECT c.id as id_centro, 
            e.id as id_estudio, 
            n.curso_academico as anyo, 
            n.TASA_RENDIMIENTO as tasa_rendimiento, 
            n.TASA_EVALUACION as tasa_evaluacion,
            n.ALUMNOS_EVALUADOS as alumnos_evaluados, 
            n.ALUMNOS_SUPERADOS as alumnos_superados, 
            n.ALUMNOS_PRESENTADOS as alumnos_presentados, 
            n.MEDIA_CONVOCATORIAS_CONSUMIDAS as media_convocatorias_consumidas 
    FROM RENDIMIENTO_ASIGNATURA_TITULACION n, 
         CENTRO c, 
         ESTUDIO e
    WHERE n.centro = c.nombre AND e.nombre = SUBSTRING(n.estudio, 8)) as t1
SET r.tasa_rendimiento = t1.tasa_rendimiento, 
    r.tasa_evaluacion = t1.tasa_evaluacion,
    r.alumnos_evaluados = t1.alumnos_evaluados,
    r.alumnos_superados = t1.alumnos_superados,
    r.alumnos_presentados = t1.alumnos_presentados,
    r.media_convocatorias_consumidas = t1.media_convocatorias_consumidas
WHERE r.id_centro = t1.id_centro AND 
      r.id_estudio = t1.id_estudio AND 
      r.curso = t1.anyo ;




