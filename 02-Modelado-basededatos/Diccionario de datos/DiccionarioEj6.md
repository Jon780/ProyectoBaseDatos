# Diccionario de Datos de la Base de Datos Empresa

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema de Administración Empresarial |
| Descripción | Base de datos para administrar empleados, departamentos, ubicaciones y proyectos |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Responsable | Ing. Irving Yael Rojas Hurbano, MTI |
| SGBD | SQL Server |

---

## 2. Descripción del Sistema de Base de Datos

El sistema administra:

- Empleados
- Departamentos
- Ubicaciones
- Proyectos
- Dependientes
- Asignación de empleados a proyectos

Permite controlar la estructura organizacional y la participación de empleados en distintos proyectos.

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
| SSn | VARCHAR | 15 | PK, NN | Identificador del empleado |
| FirstName | VARCHAR | 50 | NN | Nombre |
| LastName | VARCHAR | 50 | NN | Apellidos |
| Address | VARCHAR | 150 | NN | Dirección |
| Bdate | DATE | - | NN | Fecha de nacimiento |
| Salary | DECIMAL | 10,2 | NN | Salario |
| Sex | CHAR | 1 | NN | Sexo |
| IdDependent | INT | FK | Referencia al dependiente |

---

### Tabla: Department

**Descripción:** *Almacena la información de los departamentos.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Number | INT | - | PK, AI, NN | Identificador del departamento |
| manager | VARCHAR | 15 | FK, UQ, NN | Empleado responsable |
| Startdate | DATE | - | NN | Fecha de inicio |
| Name | VARCHAR | 100 | NN, UQ | Nombre del departamento |

---

### Tabla: Locations

**Descripción:** *Almacena las ubicaciones de cada departamento.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumLocation | INT | - | PK, NN | Identificador de ubicación |
| NumberDep | INT | - | PK, FK, NN | Departamento asociado |
| Location | VARCHAR | 100 | NN | Nombre o dirección |

> **Nota:** La tabla utiliza clave primaria compuesta `(NumLocation, NumberDep)`.

---

### Tabla: Projects

**Descripción:** *Almacena los proyectos administrados por los departamentos.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Number | INT | - | PK, AI, NN | Identificador del proyecto |
| Location | VARCHAR | 100 | NN | Ubicación del proyecto |
| Name | VARCHAR | 100 | NN | Nombre del proyecto |
| NameDep | VARCHAR | 100 | FK, NN | Departamento responsable |

---

### Tabla: WORKS_ON

**Descripción:** *Relaciona empleados con proyectos.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| SSn | VARCHAR | 15 | PK, FK, NN | Empleado asignado |
| NumberProj | INT | PK, FK, NN | Proyecto asignado |
| Hours | DECIMAL | 5,2 | NN | Horas trabajadas |

> **Nota:** La tabla utiliza clave primaria compuesta `(SSn, NumberProj)`.

---

### Tabla: Dependent

**Descripción:** *Almacena los dependientes de cada empleado.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdDependent | INT | - | PK, AI, NN | Identificador del dependiente |
| SSn | VARCHAR | 15 | FK, NN | Empleado asociado |
| Name | VARCHAR | 100 | NN | Nombre del dependiente |
| Sex | CHAR | 1 | NN | Sexo |
| Relationship | VARCHAR | 50 | NN | Relación con el empleado |
| Bdate | DATE | - | NN | Fecha de nacimiento |

---

## 5. Relaciones entre Tablas

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Department → Employee | 1:N | Un departamento tiene varios empleados |
| Department → Locations | 1:N | Un departamento puede tener varias ubicaciones |
| Department → Projects | 1:N | Un departamento administra varios proyectos |
| Employee → Dependent | 1:N | Un empleado puede tener varios dependientes |
| Employee → WORKS_ON | 1:N | Un empleado participa en varios proyectos |
| Projects → WORKS_ON | 1:N | Un proyecto puede tener varios empleados |

---

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Employee | IdDependent | Dependent (IdDependent) |
| Department | manager | Employee (SSn) |
| Locations | NumberDep | Department (Number) |
| Projects | NameDep | Department (Name) |
| WORKS_ON | SSn | Employee (SSn) |
| WORKS_ON | NumberProj | Projects (Number) |
| Dependent | SSn | Employee (SSn) |

---

## 7. Integridad Referencial

| Regla | Descripción |
| :--- | :--- |
| IR-01 | No se puede asignar un gerente inexistente |
| IR-02 | No se puede registrar un dependiente para un empleado inexistente |
| IR-03 | No se puede asignar horas a proyectos inexistentes |
| IR-04 | No se puede registrar una ubicación para departamentos inexistentes |

---

## 8. Reglas del Negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Un departamento tiene un único gerente |
| RN-02 | Un empleado puede participar en varios proyectos |
| RN-03 | Un empleado puede registrar varios dependientes |
| RN-04 | Un proyecto pertenece únicamente a un departamento |

---

9. Diagrama Relacional

### Solución ejercicio Relacional

![Solución Ej6](../../img/Relacional/Ejercicio6.png)