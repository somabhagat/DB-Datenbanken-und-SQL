/*
ich bin
ein
mehrzeiliger
Kommentar bzw. Blockkommentar
*/

create database hochbau;
-- Anlegen einer neuen Datenbank

use hochbau;

-- aktivieren einer Datenbank für die weitere Verwendung

-- Anlegen der einzelnen Tabellen:
create table tbl_abteilungen
	(abteilungsnummer int primary key,
    abteilungsname char(50));
    
    create table tbl_baustellen
    (baustellennummer char (4) primary key,
    baustellname char(150));
    
    create table tbl_mitarbeiter
    (mitarbeiternummer char (4) primary key,
    mitarbeitername char (30) not null,
    plz char(5) not null,
    maschinenberechtigung bit,
    abteilungsnummer int,
    foreign key (abteilungsnummer) references tbl_abteilungen(abteilungsnummer));
    
    create table tbl_mitarbeiter_auf_baustelle
    (mitarbeiternummer char(4),
    baustellennummer char(4),
    stunden_auf_baustellen int,
    primary key (mitarbeiternummer, baustellennummer),
    foreign key (mitarbeiternummer) references tbl_mitarbeiter(mitarbeiternummer),
    foreign key(baustellennummer)references tbl_baustellen(baustellennummer));