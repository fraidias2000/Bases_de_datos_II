/*Nos conectamos a la base de datos*/
use practica1_780336;

/*Consulta 2*/
SELECT c.nombre as centro, u.nombre as universidad, convenios.anyo, convenios.plazas_asignadas_out as alumnos
FROM CENTRO c
INNER JOIN (
  SELECT id_CENTRO, anyo, MAX(plazas_asignadas_out) as max_alumnos
  FROM CONVENIO
  WHERE anyo = 2020
  GROUP BY id_CENTRO, anyo
) as max_alumnos_centro ON c.id = max_alumnos_centro.id_CENTRO
INNER JOIN CONVENIO convenios ON c.id = convenios.id_CENTRO AND max_alumnos_centro.anyo = convenios.anyo AND max_alumnos_centro.max_alumnos = convenios.plazas_asignadas_out
INNER JOIN UNIVERSIDAD u ON convenios.id_UNIVERSIDAD = u.id;
