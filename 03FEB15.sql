SELECT num,nombre,cognom1
FROM alumnes
WHERE edad > 12
ORDER BY num DESC;
SELECT num,nombre,cognom1
FROM alumnes
WHERE edad > 12
ORDER BY num ASC;
SELECT num,nombre,cognom1
FROM alumnes
WHERE edad > 12;
SELECT * FROM alumnes;
ALTER TABLE alumnes
DROP cognom2;
UPDATE alumnes SET edad = 16 WHERE num = 2;
UPDATE alumnes SET edad = 15 WHERE num = 1;
ALTER TABLE alumnes
ADD edad INT
AFTER nombre
UPDATE alumnes SET edad = 15 WHERE num = 1;
ALTER TABLE alumnes
ADD edad INT
AFTER nombre
UPDATE TABLE alumnes SET edad = 15 WHERE num = 1;
ALTER TABLE alumnes
ADD edad INT
AFTER nombre
UPDATE TABLE alumnes SET edad VALUE(15) WHERE num = 1;
ALTER TABLE alumnes
ADD edad INT
AFTER nombre
UPDATE TABLE alumnes SET edad(15) WHERE num = 1;
ALTER TABLE alumnes
ADD edad int
AFTER nombre;
ALTER TABLE alumnes
ADD cognom2 VARCHAR(20)
AFTER nombre;
ALTER TABLE alumnes
ADD cognom2 VARCHAR(20);
ALTER TABLE alumnes
ADD cognom1 VARCHAR(20);
DELETE FROM alumnes WHERE num = 3;
USE institut;
SHOW DATABASES;
UPDATE alumnes SET nombre = "Josep" WHERE nombre = "pepe";
INSERT INTO alumnes VALUES(3,"Joselito","567923456")