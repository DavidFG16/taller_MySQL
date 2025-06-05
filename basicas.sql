USE tienda;

-- Consulta todos los datos de la tabla `usuarios` para ver la lista completa de clientes.
SELECT * FROM usuarios;

-- Muestra los nombres y correos electrónicos de todos los clientes que residen en la ciudad de Madrid.
SELECT nombre, email 
FROM usuarios
WHERE ciudad = 'Madrid';

-- Obtén una lista de productos con un precio mayor a $100.000, mostrando solo el nombre y el precio.
SELECT nombre, precio 
FROM productos 
WHERE precio > 100000;

-- Encuentra todos los empleados que tienen un salario superior a $2.500.000, mostrando su nombre, puesto y salario.
SELECT u.nombre, e.puesto, e.salario 
FROM usuarios AS u 
JOIN empleados AS e ON u.usuario_id = e.usuario_id
WHERE salario > 2500000;

-- Lista los nombres de los productos en la categoría "Electrónica", ordenados alfabéticamente.
SELECT nombre
FROM productos
WHERE categoria = 'Electrónica'
ORDER BY nombre ASC;

-- Muestra los detalles de los pedidos que están en estado "Pendiente", incluyendo el ID del pedido, el ID del cliente y la fecha del pedido.
SELECT p.estado, p.pedido_id, p.cliente_id, p.fecha_pedido, dp.cantidad, dp.precio_unitario
FROM pedidos AS p
JOIN detalles_pedidos AS dp ON p.pedido_id = dp.pedido_id
WHERE estado = 'Pendiente';

-- Encuentra el nombre y el precio del producto más caro en la base de datos.
SELECT nombre, precio 
FROM productos
ORDER BY precio DESC
LIMIT 1;

-- Obtén el total de pedidos realizados por cada cliente, mostrando el ID del cliente y el total de pedidos.
SELECT u.usuario_id,u.nombre, COUNT(p.pedido_id) AS total_pedidos
FROM usuarios AS u  
JOIN pedidos AS p ON u.usuario_id = p.cliente_id
GROUP BY u.usuario_id;

-- Calcula el promedio de salario de todos los empleados en la empresa.
SELECT AVG(salario) AS 'Promedio Empleados'
FROM empleados;

-- Encuentra el número de productos en cada categoría, mostrando la categoría y el número de productos.
SELECT categoria, COUNT(categoria) AS '# Productos'
FROM productos
GROUP BY categoria;

-- Obtén una lista de productos con un precio mayor a $75 USD, mostrando solo el nombre, 
--el precio y su respectivo precio en USD.
SELECT nombre, precio, precio / 4100 AS Dolares
FROM productos
WHERE precio / 4100 > 75; --El WHERE se ejecuta primero que el SELECT, que tiene el ALIAS, por eso toca especificar

-- Lista todos los proveedores registrados.
SELECT * FROM proveedores;