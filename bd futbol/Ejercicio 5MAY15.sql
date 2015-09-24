-- 1,2
SELECT jugadors.dorsal , jugadors.nom, (sum(golejadors.gols) + sum(golejadors.penals)) AS Total_gols 
FROM jugadors, golejadors
WHERE jugadors.`dorsal` = golejadors.`dorsal`
    AND golejadors.`equip` = jugadors.`equip`
    AND golejadors.`gols` = (SELECT max(gols)
                             FROM golejadors);
-- 3

SELECT `nom`, `sou`
FROM jugadors
WHERE  jugadors.sou = (SELECT max(sou)
                        FROM jugadors);                        

-- 4
SELECT jugadors.`equip`, jugadors.`nom`, jugadors.sou
FROM jugadors
WHERE  jugadors.sou = (SELECT max(sou)
                     FROM jugadors AS j2
                     WHERE j2.`equip` = jugadors.`equip`);  

-- 5
SELECT jugadors.`dorsal`, jugadors.`nom`, p1.`equipc` AS eLocal, p1.`equipf` AS eVisit, p1.`golsc`+p1.`golsf` AS Total_gols
               FROM partits AS p1 , jugadors
               WHERE (jugadors.`equip` = p1.`equipc` OR jugadors.`equip`= p1.`equipf`) AND 
                golsc + golsf = (SELECT max( `golsc` + `golsf`)
                                    FROM partits ) 
ORDER BY jugadors.`equip`, jugadors.nom;

                                    
                    