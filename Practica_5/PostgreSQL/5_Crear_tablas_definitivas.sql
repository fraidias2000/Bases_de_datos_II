
DROP TABLE IF EXISTS LOCALIDAD CASCADE;
DROP TABLE IF EXISTS PAIS CASCADE;
DROP TABLE IF EXISTS ESTUDIO CASCADE;
DROP TABLE IF EXISTS CENTRO CASCADE;
DROP TABLE IF EXISTS UNIVERSIDAD CASCADE;
DROP TABLE IF EXISTS AREA_ESTUDIO CASCADE;
DROP TABLE IF EXISTS NIVEL_IDIOMA CASCADE;
DROP TABLE IF EXISTS CONVENIO CASCADE;
DROP TABLE IF EXISTS RESULTADO CASCADE;


/*----------------------------------------------------------*/
CREATE TABLE LOCALIDAD(
    id SERIAL,
    nombre VARCHAR(45),
    PRIMARY KEY (id)
);

/*----------------------------------------------------------*/
CREATE TABLE CENTRO (
    id SERIAL,
    nombre VARCHAR(100),
    id_LOCALIDAD INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(id_localidad) REFERENCES LOCALIDAD(id)
);

/*----------------------------------------------------------*/
CREATE TABLE ESTUDIO(
    id SERIAL,
    nombre VARCHAR(200),
    PRIMARY KEY (id)
);

/*----------------------------------------------------------*/
CREATE TABLE PAIS (
    id SERIAL,
    nombre VARCHAR(45),
    PRIMARY KEY (id)
);

/*----------------------------------------------------------*/
CREATE TABLE UNIVERSIDAD (
    id SERIAL,
    nombre VARCHAR(100),
    id_PAIS INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(id_PAIS) REFERENCES PAIS(id)
);

/*----------------------------------------------------------*/
CREATE TABLE AREA_ESTUDIO (
    id SERIAL,
    nombre VARCHAR(100),
    PRIMARY KEY (id)

);

/*----------------------------------------------------------*/
CREATE TABLE NIVEL_IDIOMA (
    id SERIAL,
    nombre VARCHAR(50),
    PRIMARY KEY (id)
);

/*----------------------------------------------------------*/
CREATE TABLE CONVENIO (
    in_out VARCHAR(5),
    anyo INTEGER,
    id_UNIVERSIDAD INTEGER,
    id_CENTRO INTEGER,
    id_AREA_ESTUDIO INTEGER,
    id_NIVEL_IDIOMA INTEGER,
    programa VARCHAR(10),
    plazas_ofertadas INTEGER,
    plazas_asignadas_out INTEGER,
    PRIMARY KEY (in_out, anyo, id_UNIVERSIDAD, id_CENTRO, id_AREA_ESTUDIO, id_NIVEL_IDIOMA),
    FOREIGN KEY(id_CENTRO) REFERENCES CENTRO(id) ON DELETE CASCADE,
    FOREIGN KEY(id_UNIVERSIDAD) REFERENCES UNIVERSIDAD(id), 
    FOREIGN KEY (id_AREA_ESTUDIO) REFERENCES AREA_ESTUDIO(id),
    FOREIGN KEY (id_NIVEL_IDIOMA) REFERENCES NIVEL_IDIOMA(id)
);

/*----------------------------------------------------------*/
CREATE TABLE RESULTADO (
    curso INTEGER,
    id_centro INTEGER, 
    id_estudio INTEGER,
    plazas_ofertadas INTEGER,
    plazas_matriculadas INTEGER,
    plazas_solicitadas INTEGER,
    indice_ocupacion NUMERIC,
    alumnos_graduados INTEGER,
    alumnos_con_reconocimiento INTEGER,
    alumnos_movilidad_entrada INTEGER,
    alumnos_movilidad_salida INTEGER,
    creditos_matriculados NUMERIC,
    creditos_reconocidos NUMERIC,
    duracion_media_graduados NUMERIC,
    tasa_exito NUMERIC,
    nota_corte_julio NUMERIC,
    nota_corte_septiembre NUMERIC,
    abandonos_voluntarios INTEGER,
    tasa_rendimiento FLOAT,
    tasa_evaluacion FLOAT,
    alumnos_evaluados INTEGER,
    alumnos_superados INTEGER,
    alumnos_presentados INTEGER,
    media_convocatorias_consumidas FLOAT,
    PRIMARY KEY (curso, id_centro, id_estudio),
    FOREIGN KEY (id_centro) REFERENCES centro(id) ON DELETE CASCADE,
    FOREIGN KEY (id_estudio) REFERENCES estudio(id) ON DELETE CASCADE
);







