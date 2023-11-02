CREATE VIEW vista_tasas_exitos AS
SELECT r.id_ESTUDIO, r.curso, r.plazas_ofertadas, r.alumnos_evaluados, r.alumnos_superados, r.tasa_exito,
       c.nombre AS centro, e.nombre AS estudio
FROM RESULTADO r
JOIN CENTRO c ON r.id_CENTRO = c.id
JOIN ESTUDIO e ON r.id_ESTUDIO = e.id
WHERE e.nombre = 'Grado en Ingeniería Informática'
AND (c.nombre LIKE '%EINA%' OR c.nombre LIKE '%EUPT%')
ORDER BY r.tasa_exito DESC
LIMIT 10;


SELECT r.id_ESTUDIO, r.curso, r.plazas_ofertadas, r.alumnos_evaluados, r.alumnos_superados, r.tasa_exito,
       c.nombre AS centro, e.nombre AS estudio
FROM RESULTADO r
JOIN CENTRO c ON r.id_CENTRO = c.id
JOIN ESTUDIO e ON r.id_ESTUDIO = e.id
WHERE e.nombre = 'Grado en Ingeniería Informática'
AND (c.nombre LIKE '%EINA%' OR c.nombre LIKE '%EUPT%')
ORDER BY r.tasa_exito ASC
LIMIT 10;
