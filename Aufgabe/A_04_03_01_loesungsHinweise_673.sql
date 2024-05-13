
use geld_her;

-- a)	Erstellen Sie bitte zunächst einen VIEW (namens „View_1“), der für alle Produkte den Produktnamen, den Preis und den zugehörigen Speditionsnamen ermittelt. Nutzen Sie diesen VIEW bitte anschließend, um die folgende Abfrage zu formulieren:
-- Ausgabe von Produktname und zugehörigem Speditionsnamen des Produkts mit dem größten Preis.

select
	p.Produkt_Name,
    p.Euro_Preis,
    s.Spedition_Name
from produkt p
		join hersteller h on p.Hersteller_ID = h.Hersteller_ID
        join spedition s on s.Spedition_ID = h.Spedition_ID;

create view view_1 as
select
	p.Produkt_Name,
    p.Euro_Preis,
    s.Spedition_Name
from produkt p
		join hersteller h on p.Hersteller_ID = h.Hersteller_ID
        join spedition s on s.Spedition_ID = h.Spedition_ID;

select
	produkt_name,
    spedition_name
from view_1
where euro_preis = (select max(euro_preis) from view_1);
-- BEACHTE: in der Abfrage und in der Unterabfrage wurden nur jeweils der view verwendet


select
	produkt_name,
    spedition_name,
    max(euro_preis)
from view_1
where euro_preis = (select max(euro_preis) from view_1);
-- diese Anweisung wird von MySQL nicht abgewiesen ---> sie liefert aber ein nicht korrektes Ergebnis
-- das Ergebnis von Aggregatfunktionen und die Inhalte von einzelnen Spalten dürfen NICHT in einer EINZIGEN
-- SQL-Anweisung ausgegeben werden

select
	produkt_name,
    spedition_name,
    max(euro_preis)
from view_1
group by max(euro_preis);
-- das funktioniert nicht ---> für das Gruppieren können nur Spaltennamen verwendet werden (und nicht das Ergebnis
-- einer Aggregatfunktion)


-- b)	Erstellen Sie bitte zunächst einen VIEW (namens „View_2“), der für alle Produkte den Produktnamen, den Preis und zugehörigen Herstellernamen ermittelt. Nutzen Sie diesen VIEW bitte anschließend, um die folgende Abfrage zu formulieren:
-- Ausgabe der drei teuersten Produkte (Produktname, Preis und zugehöriger Herstellername)

select
	p.Produkt_Name,
    p.Euro_Preis,
    h.Hersteller_Name
from produkt p join hersteller h on p.Hersteller_ID = h.Hersteller_ID;

create view view_2 as
select
	p.Produkt_Name,
    p.Euro_Preis,
    h.Hersteller_Name
from produkt p join hersteller h on p.Hersteller_ID = h.Hersteller_ID;

select *
from view_2;

select *
from view_2
order by euro_preis desc
limit 3;
-- das ist ein Lösungsvorschlag, der nur für die gegebenen Daten eindeutig funktioniert. Diese Lösung ist nicht
-- allgemeingültig.


-- c)	Erstellen Sie bitte den neuen User „Admin“ (Passwort: „1234abcd“). Er soll für alle Datenbanken und für alle Tabellen auf dem MySQL-Server das Recht haben, Abfragen zu stellen, sofern er sich vom „localhost“ anmeldet. 
-- Testen Sie dies, indem Sie sich anschließend als Admin anmelden und sich die gesamte Tabelle „Kunde“ anzeigen lassen.

create user 'admin_neu'@'localhost' identified by '1234abcd';

grant select on *.* to 'admin_neu'@'localhost';



