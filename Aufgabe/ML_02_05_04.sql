#Musterlösung zu A_02_05_04


#a)
SELECT Spedition_ID FROM Hersteller
WHERE NOT(Hersteller_Name="Trümmermann" OR Hersteller_ID>100)
ORDER BY Spedition_ID LIMIT 3;

#b)
SELECT Produkt_Name,Hersteller_ID FROM Produkt
WHERE Euro_Preis<1000 AND NOT Hersteller_ID=1
ORDER BY Hersteller_ID,Produkt_Name LIMIT 2,10;

#c)
SELECT * FROM Abrechnung
WHERE Datum>="2021-11-01" AND Datum<="2021-11-30"
ORDER BY Kunde_ID DESC, Datum LIMIT 10;

#d)
SELECT Datum FROM Abrechnung
WHERE Kunde_ID=3
ORDER BY Datum LIMIT 2,3;

#e)
SELECT DISTINCT Abrechnung_ID FROM Abrechnung_Produkt
WHERE Produkt_ID=5
ORDER BY Abrechnung_ID;