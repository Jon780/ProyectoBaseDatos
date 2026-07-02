CREATE DATABASE EJEMPLOBD;
GO

USE EJEMPLOBD;
GO

-- SQL-LDD
CREATE TABLE categoria(
	categoria_id INT not null,
	nombre VARCHAR(50),
	CONSTRAINT pk_categoria
	PRIMARY KEY (categoria_id)
);

CREATE TABLE producto (
	producto_id INT not null PRIMARY KEY,
	nombre VARCHAR (50) not null,
	precio MONEY not null,
	existencia INT not null,
	categoria_id INT not null,
	CONSTRAINT fk_producto_categoria
	FOREIGN KEY (categoria_id)
	REFERENCES categoria (categoria_id)
);