SELECT Universidad, Centro, Alumnos_entrada from (
    SELECT Universidad,
           Centro,
           Alumnos_entrada, 
           row_number() over (partition by Centro order by Alumnos_entrada desc) as universidad_rank 
    FROM (SELECT u.nombre as Universidad, cen.nombre AS Centro, SUM(r.alumnos_movilidad_entrada) AS Alumnos_entrada
          FROM resultado r, centro cen, convenio c, universidad_acuerdo u
          WHERE r.id_centro = cen.identificador AND 
                cen.identificador = c.id_centro AND 
                c.id_universidad = u.identificador AND 
                r.curso_academico = 2019 AND 
                alumnos_movilidad_entrada > 0
          GROUP BY u.nombre, cen.nombre) ranks )ranks1
where universidad_rank <= 1;

