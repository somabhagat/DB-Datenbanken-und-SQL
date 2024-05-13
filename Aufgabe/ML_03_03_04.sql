# Musterlösung zu A_03_03_04


#a)
SELECT AVG(Euro_Preis)
FROM Kunde,Abrechnung,Abrechnung_Produkt,Produkt
WHERE Kunde.Kunde_ID=Abrechnung.Kunde_id
      AND Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
      AND Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
      AND Vorname="Elli" AND Nachname="Rot"
      AND Datum>="2021-05-01" AND Datum<="2021-05-31";
	  
#b)
SELECT SUM(Euro_Preis)
FROM Abrechnung_Produkt,Produkt
WHERE Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
      AND Produkt_Name="tool 2.0";
	  
#c)
SELECT Produkt_Name,SUM(Euro_Preis)
FROM Abrechnung_Produkt,Produkt
WHERE Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
GROUP BY Produkt_Name
ORDER BY SUM(Euro_Preis) DESC;

#d)
SELECT Produkt_Name,SUM(Euro_Preis)
FROM Abrechnung_Produkt,Produkt
WHERE Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
GROUP BY Produkt_Name HAVING SUM(Euro_Preis)>100
ORDER BY SUM(Euro_Preis) DESC;

#e)
SELECT Vorname,Nachname,COUNT(DISTINCT Spedition.Spedition_ID)
FROM Kunde,Abrechnung,Abrechnung_Produkt,Produkt,Hersteller,Spedition
WHERE Kunde.Kunde_ID=Abrechnung.Kunde_id
      AND Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
      AND Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
      AND Produkt.Hersteller_ID=Hersteller.Hersteller_ID
      AND Hersteller.Spedition_ID=Spedition.Spedition_ID
GROUP BY Vorname,Nachname HAVING COUNT(DISTINCT Spedition.Spedition_ID)<4 
                 # Auch hier ist "mindestens 1" im Moment für uns unumgänglich und muss daher nicht explizit vermerkt werden
ORDER BY COUNT(DISTINCT Spedition.Spedition_ID) DESC;

#f)
SELECT Spedition_Name,Vorname,Nachname,SUM(Euro_Preis)
FROM Kunde,Abrechnung,Abrechnung_Produkt,Produkt,Hersteller,Spedition
WHERE Kunde.Kunde_ID=Abrechnung.Kunde_id
      AND Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
      AND Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
      AND Produkt.Hersteller_ID=Hersteller.Hersteller_ID
      AND Hersteller.Spedition_ID=Spedition.Spedition_ID
GROUP BY Spedition_Name,Vorname,Nachname HAVING AVG(Euro_Preis)>25 
ORDER BY SUM(Euro_Preis) DESC,Spedition_Name,Nachname,Vorname;