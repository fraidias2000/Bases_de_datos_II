function lanza_root () {
	mysql --local-infile=1 -u root -q -pBd21780722@ < $1
}

function lanza () {
	mysql --local-infile=1 -u usuario -q -pP4sSw0Rd@ < $1
}

echo -e "Inicio del Script MYSQL - BD II P1 Virginia Casino (780722)"
chmod -R u+x /home/alumno/bd21/mysql

./descargar_ficheros_csv.sh
echo -e "Se han descargado los ficheros de correctamente"

lanza_root crear_bd_user.sql
echo -e "Se ha creado la BASE DE DATOS Y EL USUARIO"

lanza cargar_ficheros_csv.sql
echo -e "Se han importado los FICHEROS CVS"

lanza script_general.sql
echo -e "Se ha organizado la BD en base al diagrama ER"

lanza crear_trigger.sql
echo -e "Se ha creado el TRIGGER"

echo -e ""
echo -e "Ejecución PRIMERA consulta"
lanza consulta_e.sql

echo -e ""
echo -e "Ejecución SEGUNDA consulta"
lanza consulta_f.sql



