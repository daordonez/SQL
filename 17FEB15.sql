STATUS;
# Necesario introducir engine para que haga efecto las claves ajenas
# CONSTRAINT --> poner nombre a la restricción para poder modificarla posteriormente. Util en el caso de que exista mas de una
# Restricción por tabla. ex: drop index [nombre_res] ON [Nombre_tabla]
CREATE TABLE clientes(
   codigo INT PRIMARY KEY,
   nombre VARCHAR(40) NOT NULL,
   pueblo INT,
   tel VARCHAR(15),
   FOREIGN KEY (pueblo) REFERENCES pueblos(cpo)
      ON DELETE SET NULL 
      ON UPDATE CASCADE
) ENGINE = INNODB;
DROP TABLE clientes;
CREATE TABLE clientes(
   codigo INT PRIMARY KEY,
   nombre VARCHAR(40) NOT NULL,
   pueblo INT,
   tel VARCHAR(15),
   FOREIGN KEY (pueblo) REFERENCES pueblos(cpo)
) ENGINE = INNODB;
CREATE TABLE clientes(
   codigo INT PRIMARY KEY,
   nombre VARCHAR(40) NOT NULL,
   pueblo INT,
   tel VARCHAR(15),
   FOREIGN KEY pueblo REFERENCES pueblos(cpo)
) ENGINE = INNODB;
CREATE TABLE clientes(
   codigo INT PRIMARY KEY,
   nombre, VARCHAR(40) NOT NULL,
   cp_pueblo INT,
   tel VARCHAR(15),
   FOREIGN KEY pueblo REFERENCES pueblos(cpo)
) ENGINE = INNODB;
CREATE TABLE clientes(
   codigo INT PRIMARY KEY,
   nombre, VARCHAR(40) NOT NULL,
   pueblo INT,
   tel VARCHAR(15),
   FOREIGN KEY pueblo REFERENCES pueblos(cpo)
) ENGINE = INNODB;
CREATE TABLE clientes(
   codi INT PRIMARY KEY,
   nombre, VARCHAR(40) NOT NULL,
   pueblo INT,
   tel VARCHAR(15),
   FOREIGN KEY (pueblo) REFERENCES pueblos(cpo)
) ENGINE = INNODB;
CREATE TABLE pueblos(
   cpo INT PRIMARY KEY,
   nombre CHAR(15)
) ENGINE = INNODB;
SELECT * FROM personas;
INSERT INTO personas(dni,nombre,deuda) VALUES("23455668W","Rodrigo",100);
select * FROM personas;
selec * FROM personas;
INSERT INTO personas VALUES(1,"20345135Q","Pepito",10);
INSERT INTO personas VALUES(,"20345135Q","Pepito",10);
INSERT INTO personas VALUES("20345135Q","Pepito",10);
# Unique --> clave alternativa
# Default --> valor con el que se quiere que se inicie por defecto
CREATE TABLE personas(
   codigo INT PRIMARY KEY AUTO_INCREMENT,
   dni VARCHAR(10) UNIQUE,
   nombre VARCHAR(40) NOT NULL,
   deuda INT DEFAULT 0
) ENGINE = INNODB;
USE pruebas_cl;
SHOW DATABASES;
SELECT *
FROM partits
WHERE(equipc = "bar" AND `possessioc` > 70) 
OR (equipf = "bar" AND possessioc < 30)