# Diccionario de datos de la base de datos control empresarial 

1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto  | Sistema de Control Empresarial |
| Descripción | Base de datos para el control empresarial |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Responsable | Ing. Irving Yael Rojas Hurbano, MTI |
| SGBD | SQLServer |

2. Descripción del sistema de base de datos

Una empresa se dedica a la venta de productos al por mayor, y necesita registrar lo siguiente:

> De los clientes necesita almacenar:

- Identificador del cliente
- nombre del cliente, el cual es una persona moral

> De los pedidos de la venta:

- Numero del producto
- Nombre del producto
- Precio del producto

3. Catálogo de Resntrincciones Utilizadas

| Codigo | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |
| CK | Check |
| DF | Default |
| FK | Foreign Key |

## 4. Diccionario de Datos

### Tabla: Cliente

**Descripción:** *Almacena la información de los clientes.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdCliente | INT | - | PK, AI, NN | Identificador único del cliente |
| Nombre | VARCHAR | 100 | NN | Nombre del cliente |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido |
| Apellido2 | VARCHAR | 50 | NULL | Segundo apellido |

---

### Tabla: Pedido

**Descripción:** *Almacena los pedidos realizados por los clientes.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdPedido | INT | - | PK, AI, NN | Identificador único del pedido |
| Fecha | DATE | - | NN | Fecha de registro del pedido |
| IdCliente | INT | - | FK, NN | Cliente que realizó el pedido |

---

### Tabla: Producto

**Descripción:** *Almacena el catálogo de productos disponibles.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdProducto | INT | - | PK, AI, NN | Identificador único del producto |
| NombreProducto | VARCHAR | 100 | NN | Nombre del producto |
| Precio | DECIMAL | 10,2 | NN | Precio base del producto |

---

### Tabla: Contiene

**Descripción:** *Almacena el detalle de productos incluidos en cada pedido.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdPedido | INT | - | PK, FK, NN | Pedido asociado |
| IdProducto | INT | - | PK, FK, NN | Producto incluido |
| ContenidoVenta | INT | 10 | NN | Cantidad vendida del producto |
| PrecioVenta | DECIMAL | 10,2 | NN | Precio aplicado al momento de la venta |

> **Nota:** La tabla **Contiene** utiliza una **clave primaria compuesta** formada por `(IdPedido, IdProducto)`.

---

## 5. Relaciones entre Tablas

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Cliente → Pedido | 1:N | Un cliente puede realizar muchos pedidos |
| Pedido → Contiene | 1:N | Un pedido puede contener varios productos |
| Producto → Contiene | 1:N | Un producto puede aparecer en muchos pedidos |

---

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Pedido | IdCliente | Cliente (IdCliente) |
| Contiene | IdPedido | Pedido (IdPedido) |
| Contiene | IdProducto | Producto (IdProducto) |

---

## 7. Integridad Referencial

| Regla | Descripción |
| :--- | :--- |
| IR-01 | No se puede registrar un pedido para un cliente inexistente |
| IR-02 | No se puede agregar un producto inexistente a un pedido |
| IR-03 | No se puede eliminar un pedido si tiene productos asociados |

---

8. Reglas del Negocio 

| Codigo | Regla |
| :--- | :--- |
| RN-01 | Un cliente puede realizar muchos pedidos |
| RN-02 | Cada pedido pertenece a un solo cliente |
| RN-03 | Un pedido contiene varios productos |
| RN-04 | Un producto puede aparecer en muchos pedidos |
| RN-05 | Un pedido debe contener almenos un productos |
| RN-06 | Un producto puede no haber sido vendido |
| RN-07 | El detalle del pedido no existe sin pedido |
| RN-08 | El detalle del pedido no existe sin producto |
| RN-09 | El detalle del pedido almacena cantidad vendida y precio de venta |

9. Diagrama Relacional

### Solución ejercicio Relacional

![Solución Ej4](../../img/Relacional/Ejercicio4.png)