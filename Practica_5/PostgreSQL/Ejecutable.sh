#Vamos a la carpeta donde estan los ficheros que vamos a ejecutar
cd /home/alumno/Desktop/practica1/postgres

chmod -R u+x /home/alumno/Desktop/practica1/postgres
echo -e "Todo configurado correctamente, se procede a ejecutar la practica 1 en MySQL"


#1 Descargar datos desde zaguan.unizar.es
./1_Descargar_datos.sh
echo -e "1) Exito al descargar los ficheros CSV"


#2 Creamos una base de datos y un usuario
sudo -u postgres psql -f /home/alumno/Desktop/practica1/postgres/2_CrearBD_usuario.sql
echo -e "2)Exito al crear la base de datos y el usuario"

#3 Creamos las tablas temporales para almacenar los datos temporales
echo -e "Necesario ingresar contraseña para crear las tablas temporales"
psql -h localhost -d practica1_780336 -U usuario_780336 -W -f /home/alumno/Desktop/practica1/postgres/3_Crear_tablas_temporales.sql
echo -e "3) Exito al crear las tablas temporales"


#4 Cargamos los datos temporales en las tablas temporales
echo -e "Necesario ingresar contraseña para cargar datos en las tablas temporales"
psql -h localhost -d practica1_780336 -U usuario_780336 -W -f /home/alumno/Desktop/practica1/postgres/4_Cargar_datos_tablas_temporales.sql
echo -e "4) Exito al cargar los datos temporales en las tablas temporales"


#5 Creamos las tablas definitivas
echo -e "Necesario ingresar contraseña para crear las tablas definitivas"
psql -h localhost -d practica1_780336 -U usuario_780336 -W -f /home/alumno/Desktop/practica1/postgres/5_Crear_tablas_definitivas.sql
echo -e "5) Exito al crear las tablas definitivas"


#6 Cargar los datos en las tablas definitivas
echo -e "Necesario ingresar contraseña para cargar datos en las tablas definitivas"
psql -h localhost -d practica1_780336 -U usuario_780336 -W -f /home/alumno/Desktop/practica1/postgres/6_Cargar_datos_tablas_definitivas.sql
echo -e "6) Exito al cargar los datos temporales en las tablas definitivas"


#7 Eliminar tablas temporales
echo -e "Necesario ingresar contraseña para eliminar las tablas temporales"
psql -h localhost -d practica1_780336 -U usuario_780336 -W -f /home/alumno/Desktop/practica1/postgres/7_Eliminar_tablas_temporales.sql
echo -e "7) Exito al eliminar las tablas temporales"


#8 Trigger que registra el borrado, inserción y actualización
echo -e "Necesario ingresar contraseña para crear el Trigger"
psql -h localhost -d practica1_780336 -U usuario_780336 -W -f /home/alumno/Desktop/practica1/postgres/8_Trigger_registrar_borrado_actualizacion.sql
echo -e "8) Se ha creado un trigger que guarda las inserciones, borrados y actualizaciones"


#9 Consulta 1
echo -e "Necesario ingresar contraseña para lanzar consulta 1"
psql -h localhost -d practica1_780336 -U usuario_780336 -W -f /home/alumno/Desktop/practica1/postgres/9_Consulta1.sql


#10 Consulta 2
echo -e "Necesario ingresar contraseña para lanzar consulta 2"
psql -h localhost -d practica1_780336 -U usuario_780336 -W -f /home/alumno/Desktop/practica1/postgres/10_Consulta2.sql


#11 Consulta 3
echo -e "Necesario ingresar contraseña para crear la vista"
psql -h localhost -d practica1_780336 -U usuario_780336 -W -f /home/alumno/Desktop/practica1/postgres/11_Vista.sql