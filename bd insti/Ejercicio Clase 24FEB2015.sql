
#1
USE insti;
#2
CREATE TABLE alumnes(
   codi INT PRIMARY KEY,
   nom VARCHAR(20) NOT NULL,
   estudis VARCHAR(3)
) ENGINE = INNODB;
#3
INSERT INTO alumnes VALUES
(3,"Juanito Valdearrama","FOL"),
(4,"Francisco Alcantara","BIO"),
(5,"Marc Guerola","MAT"),
(6,"Fede Fernandez","MAT"),
(7,"Jose Segura","ING"),
(8,"Mohamed El Harabi","FRC"),
(9,"Ivaylo Ivanov","CST");

SELECT * FROM alumnes;
DROP TABLE a_dam;
#4
CREATE TABLE a_dam 
SELECT codi,`nom`
FROM alumnes
WHERE estudis = "DAM";
#5
CREATE TABLE a_eso(
   codi INT PRIMARY KEY,
   nom VARCHAR(20)
)ENGINE = INNODB;
#6
INSERT INTO a_eso VALUES
(10,"Pepito la Flor"),
(11,"Armando Estaban Quito"),
(12,"Simelemon Tolomeo");
#7
INSERT INTO a_eso 
SELECT codi,nom
FROM alumnes
WHERE estudis = "ESO";

SELECT codi,nom
FROM a_eso;
#8
DELETE FROM alumnes 
WHERE estudis = "ESO" OR estudis = "DAM";

SELECT *
FROM alumnes;

