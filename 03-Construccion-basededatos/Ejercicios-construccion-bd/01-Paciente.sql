CREATE DATABASE paciente;
USE paciente;


CREATE TABLE paciente(
Num_paciente int not null,
nombre varchar (30) not null,
Apellido_p varchar(20) not null,
Apellido_M varchar (20) not NULL ,
Fecha_Naci date not null,
constraint pk_Num_paciente 
primary key (Num_paciente)
);

CREATE TABLE Expediente (
Num_Exp int not null,
Fecha_Exp int not null,
Tipo_Sang varchar(30) not null,
Num_paciente int not null,
unique (Tipo_Sang)
constraint pk_Num_Exp 
primary key (Num_Exp)
foreign key (Num_paciente),
references paciente(Num_paciente)
);
