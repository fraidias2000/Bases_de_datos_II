/*Nos conectamos a la base de datos*/
use practica1_780336;

/*Consulta 1*/
SELECT l.nombre as localidad, e.nombre as estudio, r.indice_ocupacion
FROM LOCALIDAD l
INNER JOIN CENTRO c ON l.id = c.id_localidad
INNER JOIN RESULTADO r ON c.id = r.id_centro
INNER JOIN ESTUDIO e ON r.id_estudio = e.id
WHERE r.curso = 2020
AND (
    SELECT COUNT(*) 
    FROM RESULTADO r2 
    WHERE r2.id_centro = r.id_centro AND r2.indice_ocupacion >= r.indice_ocupacion
) <= 2
GROUP BY l.nombre, e.nombre, r.indice_ocupacion
ORDER BY l.nombre, r.indice_ocupacion DESC;
