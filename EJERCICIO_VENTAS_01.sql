-- Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.

SELECT FECHA FROM PEDIDO ORDER BY FECHA DESC;

-- Devuelve todos los datos de los dos pedidos de mayor valor.

SELECT ID, TOTAL, FECHA, ID_CLIENTE, ID_COMERCIAL FROM PEDIDO ORDER BY TOTAL DESC LIMIT 2;

-- Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.

SELECT DISTINCT ID_CLIENTE FROM PEDIDO;

-- Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.

SELECT FECHA, TOTAL FROM PEDIDO WHERE year(fecha)='2017' AND TOTAL > 500;

-- Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.

SELECT NOMBRE, concat(APELLIDO1, ' ', APELLIDO2) AS APELLIDO, COMISIÓN FROM COMERCIAL WHERE COMISIÓN between 0.05 AND 0.11 ORDER BY NOMBRE ASC;

-- Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.

SELECT NOMBRE, concat(APELLIDO1, ' ', APELLIDO2) AS APELLIDO, MAX(COMISIÓN) AS COMISIÓN FROM COMERCIAL;

-- Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.

SELECT NOMBRE, concat(APELLIDO1, ' ', APELLIDO2) AS APELLIDO FROM CLIENTE WHERE APELLIDO2 IS NOT NULL ORDER BY APELLIDO1 ASC;

-- Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.

SELECT NOMBRE FROM cliente WHERE NOMBRE LIKE 'P%' OR NOMBRE LIKE'A%N' ORDER BY NOMBRE ASC;

-- Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.

SELECT NOMBRE FROM CLIENTE WHERE NOMBRE NOT LIKE 'A%' ORDER BY NOMBRE ASC;

-- Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.

SELECT DISTINCT NOMBRE FROM COMERCIAL WHERE NOMBRE LIKE '%EL' OR NOMBRE LIKE '%O';
