CREATE DATABASE Escuela;
USE Escuela;

CREATE TABLE Alumno(
    alumno_id INT NOT NULL,
    matricula_id INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido_p VARCHAR(15) NOT NULL,
    apellido_m VARCHAR(15) NULL,
    correo VARCHAR(50) NOT NULL,
    fecha_naci DATE,
    PRIMARY KEY (alumno_id, matricula_id)
);


CREATE TABLE Credencial(
    Num_credencial VARCHAR(35) NOT NULL,
    fecha_exp DATE NOT NULL, 
    vigencia DATE NOT NULL,
    alumno_id INT NOT NULL,
    matricula_id INT NOT NULL,
    PRIMARY KEY (Num_credencial),
    FOREIGN KEY (alumno_id, matricula_id) REFERENCES Alumno(alumno_id, matricula_id)
);


CREATE TABLE Telefono(
    Telefono VARCHAR(25) NOT NULL,
    alumno_id INT NOT NULL,
    matricula_id INT NOT NULL,
    PRIMARY KEY (Telefono),
    FOREIGN KEY (alumno_id, matricula_id) REFERENCES Alumno(alumno_id, matricula_id)
);


CREATE TABLE Departamento(
    Num_dep INT NOT NULL,
    Nom_Dep VARCHAR(30) NOT NULL,
    Edificio INT NOT NULL,
    PRIMARY KEY (Num_dep)
); 


CREATE TABLE PROFESOR (
    Num_profesor VARCHAR(30) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido_p VARCHAR(25) NOT NULL,
    apellido_m VARCHAR(25) NOT NULL,
    Num_dep INT NOT NULL, 
    PRIMARY KEY (Num_profesor),
    FOREIGN KEY (Num_dep) REFERENCES Departamento(Num_dep)
);


CREATE TABLE Dependiente(
    Nomb_Dep VARCHAR(20) NOT NULL,
    fecha_nac DATE NOT NULL,
    Parentesco VARCHAR(30) NOT NULL,
    Num_profesor VARCHAR(30) NOT NULL, 
    PRIMARY KEY (Nomb_Dep),
    FOREIGN KEY (Num_profesor) REFERENCES PROFESOR(Num_profesor)
);


CREATE TABLE materia (
    Clave_materia VARCHAR(60) NOT NULL,
    Nom_materia VARCHAR(40) NOT NULL,
    creditos DECIMAL(4,2) NOT NULL,
    PRIMARY KEY (Clave_materia)
);


CREATE TABLE Curso(
    curso_id INT NOT NULL,
    Clave_materia VARCHAR(60) NOT NULL,
    alumno_id INT NOT NULL,
    matricula_id INT NOT NULL,
    Fecha_inscri DATE NOT NULL, 
    cali_final DECIMAL(4,2) NOT NULL,
    PRIMARY KEY (curso_id, Clave_materia, alumno_id, matricula_id),
    FOREIGN KEY (alumno_id, matricula_id) REFERENCES Alumno(alumno_id, matricula_id),
    FOREIGN KEY (Clave_materia) REFERENCES materia(Clave_materia)
);


CREATE TABLE Proyecto(
    Num_proy INT NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    Presupuesto DECIMAL(12,2) NOT NULL,
    PRIMARY KEY (Num_proy)
); 


CREATE TABLE Participa(
    Num_parti VARCHAR(50) NOT NULL,
    Num_proy INT NOT NULL,
    alumno_id INT NOT NULL,
    matricula_id INT NOT NULL,
    PRIMARY KEY (Num_parti, Num_proy),
    FOREIGN KEY (Num_proy) REFERENCES Proyecto(Num_proy),
    FOREIGN KEY (alumno_id, matricula_id) REFERENCES Alumno(alumno_id, matricula_id)
);






