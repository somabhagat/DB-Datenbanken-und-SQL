#Musterlösung zu A_03_01_04


#a)
SELECT Produkt_Name 
FROM Abrechnung,Abrechnung_Produkt,Produkt
WHERE Datum>="2021-11-01" AND Datum<="2021-11-30"
      AND Euro_Preis>=10 AND Euro_Preis<=30
      AND Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
      AND Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
ORDER BY Produkt_Name LIMIT 2,5;

#b)
SELECT DISTINCT Datum
FROM Abrechnung,Abrechnung_Produkt,Produkt,Hersteller,Spedition
WHERE (Euro_Preis>20 OR NOT Hersteller_Name="UltraBug" OR NOT Spedition_Name="Ganzal Lein")
	  AND Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
      AND Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
      AND Produkt.Hersteller_ID=Hersteller.Hersteller_ID
      AND Hersteller.Spedition_ID=Spedition.Spedition_ID 
ORDER BY Datum;

#c)
SELECT DISTINCT Email
FROM Kunde,Abrechnung,Abrechnung_Produkt
WHERE Abrechnung.Abrechnung_ID>1 AND NOT Produkt_ID=2 AND NOT Produkt_ID=3
      AND Kunde.Kunde_ID=abrechnung.Kunde_id
      AND Abrechnung.Abrechnung_ID=Abrechnung_produkt.Abrechnung_ID
ORDER BY Email;

#d)
SELECT Produkt_Name,Euro_Preis
FROM Kunde,Abrechnung,Abrechnung_Produkt,Produkt,Hersteller
WHERE Vorname="Vera" AND Nachname="Deise" AND Datum="2021-10-11" AND NOT Hersteller_Name="Ladenhut AG"
      AND Kunde.Kunde_ID=Abrechnung.Kunde_id
      AND Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
      AND Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
      AND Produkt.Hersteller_ID=Hersteller.Hersteller_ID
ORDER BY Euro_Preis DESC LIMIT 3;

#e)
SELECT DISTINCT Hersteller_Name,Spedition_Name
FROM Kunde,Abrechnung,Abrechnung_Produkt,Produkt,Hersteller,Spedition
WHERE Vorname="Rita" AND Nachname="Myrnow" AND Datum="2021-11-03" AND Euro_Preis<50
      AND kunde.Kunde_ID=abrechnung.Kunde_id
      AND Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
      AND Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
      AND Produkt.Hersteller_ID=Hersteller.Hersteller_ID
      AND Hersteller.Spedition_ID=Spedition.Spedition_ID 
ORDER BY Hersteller_Name LIMIT 10;