
create database baumarkt;
use baumarkt;

create table tbl_baumaerkte
	(baumarktID int primary key,
    baumarktName char(50),
    plz char(5),
    baumarktOrt char(50),
    baumarktStrasse char(100));

create table tbl_waren
	(warenID int primary key,
    warenName varchar(255),
    preis_in_euro decimal(10,2));
    
create table tbl_hersteller
	(herstellerID int primary key,
    herstellerName char(100),
    herstellerPLZ char(5),
    herstellerOrt char(50),
    herstellerStrasse char(100));

create table tbl_kunden
	(kundenID int primary key,
    kundenName char(50),
    kunden_eMail char(100));

create table tbl_waren_in_baumarkt
	(baumarktID int,
    warenID int,
    primary key(baumarktID, warenID),
    foreign key (baumarktID) references tbl_baumaerkte(baumarktID),
    foreign key (warenID) references tbl_waren(warenID));

create table tbl_waren_von_hersteller
	(warenID int,
    herstellerID int,
    primary key(warenID, herstellerID),
    foreign key(warenID) references tbl_waren(warenID),
    foreign key(herstellerID) references tbl_hersteller(herstellerID));

create table tbl_einkaeufe
	(einkaufsID int primary key,
    einkaufsDatum date,
    kundenID int,
    baumarktID int,
    foreign key(kundenID) references tbl_kunden(kundenID),
    foreign key(baumarktID) references tbl_baumaerkte(baumarktID));

create table tbl_waren_in_einkauf
	(warenID int,
    einkaufsID int,
    warenMenge decimal(6,2),
    primary key(warenID, einkaufsID),
    foreign key(warenID) references tbl_waren(warenID),
    foreign key(einkaufsID) references tbl_einkaeufe(einkaufsID));
