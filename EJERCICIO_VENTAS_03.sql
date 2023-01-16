-- Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.

SELECT SUM(TOTAL) FROM PEDIDO;

-- Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.

SELECT AVG(TOTAL) FROM PEDIDO;

-- Calcula el número total de clientes que aparecen en la tabla cliente.

SELECT distinct ID, concat(NOMBRE, ' ', APELLIDO1, ' ', APELLIDO2) AS NOMBRE FROM CLIENTE;

-- Calcula el número total de comerciales distintos que aparecen en la tabla pedido.

SELECT COUNT(DISTINCT ID_COMERCIAL) FROM PEDIDO;

-- Calcula cuál es la mayor cantidad que aparece en la tabla pedido.

SELECT MAX(TOTAL) FROM PEDIDO;

-- Calcula cuál es la menor cantidad que aparece en la tabla pedido.

SELECT MIN(TOTAL) FROM PEDIDO;

-- Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.

SELECT DISTINCT CIUDAD, MAX(CATEGORÍA) FROM CLIENTE GROUP BY CIUDAD;

-- Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.

SELECT CLIENTE.ID AS ID, concat(CLIENTE.NOMBRE, ' ', CLIENTE.APELLIDO1, ' ', CLIENTE.APELLIDO2) AS NOMBRE, PEDIDO.FECHA AS FECHA, MAX(PEDIDO.TOTAL) AS VALOR
FROM CLIENTE
JOIN PEDIDO ON (CLIENTE.ID = PEDIDO.ID_CLIENTE)
GROUP BY CLIENTE.NOMBRE, date(PEDIDO.FECHA)
ORDER BY PEDIDO.TOTAL DESC;

-- Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.

SELECT CLIENTE.ID AS ID, concat(CLIENTE.NOMBRE, ' ', CLIENTE.APELLIDO1, ' ', CLIENTE.APELLIDO2) AS NOMBRE, PEDIDO.FECHA AS FECHA, MAX(PEDIDO.TOTAL) AS VALOR
FROM CLIENTE
JOIN PEDIDO ON (CLIENTE.ID = PEDIDO.ID_CLIENTE)
WHERE PEDIDO.TOTAL > 2000
GROUP BY CLIENTE.NOMBRE, date(PEDIDO.FECHA)
ORDER BY PEDIDO.TOTAL DESC;

-- Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.

SELECT CLIENTE.ID AS ID, concat(CLIENTE.NOMBRE, ' ', CLIENTE.APELLIDO1, ' ', CLIENTE.APELLIDO2) AS NOMBRE, PEDIDO.FECHA AS FECHA, MAX(PEDIDO.TOTAL) AS VALOR
FROM CLIENTE
JOIN PEDIDO ON (CLIENTE.ID = PEDIDO.ID_CLIENTE)
WHERE PEDIDO.fecha = '2016-08-17'
GROUP BY CLIENTE.NOMBRE
ORDER BY PEDIDO.TOTAL DESC;

-- Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.

SELECT CLIENTE.ID, concat(CLIENTE.NOMBRE, ' ', CLIENTE.APELLIDO1, ' ', CLIENTE.APELLIDO2) AS CLIENTE,
COUNT(PEDIDO.ID_CLIENTE) AS PEDIDOS_TOTALES
FROM CLIENTE
LEFT JOIN PEDIDO ON (CLIENTE.ID = PEDIDO.ID_CLIENTE)
GROUP BY CLIENTE.ID
ORDER BY COUNT(PEDIDO.ID_CLIENTE) DESC;

-- Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.

SELECT CLIENTE.ID, concat(CLIENTE.NOMBRE, ' ', CLIENTE.APELLIDO1, ' ', CLIENTE.APELLIDO2) AS CLIENTE,
COUNT(PEDIDO.ID_CLIENTE) AS PEDIDOS_TOTALES, PEDIDO.FECHA AS FECHA
FROM CLIENTE
LEFT JOIN PEDIDO ON (CLIENTE.ID = PEDIDO.ID_CLIENTE)
WHERE year(PEDIDO.FECHA) = '2017'
GROUP BY CLIENTE.ID
ORDER BY COUNT(PEDIDO.ID_CLIENTE) DESC;

-- Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0. Puede hacer uso de la función IFNULL.

SELECT CLIENTE.ID, concat(CLIENTE.NOMBRE, ' ', CLIENTE.APELLIDO1) AS CLIENTE,
COUNT(PEDIDO.ID_CLIENTE) AS PEDIDOS_TOTALES 
FROM CLIENTE
LEFT JOIN PEDIDO ON (CLIENTE.ID = PEDIDO.ID_CLIENTE)
GROUP BY CLIENTE.ID
HAVING COUNT(PEDIDO.ID_CLIENTE) = 0;

-- Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.

SELECT max(TOTAL) as PEDIDO_MAXIMO, fecha from pedido
group by year(fecha)
ORDER BY year(FECHA) DESC;

-- Devuelve el número total de pedidos que se han realizado cada año.

select count(id) AS PEDIDOS, year(fecha) AS AÑO from pedido
group by year(fecha)
ORDER BY YEAR(FECHA);