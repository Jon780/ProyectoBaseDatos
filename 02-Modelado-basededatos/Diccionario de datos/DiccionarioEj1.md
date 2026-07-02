# Diccionario de datos de la base de datos control hospitalario 

1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto  | Sistema de Control Hospitalario |
| Descripción | Base de datos para el control hospitalario |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Responsable | Ing. Irving Yael Rojas Hurbano, MTI |
| SGBD | SQLServer |

2. Descripción del sistema de base de datos

Un hospital registra información de sus pacientes.
> De cada paciente se almacena lo siguiente:
- Identificador
- Nombre
- Fecha de nacimiento

> De cada expediente médico se debe almacenar:
- Número de expediente.
- Fecha de apertura.
- Tipo de sangre.

3. Catálogo de Resntrincciones Utilizadas

| Código | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |
| CK | Check |
| DF | Default |

4. Diccionario de Datos

### Tabla: Paciente

**Descripción:** *Almacena la información básica de los pacientes.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumPaciente | INT | - | PK, AI, NN | Identificador único del paciente |
| Nombre | VARCHAR | 50 | NN | Nombre del paciente |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido del paciente |
| Apellido2 | VARCHAR | 50 | NULL | Segundo apellido del paciente |
| Fechanaci | DATE | - | NN | Fecha de nacimiento del paciente |

---

### Tabla: Expediente

**Descripción:** *Almacena el expediente clínico asociado al paciente.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Numexp | INT | - | PK, AI, NN | Identificador único del expediente |
| Fechaaper | DATE | - | NN | Fecha de apertura del expediente |
| Tiposangre | VARCHAR | 5 | NN | Tipo sanguíneo del paciente |
| id_paciente | INT | - | FK, NN, UQ | Referencia al paciente asociado |

5. Relaciones entre tablas

| Relacioón | Cardinalidad | Descripción |
|:----------|:---------:|----------:|
| Paciente -> Expediente | 1:N    | Un paciente tiene muchos expedientes médicos  |

6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Expediente | id_paciente | Paciente (id_paciente) |

7. Integridad Referencial  

| Regla | Descripción |
| :--- | :--- |
| IR-01 | No se puede registrar un expediente para un paciente inexistente |
| IR-02 | Un paciente solo puede tener un expediente |

8. Reglas del Negocio 

| Codigo | Regla |
| :--- | :--- |
| RN-01 | Cada paciente debe tener exactamente un expediente médico.|
| RN-02 | Cada expediente médico pertenece a un único paciente.|
| RN-03 | No puede existir un expediente sin paciente.|
| RN-04 | No puede existir un paciente sin expediente.|

9. Diagrama Relacional

### Solución ejercicio Relacional

![Solución Ej1](../../img/Relacional/Ejercicio1.png)
