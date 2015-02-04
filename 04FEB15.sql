CREATE TABLE puertos(
nombre VARCHAR(20) PRIMARY KEY NOT NULL,
categoria INT,
etapa INT,
d_ciclista INT,
altura INT,
CONSTRAINT
   FOREIGN KEY (etapa) REFERENCES etapas(numero),
   FOREIGN KEY (d_ciclista) REFERENCES ciclistas(dorsal)
)ENGINE = INNODB;
CREATE TABLE llevar_m(
etapas INT NOT NULL,
mallot INT NOT NULL,
ciclista INT NOT NULL,
PRIMARY KEY (etapas,mallot),
CONSTRAINT 
   FOREIGN KEY (etapas) REFERENCES etapas(numero),
   FOREIGN KEY (mallot) REFERENCES maillot(codigo),
   FOREIGN KEY (ciclista) REFERENCES ciclistas(dorsal)
) ENGINE = INNODB;
CREATE TABLE etapas(
numero INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
kms INT NOT NULL,
c_salida VARCHAR(20),
c_llegada VARCHAR(20),
d_ciclista INT,
CONSTRAINT FOREIGN KEY (d_ciclista) REFERENCES ciclistas(dorsal) 
)ENGINE = INNODB;
CREATE TABLE ciclistas(
dorsal INT PRIMARY KEY NOT NULL,
nombre VARCHAR(20) NOT NULL ,
edad INT,
equipo VARCHAR(15),
FOREIGN KEY (equipo) REFERENCES  equipos(nombre)
)ENGINE = INNODB;
CREATE TABLE maillot(
codigo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
tipo VARCHAR(10),
color VARCHAR(15),
premio FLOAT
) ENGINE = INNODB;
CREATE TABLE equipos(
nombre VARCHAR(20) PRIMARY KEY NOT NULL,
director VARCHAR(20)
) ENGINE = INNODB;
CREATE TABLE ciclistas (
dorsal INT PRIMARY KEY,
nombre VARCHAR(15),
edad INT,
equipo VARCHAR(20),
FOREIGN KEY equipo
);
USE ciclistas;
SHOW DATABASES;
CREATE DATABASE ciclistas