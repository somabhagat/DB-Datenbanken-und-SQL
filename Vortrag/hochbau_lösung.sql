/*
	ich bin ein mehrzeiliger
    Kommentar bzw. Blockkommentar
    
    - SQL ist NICHT case sensitiv (also Groß- und Kleinschreibung ist möglich)
    - jeden Befehl mit ; (Semikolon) abschließen
    - einzelnen Befehl ausführen: Cursor in Anweisung setzen --> STRG + ENTER
    - BEACHTE: 		Name der Datenbank muss eindeutig sein!
					Namen der Tabellen innerhalb einer Datenbank müssen eindeutig sein!
*/

create database hochbau_v01;
-- Anlegen einer neuen Datenbank

use hochbau_v01;
-- Aktivieren einer Datenbank für die weitere Verwendung

-- Anlegen der einzelnen Tabellen:
create table tbl_abteilungen
	(abteilungsnummer int primary key,			-- Feld als Primärschlüssel
    abteilungsname char(50));

create table tbl_baustellen
	(baustellennummer char(4) primary key,
    baustellenname char(150));				-- als Datentyp auch möglich: varchar(150)
    
CREATE TABLE tbl_mitarbeiter (
    mitarbeiternummer CHAR(4) PRIMARY KEY,
    mitarbeitername CHAR(30) NOT NULL,
    plz CHAR(5) NOT NULL,
    maschinenberechtigung BIT,
    abteilungsnummer INT,
    FOREIGN KEY (abteilungsnummer)
        REFERENCES tbl_abteilungen (abteilungsnummer)
);
-- BEACHTE: das Feld abteilungsnummer erhält die Eigenschaft Fremdschlüssel = foreign key
-- references gibt an, auf welche Tabelle und welches Feld verwiesen/ verbunden wird

create table tbl_mitarbeiter_auf_baustelle
	(mitarbeiternummer char(4),
    baustellennummer char(4),
    stunden_auf_baustelle int,
    primary key (mitarbeiternummer, baustellennummer),	-- zusammengesetzter Primärschlüssel
    foreign key (mitarbeiternummer) references tbl_mitarbeiter(mitarbeiternummer),
    foreign key (baustellennummer) references tbl_baustellen(baustellennummer));

-- Tabelle löschen
-- drop table tbl_mitarbeiter_auf_baustelle;