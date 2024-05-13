# Musterlösung zu A_03_03_03


#a)
SELECT COUNT(Abrechnung_ID)
FROM Kunde,Abrechnung
WHERE Kunde.Kunde_ID=Abrechnung.Kunde_id
      AND Datum>="2021-01-01" AND Datum<="2021-12-31"
      AND Vorname="Witali" AND Nachname="Myrnow";
	  
#b)
SELECT SUM(Euro_Preis)
FROM Abrechnung,Abrechnung_Produkt,Produkt
WHERE Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
      AND Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id 
      AND Datum>="2021-11-01" AND Datum<="2021-11-30"
      AND NOT Kunde_ID=2;
	  
#c)
SELECT COUNT(Produkt.Produkt_ID)
FROM Kunde,Abrechnung,Abrechnung_Produkt,Produkt,Hersteller,Spedition
WHERE Kunde.Kunde_ID=Abrechnung.Kunde_id
      AND Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
      AND Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
      AND Produkt.Hersteller_ID=Hersteller.Hersteller_ID
      AND Hersteller.Spedition_ID=Spedition.Spedition_ID
      AND Spedition_Name="RocketLogistic AG" 
      AND Vorname="Eva" AND Nachname="Hahn";

#d)
SELECT Vorname,Nachname,COUNT(Produkt.Produkt_ID)
FROM Kunde,Abrechnung,Abrechnung_Produkt,Produkt
WHERE Kunde.Kunde_ID=Abrechnung.Kunde_id
      AND Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
      AND Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
      AND Datum>="2021-07-01" AND Datum<="2021-12-31"
      AND Euro_Preis<80
GROUP BY Vorname,Nachname
ORDER BY COUNT(Produkt.Produkt_ID) DESC;

#e)
SELECT Hersteller_Name,MIN(Euro_Preis),MAX(Euro_preis)
FROM Produkt,Hersteller
WHERE Produkt.Hersteller_ID=Hersteller.Hersteller_ID
GROUP BY Hersteller_Name
HAVING AVG(Euro_Preis)<100
ORDER BY COUNT(Produkt.Produkt_ID) DESC LIMIT 3;

#f)
SELECT Produkt_Name, COUNT(DISTINCT Kunde_ID)
FROM Abrechnung,Abrechnung_Produkt,Produkt
WHERE Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
      AND Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
GROUP BY Produkt_Name
ORDER BY COUNT(DISTINCT Kunde_ID) DESC;