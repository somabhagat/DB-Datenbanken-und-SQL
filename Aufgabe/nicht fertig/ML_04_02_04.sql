# Musterlösung zu A_04_02_04


#a(1)
SELECT RIGHT(LEFT(Vorname,6),3) FROM Kunde;
# BEMERKUNG: Funktioniert nur bei ausreichend langen Texten, da stets die letzten 3 Zeichen von LEFT(Vorname,6) ausgegeben werden
#            ... und also auch, wenn LEFT(Vorname,6) gar nicht aus 6 Zeichen besteht.

#a(2)
SELECT RIGHT(LEFT(Vorname,6),LENGTH(LEFT(Vorname,6))-3) FROM Kunde;
# BEMERKUNG: Funktioniert stets, da die Länge von LEFT(Vorname,6) berücksichtigt wird.


#b)
SELECT 
    mitarbeiter.mitarbeiter_bezeichnung,
    fahrzeug.fahrzeug_bezeichnung,
    parkplatz.parkplatz_bezeichnung
FROM 
	mitarbeiter NATURAL LEFT JOIN fahrzeug
	NATURAL LEFT JOIN parkplatz 
    
UNION

SELECT 
    mitarbeiter.mitarbeiter_bezeichnung,
    fahrzeug.fahrzeug_bezeichnung,
    parkplatz.parkplatz_bezeichnung
FROM 
	mitarbeiter NATURAL RIGHT JOIN fahrzeug
	NATURAL RIGHT JOIN parkplatz;
	

#c)

	DELETE FROM Abrechnung_Produkt WHERE Abrechnung_ID=5;
    DELETE FROM Abrechnung WHERE Abrechnung_ID=5;
