/*========================================================================

SQL-DQL en SQLServer

Archivo: 05-filtrado-registros-where.sql

Descripción: Recuperar únicamente las filas que cunplen determinads condiciones mediante la clausula WHERE 


=========================================================================*/

/*
  SINTAXIS GENERAL:

  SELECT 
	columna_1, 
	columna_2, 
	columna_n
  FROM tabla
  WHERE condicion;


  ORDEN SINTACTICO (CONSULTAS)

  SELEct
  FROM 
  JOIN / ON 
  WHERE 
  GROUP BY
  HAVING
  ORDER BY

  ORDEN DE EJECUCIÓN 

  FROM / JOIN 
  WHERE 
  GROUP BY 
  HAVING
  SELECT 
  DISTINCT
  ORDER BY
  TOP

*/

-- Seleccionar los datos de los clientes donde su numero de cliente sea 25
SELECT 
	c.id_cliente AS [numero_cliente], 
	UPPER(CONCAT(c.nombre, ' ', 
		   c.apellido_paterno, ' ', 
		   c.apellido_materno)) AS [nombre_completo], 
	c.correo
FROM clientes AS c
WHERE c.id_cliente = 25;

-- Seleccionar todas las categorias que sean de Cómputo
SELECT 
	c.id_categoria, 
	c.nombre
FROM categorias AS c
WHERE c.nombre = 'CÓMPUTO';
-- Seleccionar los datos del Cliente1

-- Seleccionar los datos de los clientes que no pertencen al departemento 1

-- Seleccionar los productos cuyo precio sea superior a $490

-- Seleccionar los productos con existencia crítica inferior a 10 unidades

-- Seleccionar los empleados con salario de 30000 y mas

-- Seleccionar todas las ventas realizadas el 24 de diciembre de 2025
-- manejo de fechas
-- las fechas deben ir entre comillas y seguir el formato AAAA-MM-DD

SELECT 
	v.id_venta, 
	v.fecha, 
	v.id_cliente, 
	v.id_empleado
FROM ventas AS v
WHERE fecha = '2025-12-24';


SELECT 
	v.id_venta, 
	v.fecha,
	YEAR(v.fecha) AS [Año],
	MONTH (v.fecha) AS [Mes],
	DAY(v.fecha) AS [Día],
	FORMAT (v.fecha, 'MMMM') AS [Mes en Ingles],
	UPPER(FORMAT (v.fecha, 'MMMM', 'es-ES')) AS [Mes en Español],
	FORMAT (v.fecha, 'MMM') AS [Mes Abreviado],
	FORMAT (v.fecha, 'MMM', 'es-ES') AS [Mes Abreviado],
	FORMAT (v.fecha, 'dddd') AS [Día en Ingles],
	FORMAT (v.fecha, 'dddd', 'es-Es') AS [Día en Ingles],
	v.id_cliente, 
	v.id_empleado
FROM ventas AS v
WHERE fecha = '2025-12-24';




--DISTINCT 
-- quita elementos repeidos de una o la combinación de columnas


-- Muestrame los sexos de los clientes
SELECT DISTINCT 
	sexo
FROM CLIENTES AS c;


SELECT DISTINCT
	cu.nombre
FROM clientes AS c
INNER JOIN ciudades as cu
ON c.id_ciudad = cu.id_ciudad;

-- seleccionar los descuentos únicos de las ventas

SELECT DISTINCT
	dv.descuento
FROM detalle_ventas AS dv
ORDER BY dv.descuento DESC;

SELECT DISTINCT 
	p.id_categoria, 
	p.id_proveedor
FROM productos AS p;
GO

-- TOP
-- Limita la cantidad de filas devueltas por una consulta

SELECT TOP (56)
	dv.id_venta, 
	dv.precio, 
	dv.cantidad, 
	dv.descuento
FROM detalle_ventas as dv;

SELECT TOP (20) PERCENT
	dv.id_venta, 
	dv.precio, 
	dv.cantidad, 
	dv.descuento
FROM detalle_ventas as dv;

SELECT TOP (20) 
	dv.id_venta, 
	dv.precio, 
	dv.cantidad, 
	dv.descuento
FROM detalle_ventas as dv;

-- Seleccionar las ventas anteriores al 1  de febrero de 2025

SELECT 
	v.id_venta, 
	v.fecha,
	YEAR(v.fecha) AS [Año],
	MONTH (v.fecha) AS [Mes],
	DAY(v.fecha) AS [Día],
	FORMAT (v.fecha, 'MMMM') AS [Mes en Ingles],
	UPPER(FORMAT (v.fecha, 'MMMM', 'es-ES')) AS [Mes en Español],
	FORMAT (v.fecha, 'MMM') AS [Mes Abreviado],
	FORMAT (v.fecha, 'MMM', 'es-ES') AS [Mes Abreviado],
	FORMAT (v.fecha, 'dddd') AS [Día en Ingles],
	FORMAT (v.fecha, 'dddd', 'es-Es') AS [Día en Ingles],
	v.id_cliente, 
	v.id_empleado
FROM ventas AS v
WHERE v.fecha < '2025-02-01';


-- Comparaciones con expresiones calculadas 
-- WHERE también puede evaluar un calculo

-- Mostrar productos cuyo valor del inventario sea mayor a $50,000

SELECT 
	p.codigo,
	p.nombre,
	p.precio, 
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE (p.precio * p.existencia) > 50000
ORDER BY valor_inventario DESC;
GO


-- Operador Lógico AND
-- Mostrar productos con precio entre $200 y $300 que ademas tenga menos de 
-- 50 unidades

SELECT 
	p.codigo,
	p.nombre,
	p.precio, 
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.precio >= 200 
	  AND 
	  p.precio<=300
	  AND 
	  p.existencia < 50;

-- Clausula BETWEEN (EQUIVALENTE A UN RANGO)

SELECT 
	p.codigo,
	p.nombre,
	p.precio, 
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.precio BETWEEN 200 AND 300
	  AND
	  p.existencia < 50;

-- Mostrar los empleados del departamento 1 cuyo salario sea superior a $25000

SELECT 
	e.id_empleado, 
	e.nombre, 
	e.salario, 
	e.id_departamento
FROM empleados AS e
WHERE e.id_departamento = 1
	  AND 
	  e.salario>25000;

-- Mostrar los productos con existencia inferior a 10 o superior a 190
SELECT 
	p.codigo,
	p.nombre,
	p.precio, 
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.existencia < 10
	OR
	  P.existencia > 190;
-- Mostrar prodcutos que no tengan precio mayor a 400
SELECT 
	p.codigo,
	p.nombre,
	p.precio, 
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE NOT (p.precio > 400);

SELECT 
	p.codigo,
	p.nombre,
	p.precio, 
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.precio <= 400;


-- Seleccionar los empleados que pertenezcan al departamento 1, 
-- al departamento 2 y con salario mayor 25000


SELECT 
	e.id_empleado, 
	e.nombre, 
	e.salario, 
	e.id_departamento
FROM empleados AS e
WHERE (e.id_departamento = 1
      OR 
	  e.id_departamento = 2)
	  AND 
	  e.salario > 25000;


SELECT 
	e.id_empleado, 
	e.nombre, 
	e.salario, 
	e.id_departamento
FROM empleados AS e
WHERE 
	  e.salario > 25000
	  AND
     (e.id_departamento = 1
      OR 
	  e.id_departamento = 2)
	  


-- OPERADOR BETWEEN 
-- BETWEEN permite comprobar si un valor se encuentra dentro de un rango
-- inclusivo

/*===========================================================================
	SINTAXIS

	WHERE columna BETWEEN limite_inferior AND limite_superior;

=============================================================================*/

-- Mostrar los empleados con salario entre $15,000.0 y $20,000.0, incluyendo
-- ambos limites

SELECT 
	e.id_empleado, 
	e.nombre, 
	e.salario
FROM empleados AS e
WHERE e.salario BETWEEN 15000.0 AND 20000.0
ORDER BY 3 DESC;

SELECT 
	e.id_empleado, 
	e.nombre, 
	e.salario
FROM empleados AS e
WHERE e.salario >= 15000
      AND 
	  e.salario <= 20000;

-- seleccionar los productos donde el precio este entre $100 y $200

-- Seleccionar las ventas realizadas del 1 de enero de 2025 al 
-- 10 de enero de 2025

SELECT
	v.id_venta AS numero_venta, 
	v.id_cliente AS cliente, 
	v.id_empleado AS vendedor, 
	v.fecha AS fecha_venta,
	UPPER(FORMAT(v.fecha, 'MMMM', 'es-ES')) AS [mes_venta], 
	UPPER(FORMAT(v.fecha, 'dddd', 'es-ES')) AS [dia_venta], 
    DATEPART(YEAR, v.fecha) AS [año_venta]
FROM ventas AS v 
WHERE v.fecha BETWEEN '2025-01-01' AND '2025-01-10'
ORDER BY fecha_venta;

-- NOT BETWEEN
-- Recupera valores que se encuentran fuera de un rango



-- SELECCIONAR LOS PRODUCTOS QUE NO SE ENCUENTREN EN EL RANGO DE PRECIOS
-- DE 100 Y 400

SELECT 
	p.codigo,
	p.nombre,
	p.precio, 
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.precio NOT BETWEEN 100 AND 400;

-- OPERADOR IN 
-- Permite comprobar un a columna con una lista de valores

/* =================================================================

	WHERE columna IN (valor_1, valor_2, valor_n)

	Es equivalente a varias condiciones conectadas con OR
====================================================================*/

-- Mostrar los productos pertenecientes a las categorias 1, 7, 12
SELECT
	p.codigo, 
	p.nombre, 
	p.precio, 
	p.id_categoria
FROM productos AS p
WHERE p.id_categoria IN (1,7,12)
ORDER BY p.id_categoria;


SELECT
	p.codigo, 
	p.nombre, 
	p.precio, 
	p.id_categoria
FROM productos AS p
WHERE p.id_categoria = 1
      OR 
	  p.id_categoria = 7
	  OR p.id_categoria = 12
ORDER BY p.id_categoria;


-- SELECCIONAR LOS DEPARTAMENTOS DE VENTAS, TI Y DIRECCIÓN 
SELECT
	d.id_departamento, 
	d.nombre
FROM departamentos AS d
WHERE d.nombre IN ('ventas', 'ti', 'dirección');


-- NOT IN 
-- Excluye los valores incluidos en la lista

-- Mostrar los datos de los empleados que no pertenezcan ni al departamento 1 ni al 2

SELECT 
	e.id_empleado, 
	e.nombre, 
	e.id_departamento
FROM empleados AS e
WHERE e.id_departamento NOT IN (1,2);

/* ====================================================================================

	OPERADOR LIKE 

	lIKE permite buscar patrones dentro de valores de texto

	SINTAXIS

	WHERE columna LIKE 'patron'

	los patrones pueden contener comodines

	Los principales son:

	comodin			significado
	  %             Cero, uno a varios caracteres
	  _			    Exactamente un caracter
	  [abc]         Un carácter incluido en la lista 
	  [a-f]         Un carácter incluido en el rango
	  [^abc]        un carácter no incluido en la lista



========================================================================================*/


-- Comodin %
-- El simbolo % representa cualquier cantidad de caracteres, incluyendo cero caracteres

-- Comienza con 

-- WHERE nombre LIKE 'Cliente1%'

-- Significado: Valores que comienzan con Cliente1

-- TERMINA CON 
-- WHERE correo LIKE %mail.com
-- Significa: Valores que terminan con mail.com 


-- CONTIENE 
-- WHERE nombre LIKE '%a%'
-- Significa: valores que contienen el carácter a en cualquier posición

-- Mostrar los productos donde el codigo comience con P001

SELECT 
	p.codigo, 
	p.nombre, 
	p.precio
FROM productos AS p
WHERE p.codigo LIKE 'P001%';

-- Mostrar los datos de los clientes en donde su correo termine con 10@mail.com
SELECT 
	c.id_cliente, 
	c.nombre, 
	c.correo
FROM clientes AS c
WHERE c.correo LIKE '%10@mail.com';

-- Mostrar los datos de los productos donde el nombre contenga el caracter 1

SELECT 
	p.codigo, 
	p.nombre, 
	p.precio
FROM productos AS p
WHERE p.nombre LIKE '%1%'

-- Comodín de un caracter
-- El guíon bajo _ representa exactamente un caracter

-- SELECCIONAR LOS DATOS DE LOS PRODUCTOS DONDE EL CÓDIGO COMIENCE P000 y despues exactamente 
-- un caracter adicional

SELECT 
	p.codigo, 
	p.nombre, 
	p.precio
FROM productos AS p
WHERE p.codigo LIKE 'P0_0__';


SELECT 
	p.codigo, 
	p.nombre, 
	p.precio
FROM productos AS p
WHERE p.codigo LIKE 'P000%';