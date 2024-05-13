-- ML(FPA)_01_04_02

create database aemter;
use aemter;

create table buerger
	(buerger_id int,
    name char(100),
    adresse char(255),
    primary key(buerger_id));

create table institutionen
	(institution_id int,
    bezeichnung char(255),
    adresse char(255),
    primary key(institution_id));

create table mitarbeiter
	(mitarbeiter_id int,
    name char(100),
    adresse char(255),
    institution_id int,
    primary key (mitarbeiter_id),
    foreign key(institution_id) references institutionen(institution_id));

create table dienstleistungen
	(dienstleistung_id int,
    bezeichnung char(200),
    institution_id int,
    primary key(dienstleistung_id),
    foreign key(institution_id) references institutionen(institution_id));

create table besuche
	(besuch_id int,
    mitarbeiter_id int,
    institution_id int,
    dienstleistung_id int,
    buerger_id int,
    datum date,
    primary key(besuch_id),
    foreign key(mitarbeiter_id) references mitarbeiter(mitarbeiter_id),
    foreign key(institution_id) references institutionen(institution_id),
    foreign key(dienstleistung_id) references dienstleistungen(dienstleistung_id),
    foreign key(buerger_id) references buerger(buerger_id));
