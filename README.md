# 📊 Curso de Bases de Datos: De los Fundamentos al Lenguaje SQL

Bienvenido a mi repositorio de la materia de **Bases de Datos**. Este espacio reúne los apuntes, ejercicios, diagramas y prácticas desarrolladas durante el curso, desde los conceptos fundamentales hasta la implementación y manipulación de bases de datos mediante SQL.

El objetivo es documentar el proceso de aprendizaje y servir como material de consulta para futuras prácticas y proyectos.

---

# 🗺️ Mapa de Ruta del Aprendizaje

```text
[1. Fundamentos]
        │
        ▼
[2. Modelo Entidad-Relación]
        │
        ▼
[3. Modelo Relacional]
        │
        ▼
[4. SQL - Lenguaje de Definición de Datos (LDD)]
        │
        ▼
[5. SQL - Lenguaje de Manipulación de Datos (LMD)]
```

---

# 📚 Contenido del Curso

## 🔍 1. Fundamentos de Bases de Datos

Introducción a los conceptos básicos de las bases de datos.

* Diferencia entre datos e información.
* Sistemas de archivos tradicionales.
* Bases de datos.
* Sistema Gestor de Bases de Datos (SGBD).
* Arquitectura ANSI-SPARC.
* Niveles físico, conceptual y de visión.
* Independencia de datos.

---

## 📐 2. Modelo Entidad-Relación (E-R)

Diseño conceptual de una base de datos.

* Entidades.
* Entidades fuertes y débiles.
* Atributos.
* Claves.
* Relaciones.
* Cardinalidad.
* Participación.
* Diagramas Entidad-Relación.

---

## 🔄 3. Modelo Relacional

Transformación del modelo E-R al modelo lógico.

* Tablas.
* Tuplas.
* Atributos.
* Dominios.
* Claves Primarias (PK).
* Claves Foráneas (FK).
* Restricciones de integridad.
* Acciones en cascada.

---

## 🔨 4. SQL - Lenguaje de Definición de Datos (LDD)

Implementación de la estructura de una base de datos mediante SQL.

Comandos utilizados:

* CREATE DATABASE
* CREATE TABLE
* ALTER TABLE
* DROP TABLE
* PRIMARY KEY
* FOREIGN KEY
* UNIQUE
* NOT NULL
* CHECK
* DEFAULT

### Ejemplo

```sql
CREATE TABLE alumnos (
    alumno_id INT PRIMARY KEY,
    matricula VARCHAR(15) UNIQUE NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE,
    estado VARCHAR(10) DEFAULT 'Activo'
);

CREATE TABLE inscripciones (
    inscripcion_id INT PRIMARY KEY,
    alumno_id INT,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (alumno_id)
        REFERENCES alumnos(alumno_id)
        ON DELETE CASCADE
);
```

---

## ⚡ 5. SQL - Lenguaje de Manipulación de Datos (LMD)

Manipulación y consulta de la información almacenada.

Comandos utilizados:

* INSERT
* SELECT
* UPDATE
* DELETE
* WHERE
* ORDER BY
* GROUP BY
* HAVING
* INNER JOIN
* LEFT JOIN
* RIGHT JOIN

### Ejemplo

```sql
SELECT
    a.nombre,
    i.fecha_registro
FROM alumnos a
INNER JOIN inscripciones i
    ON a.alumno_id = i.alumno_id
WHERE a.estado = 'Activo'
ORDER BY i.fecha_registro DESC;
```

---

# 📂 Estructura del Repositorio

```text
📁 01_Fundamentos/
📁 02_Modelo_ER/
📁 03_Modelo_Relacional/
📁 04_SQL_LDD/
📁 05_SQL_LMD/
README.md
```

Cada carpeta contiene apuntes, ejercicios, diagramas y scripts desarrollados durante el curso.

---

# 🛠️ Herramientas Utilizadas

* Draw.io
* MySQL
* MySQL Workbench
* DBeaver
* Visual Studio Code
* Git
* GitHub

---

# 🎯 Objetivo del Repositorio

Este repositorio tiene como finalidad documentar el aprendizaje de la materia de Bases de Datos mediante ejemplos prácticos, diagramas, ejercicios y scripts SQL, facilitando la consulta y el seguimiento del contenido del curso.

---

# 👤 Autor

**Jonathan Gael Monroy Ortiz**

📧 Correo: [jonathanmonroy567@gmail.com](mailto:jonathanmonroy567@gmail.com)
