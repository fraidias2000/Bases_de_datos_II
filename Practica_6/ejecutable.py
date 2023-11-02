from sqlalchemy import select, create_engine, text, MetaData, Table, Integer, Column, String, ForeignKey
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base


# Conexión a la base de datos sakila con el usuario root
engine = create_engine('mysql+pymysql://root:bd23@127.0.0.1/sakila')
metadata = MetaData()
conn = engine.connect()
Session = sessionmaker(bind=engine)
session = Session()
Base = declarative_base()

# Definición de la tabla "country"
class Country(Base):
    __tablename__ = 'country'
    country_id = Column(Integer, primary_key=True)
    country = Column(String(50), nullable=False)

# Definición de la tabla "city"
class City(Base):
    __tablename__ = 'city'
    city_id = Column(Integer, primary_key=True)
    city = Column(String(50), nullable=False)
    country_id = Column(Integer, ForeignKey('country.country_id'), nullable=False)

# Definición de la tabla "users"
class User(Base):
    __tablename__ = 'users'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(50), nullable=False)
    age = Column(Integer)
    email = Column(String(50), nullable=False, unique=True)

# Crea las tablas en la base de datos si no existen
Base.metadata.create_all(engine)

# Funciones para interactuar con la tabla "country"
def create_country(country_name):
    country = Country(country=country_name)
    session.add(country)
    session.commit()

def list_countries():
    countries = session.query(Country).all()
    for country in countries:
        print(country.country_id, country.country)

def delete_country(country_id):
    country = session.query(Country).filter_by(country_id=country_id).one()
    session.delete(country)
    session.commit()

# Funciones para interactuar con la tabla "city"
def create_city(city_name, country_id):
    city = City(city=city_name, country_id=country_id)
    session.add(city)
    session.commit()

def list_cities():
    cities = session.query(City).all()
    for city in cities:
        print(city.city_id, city.city, city.country_id)

def delete_city(city_id):
    city = session.query(City).filter_by(city_id=city_id).one()
    session.delete(city)
    session.commit()

# Funciones para interactuar con la tabla "users"
def create_users_table():
    Base.metadata.create_all(engine)
    print("Tabla de usuarios creada")

def delete_users_table():
    User.__table__.drop(engine)
    print("Tabla de usuarios borrada")

def show_users_table_structure():
    metadata.reflect(bind=engine)
    print(repr(metadata.tables['users']))

# Menú principal
def menu():
    while True:
        print("Menú principal:")
        print("1. Crear país")
        print("2. Listar países")
        print("3. Eliminar país")
        print("4. Crear ciudad")
        print("5. Listar ciudades")
        print("6. Eliminar ciudad")
        print("7. Crear tabla usuarios")
        print("8. Borrar tabla usuarios")
        print("9. Mostrar estructura tabla")
        print("0. Salir")

        option = input("Ingrese una opción: ")
        if option == "1":
            name = input("Introduce el nombre del país: ")
            create_country(name)
        elif option == "2":
            list_countries()
        elif option == "3":
            id = input("Introduce el ID del país que quieres eliminar: ")
            delete_country(id)
        elif option == "4":
            name = input("Introduce el nombre de la ciudad: ")
            country_id = input("Introduce el ID del país: ")
            create_city(name, country_id)
        elif option == "5":
            list_cities()
        elif option == "6":
            id = input("Introduce el ID de la ciudad que quieres eliminar: ")
            delete_city(id)
        elif option == "7":
            create_users_table()
        elif option == "8":
            delete_users_table()
        elif option == "9":
            show_users_table_structure()
        elif option == "0":
            break
        else:
            print("Opción inválida")


if __name__ == "__main__":
    menu()