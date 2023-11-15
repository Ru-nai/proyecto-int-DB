begin; 

select orden.cliente_id, cliente.nombre, COUNT(*) as ordenes_x_cliente
from orden
join cliente on orden.cliente_id = cliente.id 
group by orden.cliente_id, cliente.nombre  
order by orden.cliente_id asc;

commit;

begin;

select orden.cliente_id, cliente.nombre, SUM(orden.total) as total_valores_x_cliente
from orden 
join cliente on orden.cliente_id = cliente.id 
group by orden.cliente_id, cliente.nombre 
order by orden.cliente_id asc;

commit;