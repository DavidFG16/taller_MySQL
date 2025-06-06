USE tienda;

-- Encuentra los nombres de los clientes y los detalles de sus pedidos.
SELECT p.pedido_id, u.nombre AS Cliente, po.nombre AS Producto, dp.cantidad AS Cantidad, dp.precio_unitario AS 'Precio Unitario'
FROM usuarios AS u
INNER JOIN pedidos AS p ON u.usuario_id = p.cliente_id
INNER JOIN detalles_pedidos AS dp ON p.pedido_id = dp.pedido_id
INNER JOIN productos AS po ON dp.producto_id = po.producto_id

-- Lista todos los productos pedidos junto con el precio unitario de cada pedido
SELECT pro.nombre, dp.cantidad AS 'Cantidad Pedida', dp.precio_unitario
FROM productos AS pro
INNER JOIN detalles_pedidos AS dp ON pro.producto_id = dp.producto_id

-- Encuentra los nombres de los clientes y los nombres de los empleados que gestionaron sus pedidos
-- TODO
SELECT u.nombre, p.empleado_id
FROM usuarios AS u      
INNER JOIN pedidos AS p ON u.usuario_id = p.cliente_id
INNER JOIN empleados AS e ON p.empleado_id = e.empleado_id
GROUP BY tipo_id

-- Muestra todos los pedidos y, si existen, los productos en cada pedido, incluyendo los pedidos sin productos usando `LEFT JOIN`
SELECT p.*, pro.nombre AS 'Nombre Producto'
FROM pedidos AS p
LEFT JOIN detalles_pedidos AS dp ON p.pedido_id = dp.pedido_id      
LEFT JOIN productos AS pro ON dp.producto_id = pro.producto_id

-- Encuentra los productos y, si existen, los detalles de pedidos en los que no se ha incluido el producto usando `RIGHT JOIN`.
SELECT dp.*, pro.nombre AS 'Nombre Producto'
FROM detalles_pedidos AS dp
RIGHT JOIN productos AS pro ON dp.producto_id = pro.producto_id

-- Lista todos los empleados junto con los pedidos que han gestionado, si existen, usando `LEFT JOIN` para ver los empleados sin pedidos.
SELECT e.empleado_id, e.puesto, p.pedido_id
FROM empleados AS e
LEFT JOIN pedidos AS p ON e.empleado_id  = p.empleado_id        

-- Encuentra los empleados que no han gestionado ningún pedido usando un `LEFT JOIN` combinado con `WHERE`.
SELECT e.empleado_id, e.puesto, p.pedido_id
FROM empleados AS e
LEFT JOIN pedidos AS p ON e.empleado_id  = p.empleado_id   
WHERE p.pedido_id IS NULL

-- Calcula el total gastado en cada pedido, mostrando el ID del pedido y el total, usando `JOIN`.
SELECT p.pedido_id AS 'ID Pedido', dp.precio_unitario*cantidad AS Total
FROM pedidos AS p
JOIN detalles_pedidos AS dp ON dp.pedido_id = p.pedido_id

-- Realiza un `CROSS JOIN` entre clientes y productos para mostrar 
--todas las combinaciones posibles de clientes y productos.
SELECT u.usuario_id, pro.nombre
FROM usuarios as u
CROSS JOIN productos AS pro
    WHERE u.tipo_id = 1

-- Encuentra los nombres de los clientes y los productos que han comprado, si existen, 
--incluyendo los clientes que no han realizado pedidos usando `LEFT JOIN`.
SELECT p.pedido_id, u.nombre AS Cliente, pro.nombre AS 'Producto Comprado'
FROM usuarios AS u
INNER JOIN pedidos AS p ON u.usuario_id = p.cliente_id
INNER JOIN detalles_pedidos AS dp ON p.pedido_id = p.pedido_id 
LEFT JOIN productos AS pro ON dp.producto_id = pro.producto_id