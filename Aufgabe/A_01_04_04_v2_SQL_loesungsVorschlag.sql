
create database projektVerwaltung;
use projektVerwaltung;

create table projekt
	(projekt_id int,
    bezeichnung char(255),
    primary key(projekt_id));

create table teilProjekt
	(teilProjekt_id int,
    bezeichnung char(255),
    projekt_id int,
    primary key(teilProjekt_id),
    foreign key(projekt_id) references projekt(projekt_id));

create table aufgabe
	(aufgabe_id int,
    bezeichnung char(255),
    teilProjekt_id int,
    primary key(aufgabe_id),
    foreign key(teilProjekt_id) references teilProjekt(teilProjekt_id));

create table arbeitspaket
	(arbeitspaket_id int,
    bezeichnung char(255),
    beschreibung char(255),
    dauer_in_stunden int,
    kosten_in_euro decimal(10,2),
    aufgabe_id int,
    primary key(arbeitspaket_id),
    foreign key(aufgabe_id) references aufgabe(aufgabe_id));