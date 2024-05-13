#Musterlösung zu A_03_01_03


#a)
SELECT DISTINCT Spedition_Name
FROM Kunde,Abrechnung,Abrechnung_Produkt,Produkt,Hersteller,Spedition
WHERE Vorname="Witali" AND Nachname="Myrnow"
      AND Datum>="2021-01-01" AND Datum<="2021-12-31"
      AND Kunde.Kunde_ID=Abrechnung.Kunde_id
      AND Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
      AND Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
      AND Produkt.Hersteller_ID=Hersteller.Hersteller_ID
      AND Hersteller.Spedition_ID=Spedition.Spedition_ID
ORDER BY Spedition_Name LIMIT 1,2;

#b)
SELECT DISTINCT Email
FROM Kunde,Abrechnung,Abrechnung_Produkt
WHERE Abrechnung.Abrechnung_ID>=5 AND Abrechnung.Abrechnung_ID<=10
      AND Kunde.Kunde_ID=Abrechnung.Kunde_id
      AND Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
ORDER BY Email DESC;

#c)
SELECT DISTINCT Hersteller_Name
FROM Hersteller,Produkt,Abrechnung_Produkt
WHERE Abrechnung_ID=3 AND Produkt.Produkt_id>2
      AND Hersteller.Hersteller_ID=Produkt.Hersteller_ID
      AND Produkt.Produkt_id=Abrechnung_Produkt.Produkt_ID
ORDER BY Hersteller_Name LIMIT 10; 

#d)
SELECT Datum
FROM Abrechnung,Abrechnung_Produkt,Produkt
WHERE (Produkt_Name="tool 2.0" OR Produkt_Name="tool 3.1")
       AND Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
       AND Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
ORDER BY Datum DESC LIMIT 3,5;

#e)
SELECT Datum
FROM Kunde,Abrechnung,Abrechnung_Produkt,Produkt
WHERE  Produkt_Name="tool 2.0" AND Vorname="Eva" AND Nachname="Hahn"
       AND Kunde.Kunde_ID=Abrechnung.Kunde_id
       AND Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
       AND Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
ORDER BY Datum DESC LIMIT 1;

#f)
SELECT Produkt_Name, Euro_Preis
FROM Abrechnung,Abrechnung_Produkt,Produkt
WHERE Datum="2021-11-05"
      AND Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
      AND Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
ORDER BY Euro_Preis DESC LIMIT 1;