# Musterlösungen zu A_04_02_01


#a)
UPDATE Spedition SET Spedition_Name=CONCAT(Spedition_Name," GmbH")
WHERE NOT RIGHT(Spedition_Name,4)="GmbH"
  AND NOT RIGHT(Spedition_Name,2)="AG";
  
#b)
SELECT Hersteller_Name
FROM hersteller
ORDER BY LENGTH(Hersteller_Name) DESC LIMIT 3;

#c)
SELECT Email
FROM Kunde NATURAL JOIN Abrechnung
           NATURAL JOIN Abrechnung_Produkt
           NATURAL JOIN Produkt
WHERE Produkt_Name="solver premium"
  AND Abrechnung_ID>1 AND Abrechnung_ID<9;
  
#d)

	INSERT INTO Abrechnung(Abrechnung_ID,Kunde_ID,Datum)
    VALUES (11,3,"2022-05-02");
    INSERT INTO Abrechnung_Produkt(Abrechnung_ID,Produkt_ID)
    VALUES (11,3),
           (11,3),
           (11,4);
