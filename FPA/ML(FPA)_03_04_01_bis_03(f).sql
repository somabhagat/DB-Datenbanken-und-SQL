# Musterlösung zu FPA_03_04_01_bis_03 (f)


#(1)
SELECT Vorname,Nachname, COUNT(Zitat_ID)
FROM Philosoph LEFT JOIN Zitat ON Philosoph.Philosoph_ID=Zitat.Philosoph_ID 
GROUP BY Vorname,Nachname
ORDER BY COUNT(Zitat_ID) DESC,Nachname,Vorname;

#(2)
SELECT Text,Nachname,Titel AS "Buchtitel"
FROM Philosoph RIGHT JOIN Zitat ON Philosoph.Philosoph_ID=Zitat.Philosoph_ID
     LEFT JOIN buch on zitat.Buch_ID=buch.Buch_ID;
	 
#(3)
INSERT INTO Buch(Titel) VALUES ("Testbuch");

#(4)a
SELECT Titel, COUNT(Zitat_ID)
FROM Buch INNER JOIN Zitat ON Buch.Buch_ID=Zitat.Buch_ID
GROUP BY Titel;

#(4)b
SELECT Titel, COUNT(Zitat_ID)
FROM Buch LEFT JOIN Zitat ON Buch.Buch_ID=Zitat.Buch_ID
GROUP BY Titel HAVING COUNT(Zitat_ID)>=1;