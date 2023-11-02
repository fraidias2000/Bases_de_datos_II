USE bd21_p1_mysql;
-- Si se emplease el hash = MD5 por ejemplo,
-- INSERT INTO x (identificador, nombre)
-- SELECT DISTINCT MD5(x), nombre
-- FROM x;

DROP TABLE IF EXISTS convenio;
DROP TABLE IF EXISTS resultado;
DROP TABLE IF EXISTS universidad_acuerdo;
DROP TABLE IF EXISTS pais;
DROP TABLE IF EXISTS idioma;
DROP TABLE IF EXISTS area_estudio;
DROP TABLE IF EXISTS centro;
DROP TABLE IF EXISTS localidad;
DROP TABLE IF EXISTS estudio;

-- Creación tabla PAÍS e insercción de sus datos (FICHERO acuerdo_movilidad)
CREATE TABLE pais (
    identificador INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY (identificador)
);
INSERT INTO pais (nombre)
   SELECT DISTINCT pais_universidad 
   FROM acuerdo_movilidad;


-- Creación tabla UNIVERSIDAD ACUERDO e insercción de sus datos (FICHERO acuerdo_movilidad + TABLA país)
CREATE TABLE universidad_acuerdo (
    identificador INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    id_pais INT NOT NULL,
    PRIMARY KEY (identificador),
    FOREIGN KEY (id_pais) REFERENCES pais(identificador)
); 
INSERT INTO universidad_acuerdo (nombre, id_pais)
    SELECT DISTINCT REGEXP_REPLACE(am.universidad_acuerdo, '\\(([[:alpha:]]( \\([[:alpha:]]+\\))*| |)+\\)"*$', ''), p.identificador 
    FROM acuerdo_movilidad am, pais p
    WHERE p.nombre = am.pais_universidad;


-- Creación tabla LOCALIDAD e insercción de sus datos (FICHERO ocupacion_oferta)
CREATE TABLE localidad (
    identificador INT NOT NULL AUTO_INCREMENT,
    nombre ENUM('Huesca', 'Zaragoza', 'Teruel', 'Almunia de Doña Godina (La)') NOT NULL,
    PRIMARY KEY (identificador)
);
INSERT INTO localidad (nombre)
    SELECT DISTINCT localidad
    FROM ocupacion_oferta
    WHERE tipo_estudio = 'Grado';


-- Creación tabla CENTRO e insercción de sus datos (FICHERO ocupacion_oferta + TABLA localidad)
CREATE TABLE centro (
    identificador INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    id_localidad INT NOT NULL,
    PRIMARY KEY (identificador),
    FOREIGN KEY (id_localidad) REFERENCES localidad(identificador)
); 
INSERT INTO centro (nombre, tipo, id_localidad)
    SELECT DISTINCT o.centro, o.tipo_centro, l.identificador 
    FROM ocupacion_oferta o, localidad l
    WHERE l.nombre = o.localidad AND 
          o.tipo_estudio = 'Grado';
        

-- Creación tabla IDIOMA e insercción de sus datos (FICHERO acuerdo_movilidad)
CREATE TABLE idioma (
    identificador INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    nivel VARCHAR(50),
    descripcion_nivel VARCHAR(50),
    cadena_busqueda VARCHAR(100),
    PRIMARY KEY (identificador)
);
INSERT INTO idioma (nombre, nivel, descripcion_nivel, cadena_busqueda)
    SELECT DISTINCT REGEXP_SUBSTR(nombre_idioma_nivel, "([[:alpha:]]| )+"), 
                    REGEXP_SUBSTR(nombre_idioma_nivel, "((A|B|C)(1|2)|TOEFL| / |IELTS)+"), 
                    REGEXP_SUBSTR(nombre_idioma_nivel, "Nivel ([[:alpha:]]| |[0-9])+"), nombre_idioma_nivel
    FROM acuerdo_movilidad;


-- Modificación del fichero Acuerdos Movilidad donde sale Ciencias de la Tierra e igual pero con tierra la primera en minúscula para la igualdad ya que se refiere a la misma área
UPDATE acuerdo_movilidad 
SET nombre_area_estudio='0532-Ciencias de la Tierra' 
WHERE nombre_area_estudio='0532-Ciencias de la tierra';


-- Creación tabla ÁREA e insercción de sus datos (FICHERO acuerdo_movilidad)
CREATE TABLE area_estudio (
    identificador INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    codigo_area VARCHAR(50) NOT NULL,
    PRIMARY KEY (identificador)
);
INSERT INTO area_estudio (nombre, codigo_area)
    SELECT DISTINCT REGEXP_REPLACE(nombre_area_estudio, "([0-9]+|-|\\.|\\]|\\[)",""), 
                    REGEXP_SUBSTR(nombre_area_estudio, "([0-9]|-[0-9]|\\.|\\]|\\[)+")
    FROM acuerdo_movilidad;


-- Creación tabla CONVENIO e insercción de sus datos (FICHERO acuerdo_movilidad + TABLAS idioma, area_estudio, centro, universidad_acuerdo, pais)
CREATE TABLE convenio (
    id_universidad INT NOT NULL,
    id_centro INT NOT NULL,
    id_area INT NOT NULL,
    id_idioma INT NOT NULL,
    curso_academico SMALLINT NOT NULL,
    nombre_programa ENUM('ERASMUS','SICUE'),
    in_out ENUM('IN','OUT'),
    plazas_ofertadas SMALLINT,
    plazas_asignadas_out SMALLINT,
    PRIMARY KEY (curso_academico, nombre_programa, in_out, id_centro, id_universidad,  id_idioma, id_area),
    FOREIGN KEY (id_universidad) REFERENCES universidad_acuerdo(identificador),
    FOREIGN KEY (id_centro) REFERENCES centro(identificador),
    FOREIGN KEY (id_area) REFERENCES area_estudio(identificador),
    FOREIGN KEY (id_idioma) REFERENCES idioma(identificador)
); 
INSERT INTO convenio (curso_academico, nombre_programa, in_out, id_centro, id_universidad,  id_idioma, id_area, plazas_ofertadas, plazas_asignadas_out)
    SELECT DISTINCT am.curso_academico, am.nombre_programa, am.in_out, c.identificador, ua.identificador, i.identificador, ae.identificador, am.plazas_ofertadas, am.plazas_asignadas_out
    FROM universidad_acuerdo ua, acuerdo_movilidad am, centro c, idioma i, area_estudio ae, pais p
    WHERE p.identificador = ua.id_pais AND
          p.nombre = am.pais_universidad AND
          ua.nombre IN (SELECT DISTINCT REGEXP_REPLACE(am.universidad_acuerdo, '\\(([[:alpha:]]( \\([[:alpha:]]+\\))*| |)+\\)"*$', '')) AND 
          c.nombre = am.centro AND 
          i.cadena_busqueda = am.nombre_idioma_nivel AND 
          ae.nombre IN (SELECT DISTINCT REGEXP_REPLACE(am.nombre_area_estudio, "([0-9]+|-|\\.|\\]|\\[)","")) AND
          ae.codigo_area IN (SELECT DISTINCT REGEXP_SUBSTR(nombre_area_estudio, "([0-9]|-[0-9]|\\.|\\]|\\[)+"))
    GROUP BY am.curso_academico, am.nombre_programa, am.in_out, c.identificador, ua.identificador, i.identificador, ae.identificador, am.plazas_ofertadas, am.plazas_asignadas_out;


-- Eliminación columna "cadena_busqueda" de TABLA idioma, porque ya no va a ser empleada
ALTER TABLE idioma DROP COLUMN cadena_busqueda;

-- Creación tabla ESTUDIO e insercción de sus datos (FICHERO ocupacion_oferta, pudiendo ser también notas_corte o resultados_titulacion)
CREATE TABLE estudio (
    identificador INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (identificador)
);
INSERT INTO estudio (nombre)
   SELECT DISTINCT REGEXP_REPLACE(estudio, 'Grado: ', '')
   FROM ocupacion_oferta
   WHERE tipo_estudio = 'Grado';


-- Creación tabla curso e insercción de sus datos
CREATE TABLE resultado(
    curso_academico SMALLINT NOT NULL, 
    id_estudio INT NOT NULL, 
    id_centro INT NOT NULL, 
    alumnos_interrumpen_estudios SMALLINT, 
    nota_corte_junio FLOAT, 
    nota_corte_septiembre FLOAT, 
    alumnos_matriculados SMALLINT, 
    alumnos_nuevo_ingreso SMALLINT, 
    plazas_ofertadas SMALLINT,
    plazas_solicitadas SMALLINT,
    plazas_matriculadas SMALLINT,
    indice_ocupacion FLOAT, 
    alumnos_graduados SMALLINT, 
    alumnos_adaptados_grado SMALLINT, 
    alumnos_adaptados_grado_ni SMALLINT,
    alumnos_grado_titulado SMALLINT, 
    alumnos_reconocimiento SMALLINT, 
    alumnos_movilidad_entrada SMALLINT, 
    alumnos_movilidad_salida SMALLINT, 
    creditos_matriculados INT,
    creditos_reconocidos INT, 
    duracion_media_graduados FLOAT, 
    tasa_exito FLOAT, 
    tasa_rendimiento FLOAT, 
    tasa_eficiencia FLOAT, 
    tasa_abandono FLOAT, 
    tasa_graduacion FLOAT,
    PRIMARY KEY (curso_academico, id_estudio, id_centro),
    FOREIGN KEY (id_estudio) REFERENCES estudio(identificador),
    FOREIGN KEY (id_centro) REFERENCES centro(identificador)
);

INSERT INTO resultado (curso_academico, id_estudio, id_centro, alumnos_interrumpen_estudios, nota_corte_junio, nota_corte_septiembre, 
    alumnos_matriculados, alumnos_nuevo_ingreso, plazas_ofertadas, plazas_solicitadas, plazas_matriculadas, indice_ocupacion, alumnos_graduados, 
    alumnos_adaptados_grado, alumnos_adaptados_grado_ni, alumnos_grado_titulado, alumnos_reconocimiento, alumnos_movilidad_entrada, 
    alumnos_movilidad_salida, creditos_matriculados, creditos_reconocidos, duracion_media_graduados, tasa_exito, tasa_rendimiento, 
    tasa_eficiencia, tasa_abandono, tasa_graduacion)
    SELECT ae.curso_academico, e.identificador, c.identificador, SUM(ae.alumnos_interrumpen_estudios), nc.nota_corte_junio, nc.nota_corte_septiembre, 
       rt.alumnos_matriculados, rt.alumnos_nuevo_ingreso, rt.plazas_ofertadas, o.plazas_solicitadas, o.plazas_matriculadas, o.indice_ocupacion, rt.alumnos_graduados, 
       rt.alumnos_adaptados_grado, rt.alumnos_adaptados_grado_ni, rt.alumnos_grado_titulado, rt.alumnos_reconocimiento , rt.alumnos_movilidad_entrada, 
       rt.alumnos_movilidad_salida , rt.creditos_matriculados, rt.creditos_reconocidos, rt.duracion_media_graduados, rt.tasa_exito, rt.tasa_rendimiento, 
       rt.tasa_eficiencia, rt.tasa_abandono, rt.tasa_graduacion
    FROM alumno_egresado ae, estudio e, nota_corte nc, centro c, resultado_titulacion rt, ocupacion_oferta o, localidad l
    WHERE nc.curso_academico = ae.curso_academico AND 
        rt.curso_academico = ae.curso_academico AND 
        o.curso_academico = ae.curso_academico AND
        e.nombre = TRIM(LEADING 'Grado: ' FROM ae.estudio) AND 
        e.nombre = TRIM(LEADING 'Grado: ' FROM nc.estudio) AND 
        e.nombre = TRIM(LEADING '1-' FROM rt.estudio) AND
        e.nombre = TRIM(LEADING 'Grado: ' FROM o.estudio) AND
        c.id_localidad = l.identificador AND
        l.nombre = ae.localidad AND
        l.nombre = o.localidad AND
        l.nombre = nc.localidad AND 
        ae.tipo_egreso = 'Abandono Voluntario' AND
        nc.centro = c.nombre AND
        rt.centro = c.nombre AND
        o.centro = c.nombre AND
        c.tipo = o.tipo_centro
    GROUP BY ae.curso_academico, e.identificador, c.identificador,  nc.nota_corte_junio, nc.nota_corte_septiembre, 
        rt.alumnos_matriculados, rt.alumnos_nuevo_ingreso, rt.plazas_ofertadas, rt.alumnos_graduados, rt.alumnos_adaptados_grado, rt.alumnos_adaptados_grado_ni,
        rt.alumnos_grado_titulado, rt.alumnos_reconocimiento , rt.alumnos_movilidad_entrada , rt.alumnos_movilidad_salida , rt.creditos_matriculados ,
        rt.creditos_reconocidos, rt.duracion_media_graduados, rt.tasa_exito, rt.tasa_rendimiento, rt.tasa_eficiencia, rt.tasa_abandono, rt.tasa_graduacion,
        o.plazas_solicitadas, o.indice_ocupacion, o.plazas_matriculadas;