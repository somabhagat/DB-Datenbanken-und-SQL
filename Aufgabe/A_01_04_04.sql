create database projekt;
use projekt;

create table tbl_projekt
	(projektID int primary key,
    bezeichnung char(50)
    );

create table tbl_teil_projekt
	(teilprojektID int primary key,
    bezeichnung char(50),
    projektID int,
    foreign key(projektID) references tbl_teil_projekt(teilprojektID)
    );

create table tbl_aufgabe
	(aufgabeID int primary key,
    bezeichnung char(50),
    teilprojektID int,
    foreign key(teilprojektiD) references tbl_teil_projekt(teilprojektID)
    );
    
create table tbl_arbeitspakete
	(arbeitspaketeID int primary key,
    bezeichnung char(50),
    beschreibung char(255),
    dauer_in_tag int,
    kosten_in_euro decimal(10,2),
    aufgabeID int,
    foreign key(aufgabeID) references tbl_aufgabe(aufgabeID)
    );
