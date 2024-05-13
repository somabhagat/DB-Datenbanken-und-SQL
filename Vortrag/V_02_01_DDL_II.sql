
create database geld_her;
-- neue Datenbank erstellen

-- drop database geld_her;
-- löschen einer Datenbank

use geld_her;
-- aktive Datenbank festlegen

create table kunde
	(kunde_id int auto_increment,			-- Feld wird beginnend bei 1 mit jedem Datensatz hochgezählt
    vorname varchar(255) NULL,				-- NULL ---> dieses Feld ist 'nullierbar', kann also leer bleiben
    nachname varchar(255) NOT NULL,			-- NOT NULL ---> dieses Feld MUSS ausgefüllt werden
    email varchar(255) NOT NULL,
    primary key(kunde_id)					-- PK
    );
-- neue Tabelle erstellen
-- alternativer Datentyp mit optionalem Parameter int(<breite_der_spaltenausgabe>)
-- auto_increment ---> BEACHTE:	pro Tabelle nur EINMAL möglich
--								das Feld mit ~ muss auch PK sein
-- NULL ---> diese Eigenschaft ist vorgegeben, wenn nichts dazu geschrieben wird

create table abrechnung
	(abrechnung_id int auto_increment,
    kunde_id int NULL,
    datum date,
    primary key(abrechnung_id),
    foreign key(kunde_id) references kunde(kunde_id));

create table spedition
	(spedition_id int auto_increment primary key,
    spedition_name varchar(255));
    
create table hersteller
	(hersteller_id int auto_increment primary key,
    hersteller_name varchar(255),
    spedition_id int UNIQUE,			-- UNIQUE ---> alle Werte in dieser Spalte müssen eindeutig sein
    foreign key(spedition_id) references spedition(spedition_id));

create table produkt
	(produkt_id int auto_increment primary key,
    produkt_name varchar(255),
    euro_preis float(7,2),			-- alternativ: decimal(7,2)
    hersteller_id int,
    foreign key(hersteller_id) references hersteller(hersteller_id));

create table abrechnung_produkt
	(abrechnung_id int,
    foreign key(abrechnung_id) references abrechnung(abrechnung_id),
    produkt_id int,
    foreign key(produkt_id) references produkt(produkt_id));
    
-- drop table kunde;
-- löschen einer Tabelle

-- ---------------------------------------------------------------------------------
-- Hinzufügen von Spalten zu einer vorhandenen Tabelle
-- der Tabelle kunde soll die Spalte anrede hinzugefügt werden
alter table kunde add anrede varchar(255) not null;

-- der Tabelle produkt soll die Spalte kunde hinzugefügt werden
alter table produkt add kunde_id int;
-- alter table produkt add column kunde_id int;

-- die Spalte kunde_id in der Tabelle produkt soll eine Fremdschlüsselbeziehung auf die Tabelle kunde bekommen
alter table produkt add foreign key(kunde_id) references kunde(kunde_id);

-- Löschen eines vorhandenen Attributs aus einer Tabelle
alter table kunde drop column anrede;
-- alter table kunde drop anrede;

-- Löschen der Fremdschlüsselbeziehung zwischen Tabellen abrechung und kunde
alter table abrechnung drop foreign key abrechnung_ibfk_1;

-- zum Löschen muss der Name der zu löschenden Fremdschlüsselbeziehung bekannt sein
show create table produkt;

/*
'CREATE TABLE `produkt` (
  `produkt_id` int(11) NOT NULL AUTO_INCREMENT,
  `produkt_name` varchar(255) DEFAULT NULL,
  `euro_preis` float(7,2) DEFAULT NULL,
  `hersteller_id` int(11) DEFAULT NULL,
  `kunde_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`produkt_id`),
  KEY `hersteller_id` (`hersteller_id`),
  KEY `kunde_id` (`kunde_id`),
  CONSTRAINT `produkt_ibfk_1` FOREIGN KEY (`hersteller_id`) REFERENCES `hersteller` (`hersteller_id`),
  CONSTRAINT `produkt_ibfk_2` FOREIGN KEY (`kunde_id`) REFERENCES `kunde` (`kunde_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4'
*/
-- aus dieser Anzeige können die Namen der Beziehungen abgelesen werden
alter table produkt drop foreign key produkt_ibfk_2;

-- die Fremdschlüsselbeziehung wurde gelöscht ---> jetzt kann das Feld kunde_id aus der Tabelle produkt gelöscht werden
alter table produkt drop kunde_id;

-- Ändern von Spalteneigenschaften
-- Ändern von Datentyp bzw. andere constraints
alter table kunde change vorname vorname varchar(100) null;

-- Ändern des Spaltennamens (und weiterer Eigenschaften)
alter table kunde change vorname kunde_vorname varchar(50) not null;
--  ACHTUNG: Bei Änderung Datentyp ist Datenverlust möglich!

-- Änderung des Namens einer Tabelle
alter table abrechnung rename invoice;


