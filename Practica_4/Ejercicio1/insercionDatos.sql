--INSERCIÓN 5 ASIGNATURAS
INSERT INTO asignatura (nombreAsig) VALUES ('Bases de datos 2');
INSERT INTO asignatura (nombreAsig) VALUES ('Proyecto software');
INSERT INTO asignatura (nombreAsig) VALUES ('Ingles tecnico');
INSERT INTO asignatura (nombreAsig) VALUES ('Tecnologia de informacion en la empresa');
INSERT INTO asignatura (nombreAsig) VALUES ('Sistemas de informacion 2');

--INSERCIÓN 2 EMPLEADOS
INSERT INTO empleado (dni, nombre, apellido1, apellido2) VALUES ('18192021X', 'Jose', 'Gracia', 'De Antonio');
INSERT INTO empleado (dni, nombre, apellido1, apellido2) VALUES ('18192022B', 'Ricardo', 'Delgado', 'Garcia');

--INSERCIÓN 2 DOCENTES
INSERT INTO docente (dni, nombre, apellido1, apellido2, puestodocente) VALUES ('18192023N', 'Jaime', 'Gracia', 'Cortes', 'Profesor'); 
INSERT INTO docente (dni, nombre, apellido1, apellido2, puestodocente) VALUES ('18192023M', 'Alvaro', 'Rodriguez', 'Zaera', 'Profesor');

--INSERCIÓN 2 INVESTIGADORES
INSERT INTO investigador (dni, nombre, apellido1, apellido2, orcid) VALUES ('18192023N', 'Jaime', 'Gracia', 'Cortes', 1);
INSERT INTO investigador (dni, nombre, apellido1, apellido2, orcid) VALUES ('18192024Z', 'Jorge', 'Mor', 'Abad', 2);

--INSERCIÓN 5 PROYECTOS DE INVESTIGADOR
INSERT INTO proyectoInvestigador (titulo, fechaInicio, fechaFin) VALUES ('Investigación sobre la contaminacion en la tierra', '2022-05-30', '2022-06-10');
INSERT INTO proyectoInvestigador (titulo, fechaInicio, fechaFin) VALUES ('Investigación sobre los coches electricos', '2022-05-21', '2022-06-20'); 
INSERT INTO proyectoInvestigador (titulo, fechaInicio, fechaFin) VALUES ('Investigación sobre los coches hibridos', '2022-05-10', '2022-06-01');
INSERT INTO proyectoInvestigador (titulo, fechaInicio, fechaFin) VALUES ('Investigación sobre nueva IA', '2022-05-13', '2022-06-13');
INSERT INTO proyectoInvestigador (titulo, fechaInicio, fechaFin) VALUES ('Investigación sobre VR', '2022-07-21', '2022-08-10');

--INSERCIÓN 10 OBJETOS TABLA PARTICIPA
INSERT INTO participa (idProyecto, idInvestigador) VALUES (1, '18192023N');
INSERT INTO participa (idProyecto, idInvestigador) VALUES (2, '18192023N');
INSERT INTO participa (idProyecto, idInvestigador) VALUES (3, '18192023N');
INSERT INTO participa (idProyecto, idInvestigador) VALUES (4, '18192023N');
INSERT INTO participa (idProyecto, idInvestigador) VALUES (5, '18192023N');
INSERT INTO participa (idProyecto, idInvestigador) VALUES (1, '18192024Z');
INSERT INTO participa (idProyecto, idInvestigador) VALUES (2, '18192024Z');
INSERT INTO participa (idProyecto, idInvestigador) VALUES (3, '18192024Z');
INSERT INTO participa (idProyecto, idInvestigador) VALUES (4, '18192024Z');
INSERT INTO participa (idProyecto, idInvestigador) VALUES (5, '18192024Z');

--INSERCIÓN 10 OBJETOS TABLA IMPARTE
INSERT INTO imparte (idAsignatura, idDocente) VALUES (1, '18192023N');
INSERT INTO imparte (idAsignatura, idDocente) VALUES (2, '18192023N');
INSERT INTO imparte (idAsignatura, idDocente) VALUES (3, '18192023N');
INSERT INTO imparte (idAsignatura, idDocente) VALUES (4, '18192023N');
INSERT INTO imparte (idAsignatura, idDocente) VALUES (5, '18192023N');
INSERT INTO imparte (idAsignatura, idDocente) VALUES (1, '18192023M');
INSERT INTO imparte (idAsignatura, idDocente) VALUES (2, '18192023M');
INSERT INTO imparte (idAsignatura, idDocente) VALUES (3, '18192023M');
INSERT INTO imparte (idAsignatura, idDocente) VALUES (4, '18192023M');
INSERT INTO imparte (idAsignatura, idDocente) VALUES (5, '18192023M');

--INSERCIÓN 2 PDI
INSERT INTO pdi (dni, nombre, apellido1, apellido2, puestodocente, orcid) VALUES ('18192024U', 'Ibai', 'Llanos', 'Gratea', 'profesor', 5);
INSERT INTO pdi (dni, nombre, apellido1, apellido2, puestodocente, orcid) VALUES ('18192025A', 'Ruben', 'Doblas', 'Gundersen', 'profesor', 6);