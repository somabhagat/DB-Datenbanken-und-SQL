# Musterlösung zu A_04_02_03


#a)
SELECT CONCAT("Der Rechnungsbetrag der bisher letzten Bestellung von ",Vorname," ",Nachname," betrug: ", SUM(Euro_Preis)," €.")
FROM Kunde NATURAL JOIN Abrechnung
     NATURAL JOIN Abrechnung_Produkt
     NATURAL JOIN Produkt
WHERE Kunde_ID=3 AND Abrechnung_ID=(SELECT MAX(Abrechnung_ID) FROM Abrechnung WHERE Kunde_ID=3);

#b)
SELECT CONCAT("Der Preis von ",Produkt_Name," beträgt (gerundet auf ganze Euro) : ",ROUND(Euro_Preis,0)) 
FROM Produkt
ORDER BY ROUND(Euro_Preis,0) DESC LIMIT 3;

#c(1)
SELECT DISTINCT Datum 
FROM Abrechnung NATURAL JOIN Abrechnung_Produkt
     NATURAL JOIN Produkt
     NATURAL JOIN Hersteller
WHERE Hersteller_Name="Contrabit";

#c(2)
SELECT Hersteller_Name, COUNT(Produkt_ID)
FROM Produkt NATURAL RIGHT JOIN Hersteller
GROUP BY Hersteller_Name;

#d(1)

	ALTER TABLE Kunde ADD Hersteller_ID INT(11); # NOT NULL wäre falsch, da nicht jeder Kunde bei einem Hersteller angestellt sein muss
    ALTER TABLE Kunde ADD FOREIGN KEY(Hersteller_ID) REFERENCES Hersteller(Hersteller_ID);


#d(2)

	ALTER TABLE Hersteller DROP FOREIGN KEY Hersteller_ibfk_1;
    ALTER TABLE Hersteller DROP Spedition_ID;
