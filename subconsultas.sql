USE tienda;

-- Encuentra los nombres de los clientes que han realizado al menos un pedido de más de $500.000.
SELECT u.nombre
FROM usuarios AS u
JOIN pedidos AS p ON u.usuario_id = p.cliente_id
WHERE p.pedido_id IN (
    SELECT dp.pedido_id
    FROM detalles_pedidos AS dp
    WHERE dp.precio_unitario * dp.cantidad > 500000
);

-- Muestra los productos que nunca han sido pedidos.
SELECT pro.nombre AS 'No Pedido'
FROM productos AS pro
WHERE pro.producto_id NOT IN 
(SELECT producto_id FROM detalles_pedidos)

-- Lista los empleados que han gestionado pedidos en los últimos 6 meses.
SELECT u.nombre
FROM usuarios AS u
JOIN empleados AS e ON u.usuario_id = e.usuario_id
WHERE e.empleado_id IN (
    SELECT p.empleado_id
    FROM pedidos AS p
    WHERE p.fecha_pedido >= CURDATE() - INTERVAL 6 MONTH
);

-- Encuentra el pedido con el total de ventas más alto.
SELECT pedido_id
FROM detalles_pedidos
WHERE cantidad * precio_unitario = (
    SELECT MAX(cantidad*precio_unitario)
    FROM detalles_pedidos
)

-- Muestra los nombres de los clientes que han realizado más pedidos que el 
-- promedio de pedidos de todos los clientes.
-- TODO: Faltó, esta dificil
SELECT u.nombre AS Cliente
FROM usuarios AS u
INNER JOIN pedidos AS p ON u.usuario_id = p.cliente_id
WHERE 

-- Obtén los productos cuyo precio es superior al precio promedio de todos los productos.