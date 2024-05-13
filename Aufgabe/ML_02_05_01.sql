# Musterlösung zu A_02_05_01


#a)
SELECT * FROM Spedition;


#b)
SELECT * FROM Hersteller ORDER BY Hersteller_Name;


#c)
SELECT * FROM Produkt 
WHERE Euro_Preis>20 AND Euro_Preis<50
ORDER BY Produkt_Name ASC,Euro_Preis ASC;

# Die Sortierrichtung ASC kann als Default-Einstellung auch weggelassen werden.
# Die obige Lösung macht aber deutlich, dass die Sortierrichtung PRO Sortierkriterium gewählt werden kann

# BEMERKUNGEN:
#      1.) Da es in der Datenbank geld_her keine 2 Produkte gibt, die den selben Namen haben, "verpufft" das 2. Sortierkriterium
#      2.) Falls man zuerst bezüglich des Preises sortieren möchte (und nur bei Preis-Gleichheit bzgl. des Namens) so muss das erste
#          Sorierkriterium der Preis sein: ... ORDR BY Europreis ..., Produkt_NAme ...


#d)
SELECT 
	Kunde_ID,
    Datum
FROM Abrechnung
WHERE Datum>"2021-05-31" AND Datum<"2022-06-01";


#e)
SELECT * FROM Kunde
ORDER BY Kunde_ID DESC
LIMIT 2,4;


#f)
SELECT DISTINCT Kunde_ID FROM Abrechnung
ORDER BY Kunde_ID;
