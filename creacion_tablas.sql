begin;

CREATE table if not EXISTS cliente(
    id SERIAL PRIMARY key not NULL, 
    nombre VARCHAR(50), 
    telefono BIGINT);
  
CREATE table if not EXISTS sucursal(
    id SERIAL PRIMARY key not NULL, 
    nombre VARCHAR(20) not NULL, 
    direccion VARCHAR (30) not null);
    
CREATE table if not EXISTS orden(
    id SERIAL PRIMARY key not NULL, 
    cliente_id INTEGER references cliente(id) not null,
    sucursal_id INTEGER references sucursal(id) not null,
    fecha DATE, 
    total numeric(10,2) not null);

CREATE table if not EXISTS categoria(
    id SERIAL PRIMARY key not NULL, 
    nombre VARCHAR(30));
   
CREATE table if not EXISTS producto(
    id SERIAL PRIMARY key not NULL, 
    nombre VARCHAR(30) not null,
    marca VARCHAR(20),
    categoria_id INTEGER references categoria(id) not null,
    precio_unitario numeric(10,2) not null);
    
CREATE table if not EXISTS item(
    id SERIAL PRIMARY key not NULL, 
    orden_id INTEGER references orden(id) not null,
    producto_id INTEGER REFERENCES producto(id) NOT null,
    cantidad INTEGER,
    monto_venta numeric(10,2) not null);
    
CREATE table if not EXISTS stock(
    id SERIAL PRIMARY key not NULL, 
    sucursal_id INTEGER REFERENCES sucursal(id) NOT NULL,
    producto_id INTEGER REFERENCES producto(id) NOT null,
    cantidad INTEGER,
    UNIQUE (sucursal_id, producto_id));
   
commit;
 