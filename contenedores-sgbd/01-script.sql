
CREATE DATABASE pruebabd;

CREATE TABLE tbl1 (
	id INT,
	nombre varchar(30)
);

insert into tbl1
values (1, 'pepito'),
       (2, 'Luis'),
       (3, 'Luar');
      
select * FROM tbl1;

-- Ejemplo en maria DB

 # Crea una base de datos
create database prueba_tributos;

# Usa la base de datos 
use prueba_tributos;

create table Empleado (
	id int not null primary key auto_increment,
    nombre varchar(50) not null,
    apellido1 varchar(20) not null,
    apellido2 varchar(20) not null,
    fecha_ingreso date not null
);

Insert into Empleado values (1, 'Yael','Rojas','Hurbano','2026-05-28');

select *, year (fecha_ingreso), month (fecha_ingreso), day (fecha_ingreso) from Empleado;

alter table Empleado add column fecha_naci date not null;

update Empleado set fecha_naci = '1983-04-06' where id = 1;

select 
	nombre,
    apellido1,
    apellido2,
    fecha_ingreso,
    fecha_naci,
    timestampdiff(year, fecha_naci, curdate()) as Edad
from Empleado;

-- Ejemplo BD

use EJEMPLOBD;

create table Alumno (
	id_alumno int not null primary key,
	nombre varchar(30) not null,
	apellido1 varchar(15) not null,
	apellido2 varchar(15) null,
	telefono varchar(13),
	calle varchar(50) not null,
	numero_interior int,
	numero_exterior int,
	fecha_naci date not null
);

insert into Alumno values (1, 'Kevin', 'Korner', null, '+527737293870', 'infierno', 666, null, '2007-02-18');

insert into Alumno (id_alumno, nombre, apellido1, calle, fecha_naci)
values (2, 'Jose Luis', 'Gallardo', 'Angel', '1983-04-06');

insert into Alumno (id_alumno, nombre, apellido1, apellido2, calle, fecha_naci)
values (3, 'JIMENA', 'Valdez', 'DELGADILLO','5 de mayo', '2007-06-12');

select * , datediff(year, fecha_naci,GETDATE()) As Edad
from Alumno;

-- Razones de cardinalidad 1:N

create table categoria2(
	categoria_id int not null primary key,
	nombre varchar(50) not null,
);

create table producto2(
	producto_id int not null primary key,
	nombre varchar(50) not null,
	precio money not null,
	existencia int not null,
	categoria_id int null,
	constraint fk_producto2_categoria2
	foreign key (categoria_id)
	references categoria2(categoria_id)
);

select * from categoria2;

select * from producto2;

select *
from producto2 
where categoria_id = 1;