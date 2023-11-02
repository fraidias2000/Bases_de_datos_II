SELECT Universidad, Centro, Alumnos_entrada from (
    SELECT Universidad,
           Centro,
           Alumnos_entrada, 
           row_number() over (partition by Centro order by Alumnos_entrada desc) as universidad_rank 
    FROM (SELECT u.nombre as Universidad, cen.nombre AS Centro, SUM(r.alumnos_movilidad_entrada) AS Alumnos_entrada
          FROM RESULTADO r, CENTRO cen, CONVENIO c, UNIVERSIDAD u
          WHERE r.id_centro = cen.id AND 
                cen.id = c.id_centro AND 
                c.id_universidad = u.id AND 
                r.curso = 2021 AND 
                alumnos_movilidad_entrada > 0
          GROUP BY u.nombre, cen.nombre) ranks )ranks1
where universidad_rank <= 1;
