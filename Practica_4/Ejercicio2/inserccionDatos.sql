--INSERCIÓN 5 ASIGNATURAS
INSERT INTO asignatura (codigoAsig, nombreAsig) VALUES (1, 'Bases de datos 2');
INSERT INTO asignatura (codigoAsig, nombreAsig) VALUES(2, 'Proyecto software'); 
INSERT INTO asignatura (codigoAsig, nombreAsig) VALUES (3, 'Ingles tecnico'); 
INSERT INTO asignatura (codigoAsig, nombreAsig) VALUES (4, 'Tecnologia de informacion en la empresa'); 
INSERT INTO asignatura (codigoAsig, nombreAsig) VALUES (5, 'Sistemas de informacion 2');

--INSERCIÓN 2 EMPLEADOS
INSERT INTO tabla_empleado VALUES ('18192021X', 'Jose', 'Gracia', 'De Antonio');
INSERT INTO tabla_empleado VALUES ('18192022B', 'Ricardo', 'Delgado', 'Garcia');

--INSERCIÓN 2 DOCENTES
INSERT INTO tabla_docente  VALUES ('18192023N', 'Jaime', 'Gracia', 'Cortes', 'Profesor');
INSERT INTO tabla_docente VALUES ('18192023M', 'Alvaro', 'Rodriguez', 'Zaera', 'Profesor');

--INSERCIÓN 2 INVESTIGADORES
INSERT INTO tabla_investigador VALUES ('18192023N', 'Jaime', 'Gracia', 'Cortes', 1); 
INSERT INTO tabla_investigador VALUES ('18192023M', 'Alvaro', 'Rodriguez', 'Zaera', 2);

--INSERCIÓN 5 PROYECTOS DE INVESTIGADOR
INSERT INTO proyectoInvestigador VALUES (1, 'Investigación sobre la contaminacion en la tierra', TO_TIMESTAMP('2022-05-30', 'YYYY-MM-DD'), TO_TIMESTAMP('2022-06-10', 'YYYY-MM-DD'));
INSERT INTO proyectoInvestigador VALUES (2, 'Investigación sobre los coches electricos', TO_TIMESTAMP('2022-05-21', 'YYYY-MM-DD'), TO_TIMESTAMP('2022-06-20', 'YYYY-MM-DD')); 
INSERT INTO proyectoInvestigador VALUES (3, 'Investigación sobre los coches hibridos', TO_TIMESTAMP('2022-05-10', 'YYYY-MM-DD'), TO_TIMESTAMP('2022-06-01', 'YYYY-MM-DD'));
INSERT INTO proyectoInvestigador VALUES (4, 'Investigación sobre nueva IA', TO_TIMESTAMP('2022-05-13', 'YYYY-MM-DD'), TO_TIMESTAMP('2022-06-13', 'YYYY-MM-DD')); 										
INSERT INTO proyectoInvestigador VALUES (5, 'Investigación sobre VR', TO_TIMESTAMP('2022-07-21', 'YYYY-MM-DD'), TO_TIMESTAMP('2022-08-10', 'YYYY-MM-DD'));

--INSERCIÓN 10 OBJETOS TABLA PARTICIPA
INSERT INTO participa VALUES (1, '18192023N'); 
INSERT INTO participa VALUES (2, '18192023N'); 
INSERT INTO participa VALUES (3, '18192023N'); 
INSERT INTO participa VALUES (4, '18192023N'); 
INSERT INTO participa VALUES (5, '18192023N'); 
INSERT INTO participa VALUES (1, '18192023M'); 
INSERT INTO participa VALUES (2, '18192023M'); 
INSERT INTO participa VALUES (3, '18192023M'); 
INSERT INTO participa VALUES (4, '18192023M'); 
INSERT INTO participa VALUES (5, '18192023M');

--INSERCIÓN 10 OBJETOS TABLA IMPARTE
INSERT INTO imparte VALUES (1, '18192023N'); 
INSERT INTO imparte VALUES (2, '18192023N'); 
INSERT INTO imparte VALUES (3, '18192023N'); 
INSERT INTO imparte VALUES (4, '18192023N'); 
INSERT INTO imparte VALUES (5, '18192023N');
INSERT INTO imparte VALUES (1, '18192023M'); 
INSERT INTO imparte VALUES (2, '18192023M'); 
INSERT INTO imparte VALUES (3, '18192023M');
INSERT INTO imparte VALUES (4, '18192023M'); 
INSERT INTO imparte VALUES (5, '18192023M');

--INSERCIÓN 2 PDI
INSERT INTO pdi  VALUES ('18192023N');
INSERT INTO pdi  VALUES ('18192023M');