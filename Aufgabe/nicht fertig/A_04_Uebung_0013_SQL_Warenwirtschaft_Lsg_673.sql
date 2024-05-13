/*
	Lösen Sie folgende Aufgaben auf der Datenbank Warenwirtschaft (WaWi)
*/
use warenwirtschaft;

-- ---------------------------------------------------------------------------
-- Aufgabe 1
-- ---------------------------------------------------------------------------
/*
Alle Artikel in der Warengruppe Geschirr (GE) des Herstellers "Grazer Besteck- und Haushaltswaren GmbH" (1001) wurden im Verkaufspreis um 5% verteuert. 
Formulieren Sie die notwendige Anweisung für die Aktualisierung der Datensätze.
Lassen Sie anschließend eine Liste der veränderten Datensätze anzeigen.
*/

select * from artikel order by gruppe, lief;
select * from artikelgruppen;

select * from artikel 
where gruppe = 'GE' and lief = 1001
order by gruppe, lief;

update artikel set vkpreis = vkpreis * 1.05 where gruppe = 'GE' and lief = 1001;
select * from artikel where gruppe = 'GE' and lief = 1001;

-- ---------------------------------------------------------------------------
-- Aufgabe 2
-- ---------------------------------------------------------------------------
/*
In der Tabelle Abteilungen soll die Personalnummer des jeweiligen Leiters bzw. der Leiterin gespeichert werden. Geben Sie den notwendigen Befehl für die Anpassung der Tabellenstruktur an.
Optional: Geben Sie den nötigen FK an.
*/
select * from personal;
select * from abteilungen;

alter table abteilungen add leiter int;

-- optional (war so nicht gefordert):
-- zusätzlicher FK für die Absicherung der Personalnummer.
alter table abteilungen add foreign key (leiter) references personal (persnr);

alter table abteilungen 	add leiter int,
							add foreign key (leiter) references personal (persnr);

-- ---------------------------------------------------------------------------
-- Aufgabe 3
-- ---------------------------------------------------------------------------
/*
Die Hinweise zu den Kunden sollen nicht mehr in der Kunden-Tabelle gespeichert werden. Schreiben Sie den notwendigen Befehl für das Entfernen der Spalte.
*/

select * from kunden;

alter table kunden drop column hinweis;


-- ---------------------------------------------------------------------------
-- Aufgabe 4
-- ---------------------------------------------------------------------------
/*
Fügen Sie der Tabelle Spalten für versandrelevante Informationen hinzu. Es sollen Länge, Breite, Höhe sowie Masse des Artikels gespeichert werden.
Schreiben Sie die notwendige Anweisung.
*/

select * from artikel;
alter table artikel 	add laenge_in_cm decimal(10,2), 
						add breite_in_cm decimal(10,2), 
                        add hoehe_in_cm decimal(10,2), 
                        add masse_in_g decimal(10,2);

-- ---------------------------------------------------------------------------
-- Aufgabe 5
-- ---------------------------------------------------------------------------
/*
Lassen Sie sich alle Informationen zu den Artikeln anzeigen, die nicht in Bestellpositionen erfasst wurden.
*/
select * from artikel;
select * from bestellpositionen;

select artikel from bestellpositionen order by artikel;

select * from artikel
where artnr not IN (select artikel from bestellpositionen);

-- ---------------------------------------------------------------------------
-- Aufgabe 6
-- ---------------------------------------------------------------------------
/*
Lassen Sie sich alle Artikel aus der Tabelle löschen, die nicht in Bestellpositionen erfasst wurden und vom Lieferanten 1020 sind.
*/

-- funktioniert so nicht
select * from artikel
where artnr IN (select * from artikel where artnr not IN (select artikel from bestellpositionen)) AND lief = 1020;

-- ... aber so
-- Variante I (nicht korrelierende Subselects)
select * from artikel
where artnr IN (select artnr from artikel where artnr not IN (select artikel from bestellpositionen)) AND lief = 1020;

delete from artikel
where artnr IN (select artnr from artikel where artnr not IN (select artikel from bestellpositionen)) AND lief = 1020;


-- Variante II (korrelierende Subselects)
select * 
from artikel
where exists (select * from bestellpositionen where artikel.artnr = bestellpositionen.artikel);

select * 
from artikel
where not exists (select * from bestellpositionen where artikel.artnr = bestellpositionen.artikel) AND lief = 1020
order by lief;

delete from artikel
where not exists (select * from bestellpositionen where artikel.artnr = bestellpositionen.artikel) AND lief = 1020;

