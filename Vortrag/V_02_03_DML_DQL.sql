-- create database geld_her_v02;
use geld_her_v02;

-- Einfügen eines Datensatzes in die Tabelle kunde
insert into kunde(vorname, nachname, email) values ("Peter", "Müller", "abc@xyz");
insert into kunde(vorname, nachname, email) values ("Thomas", "Schmidt", "rst@xyz");
-- BEACHTE: die Spalte kunde_id hat die Eigenschaft auto_increment --> dieses Feld wird automatisch hochgezählt

insert into kunde(nachname, email, vorname) values ("Holzer", "hp@xyz", "Paul");
-- Reihenfolge der Spaltennamen wurde individuell angepasst

-- Einfügen eines Datensatzes in die Tabelle abrechnung
insert into abrechnung(abrechnung_id, kunde_id, datum) values (1, 1, "2017-01-02");
insert into abrechnung(abrechnung_id, kunde_id, datum) values (2, 2, "2017-02-10");
-- BEACHTE: In dieser Variante wurde der Wert für das auto_increment - Feld händisch vergeben
-- Datumsformat einhalten

insert into kunde values (4, "Paula", "Weiss", "pw@xyz");
-- Variante OHNE Spaltenliste, kunde_id wurde händisch vergeben

insert into kunde values (default, "Sabrina", "Schwarz", "SaSch@xyz");
-- insert into kunde values ("Sabrina", "Schwarz", "SaSch@xyz");
-- kunde_id wird automatisch vergeben
-- wenn die Spaltenliste weggelassen wird, müssen Anzahl und Reihenfolge der Werte im Datensatz mit der 
-- Tabellendefinition in der Datenbank übereinstimmen

insert into kunde values (default, NULL, "Schwarz", "SaSch@xyz");
-- NULL wenn der Wert noch nicht bekannt ist

-- Einfügen MEHRERER Datensätze mit EINEM Befehl
insert into produkt (produkt_name, euro_preis) values
	("Produkt A", 25.99),
    ("Produkt B", 2.22),
    ("Produkt C", 179.8),
    ("Produkt D", 0.59),
    ("Produkt E", 2);

-- Einfügen eines Datensatzes mit Verwendung einer Zeit-Funktion
-- Einfügen einer neuen Abrechnung ---> für das Datum wird die aktuelle Uhrzeit eingefügt
insert into abrechnung(kunde_id, datum) values (5, curdate());

-- Verwendung des constraints DEFAULT als Spalteneigenschaft
-- zunächst wird die Tabelle produkt angepasst:
alter table produkt change euro_preis euro_preis float(7,2) DEFAULT 0.99;
-- anschließend wird ein neues Produkt eingefügt ---> es wird kein Preis angegeben ---> der DEFAULT-Wert wird verwendet
insert into produkt(produkt_id, produkt_name) values (77, "ABC");

-- -----------------------------------------------------------------------
-- Löschen von Datensätzen
-- alle Datensätze aus der Tabelle produkt sollen gelöscht werden
delete from produkt;

-- es sollen ausgewählte Datensätze gelöscht werden ---> zusätzliche Verwendung von WHERE
delete from abrechnung where abrechnung_id = 1;
delete from kunde where nachname = "Müller";
-- genereller HINWEIS: Zeichenketten können überall auch mit einfachen 'Anführungszeichen' verwendet werden
delete from kunde where kunde_id > 2 AND kunde_id < 5;
-- Verwendung eines zusammengesetzten logischen Ausdrucks im WHERE ---> beide Bedingungen müssen erfüllt sein

-- ---------------------------------------------------------------------
-- Aktualisieren = update von Datensätzen
-- ALLE Kunden sollen den Nachnamen Müller bekommen
update kunde set nachname = 'Müller';

-- die Abrechnungen mit einer ID größer 2 sollen das Datum 01.05.2024 bekommen.
update abrechnung set datum = '2024-05-01' where abrechnung_id > 2;

-- der Kunde mit der ID 2 soll den Vornamen Klaus und die email km@xyz bekommen:
update kunde set vorname = 'Klaus', email = 'km@xyz' where kunde_id = 2;


-- ---------------------------------------------------------------------
-- Abfragen aller Spalten und Datensätze aus einer Tabelle
select * from kunde;
select * from abrechnung;
select * from produkt;