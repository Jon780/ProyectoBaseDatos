
CREATE DATABASE Ejercicio04;

USE Ejercicio04;

CREATE TABLE cliente (
Id_Cliente int not null,
Nom_pr varchar(30) not null,
Apelli_p varchar(20) not null,
Apelli_m varchar(20) not null,
PRIMARY KEY (Id_Cliente)
);

CREATE TABLE pedido(
Id_pedido int not null,
Fecha date not null,
PRIMARY KEY (Id_pedido),
FOREIGN KEY (Id_Cliente)
);

CREATE TABLE contiene(
Id_Contiene int not null,
Id_pedido int not null,
Id_prod int not null,
Cantidad_Ven int not null,
Precio_Ven not null,
PRIMARY KEY (Id_Contiene, Id_prod , Precio_Ven),
FOREIGN KEY (Id_pedido) REFERENCES Pedido(Id_Pedido),
);

CREATE TABLE producto(
Id_prod int not null,
Nom_prod varchar(30) not null,
Precio double not null,
Precio_Ven not null,
PRIMARY KEY (Id_prod),
FOREIGN KEY (Precio_Ven) REFERENCES contiene(Precio_Ven)
);





