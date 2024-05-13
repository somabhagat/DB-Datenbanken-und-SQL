create database softwareAG;
use softwareAG;

create table tbl_kunden
	(kundenNr int primary key,
    kundenName varchar(160),
    kundenPLZ char(5),
    kundenOrt varchar(150),
    kundenStrasseNr varchar(150));

create table tbl_filialen
	(filialeNr int primary key,
    filialePLZ char(5),
    filialeOrt varchar(150),
    filialeStrasseNr varchar(150),
    kundenNr int,
    foreign key(kundenNr) references tbl_kunden(kundenNr));

create table tbl_projekte
	(projektNr int primary key,
    projektBezeichnung varchar(255),
    projektVolumen_in_euro int,
    kundenNr int,
    foreign key(kundenNr) references tbl_kunden(kundenNr));