#Vamos a la carpeta donde estan los ficheros que vamos a ejecutar
cd /home/alumno/Desktop/practica1/mysql

chmod -R u+x /home/alumno/Desktop/practica1/mysql
echo -e "Todo configurado correctamente, se procede a ejecutar la practica 1 en MySQL"


#1 Descargar datos desde zaguan.unizar.es
./1_Descargar_datos.sh
echo -e "1) Exito al descargar los ficheros CSV"

#2 Creamos una base de datos y un usuario
mysql --local-infile=1 -u root -q -pbd23 < 2_CrearBD_usuarios.sql
echo -e "2)Exito al crear la base de datos y el usuario"

#3 Creamos las tablas temporales para almacenar los datos temporales
mysql --local-infile=1 -u 780336 -q -pbd23 < 3_Crear_tablas_temporales.sql
echo -e "3) Exito al crear las tablas temporales"

#4 Cargamos los datos temporales en las tablas temporales
mysql --local-infile=1 -u 780336 -q -pbd23 < 4_Cargar_datos_tablas_temporales.sql
echo -e "4) Exito al cargar los datos temporales en las tablas temporales"

#5 Creamos las tablas definitivas
mysql --local-infile=1 -u 780336 -q -pbd23 < 5_Crear_tablas_definitivas.sql
echo -e "5) Exito al crear las tablas definitivas"

#6 Cargar los datos en las tablas definitivas
mysql --local-infile=1 -u 780336 -q -pbd23 < 6_Cargar_datos_tablas_definitivas.sql
echo -e "6) Exito al cargar los datos temporales en las tablas definitivas"

#7 Eliminar tablas temporales
mysql --local-infile=1 -u 780336 -q -pbd23 < 7_Eliminar_tablas_temporales.sql
echo -e "6) Exito al eliminar las tablas temporales"

#8 Trigger que impide borrar en la tabla Centro
mysql --local-infile=1 -u 780336 -q -pbd23 < 8_Trigger_impedir_borrar_tabla_centro.sql
echo -e "8) Se ha creado un trigger que impide borrar cualquier instancia de la tabla centro"

#9 Consulta 1
echo -e "9) La consulta 1 da como resultado:"
mysql --local-infile=1 -u 780336 -q -pbd23 < 9_Consulta_1.sql

#10 Consulta 2
echo -e "10) La consulta 2 da como resultado:"
mysql --local-infile=1 -u 780336 -q -pbd23 < 10_Consulta_2.sql




