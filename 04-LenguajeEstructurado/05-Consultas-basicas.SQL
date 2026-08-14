/*========================================================

SQL-DQL EN SQL SERVER

ARCHIVO:04-Consultas-basicas.SQL

DESCRIPCION :Introduccion a la ejecucion de las primeras consultas de recuperacion de datos


=========================================================*/

USE comercial_db;
GO

-- utilizando el operador asterisco (*), no es muy recomendada 
-- *, todas las columnas 

SELECT * 
FROM productos;

-- Seleccionar columnas necesarias (Proyeccion)

SELECT
	nombre
FROM estados;
GO

SELECT 
	codigo,
	nombre,
	precio
FROM productos; 
GO

SELECT 
	nombre, apellido_paterno telefono, correo
FROM clientes;
GO


SELECT 
	nombre, 
	apellido_paterno,
	telefono,
	correo
FROM clientes;
GO

--Alias de columna 
--Es un nombre temporal asignado a una columna dentro del
--resultadode una consulta 

SELECT	
	codigo,
	nombre,
	precio
FROM productos;

SELECT	
	codigo AS codigo_producto,
	nombre AS nombre_producto,
	precio AS preci_unitario
FROM productos;
GO

SELECT	
	codigo AS [codigo producto],
	nombre AS [nombre producto],
	precio AS [preci unitario]
FROM productos;
GO

SELECT	
	codigo AS 'codigo producto',
	nombre AS 'nombre producto',
	precio AS 'preci unitario'
FROM productos;
GO

-- Otra forma de poner alias (no recomendada)

SELECT	
	codigo  codigo_producto,
	nombre  nombre_producto,
	precio  preci_unitario
FROM productos;
GO

-- Alias de tabla 
SELECT 
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS P;

SELECT 
	productos.codigo,
	productos.nombre,
	productos.precio
FROM productos;


SELECT 
	productos.codigo,
	productos.nombre,
	productos.precio
FROM productos AS productos;

SELECT 
categorias.id_categoria AS [numero_categoria],
categorias.nombre AS [nombre_categoria],
id_producto AS [numero_producto],
productos.nombre AS [nombre_producto],
precio,
existencia
FROM categorias	
INNER JOIN 
productos
ON categorias.id_categoria = productos.id_categoria;
GO

SELECT *
FROM productos
GO

SELECT 
c.id_categoria AS [numero_categoria],
c.nombre AS [nombre_cateforia],
p.id_producto AS [numero_producto],
p.nombre AS [nombre_producto],
p.precio,
p.existencia
FROM categorias	AS c
INNER JOIN 
productos AS p
ON c.id_categoria = p.id_categoria;
GO

--columna calculada 
--seleccionar los datos de los productos y el valor de el inventario 

SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	precio * existencia

FROM productos AS P;

-- seleccionar los datos de las ventas , numero de venta cantidad vendida ,precio ,descuento ,
-- y clacular el importe bruto , importe con descuento y el( importe bruto por descuento entre 100)
--  el importe neto (importe bruto por 1 menso el descuento entre 100)


SELECT 
	dv.id_venta  AS [#venta], 
	dv.cantidad  AS [cantidad_vendida],
	dv.precio    AS [precio_venta],
	dv.descuento AS [descuento],
    dv.cantidad  * dv.precio AS [importe_bruto],
	dv.cantidad  * dv.precio * dv.descuento / 100.0 AS importe_descuento ,
	dv.cantidad  * dv.precio *(1-descuento / 100.0) AS importe_neto
FROM  detalle_ventas AS dv;


-- USO DE DISTINC 

-- ELIMINA DEL RESULTADO LAS FILAS QUE TENGAN LOS VALORES REPETIDOS EN TODAS 
-- LAS COLUMNAS SELECCIONADAS 

/*============================================================================
	SELECT DISTINCT columna
	FROM tabla;
	
==============================================================================*/

-- ejemplo sin DISTINCT  
-- SELECCIONA LOS SEXOS DE LOS CLIENTES 

SELECT sexo
FROM clientes;

-- ejemplo con DISTINCT  

SELECT DISTINCT 
	sexo
FROM clientes;

-- seleccionar los distintos descuentos  que se ahn aplicado a las ventas 

SELECT DISTINCT 
	dv.descuento
FROM detalle_ventas AS	dv;


-- seleccionar los distintos departamentos a los que pertenecen los empleados 

SELECT DISTINCT 
	e.id_departamento AS [departamento]
FROM departamentos AS	e;

-- DISTNCT PARA VARIAS COLUMNAS 
-- cuando se utiliza con variass columnas se evalua la conbinacion completa 
 
SELECT DISTINCT 
	p.id_categoria,
	p.id_proveedor
FROM productos AS p
ORDER BY p.id_categoria





-- seleccionar conco primeros prodcutos enconrados enla tabla productos 

SELECT TOP (5)
	id_producto,
	codigo
FROM productos AS p
ORDER BY id_producto DESC;

-- seleccionar los primeors 5 productos que aparezcan en la consulta mostrando el codiugo nombre precio existencia 
-- y el velor fdel inventario de la tabla productos 

SELECT TOP (5)
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p;

-- TOP CON PORCENTAJE
--SQL SERVER permite limitar el resulytado mediante un porcentaje 


/*============================================================================
	SELECT TOP (%) PRECENT
		columnas
	FROM tabla;
	
==============================================================================*/

-- seleccionar el 10% de los registros de la tabla productos 
-- mostrando el nuemro de producto codigo y el nombre 

SELECT TOP (10) PERCENT 
	p.id_producto,
	p.codigo,
	p.nombre
FROM productos AS p;

-- SELECCIONAR LOS 3 PRIMEROS DESCUENTOS DISTINTOS 

SELECT DISTINCT TOP (3)  
	descuento
FROM detalle_ventas AS b;

