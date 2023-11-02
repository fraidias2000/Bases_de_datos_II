
SELECT Estudio, Localidad, Indice_Ocupacion from (
    SELECT e.nombre AS Estudio,
           l.nombre AS Localidad,
           r.indice_ocupacion AS Indice_Ocupacion, 
           row_number() OVER (PARTITION BY l.id 
                              ORDER BY r.indice_ocupacion DESC) AS rank 
    FROM RESULTADO r, CENTRO c, LOCALIDAD l, ESTUDIO e
    WHERE r.id_centro = c.id AND 
          l.id = c.id_localidad AND 
          r.id_estudio = e.id AND 
          r.curso = 2021) ranks
WHERE rank <= 2;
