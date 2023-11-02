SELECT distinct cen.nombre, u.nombre, c.plazas_asignadas_out
FROM convenio_movilidad c, universidad u, centro cen
WHERE c.id_centro = cen.id AND 
      c.id_universidad = u.id AND c.in_out = 'OUT' AND c.anyo = 2021 AND 
      c.plazas_asignadas_out = (SELECT MAX(c2.plazas_asignadas_out)
			        FROM convenio_movilidad c2
			        WHERE c2.in_out = 'OUT' AND c2.anyo = 2021 AND c2.id_centro = c.id_centro)
ORDER BY cen.nombre;