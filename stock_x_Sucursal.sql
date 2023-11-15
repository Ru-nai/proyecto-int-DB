select sucursal.id, sucursal.nombre, SUM(stock.cantidad) as stock_x_sucursal
from sucursal
join stock on sucursal.id = stock.sucursal_id
group by sucursal.id, sucursal.nombre;
