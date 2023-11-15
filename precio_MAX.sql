select id, nombre, precio_unitario as "precio_maximo"
from producto
where precio_unitario = (select MAX(precio_unitario) from producto);
