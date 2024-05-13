# Musterlösung zu A_03_02_02

use geld_her_v5;

#a)
select * from kunde;
select * from abrechnung;

SELECT 
	Abrechnung_ID,Datum,Vorname,Nachname
FROM Kunde 
	LEFT JOIN Abrechnung ON Kunde.Kunde_ID=Abrechnung.Kunde_id;

SELECT 
	Abrechnung_ID,Datum,Vorname,Nachname
FROM Abrechnung 
	right JOIN Kunde ON Kunde.Kunde_ID=Abrechnung.Kunde_id;

#b)
select * from produkt;					-- diese Tabelle wird für die Aufgabe NICHT benötigt
select * from abrechnung_produkt;
select * from abrechnung;

SELECT Abrechnung.Abrechnung_ID,Produkt_ID
FROM Abrechnung 
	LEFT JOIN Abrechnung_Produkt ON Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID;

-- weitere Variante mit RIGHT JOIN möglich

#c)
select * from abrechnung_produkt;
select * from produkt;

SELECT Abrechnung_Produkt.Abrechnung_ID,Produkt.Produkt_ID
FROM Abrechnung_Produkt 
	RIGHT JOIN Produkt ON Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id;

#d)
select * from hersteller;
select * from produkt;

SELECT *					-- bedeutet nur, dass ALLE Spalten der beteiligten Tabellen ausgegeben werden
FROM Produkt 
	RIGHT JOIN Hersteller ON Produkt.Hersteller_ID=Hersteller.Hersteller_ID;

SELECT Produkt_Name,Hersteller_Name
FROM Produkt 
	RIGHT JOIN Hersteller ON Produkt.Hersteller_ID=Hersteller.Hersteller_ID;

#e)
SELECT Hersteller_Name,Spedition_Name
FROM Hersteller 
	RIGHT JOIN Spedition ON Hersteller.Spedition_ID=Spedition.Spedition_ID;



