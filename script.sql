-- 1. Cargar el respaldo de la base de datos unidad2.sql.


-- 2. El cliente usuario01 ha realizado la siguiente compra:
-- ● producto: producto9.
-- ● cantidad: 5.
-- ● fecha: fecha del sistema.
-- Mediante el uso de transacciones, realiza las consultas correspondientes para este
-- requerimiento y luego consulta la tabla producto para validar si fue efectivamente descontado en el stock.

BEGIN TRANSACTION;
INSERT INTO compra (cliente_id, fecha) VALUES (1, '13-04-2022');
SELECT * FROM compra; -- verificar id de compra_id (id 39 asignada)
INSERT INTO detalle_compra (producto_id, compra_id, cantidad) VALUES (9, 39, 5);
SELECT * FROM detalle_compra; 
UPDATE producto SET stock = stock -5 WHERE id = 9;
SELECT * FROM producto;
COMMIT;

-- 3. El cliente usuario02 ha realizado la siguiente compra:
-- ● producto: producto1, producto 2, producto 8.
-- ● cantidad: 3 de cada producto.
-- ● fecha: fecha del sistema.

BEGIN TRANSACTION;
INSERT INTO compra (cliente_id, fecha) VALUES (2, '13-04-2022');
SELECT * FROM compra; 
INSERT INTO detalle_compra (producto_id, compra_id, cantidad) VALUES (1, 40, 3);
SELECT * FROM detalle_compra; 
UPDATE producto SET stock = stock -3 WHERE id = 1;
SELECT * FROM producto;
COMMIT;

BEGIN TRANSACTION;
INSERT INTO compra (cliente_id, fecha) VALUES (2, '13-04-2022');
SELECT * FROM compra; 
INSERT INTO detalle_compra (producto_id, compra_id, cantidad) VALUES (2, 41, 3);
SELECT * FROM detalle_compra; 
UPDATE producto SET stock = stock -3 WHERE id = 2;
SELECT * FROM producto;
COMMIT;

BEGIN TRANSACTION;
INSERT INTO compra (cliente_id, fecha) VALUES (2, '13-04-2022');
SELECT * FROM compra; 
INSERT INTO detalle_compra (producto_id, compra_id, cantidad) VALUES (8, 42, 3);
SELECT * FROM detalle_compra; 
UPDATE producto SET stock = stock -3 WHERE id = 8;
SELECT * FROM producto;
COMMIT;




-- 4. Realizar las siguientes consultas:
-- a. Deshabilitar el AUTOCOMMIT.
-- Solución punto a: \set AUTOCOMMIT off

-- b. Insertar un nuevo cliente.
BEGIN TRANSACTION;
INSERT INTO cliente (nombre, email) VALUES ('usuario20', 'usuario20@mail.com');
-- c. Confirmar que fue agregado en la tabla cliente.
SELECT * FROM cliente
-- d. Realizar un ROLLBACK.
ROLLBACK;
-- e. Confirmar que se restauró la información, sin considerar la inserción del punto b.
SELECT * FROM cliente;
-- f. Habilitar de nuevo el AUTOCOMMIT
-- Solución a punto f: \set AUTOCOMMIT on