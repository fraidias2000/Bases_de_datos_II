SELECT a.*
FROM asignatura a, docente d, imparte i
WHERE  i.idDocente = d.dni AND a.codigoAsig = i.idAsignatura 
GROUP BY a.codigoAsig
HAVING count(*) >= 2;

