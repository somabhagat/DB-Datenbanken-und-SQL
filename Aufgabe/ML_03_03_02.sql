# Musterlösung zu A_03_03_02


#a)
SELECT COUNT(Kunde_ID) FROM Kunde;

#b)
SELECT MAX(Datum) FROM Abrechnung;

#c)
SELECT COUNT(DISTINCT Produkt_ID) FROM Abrechnung_Produkt;

#d)
SELECT MIN(Euro_preis), MAX(Euro_Preis) FROM Produkt
WHERE Euro_Preis>=20 AND Euro_Preis<=60;

#e)
SELECT Spedition_Name, COUNT(Abrechnung_Produkt.Produkt_ID)
FROM Abrechnung_Produkt,Produkt,Hersteller,Spedition
WHERE Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
      AND Produkt.Hersteller_ID=Hersteller.Hersteller_ID
      AND Hersteller.Spedition_ID=Spedition.Spedition_ID
GROUP BY Spedition_Name
ORDER BY COUNT(Abrechnung_Produkt.Produkt_ID) DESC;

#f)
SELECT Abrechnung_ID,MAX(Euro_Preis)
FROM Abrechnung_Produkt,Produkt
WHERE Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
GROUP BY Abrechnung_ID HAVING MAX(Euro_Preis)>=30
ORDER BY MAX(Euro_Preis) DESC, Abrechnung_ID;