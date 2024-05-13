#Musterlösung zu A_03_01_02


#a)
SELECT Vorname,Nachname
FROM Kunde,Abrechnung
WHERE Abrechnung_ID=2 AND Kunde.Kunde_ID=Abrechnung.Kunde_id;

#b)
SELECT Spedition_Name
FROM Produkt,Hersteller,Spedition
WHERE Produkt_Name="solver premium" AND Produkt.Hersteller_ID=Hersteller.Hersteller_ID
                                    AND Hersteller.Spedition_ID=Spedition.Spedition_ID;
									
#c)
SELECT DISTINCT Hersteller_Name
FROM Produkt,Hersteller
WHERE Produkt_ID>2 AND Produkt.Hersteller_ID=Hersteller.Hersteller_ID
ORDER BY Hersteller_Name DESC;

#d)
SELECT DISTINCT Spedition_Name
FROM Produkt,Hersteller,Spedition
WHERE Euro_Preis>=10 AND Euro_Preis<=1000 
      AND Produkt.Hersteller_ID=Hersteller.Hersteller_ID
      AND Hersteller.Spedition_ID=Spedition.Spedition_ID
ORDER BY Spedition_Name;

#e)
SELECT DISTINCT Spedition_Name
FROM Produkt,Hersteller,Spedition,Abrechnung_Produkt
WHERE Euro_Preis>=10 AND Euro_Preis<=1000 
      AND Produkt.Hersteller_ID=Hersteller.Hersteller_ID
      AND Hersteller.Spedition_ID=Spedition.Spedition_ID
      AND Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
ORDER BY Spedition_Name;

#f)
SELECT Produkt_Name,Euro_Preis,Datum
FROM Kunde,Abrechnung,Abrechnung_Produkt,Produkt
WHERE Vorname="Elli" AND Nachname="Rot"
      AND Kunde.Kunde_ID=Abrechnung.Kunde_id
      AND Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
      AND Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
ORDER BY Euro_Preis DESC LIMIT 3;