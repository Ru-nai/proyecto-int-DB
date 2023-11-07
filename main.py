import sqlite3 as sql

'''

Dada la base de datos que diseñamos en la anterior etapa, escribe las consultas para crear cada 
una de las tablas en SQLite.

La tabla stock debe tener una restricción de unicidad unique (sucursal_id, producto_id).

Una restricción unique se utiliza de la siguiente forma:

CREATE TABLE someTable (
    id serial PRIMARY KEY,
    col1 int NOT NULL,
    col2 int NOT NULL,
    UNIQUE (col1, col2)
)

'''
conexion = sql.connect("Proyecto_int.db")
cursor = conexion.cursor()

cursor.execute(
        """CREATE TABLE IF NOT EXISTS cliente (
            id INTEGER PRIMARY KEY NOT NULL,
            nombre TEXT NOT NULL,
            telefono INTEGER NOT NULL
        )"""
)

cursor.execute(
        """CREATE TABLE IF NOT EXISTS orden (
            id INTEGER PRIMARY KEY NOT NULL,
            cliente_id INTEGER REFERENCES cliente(id) NOT NULL,
            sucursal_id INTEGER REFERENCES sucursal(id) NOT NULL,
            fecha TEXT,
            total INTEGER
        )"""
)


cursor.execute(
        """CREATE TABLE IF NOT EXISTS producto (
            id INTEGER PRIMARY KEY NOT NULL,
            nombre TEXT NOT NULL,
            marca TEXT,
            categoria_id INTEGER REFERENCES categoria(id),
            precio_unitario INTEGER NOT NULL
        )"""
)

cursor.execute(
        """CREATE TABLE IF NOT EXISTS item (
            id INTEGER PRIMARY KEY NOT NULL,
            orden_id INTEGER REFERENCES orden(id) NOT NULL,
            producto_id INTEGER REFERENCES producto(id) NOT NULL,
            cantidad INTEGER,
            monto_venta INTEGER NOT NULL
        )"""
)

cursor.execute(
        """CREATE TABLE IF NOT EXISTS categoria(
            id INTEGER PRIMARY KEY NOT NULL,
            nombre TEXT
        )"""
)

cursor.execute(
        """CREATE TABLE IF NOT EXISTS sucursal(
            id INTEGER PRIMARY KEY NOT NULL,
            nombre TEXT NOT NULL,
            direccion TEXT NOT NULL
        )"""
)

cursor.execute(
        """CREATE TABLE IF NOT EXISTS stock (
            id INTEGER PRIMARY KEY NOT NULL,
            sucursal_id INTEGER REFERENCES sucursal(id) NOT NULL,
            producto_id INTEGER REFERENCES producto(id) NOT NULL,
            cantidad INTEGER,
            UNIQUE (sucursal_id, producto_id)
        )"""
)


conexion.commit()
