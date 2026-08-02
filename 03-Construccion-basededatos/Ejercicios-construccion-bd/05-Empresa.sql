CREATE DATABASE Empresa;

USE Empresa;


CREATE TABLE Emplayee(
SSN varchar (25) not null,
First_name varchar(25) not null,
Addres  varchar (100) not null,
salary decimal not null,
Sex int NOT NULL,
PRIMARY KEY (SSN),
FOREIGN KEY (Jet)
);


CREATE TABLE Dependnt(
name varchar(25) not null ,
sex int not null ,
relation_shin int NOT NULL ,
bdat varchar(25) not null,
SSN varchar(25) not null,
PRIMARY KEY (name),
FOREIGN KEY (SSN) REFERENCES Emplayee(SSN)
);

CREATE TABLE Departament(
Number int not null,
name varchar (25) not null,
manager varchar(25) not null,
Start date,
SSN VARCHAR (25) not null,
PRIMARY KEY  (Number , Name),
FOREIGN KEY (SSN) REFERENCES Emplayee(SSN)
);

CREATE TABLE Worlks_on(
SSN varchar(35) not null,
Num_proyect int not null,
Hours date,
NumberDep varchar(35), 
PRIMARY KEY (SSN, Num_proyect),
FOREIGN KEY (SSN) REFERENCES Emplayee(SSN)
);

CREATE TABLE Proyects(
name varchar(25) not null,
number varchar(25) not null,
location varchar (25) not null,
NumberDep varchar (25)not null,
Primary key (name, number),
foreign Key (NumberDep) REFERENCES worlks_on(NumberDep)
);

CREATE TABLE  locations (
name varchar(25) not null,
number varchar(25) not null,
Primary key (name),
Foreign key (location)REFERENCES Proyects(location),
Foreign key (NumberDep) REFERENCES Worlks_on(NumberDep)
);



