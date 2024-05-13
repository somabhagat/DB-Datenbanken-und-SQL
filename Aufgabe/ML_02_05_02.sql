#Musterlösung zu A_02_05_02


#a)
SELECT * FROM Produkt;

#b)
SELECT * FROM Abrechnung_Produkt
WHERE Abrechnung_ID=1 OR Abrechnung_ID=4;

#c)
SELECT * FROM Abrechnung
WHERE Kunde_ID=1 OR Kunde_ID=2 OR Kunde_ID=3
ORDER BY Datum DESC;

#d)
SELECT Produkt_Name,Euro_Preis FROM Produkt
WHERE Hersteller_ID=1 OR Hersteller_ID=2
ORDER BY Produkt_Name;

#e)
SELECT Kunde_ID,Datum FROM Abrechnung 
ORDER BY Kunde_ID,Datum DESC;

#f)
SELECT Vorname,Nachname FROM Kunde
WHERE NOT Vorname="Peter" AND NOT Vorname="Pietro"
ORDER BY Kunde_ID DESC LIMIT 2,3;

#g)
SELECT DISTINCT Hersteller_ID FROM Produkt
WHERE Euro_Preis>30
ORDER BY Hersteller_ID;
