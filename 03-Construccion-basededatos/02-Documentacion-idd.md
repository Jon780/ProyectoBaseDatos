# Contruccion de base de datos  con lenguaje sql

e1 lenguaje sql(Struture Query leguaje), se divide en cinco categorias

1.Con DDL(Para defincion languaje)
2.DML (data manipulation language)
3.DQL (para quety languaje)
4.DCL (para control languaje-Controla permisos) - Grnat-,Revore
5.TCL (Transaction Control languaje -Control transacciones) -DIGIN TRANFACTION, COMMIT, ROLLBACKS, SAVEPOINT

## SQL DDL 

se utiliza para ** Crear y modificar la estrutura** de una base de datos

Con DDL trabajaos sobre los objetos de la base de datos .
-_Base de datos_
-_Tablas_
-_Restriciones_
-Vistas
-indica
-esquemas
-store procede
-Funtions
- Triggers

**Comandos priincipales **
| Elemento | Valor |
| :--- | :--- |
| Creat   | Sistema de Control Empresarial |
| Descripción | Base de datos para el control empresarial |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Responsable | Est. Jesus Emmanuel Barreto Santana, MTI |
| SGBD | SQLServer |

## SQL -DML
**Lenguaje de manupulacion de datos **

Sirve para **trabajar con la informacion almacenada**
Con este lenguaje nos ecamb la escritura  , sino los registros

## comandos Principales** 
| Elemento | Valor |
| :--- | :--- |
| insert  | Inserta registro |
| Upate | Actuliza registros |
| Delet | Elimina registros |

## SQL-DQL 
**Lenguaje de consulta de datos *
su funcion **consultar informacion***

Este es probablemente el mas utilizado

*** comando principal ***
| insert  | Consultar informacion |

general mente se comibina con 

- whter
- Order bv
- group BY
- HAVING
- JOIN (LEEFT, RIGHT, INNER, FULL, CROOS)
- DISTIMCY
- FUNCIONES DE AGREGADO (SUB, AVG,MIN, MAX, COUNT)
- WINDWOS (funcion de ventana)

## Nomeclatura para la contruccion de base de datos (Snake Case)

La numeclatura o convencion que mas recomienda hoy , si se busca una numeclatura moderna portable y alineada con buenas praticas en distintas de base de datos 
la razon de que funciona de forma consistente  en ***SQL_server , AVSQL,MARIADB** y especialmente
en **posgresesql** , donde las idetificamos sin comillas se convierte automaticamente a minusculas. con **snake_case** evitas problemas de mayusculas y hace s qyue las busquedas sean mas legibles 

| Objeto | Convencion | ejemplo |
| :--- | :--- | :--- |
|Base de datos| snake_case | control_escolar |
|esquema| snake_case | ventas , rh , seguridad |
|Tablas| singular en snake_case | cliente , pedido, detalle_pedido |
|Columna| snake_case | cliente_id, fecha_registro, correo_eletronico |
|pk| <tabla_id> | cliente_id,producto_id |
|fk| igual q la pk reference | cliente_id,producto_id |
|tabla fuente| <tabla>_<tabla2> | alumnos_curso, producto_provedor |

## nombra las restricionas
- fk_pedido_cliente
- uq_cliente_correo_electronico
- ck_producto_precio
- df_cliente_activo
-pk_cinete
fecha

*** prefijso**
- pk (primary key)
- fk ( foreing key)
- ug (unique)
- ck (check)
- df (default)
- ix (index)

## alter table
permite modificar un atabla exclusiva 

puede :

- agregar columna
- eliminar columna
- modificar  columnas 
- agregar restriciones 
