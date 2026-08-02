CREATE DATABASE escuela3;

USE escuela3;


CREATE TABLE alumno (
    Alumno_id varchar(25) not null,
    Semestre int not null,
    matricula varchar(25) not null,
    Nombre varchar(25) not null,
    Apellido_p varchar(25) not null,
    Apellido_m varchar(25) not null,
    PRIMARY KEY (matricula) 
);


CREATE TABLE curso (
    curso_id int not null,
    Clave_materia varchar(25) not null,
    Nombre_materia varchar(25) not null,
    Creditos decimal(10,2),
    PRIMARY KEY (Clave_materia) 
);

CREATE TABLE inscribe (
    inscribe_id varchar(25) not null,
    Fecha_inscr date not null,
    Clave_materia varchar(25) not null,
    matricula varchar(25) not null,
    PRIMARY KEY (inscribe_id),
    CONSTRAINT fk_inscribe_alumno 
    FOREIGN KEY (matricula) 
    REFERENCES alumno(matricula),    
    CONSTRAINT fk_inscribe_curso 
    FOREIGN KEY (Clave_materia) 
    REFERENCES curso(Clave_materia)
);