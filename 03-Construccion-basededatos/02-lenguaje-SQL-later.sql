 

CREATE DATABASE bdejemplo
 
--alter table
USE bdejemplo;


-- ALTER TABLE

CREATE TABLE alumno (
alumno_id INT NOT NULL IDENTITY(1,1),
nombre VARCHAR (20) NOT NULL, 
apellido_paterno VARCHAR (15) NOT NULL,
apellido_maternO VARCHAR(15)
);

-- Agregar una columna
ALTER TABLE alumno
ADD telefono VARCHAR(20);

-- Agregar varias columnas
ALTER TABLE alumno
ADD curp CHAR(18), 
rfc CHAR (13) NOT NULL;

-- Modificar un campo
ALTER TABLE alumno
ALTER COLUMN
telefono VARCHAR(30);


-- Restricciones 
-- PRIMARY KEY
ALTER TABLE alumno
ADD CONSTRAINT pk_alumno
PRIMARY KEY(alumno_id);

-- Foreing key
CREATE TABLE carrera (
carrera_id INT NOT NULL IDENTITY (1,1),
nombre VARCHAR (30) NOT NULL
);


ALTER TABLE carrera
ADD CONSTRAINT pk_carrera
PRIMARY KEY (carrera_id);

ALTER TABLE alumno
ADD carrera_id INT NOT NULL;


ALTER TABLE alumno
ADD CONSTRAINT fk_alumno_carrera
FOREIGN KEY (carrera_id)
REFERENCES carrera(carrera_id)
ON DELETE CASCADE 
ON UPDATE NO ACTION;


ALTER TABLE alumno
ADD CONSTRAINT pk_alumno
PRIMARY KEY (alumno_id);++

--Check

alter table alumno
add edad int not null;

-- restriciones check

ALTER TABLE alumno 
add constraint ck_alumno_edad
check (edad>;

ALTER TABLE alumno
ADD CONSTRAINT ck_alumno_telefono
 check (telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]');

insert INTO  carrera 
values ("tecnologias")

insert into alumno 
values ("monico turibio", "cervantes","chinbobo","773-568-980","gfffhfjf",1,18);

SELECT * FROM alumno;

-- Restriccion default 

DELETE FROM alumno;

ALTER TABLE alumno
ADD activo BIT NOT NULL;

ALTER TABLE alumno
ADD CONSTRAINT df_alumno_activo
DEFAULT 1
FOR activo;

-- UNIQUE 
ALTER TABLE carreras
ADD CONSTRAINT uq_carrera_nombre
UNIQUE (nombre);

-- Eliminar Restricciones 

-- Restriccion FK 
ALTER TABLE alumno
DROP CONSTRAINT fk_alumno_carrera;

-- Eliminar PK
ALTER TABLE alumno
DROP CONSTRAINT pk_alumno;

ALTER TABLE carrera 
DROP CONSTRAINT pk_carrera;

-- Eliminar Check
ALTER TABLE alumno
DROP CONSTRAINT ck_alumno_edad;

ALTER TABLE alumno
DROP CONSTRAINT ck_alumno_telefono;

-- eliminar Unique
ALTER TABLE carrera
DROP CONSTRAINT uq_carrera_nombre;

-- Eliminar columna
ALTER TABLE alumno
DROP COLUMN carrera_id;

-- DROP (Elimkinar objetos de la bd completos
-- (tables, view, stored procedures, trigger, bd))

DROP TABLE carrera;
DROP TABLE alumno;

-- Eliminar la base de datos
USE master;
GO

IF OBJECT_ID ('bdejemplo') IS NOT NULL
BEGIN
DROP DATABASE bdejemplo;
END