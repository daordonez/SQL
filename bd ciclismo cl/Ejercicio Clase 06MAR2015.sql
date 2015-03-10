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
