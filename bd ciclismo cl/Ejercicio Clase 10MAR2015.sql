-- Es posible agrupar por mas de un campo
SELECT edat, equip, count(*)
FROM ciclistes
GROUP BY edat, equip
HAVING ciclista;
-- HAVIG = WHERE para groups . Siempre irá despues de GROUP BY y el WHERE

SELECT ciclista, count(*) 
FROM etapes
GROUP BY `ciclista`
ORDER BY count(*) DESC ;

-- C3
SELECT categoria,max(altura) AS Altura_max, min(altura) AS Altura_min, round(AVG(altura),2) AS Media, max(pendent) AS Pendent_Max,
min(pendent) AS Pendent_Min,round(AVG(pendent),2) AS Pendent_med, COUNT(*) AS puertos
FROM ports
GROUP BY categoria;

-- C4
SELECT mallot, ciclista, COUNT(*) AS Ha_portat
FROM portar
GROUP BY mallot,ciclista
ORDER BY count(*) DESC;

-- C5
SELECT  equip, edat, count(*) quantitat
FROM ciclistes
GROUP BY equip;

-- HAVING
-- D1
SELECT equip, round(AVG(edat),2) AS Edat_Mitjana, max(edat) AS Max_edat, min(edat) AS Min_edat, count(*) AS cantidad_cic
FROM ciclistes
GROUP BY `equip`
HAVING count(*) > 3;

-- D2
SELECT ciclista ,count(*)
FROM etapes
GROUP BY ciclista
HAVING count(*) > 1;

-- D3
SELECT categoria , max(altura) AS Altura_Max, min(altura) AS Altura_min
FROM ports
GROUP BY categoria
HAVING Altura_Max = Altura_Min;

-- D4
SELECT ciclista AS dorsal, etapa, count(*) AS Ganadas 
FROM ports
GROUP BY etapa, ciclista
HAVING count(*) > 1;

-- 4.4.12
-- E1
SELECT numero,kms 
FROM etapes 
WHERE kms >= 50 AND kms <= 100;

-- E2
SELECT numero, kms
FROM etapes
WHERE kms < 50 OR kms > 100;

-- E3
SELECT `nom`, equip
FROM ciclistes
WHERE nom LIKE 'Al%';

-- E4
SELECT  nom, director
FROM equips
WHERE nom LIKE '%tiac%';

-- E5
SELECT arribada
FROM etapes
WHERE arribada LIKE '%Naran%o';

-- E6
SELECT `nom`
FROM ciclistes
WHERE nom LIKE '%Induráin%' AND nom NOT LIKE '%Miguel%';

-- 4.4.13
-- F1
SELECT nom, altura
FROM ports
WHERE (altura BETWEEN 1500 AND 2000) AND (categoria != 'E') AND (pendent > 5);

-- F2
SELECT nom, edat
FROM ciclistes
WHERE (nom LIKE 'AL%' OR nom LIKE 'An%' OR nom LIKE 'Ar%') AND (edat BETWEEN 25 AND 30);

-- 4.4.14
-- G1
SELECT nom,equip, edat
FROM ciclistes
ORDER BY equip, edat DESC;

-- 4.4.16
-- H1
SELECT dorsal, nom
FROM ciclistes
WHERE equip LIKE "Banesto"
UNION 
SELECT ciclista, count(*) AS victorias
FROM etapes
GROUP BY ciclista
HAVING count(*) > 1;

-- H4
SELECT ciclista, count(*) AS victorias_Etapa, (kms * 1000) AS kms_En_Metros
FROM etapes
GROUP BY ciclista
HAVING count(*) > 1
UNION
SELECT ciclista, count(*) AS victorias_Port, (altura * 100) AS altura_metros
FROM ports
GROUP BY ciclista
HAVING count(*) > 1;

-- H5
SELECT numero
FROM etapes
WHERE kms > 200
UNION
SELECT `etapa`
FROM ports
GROUP BY etapa
HAVING count(*) > 2
UNION
SELECT etapa
FROM portar
GROUP BY ciclista,etapa
HAVING count(*) > 1;

-- H6
SELECT ciclista, count(*) AS Premis, "etapes" AS tipus
FROM etapes
GROUP BY `ciclista`
UNION 
SELECT `ciclista`, count(*) , "Ports"
FROM ports
GROUP BY `ciclista`
ORDER BY ciclista,premis;

-- 4.5.3
-- I1
SELECT ciclistes.nom , ciclistes.equip, director
FROM ciclistes, equips
WHERE ciclistes.`equip` = equips.nom;

-- I2
SELECT  ports.nom, etapes.`eixida`, etapes.`arribada`
FROM etapes, ports
WHERE ports.`etapa`= etapes.`numero`;

-- I3
SELECT ciclistes.equip, equips.director, count(*) AS Q_Ciclistes
FROM ciclistes, equips
WHERE ciclistes.equip = equips.nom
GROUP BY equip;

-- I4
SELECT ciclistes.nom, count(*) AS Victories
FROM ciclistes, `etapes`
WHERE etapes.ciclista = ciclistes.dorsal
GROUP BY ciclista
HAVING count(*) > 1
ORDER BY Victories,nom;

-- I5
SELECT ciclistes.nom AS Nom, etapes.`numero` AS N_Etapa, ports.nom
FROM ciclistes,etapes, ports
WHERE ports.etapa = etapes.numero AND ports.ciclista = ciclistes.dorsal AND etapes.`eixida` = "Igualada";