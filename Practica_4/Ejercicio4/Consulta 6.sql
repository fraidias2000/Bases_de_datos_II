SELECT DISTINCT e.dni, COALESCE(t1.num_asignaturas, 0) + COALESCE(t2.num_proyectos, 0) AS carga
FROM empleado e LEFT JOIN 
		(SELECT COUNT(*) as num_asignaturas, i.idDocente as dni
		FROM imparte i
		GROUP BY i.idDocente) AS t1 ON e.dni = t1.dni LEFT JOIN
		
		(SELECT  COUNT(*) as num_proyectos, p.idInvestigador as dni
		FROM participa p
		GROUP BY p.idInvestigador) AS t2 ON e.dni = t2.dni;