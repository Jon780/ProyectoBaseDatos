# Diccionario de Datos de la Base de Datos Empresa

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema de Administración Empresarial |
| Descripción | Base de datos para la administración de empleados, departamentos, proyectos y dependientes |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Responsable | ING. Irving Yael Rojas Hurbano, MTI |
| SGBD | SQL Server |

---

## 2. Descripción del Sistema de Base de Datos

El sistema administra:

- Empleados
- Departamentos
- Ubicaciones
- Proyectos
- Dependientes
- Asignación de trabajo

Permite controlar la estructura organizacional de la empresa y la participación de empleados en proyectos.

---

## 3. Catálogo de Restricciones Utilizadas

| Código | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |
| CK | Check |
| DF | Default |

---

## 4. Diccionario de Datos

### Tabla: Employee

**Descripción:** *Almacena la información de los empleados.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| SSn | VARCHAR | 15 | PK, NN | Número identificador del empleado |
| FirstName | VARCHAR | 50 | NN | Nombre |
| LastName | VARCHAR | 50 | NN | Apellidos |
| Address | VARCHAR | 150 | NN | Dirección |
| Bdate | DATE | - | NN | Fecha de nacimiento |
| Salary | DECIMAL | 10,2 | NN | Salario |
| Sex | CHAR | 1 | NN | Sexo |
| Jef | VARCHAR | 15 | FK | Jefe directo |

---

### Tabla: Department

**Descripción:** *Almacena los departamentos de la empresa.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Number | INT | - | PK, AI, NN | Identificador del departamento |
| Name | VARCHAR | 100 | NN, UQ | Nombre del departamento |
| manager | VARCHAR | 15 | FK, UQ, NN | Empleado responsable |
| Startdate | DATE | - | NN | Fecha de inicio del gerente |

---

### Tabla: Locations

**Descripción:** *Almacena las ubicaciones de cada departamento.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumLocation | INT | - | PK, NN | Identificador de ubicación |
| NumberDep | INT | - | PK, FK, NN | Departamento asociado |
| Location | VARCHAR | 100 | NN | Nombre o dirección de ubicación |

> **Nota:** La tabla **Locations** utiliza clave primaria compuesta `(NumLocation, NumberDep)`.

---

### Tabla: Projects

**Descripción:** *Almacena los proyectos desarrollados por los departamentos.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Number | INT | - | PK, AI, NN | Identificador del proyecto |
| Name | VARCHAR | 100 | NN | Nombre del proyecto |
| Location | VARCHAR | 100 | NN | Ubicación del proyecto |
| NumberDsp | INT | - | FK, NN | Departamento responsable |
| NameDef | VARCHAR | 100 | FK, NN | Departamento asignado |

---

### Tabla: WORKS_ON

**Descripción:** *Relaciona empleados con proyectos.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| SSn | VARCHAR | 15 | PK, FK, NN | Empleado asignado |
| NumberProj | INT | PK, FK, NN | Proyecto asignado |
| Hours | DECIMAL | 5,2 | NN | Horas trabajadas |

> **Nota:** La tabla **WORKS_ON** utiliza clave primaria compuesta `(SSn, NumberProj)`.

---

### Tabla: Dependent

**Descripción:** *Almacena dependientes asociados a empleados.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Name | VARCHAR | 100 | PK, NN | Nombre del dependiente |
| SSn | VARCHAR | 15 | PK, FK, NN | Empleado asociado |
| Sex | CHAR | 1 | NN | Sexo |
| Relationship | VARCHAR | 50 | NN | Relación con el empleado |
| Bdate | DATE | - | NN | Fecha de nacimiento |

> **Nota:** La tabla **Dependent** utiliza clave primaria compuesta `(Name, SSn)`.

---

## 5. Relaciones entre Tablas

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Employee → Department | 1:1 | Un empleado administra un departamento |
| Department → Employee | 1:N | Un departamento tiene varios empleados |
| Department → Locations | 1:N | Un departamento puede tener varias ubicaciones |
| Department → Projects | 1:N | Un departamento administra proyectos |
| Employee → WORKS_ON | 1:N | Un empleado participa en varios proyectos |
| Projects → WORKS_ON | 1:N | Un proyecto tiene varios empleados |
| Employee → Dependent | 1:N | Un empleado puede tener varios dependientes |

---

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Employee | Jef | Employee (SSn) |
| Department | manager | Employee (SSn) |
| Locations | NumberDep | Department (Number) |
| Projects | NumberDsp | Department (Number) |
| WORKS_ON | SSn | Employee (SSn) |
| WORKS_ON | NumberProj | Projects (Number) |
| Dependent | SSn | Employee (SSn) |

---

## 7. Integridad Referencial

| Regla | Descripción |
| :--- | :--- |
| IR-01 | No se puede asignar un gerente inexistente |
| IR-02 | No se puede asignar un proyecto a un departamento inexistente |
| IR-03 | No se puede registrar horas para empleados inexistentes |
| IR-04 | No se puede registrar dependientes para empleados inexistentes |

---

## 8. Reglas del Negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Un empleado puede participar en varios proyectos |
| RN-02 | Un departamento tiene un único gerente |
| RN-03 | Un empleado puede tener varios dependientes |
| RN-04 | Un proyecto pertenece a un único departamento |

---

9. Diagrama Relacional

### Solución ejercicio Relacional

![Solución Ej5](../../img/Relacional/Ejercicio5-1.png)