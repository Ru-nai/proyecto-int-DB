begin;

select id, nombre, precio_unitario as "precio_minimo"
from producto 
where precio_unitario = (select MIN(precio_unitario) from producto);

commit;