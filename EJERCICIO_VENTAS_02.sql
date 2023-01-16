-- Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.

SELECT concat(cliente.nombre, ' ', cliente.apellido1, ' ', cliente.apellido2) AS CLIENTE, pedido.fecha AS FECHA, pedido.total AS TOTAL
FROM cliente
LEFT JOIN pedido ON (cliente.id = pedido.id_cliente)
WHERE cliente.NOMBRE or cliente.apellido1 or cliente.apellido2 IS NOT NULL
group by cliente.nombre
order by cliente.apellido1, cliente.apellido2, cliente.nombre;

-- Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado. Este listado también debe incluir los comerciales que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.

SELECT concat(comercial.nombre, ' ', comercial.apellido1, ' ', comercial.apellido2) AS COMERCIALES, pedido.total AS PEDIDOS, pedido.fecha AS FECHAS
FROM comercial
LEFT JOIN pedido on (comercial.id = pedido.id_comercial)
group by comercial.nombre
order by comercial.apellido1, comercial.apellido2, comercial.nombre;

-- Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.

SELECT concat(cliente.nombre, ' ', cliente.apellido1, ' ', cliente.apellido2) AS CLIENTE, pedido.fecha AS FECHA, pedido.total AS TOTAL
FROM cliente
LEFT JOIN pedido ON (cliente.id = pedido.id_cliente)
WHERE pedido.id_cliente IS NULL
group by cliente.nombre
order by cliente.apellido1, cliente.apellido2, cliente.nombre;

-- Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.

SELECT concat(comercial.nombre, ' ', comercial.apellido1, ' ', comercial.apellido2) AS COMERCIALES, pedido.total AS PEDIDOS, pedido.fecha AS FECHAS
FROM comercial
LEFT JOIN pedido on (comercial.id = pedido.id_comercial)
WHERE pedido.id_comercial IS NULL
group by comercial.nombre
order by comercial.apellido1, comercial.apellido2, comercial.nombre;

-- Devuelve un listado con los clientes que no han realizado ningún pedido y de los comerciales que no han participado en ningún pedido. Ordene el listado alfabéticamente por los apellidos y el nombre. En en listado deberá diferenciar de algún modo los clientes y los comerciales.
	
    SELECT concat(comercial.nombre, ' ', comercial.apellido1, ' ', comercial.apellido2) AS NOMBRE_COMPLETO
	FROM comercial
	LEFT JOIN pedido on (comercial.id = pedido.id_comercial)
	WHERE pedido.id_comercial is null
	UNION
	SELECT concat(cliente.nombre, ' ', cliente.apellido1, ' ', cliente.apellido2)
	FROM cliente
	LEFT JOIN pedido on (cliente.id = pedido.id_cliente)
	WHERE pedido.id_cliente IS NULL
	order by NOMBRE_COMPLETO ASC;
    
    