#7 Mostra el següents sous: El més car, el més barat i la mitjana
SELECT MAX(sou), MIN(sou), AVG(sou)
	FROM jugadors;
	
#8 Incrementa un 5% els pressupostos de tots els equips.
UPDATE equips
	SET pressupost = pressupost * 1.05;

#9 Mostra la quiniela de la primera jornada (equip casa, equip fora, 1x2). Harás de buscar un select condicional. Busca en internet.
DESCRIBE partits;
SELECT equipc, equipf, IF(golsc > golsf, 'x', '') AS `Equip casa`, IF (golsc < golsf, 'x', '') AS `Equip fora`, IF(golsc = golsf, 'x', '') AS `1x2`
	FROM partits
	WHERE jornada = 1;
	
#10. Mostra les quinieles de tota la competició
SELECT equipc, equipf, jornada, IF(golsc > golsf, 'x', '') AS `Equip casa`, IF (golsc < golsf, 'x', '') AS `Equip fora`, IF(golsc = golsf, 'x', '') AS `1x2`
	FROM partits
	ORDER BY jornada;
	
#11 Gols marcats pel pitxitxi
SELECT jugadors.nom AS `pitxitxi`, golejadors.equip, golejadors.dorsal, MAX(gols) AS `gols`
	FROM golejadors, jugadors
	WHERE golejadors.dorsal = jugadors.dorsal AND golejadors.equip = jugadors.equip;
	
#EXERCICIS GROUP BY
#1 Mostra de cada equip: el codi, sou màxim, mínim, la suma de tots els sous, quants jugadors hi ha, de quants jugadors es coneix el sou, la mitjana de sous entre els que sabem el sou i la mitjana de sous entre tots el jugadors.
DESCRIBE jugadors;
SELECT count(*) 
	FROM jugadors;
	
SELECT count(*)
	FROM jugadors
	WHERE sou IS NULL;
SELECT equip, MAX(sou), MIN(sou), SUM(sou), COUNT(dorsal) AS `jugadors`, COUNT(sou), AVG(sou) AS `Mitja sou`, SUM(sou)/COUNT(*) AS `Mitja total`
	FROM jugadors
	GROUP BY equip;
	
#2. Mostra quants jugadors té cada equip en cada posició.
DESCRIBE jugadors;
SELECT equip, lloc, count(*)
	FROM jugadors
	GROUP BY equip, lloc;
	
#3 Gols marcats en total en cada jornada
SELECT jornada, sum(golsc+golsf) AS `gols`
	FROM `partits`
	GROUP BY jornada
	HAVING gols IS NOT NULL;
	
#4 Mitja de gols per partit en cada jornada
DESCRIBE partits;
SELECT count(*)
	FROM partits
	WHERE jornada = 1;
	
SELECT jornada, count(*) AS `partits`, AVG(golsc + golsf) AS `Mitja gols`
	FROM `partits`
	GROUP BY jornada
	HAVING `Mitja gols` IS NOT NULL;
	
#5 Gols marcats pel pitxitxi de cada equip
DESCRIBE golejadors;
SELECT 	equip, max(gols) 
	FROM golejadors
	GROUP BY equip;
	
#6 Gols marcats per cada equip en casa
DESCRIBE partits;
SELECT equipc, sum(golsc)
	FROM partits
	GROUP BY equipc;
	
#7 Gols que ha rebut en total cada equip com a visitant
SELECT equipf AS equip, sum(golsc) AS `goles encajados como vis.`
	FROM partits
	GROUP BY equipf;
	
#8 Quants partits han guanyat cada equip jugant en casa
SELECT equipc AS `equip`, count(*) AS `partits guanyats`
	FROM `partits`
	WHERE golsc > golsf
	GROUP BY equipc;
	
#9 Comprova si hi ha algun nom de jugador repetit. És a dir: cal mostrar el nom del jugador i quantes voltes apareix però només per a aquells jugadors que tinguen el nom repetit.
SELECT nom, count(*)
	FROM jugadors
	GROUP BY nom
	HAVING count(*) > 1;
	
#10 Volem saber la mitja de possessió del baló de cada equip jugant a casa. Ordenat de major a menor possessió. La mitja ha d'eixir sense decimals.
DESCRIBE partits;
SELECT equipc, ROUND(AVG(possessioc))
	FROM partits
	GROUP BY equipc
	ORDER BY 2 DESC;
	
#11 Mitjana de gols marcats en cada jornada i la data de la jornada (un decimal).
DESCRIBE jornades;
SELECT jornades.num AS `Jornada`, jornades.data, ROUND(AVG(partits.golsc + partits.golsf), 1) AS `Mitja gols`
	FROM jornades, `partits`
	WHERE jornades.num = partits.jornada
	GROUP BY jornades.num, jornades.data;
	
#12 Jornades en les quals s'han marcat més de 35 gols.
DESCRIBE partits;
SELECT jornada, SUM(golsc+golsf) AS `gols`
	FROM partits
	GROUP BY jornada
	HAVING SUM(golsc+golsf) > 35;
	
#EXERCICIS AMB UNION
DESCRIBE partits;
#1 Quants partits li queda per jugar a cada equip en casa i quants fora?
SELECT equipc AS `Equip`, count(*) AS `Partits`, "casa" AS `Lloc`
	FROM partits
	WHERE golsc IS NULL
	GROUP BY equipc
	
UNION 

SELECT equipf, count(*), "fora"
	FROM `partits`
	WHERE golsf IS NULL 
	GROUP BY equipf
	
ORDER BY 1;

#2 Quants partits ha guanyat/empatat/perdut cada equip jugant en casa/fora. Així:
SELECT equipc AS `Equip`, count(*) AS `Partits`, "guanyats a casa" AS `Resultat`
	FROM partits
	WHERE golsc > golsf
	GROUP BY equipc

UNION

SELECT equipc, count(*), "empatats a casa"
	FROM partits
	WHERE golsc = golsf
	GROUP BY equipc

UNION
	
SELECT equipc, count(*), "perduts a casa"
	FROM partits
	WHERE golsc < golsf
	GROUP BY equipc
	
ORDER BY 1,3;

#Intentar usar JOIN LEFT
SELECT count(*)
	FROM partits
	WHERE golsc < golsf
	GROUP BY equipc;
	
#3 Quants partits ha guanyat/empatat/perdut cada equip, però sense diferenciar si és a casa o fora (només els totals)

SELECT count(*)
	FROM partits
	WHERE equipc = 'ath' AND golsc = golsf OR equipf = 'ath' AND golsf = golsc;

SELECT equips.codi AS `Equip`, count(*) AS `Partits`, "guanyats" AS `Resultat`
	FROM partits, equips
	WHERE equipc = equips.codi AND golsc > golsf OR equipf = equips.codi AND golsf > golsc
	GROUP BY `Equip`
		
UNION 

SELECT equips.codi, count(*), "perduts"
	FROM partits, equips
	WHERE equipc = equips.codi AND golsc < golsf OR equipf = equips.codi AND golsf < golsc
	GROUP BY equips.codi
	
UNION

SELECT equips.codi, count(*), "empatats"
	FROM partits, equips
	WHERE equipc = equips.codi AND golsc = golsf OR equipf = equips.codi AND golsf = golsc
	GROUP BY equips.codi


ORDER BY `Equip`;

#4 Quants 1, quantes X i quants 2
SELECT count(*), "1" AS `Resultat`
	FROM partits
	WHERE golsc > golsf

UNION 

SELECT count(*), "2"
	FROM partits
	WHERE golsc < golsf

UNION 

SELECT count(*), "x"
	FROM partits
	WHERE golsc = golsf; 

##EXERCISIS MULTITAULA
#1 De cada partit volem mostrar els codis dels equips i el nom de la ciutat on juguen.
DESCRIBE partits;
DESCRIBE equips;
DESCRIBE ciutats;
SELECT CASA.nomllarg AS EC, FORA.nomllarg AS EV, ciutats.nom AS Ciutat
	FROM partits, `equips` CASA, `equips` FORA, ciutats
	WHERE partits.`equipc` = CASA.`codi`
		AND partits.`equipf` = FORA.`codi`
		AND CASA.ciutat = ciutats.codi;

#2 De cada partit que falta per jugar volem mostrar en quina data es disputarà, els noms curts dels equips, els noms de les ciutats respectives i el total d'habitants de les 2 ciutats
DESCRIBE ciutats;
DESCRIBE partits;
DESCRIBE equips;
DESCRIBE jornades;

SELECT count(*)
	FROM partits
	WHERE golsc IS NULL;

SELECT jornades.data, 
EC.`nomcurt` AS EC, EF.`nomcurt` AS EF,
CC.`nom` AS `Ciutat casa`, CC.`habitants`,
CF.`nom` AS `Ciutat fora`, CF.`habitants`
	FROM partits, jornades, 
		equips EC, equips EF, 
		ciutats CC, ciutats CF
	WHERE partits.golsc IS NULL
		AND partits.jornada = jornades.num
		AND partits.`equipc` = EC.`codi`
		AND partits.`equipf` = EF.`codi`
		AND EC.`ciutat` = CC.`codi`
		AND EF.`ciutat` = CF.`codi`;
		
##EJERCICIOS SUBCONSULTAS

#1 Nom del pitxixi

SELECT nom
	FROM jugadors, (
		SELECT dorsal AS dorsal_pixixi, equip AS equip_pixixi
 			FROM golejadors
 			WHERE gols = (
 				SELECT max(gols)
				FROM golejadors) 
		)AS pixixi
	WHERE dorsal = dorsal_pixixi AND equip = equip_pixixi;
	
SELECT nom
	FROM jugadors, golejadors
	WHERE golejadors.dorsal = jugadors.`dorsal`
		AND golejadors.`equip` = jugadors.`equip`
		AND golejadors.gols = 
		(
			SELECT max(gols)
				FROM golejadors
		);
		
#2 Nom del pitxixi i quants gols ha marcarts

SELECT nom, golejadors.gols
	FROM jugadors, golejadors
	WHERE golejadors.dorsal = jugadors.`dorsal`
		AND golejadors.`equip` = jugadors.`equip`
		AND golejadors.gols = 
		(
			SELECT max(gols)
				FROM golejadors
		);

#3 Mostra el nom i sou del jugador millor pagat de tota la lliga
SELECT nom, sou
	FROM jugadors
	WHERE 
		sou = (SELECT max(sou) FROM jugadors);
		
#4 Mostra el nom del jugador millor pagat de cada equip

SELECT nom, jugadors.equip
	FROM jugadors, (
		SELECT max(sou) AS 'sou_max', equip
			FROM jugadors
			GROUP BY equip
	) AS sueldos_maximos
	WHERE jugadors.sou = sou_max
		AND jugadors.equip = sueldos_maximos.equip;
	

#5 Noms dels jugadors dels equips del partit on més gols es marcaren. Mostra també els equips. Ordenat per equip i nom de jugador.

SELECT jugadors.nom, jugadors.equip
	FROM jugadors, partits
	WHERE jugadors.equip IN (partits.`equipc`, partits.`equipf`)
		AND partits.golsc + partits.golsf = ( SELECT max(golsc + golsf)
												FROM partits
											);
											
#6 Jugadors(equip i nom) que encara no han marcat cap gol. Ordenat per equip i nom.
	SELECT j1.nom, j1.equip
		FROM  jugadors j1
		WHERE j1.dorsal NOT IN (
									SELECT dorsal
										FROM golejadors
										WHERE golejadors.equip = j1.equip
										);
										
#7 

	SELECT equips.`nomcurt`, count(*)
		FROM equips, partits
		WHERE (equips.`codi` = partits.`equipc`
			OR equips.`codi` = partits.`equipf`)
			AND possessioc IS NULL
		GROUP BY equips.`nomcurt`;

#8 Equip amb més jugdors i la cuantitat de jugadors

	SELECT jugadors.equip, count(*)
		FROM jugadors
		GROUP BY jugadors.equip
		HAVING count(*) >= ALL (SELECT count(*)
							FROM jugadors
							GROUP BY equip);
							
SELECT jugadors.equip, count(*)
	FROM jugadors, (
						SELECT count(*) AS n_jugadores, equip
						FROM jugadors
						GROUP BY equip) AS tabla
	WHERE jugadors.equip = tabla.equip
	GROUP BY equip
	HAVING count(*) = max(tabla.n_jugadores);
	
#9 Equip amb menys jugadors i la quantitat

SELECT jugadors.equip, count(*)
	FROM jugadors
	GROUP BY jugadors.equip
	HAVING count(*) <= ALL (
						SELECT count(*)
							FROM jugadors
							GROUP BY equip
						);
						
#10 Equip amb més jugadors i equip amb menys jugadors. També ha d'apareixer les quantitats i una parauleta al costat que diga MAX o MIN.

SELECT jugadors.equip, count(*), IF(count(*) >= ALL (
						SELECT count(*)
							FROM jugadors
							GROUP BY equip
						), "MAYOR", "MENOR")
	FROM jugadors
	GROUP BY equip
	HAVING count(*) <= ALL (
						SELECT count(*)
							FROM jugadors
							GROUP BY equip
						)
		OR
		    count(*) >= ALL (
						SELECT count(*)
							FROM jugadors
							GROUP BY equip
						);
						
SELECT jugadors.equip, count(*), "MAYOR" AS `motivo`
	FROM jugadors
	GROUP BY jugadors.equip
	HAVING count(*) >= ALL (
						SELECT count(*)
							FROM jugadors
							GROUP BY equip
						)
	
UNION 

SELECT jugadors.equip, count(*), "MENOR" AS `motivo`
	FROM jugadors
	GROUP BY jugadors.equip
	HAVING count(*) <= ALL (
						SELECT count(*)
							FROM jugadors
							GROUP BY equip
						);

#11 Incrementa 1000 euros a cada jugador que haja guanyat algun partit el seu equip;


SELECT jugadors.`nom`, IF(jugadors.`equip` IN (
												SELECT DISTINCT equips.codi
												FROM partits, equips
												WHERE 	equips.`codi` = partits.`equipc` AND partits.`golsc` > partits.`golsf`
													OR
														equips.`codi` = partits.`equipf` AND partits.`golsf` > partits.`golsc`
													), jugadors.`sou` + 1000, jugadors.`sou`)
	FROM jugadors;

SELECT jugadors.`nom`, jugadors.`sou` + 1000, 'Sí' AS `Equip guanyador`
	FROM jugadors
	WHERE jugadors.`equip` IN (
								SELECT DISTINCT equips.codi
									FROM partits, equips
									WHERE 	equips.`codi` = partits.`equipc` AND partits.`golsc` > partits.`golsf`
										OR
											equips.`codi` = partits.`equipf` AND partits.`golsf` > partits.`golsc`
								)

UNION

SELECT jugadors.`nom`, jugadors.`sou`, 'NO' AS `Equip guanyador`
	FROM jugadors
	WHERE jugadors.`equip` NOT IN (
									SELECT DISTINCT equips.codi
									FROM partits, equips
									WHERE 	equips.`codi` = partits.`equipc` AND partits.`golsc` > partits.`golsf`
										OR
											equips.`codi` = partits.`equipf` AND partits.`golsf` > partits.`golsc`
								);

#12 Increment 1000 euros a cada jugador per cada partit que haja guanyat el seu equip
SELECT jugadors.`nom`, jugadors.sou + 1000 * partidos_ganados.victorias, partidos_ganados.victorias, jugadors.`equip`
	FROM jugadors, ( SELECT e1.codi AS equip, count(*) AS victorias
						FROM equips e1, partits
						WHERE  (
							e1.`codi` = partits.`equipc` AND partits.`golsc` > partits.`golsf`
						OR
							e1.`codi` = partits.`equipf` AND partits.`golsf` > partits.`golsc`)
						GROUP BY e1.codi) AS partidos_ganados
	WHERE jugadors.`equip` = partidos_ganados.`equip`;
	
### Con update (lo que de verdad pedía el ejercicio)
UPDATE jugadors
	SET sou = sou + (
						SELECT count(*)
						FROM partits
						WHERE 
							(equipc = jugadors.`equip` AND golsc > golsf)
							OR
							(equipf = jugadors.`equip` AND golsf > golsc)
					) * 1000;
	

#13 Incrementa 1000 euros a cada porter que ha rebut menys de 20 gols;

SELECT jugadors.nom, sou + 1000, "<20" AS encajados
	FROM jugadors
	WHERE jugadors.`dorsal` IN (
								SELECT porters.`dorsal`
									FROM porters
									WHERE porters.`gols` < 20
								)
								
UNION

SELECT jugadors.nom, sou, ">20"
	FROM jugadors
	WHERE jugadors.`dorsal` IN (
								SELECT porters.`dorsal`
									FROM porters
									WHERE porters.`gols` >= 20
								);		
								
#14 Incrementa 1000 euros a cada jugador per cada gol marcado

SELECT jugadors.nom, jugadors.`dorsal`, jugadors.sou + 1000 * golejadors.`gols` AS sou
	FROM jugadors, golejadors
	WHERE jugadors.`dorsal` = golejadors.`dorsal`
		AND	
		jugadors.`equip` = golejadors.`equip`;
		
SELECT jugadors.nom, jugadors.`dorsal`, jugadors.sou AS base, jugadors.sou + 1000 * golejadors.`gols` AS sou
	FROM jugadors LEFT JOIN  golejadors
		ON  jugadors.`dorsal` = golejadors.`dorsal`
			AND	
			jugadors.`equip` = golejadors.`equip`;
			
#15. Mostra els noms dels jugadors que cobren més que tot un altre equip sencer.

SELECT j1.`nom`, j1.`equip`
	FROM jugadors AS j1
	WHERE j1.`sou` > ANY (
								SELECT max(j2.sou)
									FROM jugadors AS j2
									WHERE j1.`equip` != j2.`equip`
								GROUP BY j2.`equip`
								);

#16. Nom de jugadors que han marcat més gols que un altre equip sencer.

SELECT jugadors.`nom`, j1.`equip`, j1.gols
	FROM jugadors, golejadors AS j1
	WHERE  j1.`dorsal` = jugadors.`dorsal`
		AND
			j1.`equip` = jugadors.`equip`
		AND
			j1.`gols` > ANY (
								SELECT sum(j2.gols)
									FROM golejadors AS j2
									WHERE j1.`equip` != j2.`equip`
								GROUP BY j2.`equip`
								);
								
#17. Nom dels jugadors que han marcat més gols que tot un altre equip sencer. També ha d'apareixer el codi de l'equip del golejador i equip a qui supera.

SELECT j1.`nom`, j1.`equip`, g2.`codi` AS `owned`
	FROM jugadors j1, golejadors AS g1, equips AS g2
	WHERE j1.`dorsal` = g1.`dorsal`
		AND j1.`equip` = g1.`equip`
		AND g1.`gols` > (
							SELECT sum(golejadors.`gols`)
								FROM golejadors
								WHERE g2.`codi` = golejadors.`equip`
									AND g2.`codi` != g1.`equip`
						);
						
#18. Igual que l'exercisi anterior però també ha d'aparéixer els gols del golejador i els gols de l'equip amb qui es compara

SELECT j1.`nom`, j1.`equip`, g1.`gols` AS `gols goleador`, g2.`codi` AS `owned`, sum(own.`gols`)
	FROM jugadors j1, golejadors AS g1, equips AS g2, golejadors AS own
	WHERE j1.`dorsal` = g1.`dorsal`
		AND j1.`equip` = g1.`equip`
		AND g1.`gols` > (
							SELECT sum(golejadors.`gols`)
								FROM golejadors
								WHERE g2.`codi` = golejadors.`equip`
									AND g2.`codi` != g1.`equip`
						)
		AND g2.`codi` = own.`equip`
	GROUP BY 1,2,3,4;
	
#19. Jornades en les cuals se han marcat mes gols que en la jornada anterior
SELECT jornades.`num`, sum(partits.`golsc` + partits.`golsf`)
	FROM jornades, partits
	WHERE jornades.`num` = partits.`jornada`
	GROUP BY jornades.`num`;
	
SELECT p1.`jornada`
	FROM partits AS p1
	GROUP BY p1.`jornada`
	HAVING sum(p1.`golsc` + p1.`golsf`) > (
											SELECT sum(partits.`golsc` + partits.`golsf`)
												FROM partits
											WHERE partits.`jornada` = p1.`jornada` - 1
													);
													
#20. Equip (nom llarg) que en tots els partits (jugats) ha superat el 65% de possessió del baló jugant en casa.

SELECT e1.`nomllarg`
	FROM equips AS e1
	WHERE 65 <= ALL (
						SELECT partits.`possessioc`
							FROM partits
							WHERE partits.`equipc` = e1.`codi`
								AND partits.`possessioc` IS NOT NULL 
						);
						
#21. Equip (nom llarg) que en tots els partits ha superat el 55% de possessió del baló jugant fora.

SELECT nomllarg
	FROM equips
	WHERE codi NOT IN (SELECT equipf
							FROM partits
							WHERE 100 - `possessioc` <= 55
						);
						
#22. Jugador que més cobra en cada equip dins la seua categoria(lloc). Cal mostrar el nom de l'equip, el nom del jugador, el lloc i el sou(expressat en milions d'euros, amb 1 decimal). Ordenat per equip i lloc.

SELECT j1.`nom`, j1.`equip`, j1.`lloc`, j1.`sou`
	FROM jugadors j1
	WHERE j1.`sou` = (SELECT max(sou)
						FROM jugadors
						WHERE jugadors.`equip` = j1.`equip`
							AND jugadors.`lloc` = j1.`lloc`);
							
#23. Equips on els han marcat més de 20 gols a cadascun dels seus porters

SELECT equips.`nomllarg`
	FROM equips
	WHERE equips.`codi` NOT IN (SELECT porters.`equip`
									FROM porters
									WHERE porters.`gols` < 20);
									
#24. Nom curt dels equips que mai han perdut a casa

SELECT equips.`nomcurt`
	FROM equips
	WHERE equips.`codi` NOT IN (SELECT equips.codi
									FROM equips, partits
									WHERE equips.`codi` = partits.`equipc` AND partits.`golsf` > partits.`golsc`);
									
#25. Volem saber la mitja de possessió de cada equip. Primer els de més possessió.

SELECT equips.`nomllarg`, ((SELECT AVG(partits.`possessioc`)
							FROM `partits`
							WHERE partits.`equipc` = equips.`codi`
							) + (SELECT AVG(100 - partits.`possessioc`)
							FROM `partits`
							WHERE partits.`equipf` = equips.`codi`))/2
	FROM equips
	ORDER BY 2 DESC;