-- http://www.silota.com/docs/recipes/sql-top-n-group.html
USE bd21_p1_mysql;

SELECT Estudio, Localidad, Indice_Ocupacion FROM (
    SELECT e.nombre AS Estudio,
           l.nombre AS Localidad,
           r.indice_ocupacion AS Indice_Ocupacion, 
           row_number() OVER (PARTITION BY l.identificador ORDER BY r.indice_ocupacion DESC) AS indice_rank 
    FROM resultado r, centro c, localidad l, estudio e
    WHERE r.id_centro = c.identificador AND 
          l.identificador = c.id_localidad AND 
          r.id_estudio = e.identificador AND 
          r.curso_academico = 2018) ranks
WHERE indice_rank <= 2;   