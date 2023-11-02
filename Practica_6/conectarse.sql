from sqlalchemy import select, create_engine, text

# Conexión a la base de datos
engine = create_engine('mysql+pymysql://root:bd23@127.0.0.1/sakila')

# Crear una conexión
conn = engine.connect()

# Crear un objeto de tipo Select para ejecutar la consulta
s = select('*').select_from(text('customer'))

# Ejecutar la consulta y obtener el resultado
result = conn.execute(s)

# Imprimir el resultado
for row in result:
    print(row)

# Cerrar la conexión
conn.close()