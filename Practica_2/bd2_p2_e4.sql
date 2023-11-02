-- Primera consulta
SELECT DISTINCT * 
FROM empleado;

-- Segunda consulta
SELECT dni, (nombre).nombre, (nombre).apellido1, (nombre).apellido2, puestoDocente
FROM ONLY docente; 

-- Tercer consulta
-- Esta consulta no se puede hacer únicamente listando los usuarios en pdi porque ocurre el caso que se ha explicado en el ejercicio 1,
-- donde se ha insertado en el juego de pruebas un empleado tanto en docente e investigador y no aparece en pdi
SELECT DISTINCT e.dni, (e.nombre).nombre, (e.nombre).apellido1, (e.nombre).apellido2
FROM pdi p, docente d, investigador i, empleado e
WHERE d.dni = i.dni AND (e.dni = d.dni OR e.dni = d.dni OR p.dni = e.dni);
 
-- Cuarta consulta
-- Con el LOWER lo que se consigue es que no distinga entre mayúsculas y minúsculas solo los carácteres
SELECT dni, (nombre).nombre, (nombre).apellido1, (nombre).apellido2 
FROM empleado 
WHERE LOWER((nombre).apellido1) = 'gracia';

-- Quinta consulta
SELECT a.nombre, COUNT(d.dni) AS num_docentes
FROM asignatura a, docente d, imparte i
WHERE a.codigo = i.codAsig AND i.dniDocente = d.dni
GROUP BY a.nombre
HAVING COUNT(d.dni) >= 2;

-- Sexta consulta
SELECT DISTINCT e.dni, COUNT(e.dni) AS carga_trabajo
FROM imparte i, empleado e, participa p
WHERE i.dniDocente = e.dni AND 
      p.dniInvestigador = e.dni
GROUP BY e.dni

UNION

SELECT DISTINCT e.dni, COUNT(e.dni) AS carga_trabajo
FROM imparte i, empleado e
WHERE i.dniDocente = e.dni AND 
      e.dni NOT IN (SELECT dniInvestigador
                    FROM participa)
GROUP BY e.dni

UNION

SELECT DISTINCT e.dni, COUNT(e.dni) AS carga_trabajo
FROM participa p, empleado e
WHERE p.dniInvestigador = e.dni AND 
      e.dni NOT IN (SELECT dniDocente
                    FROM imparte)
GROUP BY e.dni;