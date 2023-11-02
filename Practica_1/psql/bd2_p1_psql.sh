function lanza_postgres () {
	PGPASSWORD=x psql -U postgres -q < $1
}

function lanza () {
	PGPASSWORD=P4sSw0Rd@ psql -U usuario -q bd21_p1_psql < $1
}

echo -e "Inicio del Script PSQL - BD II P1 Virginia Casino (780722)"
chmod -R u+x /home/alumno/bd21/psql

./descargar_ficheros_csv.sh
echo -e "Se han descargado los ficheros de correctamente"

lanza_postgres crear_bd_user.sql
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