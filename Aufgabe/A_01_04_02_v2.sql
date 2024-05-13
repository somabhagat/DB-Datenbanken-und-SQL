create database bank_M27_002;
use bank_M27_002;

create table tbl_laender
	(land_id int primary key,
    land_name char(100));

create table tbl_institute
	(institut_id int primary key,
    institut_name char(100));

create table tbl_filialen
	(filial_id int primary key,
    gruendungsjahr int,
    land_id int,
    institut_id int,
    foreign key(land_id) references tbl_laender(land_id),
    foreign key(institut_id) references tbl_institute(institut_id));

create table tbl_kunden
	(kunden_id int primary key,
    kunden_name char(100),
    kunden_adresse char(100));

create table tbl_konten
	(konto_id int primary key,
    konto_stand decimal(10,2),
    kunden_id int,
    filial_id int,
    foreign key(kunden_id) references tbl_kunden(kunden_id),
    foreign key(filial_id) references tbl_filialen(filial_id));

create table tbl_kredite
	(kredit_id int primary key,
    kredit_betrag decimal(10,2),
    kunden_id int,
    filial_id int,
    foreign key(kunden_id) references tbl_kunden(kunden_id),
    foreign key(filial_id) references tbl_filialen(filial_id));