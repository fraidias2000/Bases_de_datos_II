# VAMOS A LA RUTA DONDE QUEREMOS DESCARGAR LOS DATOS
cd /home/alumno/Descargas

#Creamos una nueva carpeta y accedemos a ella
mkdir ficherosCSV
cd ficherosCSV

#Descargar datos

#Oferta y ocupación de plazas (de estudios de grado)
wget -q --output-document ocupacion_oferta_2019.csv https://zaguan.unizar.es/record/87665/files/CSV.csv #2019
wget -q --output-document ocupacion_oferta_2020.csv https://zaguan.unizar.es/record/96835/files/CSV.csv #2020
wget -q --output-document ocupacion_oferta_2021.csv https://zaguan.unizar.es/record/108270/files/CSV.csv #2021



#Resultados de las titulaciones (de estudios de grado)
wget -q --output-document resultados_por_titulacion_2019.csv https://zaguan.unizar.es/record/95644/files/CSV.csv #2019
wget -q --output-document resultados_por_titulacion_2020.csv https://zaguan.unizar.es/record/107369/files/CSV.csv #2020
wget -q --output-document resultados_por_titulacion_2021.csv https://zaguan.unizar.es/record/118234/files/CSV.csv #2021



#Notas de corte definitivas del cupo general a estudios de grado.
wget -q --output-document notas_corte_2019.csv https://zaguan.unizar.es/record/87663/files/CSV.csv #2019
wget -q --output-document notas_corte_2020.csv https://zaguan.unizar.es/record/98173/files/CSV.csv #2020
wget -q --output-document notas_corte_2021.csv https://zaguan.unizar.es/record/109322/files/CSV.csv #2021



#Acuerdos de movilidad de estudiantes ERASMUS y SICUE.
wget -q --output-document acuerdos_movilidad_2019.csv https://zaguan.unizar.es/record/83980/files/CSV.csv #2019
wget -q --output-document acuerdos_movilidad_2020.csv https://zaguan.unizar.es/record/95648/files/CSV.csv #2020
wget -q --output-document acuerdos_movilidad_2021.csv https://zaguan.unizar.es/record/107373/files/CSV.csv #2021



#Alumnos egresados por titulación.
wget -q --output-document alumnos_egresados_2019.csv https://zaguan.unizar.es/record/95646/files/CSV.csv #2019
wget -q --output-document alumnos_egresados_2020.csv https://zaguan.unizar.es/record/107371/files/CSV.csv #2020
wget -q --output-document alumnos_egresados_2021.csv https://zaguan.unizar.es/record/118236/files/CSV.csv #2021



#Rendimiento por asignatura y titulación.
wget -q --output-document rendimiento_asignatura_titulacion_2019.csv https://zaguan.unizar.es/record/95645/files/CSV.csv #2019
wget -q --output-document rendimiento_asignatura_titulacion_2020.csv https://zaguan.unizar.es/record/107370/files/CSV.csv #2020
wget -q --output-document rendimiento_asignatura_titulacion_2021.csv https://zaguan.unizar.es/record/118235/files/CSV.csv #2021






