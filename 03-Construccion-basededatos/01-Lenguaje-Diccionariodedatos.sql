
-- contruccion de Bases de datos con SQL-LDD (create, Alter, Drop)

-- Crear una base de datos
create database universidad;


-- usar la bd 
use universidad;

-- Crear una tabla
create table alumno(
	alumnos_id int,
	nombre varchar(50),
	apellido_paterno varchar(25),
	apellido_materno varchar(25),
	fecha_nacimiento date,
	correo varchar(50)

);



insert into alumno
values (1,'Arcadia','Vaca','Del Corral','1986-04-07', 'correo@correo.com')

insert into alumno
values (1,'Kevin','Cabeza','De Borrego','1942-05-01', 'correo@correo.com')

select *
from alumno;

-- Restricciones

/*
	las restricciones son reglas que garantizan la integridad de los datos

	las mas utilizadas son:
	-- PRYMARY KEY
	-- FOREIGN KEY
	-- NOT NULL
	-- CHECK
	--DEFAULT
*/

DROP TABLE alumno;

-- PRYMARY KEY
create table alumno(
	alumno_id int primary key,
	nombre varchar(50),
	correo varchar(50),
);

insert into alumno
values (1, 'Luis','coreo@correo.com');

insert into alumno
values (2, 'Roberta','coreo@correo.com');

drop table alumno;

-- PRYMARY KEY
create table alumno(
	alumno_id int not null ,
	nombre varchar(50),
	correo varchar(50),
	constraint pk_alumno
	primary key (alumno_id)
);


insert into alumno
values (1, 'Luis','coreo@correo.com');

insert into alumno
values (1, 'Roberta','coreo@correo.com');

drop table alumno;

-- PRYMARY KEY CON IDENTITY
create table alumno(
	alumno_id int IDENTITY(1,1) PRIMARY KEY ,
	nombre varchar(50),
	correo varchar(50),
);


insert into alumno
values ('Luis','coreo@correo.com');

insert into alumno
values ('Roberta','coreo@correo.com');

select* from alumno;

create table alumno(
	alumno_id int not null IDENTITY(1,1) ,
	nombre varchar(50),
	correo varchar(50),
	constraint pk_alumno
	primary key (alumno_id)
);


-- NOT NULL

create table profesor (
	profesor_id int not null identity (1,1),
	numero_nomina varchar(20) not null,
	nombre varchar(15) not null,
	apellido_materno varchar(20) not null,
	apellido_paterno varchar(20) null,
	fecha_ingreso date,
	constraint pk_profesor
	primary key(profesor_id)
);


insert into profesor
values ('5554558645','luis','Hernandez',null,'2027-05-07');

insert into profesor(numero_nomina,nombre, apellido_materno)
values ('asdis546','Ricarda','Sonric');

select * from profesor;

--Restriccion UNIQUE

create table categoria(
	caegoria_id int not null primary key identity(1,1),
	nombre varchar(20) not null unique,
	activo bit not null 
);


insert into categoria
values (upper(' carnes_firas'), 1);

insert into categoria
values (upper(' carnes_firas'), 1);

drop table categoria;

-----

create table categoria(
	categoria_id int not null identity(1,1)
	constraint pk_categoria
	primary key (categoria_id),
	nombre varchar(20) not null
	constraint uq_categoria_nombre
	unique,
	activo bit not null
);


drop table categoria;


create table categoria(
	categoria_id int not null identity(1,1),
	nombre varchar(20) not null,
	activo bit not null,
	constraint pk_categoria
	primary key (categoria_id),
	constraint uq_categoria_nombre
	unique (nombre)
);


drop table categoria;



-- Resticcion default

create table categoria(
	categoria_id int not null identity(1,1),
	nombre varchar(20) not null,
	activo bit not null default 1,
	constraint pk_categoria
	primary key (categoria_id),
	constraint uq_categoria_nombre
	unique (nombre)
);

insert into categoria (nombre,activo)
values ('carnes Frias',default);

insert into categoria (nombre)
values ('lacteos');

select * from categoria


-- TODO: crear tablas de las otras dos formas 

-- TODO: CHECK


create database empresa_patito;

create table empleado(
producto_id int not null identity(1,1),
nombre varchar(20) not null,
descripcion varchar(50) not null,
precio decimal(10,2) not null,
exitencia int not null check (exitencia >=0),
activo bit not null default 1,
tipo char(1) not null check (tipo = "p" or tipo = "s"
));

insert into producto
values ("Pan", "Pan de molde", 15.50, 100, default, "p");

insert into producto 
values ("quemadita","sabrosona" ,12,50,34 ,default,"s");

insert into producto (nombre,precio,exitencia, tipo)
values ("pantera rosa", 89,9,56, "p");

-- segunda forma de construir (restricion por collumna)

create table empleado(
producto_id int not null identity(1,1)
constraint pk_producto
primary key,
nombre varchar(20) not null,
constraint uq_producto_nombre
unique,
descripcion varchar(80) not null,
precio decimal(10,2) not null,
constraint ck_producto_precio
check (precio >= 0),
exitencia int not null ,
constraint ck_producto_exitencia
check (exitencia >= 0),
activo bit not null,
constraint df_producto_activo
default 1,
tipo char(1) not null
constraint ck_producto_tipo
check (tipo in ("r","p"))
);


drop table producto;

-- Tercer Forma de creacion (definicion al final)

create table producto(
	producto_id int identity(1,1), 
	nombre varchar(20) not null,
	descripcion varchar(80)not null,
	precio decimal(10,2) not null ,
	existencia int not null ,
	activo bit not null
	constraint df_producto_activo
	default 1,
	tipo varchar(1) not null

	constraint pk_producto
	primary key (producto_id),
	constraint uq_producto_nombre
	unique (nombre),
	constraint ck_producto_precio
	check(precio>0.0),
	constraint ck_producto_existencia
	check (existencia between 1 and 100),

);


insert into producto 
values ('Pitufo', 'corrientona', 12.50, 99, default , 'r');

insert into producto 
values ('Pitufo', 'corrientona', 12.50, 34, default , 'p');

insert into producto 
values ('Pitufo', 'corrientona', -12.50, 99, default , 'p');

insert into producto (nombre, precio, existencia, tipo)
values ('Pantera Rosa',89.9, 56,'p');

select * from producto;

drop table producto

-- restrincion foreing key (integridad refecial)

create table provedor(
	provedor_id int not null identity(1,1),
	empresa varchar(20) not null,
	limite_credito decimal(10,2) not null
);

-- TODO: CHECK

create database empresa_patito;
go

use empresa_patito;
go

-- primera forma de construccion (no utilizando en ln futuro)
create table producto(
	producto_id int identity(1,1) primary key,
	nombre varchar(20) not null unique,
	dexcripcion varchar(80),
	precio decimal(10,2) not null check (precio>0.0),
	existencia int not null check (existencia>0 and existencia<=100),
	activo bit not null default 1,
	tipo varchar(1) not null check (tipo = 'r' or tipo = 'p')
);


insert into producto 
values ('Pitufo', 'corrientona', 12.50, 99, default , 'r');

insert into producto 
values ('Pitufo', 'corrientona', 12.50, 34, default , 'p');

insert into producto 
values ('Pitufo', 'corrientona', -12.50, 99, default , 'p');

insert into producto (nombre, precio, existencia, tipo)
values ('Pantera Rosa',89.9, 56,'p');

select * from producto;

drop table producto

-- segunda de froma de contruccion (Restriccion por columna)

create table producto(
	producto_id int identity(1,1) 
	constraint pk_producto
	primary key,
	nombre varchar(20) not null
	constraint uq_producto_nombre
	unique,
	descripcion varchar(80)not null,
	precio decimal(10,2) not null 
	constraint ck_producto_precio
	check(precio>0),
	existencia int not null 
	constraint ck_producto_existencia
	check (existencia between 1 and 100),
	activo bit not null
	constraint df_producto_activo
	default 1,
	tipo varchar(1) not null
	constraint ck_producto_tipo
	check (tipo in ('r','p'))
);


-- Tercer Forma de creacion (definicion al final)

create table producto(
	producto_id int identity(1,1), 
	nombre varchar(20) not null,
	descripcion varchar(80)not null,
	precio decimal(10,2) not null ,
	existencia int not null ,
	activo bit not null
	constraint df_producto_activo
	default 1,
	tipo varchar(1) not null

	constraint pk_producto
	primary key (producto_id),
	constraint uq_producto_nombre
	unique (nombre),
	constraint ck_producto_precio
	check(precio>0.0),
	constraint ck_producto_existencia
	check (existencia between 1 and 100),
	constraint ck_producto_tipo
	check (tipo in ('r','p'))

);


insert into producto 
values ('Pitufo', 'corrientona', 12.50, 99, default , 'r');

insert into producto 
values ('Pitufo', 'corrientona', 12.50, 34, default , 'p');

insert into producto 
values ('Pitufo', 'corrientona', -12.50, 99, default , 'p');

insert into producto (nombre, precio, existencia, tipo)
values ('Pantera Rosa',89.9, 56,'p');

select * from producto;

drop table producto

-- Rrestriccion Foreign Key (Integridad Referencial)

create table proveedor (
	proveedor_id int not null identity (1,1),
	empresa varchar (20)not null,
	limite_credito numeric(10,2) not null,
	activo bit not null
	constraint df_proveedor_activo
	default 1,
	created_at datetime2 not null
	constraint df_proveedor_created_at
	default sysdatetime(),
	update_at datetime2 not null
	constraint df_proveedor_update_at
	default sysdatetime(),
	constraint pk_proveedor
	primary key (proveedor_id),
	constraint uq_proveedor_empresa
	unique (empresa),
	constraint ck_proveedor_limite_creedito
	check (limite_credito between 100 and 100000)
);


create table contacto_proveedor(
	contacto_id int identity (1,1)
	primary key,
	nombre varchar(30) not null,
	apellido_paterno varchar(15)not null,
	apellido_materno varchar(15) null,
	telefono varchar(18) not null,
	proveedor_id int not null,
	constraint fk_contacto_proveedor_proveedor
	foreign key (proveedor_id)
	references proveedor (proveedor_id)

);

drop table contacto_proveedor

insert into proveedor (empresa,limite_credito)
values	('Coca-Cola', 78000);
insert into proveedor (empresa,limite_credito)
values	('Pecsi',7485);
insert into proveedor (empresa,limite_credito)
values	('Bimbo', 100000);

select * from proveedor

insert into contacto_proveedor(nombre,apellido_paterno,apellido_materno,telefono, proveedor_id)
values ('luis','Aguilar',null,'789654',1);

insert into contacto_proveedor (nombre,apellido_paterno,apellido_materno,telefono, proveedor_id)
values ('Casilga','Cabeza','de Vaca','523652',1);

insert into contacto_proveedor (nombre,apellido_paterno,apellido_materno,telefono, proveedor_id)
values ('Arcadia','Cabeza','de Vaca','523652',1);

select * from contacto_proveedor

TRUNCATE table contacto_proveedor ; --elimna todos los registros de la tabla y que no tenga referencias 
 
drop table conctacto_proveedor;
drop table proveedor;

create table proveedor (
	proveedor_id int not null,
	empresa varchar (20)not null,
	limite_credito numeric(10,2) not null,
	activo bit not null
	constraint df_proveedor_activo
	default 1,
	created_at datetime2 not null
	constraint df_proveedor_created_at
	default sysdatetime(),
	update_at datetime2 not null
	constraint df_proveedor_update_at
	default sysdatetime(),
	constraint pk_proveedor
	primary key (proveedor_id),
	constraint uq_proveedor_empresa
	unique (empresa),
	constraint ck_proveedor_limite_creedito
	check (limite_credito between 100 and 100000)
);


    create table contacto_proveedor(
	contacto_id int identity (1,1)
	primary key,
	nombre varchar(30) not null,
	apellido_paterno varchar(15)not null,
	apellido_materno varchar(15) null,
	telefono varchar(18) not null,
	proveedor_id int not null,
	constraint fk_contacto_proveedor_proveedor
	foreign key (proveedor_id)
	references proveedor (proveedor_id)
	on delete no ACTION
	on update no ACTION
    

);

select * from contacto_proveedor;


insert into contacto_proveedor(nombre,apellido_paterno,apellido_materno,telefono, proveedor_id)
values ('luis','Aguilar',null,'789654',1);

insert into contacto_proveedor (nombre,apellido_paterno,apellido_materno,telefono, proveedor_id)
values ('Casilga','Cabeza','de Vaca','523652',2);

insert into contacto_proveedor (nombre,apellido_paterno,apellido_materno,telefono, proveedor_id)
values ('Arcadia','Cabeza','de Vaca','523652',3);


-- eliminar el padre con no action


delete from contacto_proveedor where proveedor_id = 1;

delete from proveedor where proveedor_id = 1;

drop table contacto_proveedor;


--todo: se debe de revisar el on update no action  y las  demas intergridades referenciales
=======
--Contruccion de base de datos  con SQL-LDD(Create,Alter,Drop) 

--Crear una base de datos

CREATE database universidad;

-- USAR la base de datos
 use universidad;


--Crear tabla
CREATE TABLE alumno (
 alumno_id int ,
 nombre varchar (50),
 apellido paterno varchar (25),
 apellido materno varchar (20),
 fecha_nacimiento date,
 correo varchar (50)

);

INSERT INTO alumno
VALUES (1, "arkadia","vaca", "del corral","1978-06-10", "correo@correo.com");


INSERT INTO alumno
VALUES (1, "kevin","cabeza", "de borrego","1968-06-9", "correo@correo.com");


 --restriciones
/*
   las mas utilizadas son;
     
   - primary key
    - FOREIGN KEY
    - NOT NULL
    - UNIQUE
    - CHECK
    - DEFAULT
*/
    
    DROP TABLE alumno;
    
    -- primary key 
    CREATE TABLE alumno (
     alumno_id inty PRIMARY KEY,
     nombre varchar(30),
     correo varchar (30)
     );
    
    INSERT INTO alumno
    values (1, "luis", "correo@correo.com")
    
    INSERT INTO alumno 
    VALUES (1,"roberta","correo@correo.com");
    
    DROP TABLE alumno;
    
      CREATE TABLE alumno (
     alumno_id int PRIMARY KEY,
     nombre varchar(30),
     correo varchar (30),
     CONSTRAINT pk_alumno
     PRIMARY KEY (alumno_id)
     );
    
    INSERT INTO alumno
VALUES (1, "arkadia","vaca", "del corral","1978-06-10", "correo@correo.com");


INSERT INTO alumno
VALUES (1, "kevin","cabeza", "de borrego","1968-06-9", "correo@correo.com");
    
DROP TABLE alumno;

-- PRMRY KEY CON IDENTITY

  CREATE TABLE alumno (
     alumno_id int IDENTITY (1,1) PRIMARY KEY,
     nombre varchar(30),
     correo varchar (30),
     CONSTRAINT pk_alumno
     PRIMARY KEY (alumno_id)
     );   
   INSERT INTO alumno
VALUES (1, "arkadia","vaca", "del corral","1978-06-10", "correo@correo.com");´		


INSERT INTO alumno
VALUES (1, "kevin","cabeza", "de borrego","1968-06-9", "correo@correo.com");
   
    DROP TABLE alumno;

SELECT * from
  CREATE TABLE alumno (
     alumno_id int IDENTITY (1,1) PRIMARY KEY,
     nombre varchar(30),
     correo varchar (30),
     CONSTRAINT pk_alumno
     PRIMARY KEY (alumno_id)
     );

CREATE TABLE profesor(
profesor_id int NOT NULL,
numero_nomina varchar (20) NOT NULL,
apellido_paterno varchar (20) NOT NULL,
apellido_materno varchar (20) NOT NULL ,
fecha_ingreso date ,
CONSTRAINT pk_profesor
PRIMARY KEY (profesor_id )

);

INSERT INTO profesor
VALUES ("1423638dygdty","2027-07-9")

    DROP TABLE alumno;

select *
from profesor;

insert into profesor (numero_nomina, nombre, apellido_materno)
values ("sddsds", "ricada","castro");

--todo se debe revisar

