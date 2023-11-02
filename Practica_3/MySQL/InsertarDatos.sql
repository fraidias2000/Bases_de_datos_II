/* Insertar datos en la tabla Localidad */
INSERT INTO localidad(nombre)
SELECT DISTINCT localidad
FROM oferta_ocupacion_plazas_tmp
WHERE tipo_estudio = 'Grado';

/* Insertar datos en tabla Centro */
INSERT INTO centro(nombre, id_localidad)
SELECT DISTINCT o.centro, l.id
FROM oferta_ocupacion_plazas_tmp o, localidad l
WHERE o.tipo_estudio = 'Grado' and l.nombre = o.localidad;

/* Insertar datos en tabla Estudio */
INSERT INTO estudio(nombre)
SELECT DISTINCT SUBSTRING(estudio, 8)
FROM oferta_ocupacion_plazas_tmp
WHERE tipo_estudio = 'Grado';

/* Insertar datos en tabla Pais */
INSERT INTO pais(nombre)
SELECT DISTINCT pais_universidad_acuerdo
FROM movilidad_tmp;

/* Insertar datos en tabla Universidad */
INSERT INTO universidad(nombre, id_pais)
SELECT DISTINCT m.universidad_acuerdo, p.id
FROM movilidad_tmp m, pais p
WHERE p.nombre = m.pais_universidad_acuerdo;

/* Insertar datos en tabla centro_estudio */
INSERT INTO centro_estudio(id_estudio, id_centro, curso, plazas_ofertadas, plazas_matriculadas, plazas_solicitadas, indice_ocupacion)
SELECT  DISTINCT e.id, c.id, o.año, o.plazas_ofertadas, o.plazas_matriculadas, o.plazas_solicitadas, o.indice_ocupacion
FROM oferta_ocupacion_plazas_tmp o, estudio e, centro c
WHERE o.tipo_estudio = 'Grado' AND e.nombre = SUBSTRING(o.estudio, 8) AND c.nombre = o.centro;

/* Insertar los resultados restantes en tabla centro_estudio */
UPDATE centro_estudio u,
    (SELECT c.id as id_centro, e.id as id_estudio, r.año as anyo, r.alumnos_graduados as graduados, r.alumnos_con_reconocimiento as reconocimiento, 
    r.alumnos_movilidad_entrada as alumnos_entrada, r.alumnos_movilidad_salida as alumnos_salida, r.creditos_matriculados as creditos_matriculados, 
    r.creditos_reconocidos as creaditos_reconocidos, r.duracion_media_graduados as duracion, r.tasa_exito as exito
    FROM resultados_titulaciones_tmp r, centro c, estudio e
    WHERE tipo_estudio = 'Grado' AND SUBSTRING(r.estudio, 3) = e.nombre AND c.nombre = r.centro) AS t1
SET u.alumnos_graduados = t1.graduados, u.alumnos_con_reconocimiento = t1.reconocimiento, u.alumnos_movilidad_entrada = t1.alumnos_entrada, 
u.alumnos_movilidad_salida = t1.alumnos_salida, u.creditos_matriculados = t1.creditos_matriculados, u.creditos_reconocidos = t1.creaditos_reconocidos,
duracion_media_graduados = t1.duracion, tasa_exito = t1.exito
WHERE u.id_centro = t1.id_centro AND u.id_estudio = t1.id_estudio AND u.curso = t1.anyo;

/* Insertar nº de abandonos volunatarios en tabla centro_estudio */
UPDATE centro_estudio u,
    (SELECT  a.año as anyo, c.id as id_centro, e.id as id_estudio, SUM(a.alumnos_interrumpen_estudios) as abandonos
    FROM alumnos_egresados_tmp a, centro c, estudio e, localidad l, centro_estudio u
    WHERE tipo_egreso = 'Abandono Voluntario' AND a.localidad = l.nombre AND l.id = c.id_localidad AND e.nombre = substring(a.estudio, 8)
    AND c.id = u.id_centro AND e.id =+ u.id_estudio AND u.curso = a.año
    GROUP BY c.id, e.id, a.año) as t1
SET u.abandonos_voluntarios = t1.abandonos
WHERE u.id_centro = t1.id_centro AND u.id_estudio = t1.id_estudio AND u.curso = t1.anyo;

/* Insertar cotas de corte en tabla centro_estudio */
UPDATE centro_estudio u,
    (SELECT c.id as id_centro, e.id as id_estudio, n.año as anyo, n.nota_corte_definitiva_julio as nota_julio, n.nota_corte_definitiva_septiembre as nota_sep
    FROM notas_corte_tmp n, centro c, estudio e
    WHERE n.centro = c.nombre AND e.nombre = SUBSTRING(n.estudio, 8)) as t1
SET u.nota_corte_julio = t1.nota_julio, u.nota_corte_septiembre = t1.nota_sep
WHERE u.id_centro = t1.id_centro AND u.id_estudio = t1.id_estudio AND u.curso = t1.anyo;

/* Insertar datos en tabla Area_estudio */
INSERT INTO area_estudio(nombre)
SELECT distinct nombre_area_estudios_mov
FROM movilidad_tmp;

/* Insertar datos en tabla Nivel_idioma */
INSERT INTO nivel_idioma(nombre)
SELECT distinct nombre_idioma_nivel_movilidad
FROM movilidad_tmp;

/* Insertar datos en tabla Convenio_movilidad */
INSERT INTO convenio_movilidad (in_out, anyo, id_universidad, id_centro, id_area_estudio, id_nivel_idioma, programa, plazas_ofertadas, plazas_asignadas_out)
SELECT DISTINCT m.in_out, m.año, u.id, c.id, a.id, n.id, m.nombre_programa_movilidad, m.plazas_ofertadas_alumnos, 
m.plazas_asignadas_alumnos_out
FROM movilidad_tmp m, centro c, universidad u, area_estudio a, nivel_idioma n
WHERE m.centro = c.nombre AND u.nombre = m.universidad_acuerdo AND m.nombre_area_estudios_mov = a.nombre AND 
n.nombre = m.nombre_idioma_nivel_movilidad;