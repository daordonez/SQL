#1. Nombre y sueldo en pesetas de los jugadores del Real Madrid
SELECT equip, nom, (sou * 16.386) AS pesetes
FROM jugadors
WHERE equip = "rma";
#2.Dorsal y goles que ha marcado cada jugador, donde los partidos se han jugado el dia sabado
SELECT `dorsal`,`gols`,`penals`,`pp`, (gols+penals+pp) AS total
FROM golejadors
WHERE  partits > 30
ORDER BY total DESC;

SELECT golejadors.*, jugadors.nom
FROM golejadors, jugadors
WHERE golejadors.equip = jugadors.equip AND golejadors.dorsal = jugadors.dorsal;

SELECT equips.`nomcurt`, jugadors.nom, sou
FROM equips, jugadors
WHERE jugadors.equip = equips.codi;

SELECT *, dayname(`data`)
FROM jornades 
WHERE dayname(`data`) = "saturday"
ORDER BY DATA DESC;