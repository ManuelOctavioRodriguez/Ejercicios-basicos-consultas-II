-- Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).

SELECT count(TOTAL) FROM PEDIDO WHERE ID_CLIENTE = (SELECT ID FROM CLIENTE WHERE NOMBRE = 'ADELA' AND APELLIDO1 = 'SALAS' AND APELLIDO2 = 'DÍAZ'); 

-- Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)
 
SELECT count(TOTAL) FROM PEDIDO WHERE ID_COMERCIAL = (SELECT ID FROM COMERCIAL WHERE NOMBRE = 'DANIEL' AND APELLIDO1 = 'SÁEZ' AND APELLIDO2 = 'VEGA');

-- Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)

SELECT ID, concat(NOMBRE, ' ', APELLIDO1, ' ', APELLIDO2) AS NOMBRE, CIUDAD, CATEGORÍA FROM cliente WHERE ID = (SELECT ID_CLIENTE FROM PEDIDO HAVING MAX(TOTAL));

-- Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.

SELECT FECHA, min(TOTAL) AS MENOR_PEDIDO FROM PEDIDO WHERE ID_CLIENTE = (SELECT ID FROM CLIENTE WHERE NOMBRE = 'PEPE' AND APELLIDO1 = 'RUIZ' AND APELLIDO2 = 'SANTANA');

-- Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.

SELECT CLIENTE.ID, concat(CLIENTE.NOMBRE, ' ', CLIENTE.APELLIDO1, ' ', CLIENTE.APELLIDO2) AS NOMBRE, CLIENTE.CIUDAD, CLIENTE.CATEGORÍA, 
count(PEDIDO.TOTAL) AS PEDIDOS, pedido.fecha AS FECHA
FROM CLIENTE
LEFT JOIN PEDIDO ON (CLIENTE.ID = PEDIDO.ID_CLIENTE) 
where PEDIDO.total >= (select avg(total) from pedido where year(fecha) = '2017')
and year(fecha) = '2017'
GROUP BY CLIENTE.NOMBRE
ORDER BY pedido.fecha ASC
;

-- Devuelve el pedido más caro que existe en la tabla pedido si hacer uso de MAX, ORDER BY ni LIMIT.

SELECT TOTAL FROM PEDIDO WHERE TOTAL >= all(SELECT TOTAL FROM PEDIDO);

-- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando ANY o ALL).

SELECT * FROM CLIENTE WHERE ID <> all(SELECT id_cliente FROM pedido);

-- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando ANY o ALL).

SELECT * FROM comercial WHERE ID <> all(SELECT id_comercial FROM pedido);

-- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).

SELECT * FROM CLIENTE WHERE ID NOT IN (SELECT ID_CLIENTE FROM PEDIDO);

-- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).

SELECT * FROM COMERCIAL WHERE ID NOT IN (SELECT ID_COMERCIAL FROM PEDIDO);

-- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).

SELECT ID FROM CLIENTE WHERE NOT EXISTS (SELECT ID_CLIENTE FROM PEDIDO WHERE CLIENTE.ID = PEDIDO.ID_CLIENTE);

-- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).

SELECT ID FROM COMERCIAL WHERE NOT EXISTS (SELECT ID_COMERCIAL FROM PEDIDO WHERE COMERCIAL.ID = PEDIDO.ID_COMERCIAL);