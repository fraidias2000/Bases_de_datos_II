SELECT e1.nombre as estudio, l1.nombre as localidad, u1.indice_ocupacion 
FROM localidad l1, estudio e1, centro c1, centro_estudio u1
WHERE u1.id_estudio = e1.id AND u1.id_centro = c1.id AND c1.id_localidad = l1.id AND 
u1.curso = 2020 AND e1.id IN (SELECT t1.id_estudio
			      FROM (SELECT e2.id as id_estudio
				    FROM estudio e2, centro c2, centro_estudio u2 
		    		    WHERE u2.id_estudio = e2.id AND u2.id_centro = c2.id AND c2.id_localidad = l1.id AND u2.curso = 2020
				    ORDER BY u2.indice_ocupacion DESC LIMIT 2) as t1)