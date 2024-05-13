
-- Systemfunktionen

use versicherung;

-- ---------------------------------------------------------------------------------------------
-- Funktionen auf Zeichenketten bzw. Strings
-- ---------------------------------------------------------------------------------------------

-- Verbinden von Zeichenketten
select CONCAT('Das', ' ', 'ist', ' ', 'eine', ' ', 'Zeichenkette.');

select * from mitarbeiter;

select
	concat(vorname, ' ', name),
    concat(vorname, ' ', name) 'Mitarbeitername'
from mitarbeiter;

select
    concat(abteilung_id, ' ',  vorname, ' ', name) 'Mitarbeitername'
from mitarbeiter;
-- abteilung_id wurde automatisch = implizit in Zeichenkette konvertiert und dann zusammengefügt ...

select
    concat(abteilung_id, ' ',  vorname, ' ', name, ' ', geburtsdatum) 'Mitarbeitername'
from mitarbeiter;

select 1+1;
select concat('1', '+', '1');
select concat(1+1);
select concat(1+1)+1;

-- ---------------------------------------------------------------
-- Ermitteln der Länge einer Zeichenkette
select
	name,
    char_length(name) 'Länge des Namens',
    vorname,
    char_length(vorname) 'Länge des Vornamens',
    char_length(name) + char_length(vorname) 'Gesamtlänge des Mitarbeiternamens'
from mitarbeiter;

-- ---------------------------------------------------------------
-- Ersetzen von Strings durch andere Strings
select REPLACE('Jurassic Park Hotel', 'Park', 'World');
select REPLACE('Jurassic Park Hotel', 'park', 'World');
-- bei MySQL werden in DIESER Funktion Groß- und Kleinschreibung berücksichtigt (produkt-/ herstellerabhängig)

select
	vorname,
    name,
    telefon,
    replace(telefon, '0231/', '03441/') 'Telefon mit neuer Vorwahl'
from mitarbeiter;
-- die Telefonnummer mit neuer Vorwahl wird NUR angezeigt, der Tabelleninhalt wird NIChT geändert

select replace('Jurassic Park', 'assi', '');

-- ---------------------------------------------------------------
-- Ermitteln eines Teilstrings aus einem gegebenen String
select SUBSTRING('Jurassic Park', 3, 6);
select SUBSTRING('Jurassic Park', 1, 4);





