# Ejercicios del Modelo entidad Relacion 

## Ejercicio 1.

Un hospital registra información de sus pacientes.
> De cada paciente se almacena lo siguiente:
- Identificador
- Nombre
- Fecha de nacimiento

> De cada expediente médico se debe almacenar:
- Número de expediente.
- Fecha de apertura.
- Tipo de sangre.

> Reglas del negocio:
- Cada paciente debe tener exactamente un expediente médico.
- Cada expediente médico pertenece a un único paciente.
- No puede existir un expediente sin paciente.
- No puede existir un paciente sin expediente.

![Solución Ej1](../img/ER/Ejercicio1.png)

## Ejercicio 2.

Una universidad administra profesores y cursos

> De cada profesor se almacena:

- numero de profesor
- nombre
- especialidad 

> De cada curso se almacena:

- numero de curso 
- Nombre del curso
- Creditos

> Reglas del negocio:

1. Un profesor puede impartir varios cursos 
2. Un curso solo puede ser impartido por un profesor 
3. Puede existir un profesor que actualmente no imparta cursos 
4. Todo curso debe estar asignado a un profesor 

> Lo  que se debe realizar:

- Identificar y dibujar las entidades 
- Identificar y dibujar la relacion **IMPARTE**
- Determinar la razon de cardinalidad 
- Determinar la participacion

### Solución ejercicio 2

![Solución Ej2](../img/ER/Ejercicio2.png)

## Ejercicio 3

Una escuela administra alumnos y materias

> De cada alumno se almacena:

- Matricula
- Nombre
- Semestre

> De cada materia:

- Clave de la materia
- Nombre de la materia
- Creditos

> Reglas del negocio.

1. Un alumno puede inscribirse en varias materias
2. Una materia puede tener muchos alumnos inscritos 
3. Puede existir una materia sin alumnos inscritos
4. Todo alumno debe estar inscrito en almenos una materia 
5. De cada inscripcion se desea almacenar: 

    - Fecha de inscripcion 
    - Calificacion final 

Nota: La relacion se debe llamar **INSCRIBE**

![Solución Ej3](../img/ER/Ejercicio3.png)

## Ejercicio 4

Una empresa se dedica a la venta de productos al por mayor, y necesita registrar lo siguiente:

> De los clientes necesita almacenar:

- Identificador del cliente
- nombre del cliente, el cual es una persona moral

> De los pedidos de la venta:

- Numero del producto
- Nombre del producto
- Precio del producto

> Reglas del negocio:

1. Un cliente puede realizar muchos pedidos
2. Cada pedido pertenece a un solo cliente
3. Un pedido contiene varios productos
4. Un producto puede aparecer en muchos pedidos 
5. Un pedido debe contener almenos un productos
6. Un producto puede no haber sido vendido
7. El detalle del pedido no existe sin pedido 
8. El detalle del pedido no existe sin producto 
9. El detalle del pedido almacena cantidad vendida y precio de venta

### Solución ejercicio 4

![Solución Ej4](../img/ER/Ejercicio4.png)