DROP TABLE IF EXISTS localidad CASCADE;
CREATE TABLE localidad (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(45)
);

DROP TABLE IF EXISTS centro CASCADE;
CREATE TABLE centro (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    id_localidad INTEGER NOT NULL,
    FOREIGN KEY(id_localidad) REFERENCES localidad(id)
);

DROP TABLE IF EXISTS pais CASCADE;
CREATE TABLE pais (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(45)
);

DROP TABLE IF EXISTS universidad CASCADE;
CREATE TABLE universidad (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    id_pais INTEGER NOT NULL,
    FOREIGN KEY(id_pais) REFERENCES pais(id)
);

DROP TABLE IF EXISTS estudio CASCADE;
CREATE TABLE estudio(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100)
);

DROP TABLE IF EXISTS centro_estudio;
CREATE TABLE centro_estudio (
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
    PRIMARY KEY (curso, id_centro, id_estudio),
    FOREIGN KEY (id_centro) REFERENCES centro(id) ON DELETE CASCADE,
    FOREIGN KEY (id_estudio) REFERENCES estudio(id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS area_estudio CASCADE;
CREATE TABLE area_estudio (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100)

);

DROP TABLE IF EXISTS nivel_idioma CASCADE;
CREATE TABLE nivel_idioma (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50)
);

DROP TABLE IF EXISTS convenio_movilidad;
CREATE TABLE convenio_movilidad (
    in_out VARCHAR(5),
    anyo INTEGER,
    id_universidad INTEGER,
    id_centro INTEGER,
    id_area_estudio INTEGER,
    id_nivel_idioma INTEGER,
    programa VARCHAR(10),
    plazas_ofertadas INTEGER,
    plazas_asignadas_out INTEGER,
    PRIMARY KEY (in_out, anyo, id_universidad, id_centro, id_area_estudio, id_nivel_idioma),
    FOREIGN KEY(id_centro) REFERENCES centro(id) ON DELETE CASCADE,
    FOREIGN KEY(id_universidad) REFERENCES universidad(id), 
    FOREIGN KEY (id_area_estudio) REFERENCES area_estudio(id),
    FOREIGN KEY (id_nivel_idioma) REFERENCES nivel_idioma(id)
);