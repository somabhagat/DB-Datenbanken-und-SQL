
-- create database geld_her;
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
--								das Feld mit constraint auto_increment muss auch PK sein
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
