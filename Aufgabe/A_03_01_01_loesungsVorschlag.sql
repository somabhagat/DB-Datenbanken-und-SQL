-- Lösungsvorschlag A_03_01_01.docx

use geld_her;

/*
a)	Für jede Abrechnung soll deren Datum, Kunden-ID und Nachnamen des Kunden, der diese Abrechnung einreichte, ausgegeben werden. Ausgabe nach Datum abfallend sortiert, auf 10 Datensätze begrenzt.
*/

select
	Datum,
    abrechnung.Kunde_id,
    Nachname
from abrechnung inner join kunde on abrechnung.Kunde_id = kunde.Kunde_ID
order by datum desc
limit 10;

/*
b)	Für alle Produkte soll der Produktname, Preis und Herstellername ausgegeben werden, allerdings nur, wenn das Produkt weniger als 1000 Euro kostet. Ausgabe alphabetisch sortiert (erstes Kriterium Herstellername, 2. Kriterium Produktname).
*/
select
	Produkt_Name,
    Euro_Preis,
    Hersteller_Name
from produkt inner join hersteller on produkt.Hersteller_ID = hersteller.Hersteller_ID
where Euro_Preis < 1000
order by Hersteller_Name, Produkt_Name;

/*
c)	Von allen Kunden sollen Vor- und Nachname ausgegeben werden, sofern der jeweilige Kunde mindestens 1-mal das Produkt „tool 2.0“ kaufte. Ausgabe alphabetisch sortiert nach (1.) Nachname und (2.) Vorname. Ausgabe-Dubletten sollen vermieden werden.
*/
select distinct
	Vorname,
    Nachname
from kunde 
	inner join abrechnung on kunde.Kunde_ID = abrechnung.Kunde_id
    inner join abrechnung_produkt on abrechnung_produkt.Abrechnung_ID = abrechnung.Abrechnung_ID
    inner join produkt on produkt.Produkt_id = abrechnung_produkt.Produkt_ID
where Produkt_Name = 'tool 2.0'
order by Nachname, Vorname;

/*
d)	Name aller Produkte, die am 16. Oktober 2021 gekauft wurden. Ausgabe alphabetisch sortiert, Vermeidung von Dubletten.  Die ersten 2 Treffer sollen jedoch übersprungen, und nur die 3 folgenden ausgegeben werden. 
*/
select distinct
	Produkt_Name
from abrechnung
	inner join abrechnung_produkt on abrechnung.Abrechnung_ID = abrechnung_produkt.Abrechnung_ID
    inner join produkt on abrechnung_produkt.Produkt_ID = produkt.Produkt_id
where Datum = '2021-10-16'
order by Produkt_Name
limit 2,3;

/*
e)	Ausgabe aller Kalenderdaten, an denen die Spedition „Speedvan GmbH“ mindestens 1 Produkt der Firma „Geld_her“ transportierte. Erneut sollen Dubletten vermieden werden. Ausgabe chronologisch sortiert. Ausgabe auf 100 Datensätze begrenzt.
*/
select distinct
	Datum
from abrechnung
	inner join abrechnung_produkt on abrechnung.Abrechnung_ID = abrechnung_produkt.Abrechnung_ID
    inner join produkt on abrechnung_produkt.Produkt_ID = produkt.Produkt_id
    inner join hersteller on hersteller.Hersteller_ID = produkt.Hersteller_ID
    inner join spedition on hersteller.Spedition_ID = spedition.Spedition_ID
where Spedition_Name = 'Speedvan GmbH'
order by Datum
limit 100;