CREATE DATABASE profesor;

USE profesor;

CREATE TABLE profesor(
Num_prof int not null,
Nombre varchar(30) not null,
Apellido_P varchar(20) not null,
Apellido_M varchar(20) not null,
constraint pk_Num_prof
primary key (Num_prof)
);

CREATE TABLE expecialidad(
Num_Exp int not null,
Nume_prof int not null,
Nume_Expediente varchar (20) not null
constraint pk_Num_Exp
primary key (Num_Exp),
constraint fk_Num_prof 
foreign key (Num_prof)
references profesor(Num_prof)
);


CREATE TABLE curso(
Num_curso int not null,
Nom_curso int not null,
Creditos int not null,
Num_prof int not NULL 
constraint pk_Num_curso 
primary key (Num_curso),
constraint fk_ Num_prof
foreign key (Num_prof )
references profesor(Num_prof)
);



