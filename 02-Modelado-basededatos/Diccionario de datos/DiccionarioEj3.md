|
# Diccionario de datos de la base de datos control de inscripciones 

1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto  | Sistema de Control de Inscripciones |
| Descripción | Base de datos para el control de inscripciones |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Responsable | Ing. Irving Yael Rojas Hurbano, MTI |
| SGBD | SQLServer 
2. Descripción del sistema de base de datos

Una escuela administra alumnos y materias

> De cada alumno se almacena:

- Matricula
- Nombre
- Semestre

> De cada materia:

- Clave de la materia
- Nombre de la materia
- Creditos

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

4. Diccionario de Datos

### Tabla: Alumno

**Descripción:** *Almacena la información de los estudiantes.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdAlumno | INT | - | PK, AI, NN | Identificador único del alumno |
| Matricula | VARCHAR | 10 | NN, UQ | Matrícula institucional |
| Nombre | VARCHAR | 100 | NN | Nombre del alumno |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido |
| Apellido2 | VARCHAR | 50 | NULL | Segundo apellido |
| Semestre | INT | 2 | NN | Semestre actual del alumno |

---

### Tabla: Materia

**Descripción:** *Almacena la información de las materias.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdMateria | INT | - | PK, AI, NN | Identificador único de la materia |
| NombreMat | VARCHAR | 100 | NN | Nombre de la materia |
| Creditos | INT | 2 | NN | Créditos asignados a la materia |

---

### Tabla: INSCRIBE

**Descripción:** *Almacena las inscripciones realizadas por los alumnos a las materias.*

| Campo | Tipo | Longitud | Restricción | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdMateria | INT | - | PK, FK, NN | Materia inscrita |
| IdAlumno | INT | - | PK, FK, NN | Alumno inscrito |
| FechaInscripcion | DATE | - | NN | Fecha de inscripción |
| Califin | DECIMAL | 5,2 | NULL | Calificación final obtenida |

---

## 5. Relaciones entre Tablas

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Alumno → INSCRIBE | 1:N | Un alumno puede realizar muchas inscripciones |
| Materia → INSCRIBE | 1:N | Una materia puede tener muchos alumnos inscritos |

---

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| INSCRIBE | IdAlumno | Alumno (IdAlumno) |
| INSCRIBE | IdMateria | Materia (IdMateria) |

---

## 7. Integridad Referencial

| Regla | Descripción |
| :--- | :--- |
| IR-01 | No se puede registrar una inscripción para un alumno inexistente |
| IR-02 | No se puede registrar una inscripción para una materia inexistente |
| IR-03 | No se puede duplicar la inscripción del mismo alumno a la misma materia |

---

8. Reglas del Negocio 

| Codigo | Regla |
| :--- | :--- |
| RN-01 | Un alumno puede inscribirse en varias materias |
| RN-02 | Una materia puede tener muchos alumnos inscritos |
| RN-03 | Puede existir una materia sin alumnos inscritos |
| RN-04 | Todo alumno debe estar inscrito en al menos una materia |
| RN-05 | De cada inscripción se desea almacenar: Fecha de inscripción y Calificación final |

---

9. Diagrama Relacional

### Solución ejercicio Relacional

![Solución Ej3](../../img/Relacional/Ejercicio3.png)
