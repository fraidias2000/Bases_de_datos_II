SELECT e.*
FROM empleado e, docente d
WHERE e.dni = d.dni AND d.dni NOT IN (SELECT dni FROM investigador);


