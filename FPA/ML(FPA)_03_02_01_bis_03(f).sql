# Musterlösung zu FPA_03_02_01_bis_03 (f)


#(1)
SELECT Frau_Vorname,
       Frau_Nachname,
       Mann_Vorname,
       Mann_Nachname,
       Beginn,
       Ende
FROM Frau RIGHT JOIN Ehe ON Frau.Frau_ID=Ehe.Frau_ID
     LEFT JOIN Mann ON Ehe.Mann_ID=Mann.Mann_ID
ORDER BY Beginn;
	
	
#(2)
SELECT Ehe_ID,
       Beginn,
       Ende
FROM Ehe INNER JOIN Mann ON Ehe.Mann_ID=Mann.Mann_ID AND Ende IS NULL
WHERE Mann_Vorname="Anton" AND Mann_Nachname="Alster";

#BEMERKUNG: Die Ausgabe zeigt, dass Anton Alster 2 Ehen zugeordnet werden kann, die beide noch nicht geschieden wurden.


#(3)
SELECT DISTINCT Mann_Vorname,Mann_Nachname
FROM Ehe INNER JOIN Mann ON Ehe.Mann_ID=Mann.Mann_ID
WHERE Ende IS NOT NULL
ORDER BY Mann_Nachname DESC LIMIT 3;


#(4)
SELECT Frau_Vorname,
       Frau_Nachname,
       Mann_Vorname,
       Mann_Nachname,
       Beginn
FROM Frau RIGHT JOIN Ehe ON Frau.Frau_ID=Ehe.Frau_ID
     LEFT JOIN Mann ON Ehe.Mann_ID=Mann.Mann_ID
WHERE Ende IS NULL;


#(5)
SELECT Frau_Vorname,
       Frau_Nachname,
       Mann_Vorname,
       Mann_Nachname
FROM Frau RIGHT JOIN Ehe ON Frau.Frau_ID=Ehe.Frau_ID
     RIGHT JOIN Mann ON Ehe.Mann_ID=Mann.Mann_ID AND Ende IS NULL;
