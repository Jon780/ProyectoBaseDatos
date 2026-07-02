# Diccionario de Datos de la Base de Datos Universidad

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema de Administración Universitaria |
| Descripción | Base de datos para administrar alumnos, profesores, materias, departamentos, proyectos y credenciales |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Responsable | Ing. Irving Yael Rojas Hurbano, MTI |
| SGBD | SQL Server |

---

## 2. Descripción del Sistema de Base de Datos

El sistema administra:

- Alumnos
- Profesores
- Materias
- Departamentos
- Credenciales
- Teléfonos de alumnos
- Dependientes de profesores
- Proyectos de investigación
- Inscripción de alumnos a materias
- Participación de profesores en proyectos

Permite controlar la información académica y administrativa de una institución educativa.

---

## 3. Catálogo de Restricciones Utilizadas

| Código | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| CK | Check |
| DF | Default |

---

# 4. Diccionario de Datos

## Tabla: Alumno

**Descripción:** *Almacena la información de los alumnos.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Matricula | VARCHAR | 10 | PK, NN | Identificador único del alumno |
| Nombre | VARCHAR | 50 | NN | Nombre del alumno |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido |
| Apellido2 | VARCHAR | 50 | NN | Segundo apellido |
| Correo | VARCHAR | 100 | NN | Correo electrónico |
| FechaNaci | DATE | - | NN | Fecha de nacimiento |

---

## Tabla: Telefono

**Descripción:** *Almacena los teléfonos registrados por cada alumno.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| ClaveTel | INT | - | PK, NN | Identificador del teléfono |
| Matricula | VARCHAR | 10 | PK, FK, NN | Alumno propietario |
| Telefono | VARCHAR | 15 | NN | Número telefónico |

> **Nota:** La tabla utiliza clave primaria compuesta `(ClaveTel, Matricula)`.

---

## Tabla: Credencial

**Descripción:** *Almacena la credencial institucional de cada alumno.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumeroCredencial | VARCHAR | 20 | PK, NN | Número de credencial |
| FechaExp | DATE | - | NN | Fecha de expedición |
| Vigencia | DATE | - | NN | Fecha de vencimiento |
| Matricula | VARCHAR | 10 | FK, UQ, NN | Alumno propietario |

---

## Tabla: Profesor

**Descripción:** *Almacena la información de los profesores.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumProf | INT | - | PK, NN | Número del profesor |
| Nombre | VARCHAR | 50 | NN | Nombre |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido |
| Apellido2 | VARCHAR | 50 | NN | Segundo apellido |
| NumDep | INT | - | FK, NN | Departamento al que pertenece |

---

## Tabla: Departamento

**Descripción:** *Almacena la información de los departamentos.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumDep | INT | - | PK, NN | Identificador del departamento |
| NombreDep | VARCHAR | 80 | NN | Nombre del departamento |
| Edificio | VARCHAR | 50 | NN | Edificio donde se encuentra |

---

## Tabla: Materia

**Descripción:** *Almacena las materias impartidas en la universidad.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| ClaveMateria | VARCHAR | 10 | PK, NN | Clave de la materia |
| NombreMat | VARCHAR | 80 | NN | Nombre de la materia |
| Creditos | INT | - | NN | Número de créditos |
| NumProf | INT | - | FK, NN | Profesor que imparte la materia |

---

## Tabla: Cursa

**Descripción:** *Relaciona a los alumnos con las materias inscritas.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Matricula | VARCHAR | 10 | PK, FK, NN | Alumno inscrito |
| ClaveMat | VARCHAR | 10 | PK, FK, NN | Materia inscrita |
| FechaInscrip | DATE | - | NN | Fecha de inscripción |
| Calif | DECIMAL | 4,2 | - | Calificación obtenida |

> **Nota:** La tabla utiliza clave primaria compuesta `(Matricula, ClaveMat)`.

---

## Tabla: Dependiente

**Descripción:** *Almacena los dependientes de cada profesor.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NombreDep | VARCHAR | 80 | PK, NN | Nombre del dependiente |
| NumProf | INT | - | PK, FK, NN | Profesor asociado |
| FechaNaci | DATE | - | NN | Fecha de nacimiento |
| Parentesco | VARCHAR | 30 | NN | Relación familiar |

> **Nota:** La tabla utiliza clave primaria compuesta `(NombreDep, NumProf)`.

---

## Tabla: Proyecto

**Descripción:** *Almacena la información de los proyectos institucionales.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumProy | INT | - | PK, NN | Identificador del proyecto |
| Nombre | VARCHAR | 100 | NN | Nombre del proyecto |
| Presupuesto | DECIMAL | 12,2 | NN | Presupuesto asignado |

---

## Tabla: Participa

**Descripción:** *Relaciona profesores con proyectos de investigación.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumProf | INT | - | PK, FK, NN | Profesor participante |
| NumProy | INT | - | PK, FK, NN | Proyecto asignado |
| Rol | VARCHAR | 50 | NN | Rol desempeñado en el proyecto |

> **Nota:** La tabla utiliza clave primaria compuesta `(NumProf, NumProy)`.

---

## 5. Relaciones entre Tablas

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Alumno → Teléfono | 1:N | Un alumno puede registrar varios teléfonos |
| Alumno → Credencial | 1:1 | Cada alumno posee una única credencial |
| Alumno → Cursa | 1:N | Un alumno puede cursar varias materias |
| Materia → Cursa | 1:N | Una materia puede ser cursada por varios alumnos |
| Profesor → Materia | 1:N | Un profesor puede impartir varias materias |
| Departamento → Profesor | 1:N | Un departamento tiene varios profesores |
| Profesor → Dependiente | 1:N | Un profesor puede registrar varios dependientes |
| Profesor → Participa | 1:N | Un profesor puede participar en varios proyectos |
| Proyecto → Participa | 1:N | Un proyecto puede tener varios profesores |

---

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Telefono | Matricula | Alumno (Matricula) |
| Credencial | Matricula | Alumno (Matricula) |
| Materia | NumProf | Profesor (NumProf) |
| Profesor | NumDep | Departamento (NumDep) |
| Cursa | Matricula | Alumno (Matricula) |
| Cursa | ClaveMat | Materia (ClaveMateria) |
| Dependiente | NumProf | Profesor (NumProf) |
| Participa | NumProf | Profesor (NumProf) |
| Participa | NumProy | Proyecto (NumProy) |

---

## 7. Integridad Referencial

| Regla | Descripción |
| :--- | :--- |
| IR-01 | No puede registrarse un teléfono para un alumno inexistente. |
| IR-02 | No puede existir una credencial sin un alumno asociado. |
| IR-03 | No puede asignarse una materia a un profesor inexistente. |
| IR-04 | No puede registrarse un profesor en un departamento inexistente. |
| IR-05 | No puede inscribirse un alumno en una materia inexistente. |
| IR-06 | No puede registrarse un dependiente para un profesor inexistente. |
| IR-07 | No puede registrarse la participación de un profesor en un proyecto inexistente. |

---

## 8. Reglas del Negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Cada alumno posee una única credencial institucional. |
| RN-02 | Un alumno puede registrar varios números telefónicos. |
| RN-03 | Un alumno puede inscribirse en varias materias. |
| RN-04 | Cada materia es impartida por un solo profesor. |
| RN-05 | Un profesor pertenece únicamente a un departamento. |
| RN-06 | Un profesor puede participar en varios proyectos de investigación. |
| RN-07 | Un proyecto puede contar con varios profesores participantes. |
| RN-08 | Un profesor puede registrar varios dependientes. |

---

## 9. Diagrama Relacional

### Solución ejercicio Relacional

![Solución Ej7](../../img/Relacional/Ejercicio7.png)