ALTER TABLE producto ADD CONSTRAINT fk_producto_categoria
FOREIGN KEY (categoria_id)
REFERENCES categoria(id);

ALTER TABLE stock ADD CONSTRAINT fk_stock_sucursal
FOREIGN KEY (sucursal_id)
REFERENCES sucursal(id);

ALTER TABLE stock ADD CONSTRAINT fk_stock_producto
FOREIGN KEY (producto_id)
REFERENCES producto(id);

ALTER TABLE orden ADD CONSTRAINT fk_orden_cliente
FOREIGN KEY (cliente_id)
REFERENCES cliente(id);

ALTER TABLE orden ADD CONSTRAINT fk_orden_sucursal
FOREIGN KEY (sucursal_id)
REFERENCES sucursal(id);

ALTER TABLE item ADD CONSTRAINT fk_item_orden
FOREIGN KEY (orden_id)
REFERENCES orden(id);

ALTER TABLE item ADD CONSTRAINT fk_item_producto
FOREIGN KEY (producto_id)
REFERENCES producto(id);

