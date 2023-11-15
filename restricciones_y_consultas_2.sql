SELECT categoria.nombre, ROUND(AVG(producto.precio_unitario),2) AS promedio_x_categoria
FROM categoria
JOIN producto ON categoria.id = producto.categoria_id
GROUP BY categoria.nombre;


SELECT categoria.nombre, SUM(stock.cantidad) AS stock_x_categoria
FROM categoria
JOIN producto ON categoria.id = producto.categoria_id
JOIN stock ON producto.id = stock.producto_id
GROUP BY categoria.nombre;


SELECT sucursal.nombre, SUM(orden.total) AS ventas_x_sucursal 
FROM sucursal
JOIN orden ON sucursal.id = orden.sucursal_id
GROUP BY sucursal.nombre;


SELECT cliente.nombre, SUM(orden.total) AS mayor_total_compras
FROM cliente
JOIN orden ON cliente.id = orden.cliente_id
GROUP BY cliente.nombre
ORDER BY mayor_total_compras DESC
LIMIT 1;


SELECT cliente.nombre, COUNT(orden.id) AS mayor_compras_cliente
FROM orden
JOIN cliente ON orden.cliente_id = cliente.id
GROUP BY cliente.nombre
ORDER BY mayor_compras_cliente DESC
LIMIT 1;

