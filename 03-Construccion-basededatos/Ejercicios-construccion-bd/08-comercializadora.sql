-- creat base de datos 

CREATE DATABASE comercializadora;

--utiliza l abase de datos
USE comercializadora ;

CREATE TABLE producto (
producto_id char(5) not null
fabricante_id char (3) not null,
descripcion varchar(40) not null,
precio decimal(10,2) not null 
exitencia int not null
constraint pk_producto
primary key -(producto_id, fabriante_id),
constraint uq_producto_descripcion
unique (descripcion)
constraint ck_producto_precio
check(precio>0,0),
constraint ck_producto_exitencia
check (exitencia BETWWEN 1 AND 100)
);

--/========= CREAR TABLA REPRESENTANTE  =========

CREATE TABLE representante (
representate_id int not null identity(1,1)
constraint pk_representante 
primary key,

nombre varchar (20) not null,
apellido_p varchar(15) not null,
apellido_m varchar(15) null,
fecha_contrato date not null,
fecha_naci date not null,
puesto varchar (15) not null,

couta decimal(10,2) not null
constraint ck_representante_cuota
check (couta>0.0),

ventas decimal (10,2)
constraint ck_representante_venta
check (ventas>0.0),

represntante_id_jefe int,  -- foreign key recursiva o jerarquia
constraint FK_representante_representante
foreign key (represntante_id_jefe) references representante(representate_id),

oficina_id int not null, -- foreign key de oficina 

creadted_at DATETIME2 not null
constraint df_representante_creadted_at
default SYSDATETIME(),

[updated_ at] DATETIME2 not null
constraint df_representante_updated_at
default SYSDATETIME()
);

--/========= CREAR TABLA OFICINA  =========

CREATE TABLE oficina (
oficina_id int not null,
cuidad varchar(30) not null,
region varchar(20) not null,
objetivo decimal (10,2) not null,
venta decimal (10,2) not null,

created_at datetime2 not null
constraint df_oficina_created_at
default sysdatetime(),

updated_at datetime2 not null
constraint df_oficina_udated_at
default sysdatetime(),

representante_id int not null, -- Esta es tu columna local, aquí sí le pusiste la "n"

constraint pk_oficina
PRIMARY key (oficina_id),

constraint uq_oficina_cuidad
unique (cuidad),

constraint ck_oficina_region
check (region in ('este','oeste')),

constraint ck_oficina_objetivo
check (objetivo>0.0),

constraint ck_oficina_venta
check (venta>0.0),

constraint fk_oficina_representante
foreign key (representante_id)
references representante (representate_id) 
);

--/========= agregar los campos de auditoria a productos ===========

ALTER TABLE producto
ADD 
created_at datetime2 not null,
update_at datetime2 not null;

ALTER TABLE producto -- Faltaba el nombre de la tabla
ADD CONSTRAINT df_producto_created_at
DEFAULT SYSDATETIME() FOR created_at;

ALTER TABLE producto
ADD CONSTRAINT df_producto_updated_at
DEFAULT SYSDATETIME() FOR update_at 




--/========= representate de oficina ===========

alter table representate
add constraint fk_represtate_oficina
foreign key (oficina_id)
references oficina(oficina_id)


--/========= crear tabla cliente ===========

CREATE TABLE cliente (
cliente_id int not null identity(1,1)
    constraint pk_cliente primary key,

empresa varchar(30) not null
    constraint uq_cliente_empresa unique,

limite_credito decimal (10,2) not null,

constraint ck_cliente_limite_credito
    check (limite_credito between 1000 and 100000),

created_id datetime2 not null
    constraint df_cliente_created_at default sysdatetime(),

updated_at datetime2 not NULL 
    constraint df_cliente_updated_at default sysdatetime(),

representate_id int not null,

constraint fk_cliente_representante
    foreign key (representate_id)
    references representante(representate_id) 
);

--/========= crear tabla pedido ===========

CREATE TABLE pedido (
      pedido_id INT NOT NULL IDENTITY(1,1)
	  CONSTRAINT pk_pedido
	  PRIMARY KEY,

	  fecha_pedido DATE NOT NULL
	  CONSTRAINT df_pedido_fecha_pedido
	  DEFAULT GETDATE(),

	  created_at DATETIME2 NOT NULL 
	  CONSTRAINT df_pedido_created_at
	  DEFAULT SYSDATETIME(),

	  updated_at DATETIME2 NOT NULL
	  CONSTRAINT df_pedido_updated_at
	  DEFAULT SYSDATETIME(),

	  cliente_id INT NOT NULL, -- <--- Faltaba esta coma

	  CONSTRAINT fk_pedido_cliente
	  FOREIGN KEY (cliente_id)
	  REFERENCES cliente (cliente_id),

	  representante_id INT NOT NULL, -- <--- Faltaba esta coma

	  CONSTRAINT fk_pedido_representante
	  FOREIGN KEY (representante_id)
	  REFERENCES representante (representante_id)
);
--/========= crear tabla detalle pedido ===========

CREATE TABLE detalle_pedido (
       pedido_id INT NOT NULL,
	   producto_id CHAR(5) NOT NULL,
       fabricante_id CHAR(3) NOT NULL,
	   cantidad INT NOT NULL
	   CONSTRAINT ck_detalle_pedido_cantidad
	   CHECK (cantidad > 0.0),
	   precio_venta DECIMAL (10,2) NOT NULL
	   CONSTRAINT ck_detalle_pedido_precio_venta
	   CHECK (precio_venta >0.0),
	   created_at DATETIME2 NOT NULL
	   CONSTRAINT df_detalle_precio_created_at
	   DEFAULT SYSDATETIME(),
	   updated_at DATETIME2 NOT NULL 
	   CONSTRAINT df_detalle_venta_updated_at
	   DEFAULT SYSDATETIME(),
	   CONSTRAINT pk_detalle_venta
	   PRIMARY KEY (pedido_id, producto_id, fabricante_id),
	   CONSTRAINT fk_detalle_pedido_pedido
	   FOREIGN KEY (pedido_id)
	   REFERENCES pedido (pedido_id),
	   CONSTRAINT fk_detalle_pedido_producto
	   FOREIGN KEY (producto_id, fabricante_id)
	   REFERENCES producto (producto_id, fabricante_id)
);




