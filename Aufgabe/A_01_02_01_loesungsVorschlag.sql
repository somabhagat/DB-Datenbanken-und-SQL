-- Sporthalle

create database sport;
use sport;

create table tbl_ort
	(ort_ID int primary key,
    name varchar(150),
    ew_zahl int);

create table tbl_sportArt
	(art_ID int primary key,
    bezeichnung varchar(255));

create table tbl_sporthalle
	(halle_ID int primary key,
    name varchar(255),
    groesse_qm int,
    ort_ID int,
    foreign key(ort_ID) references tbl_ort(ort_ID));

create table tbl_art_in_halle
	(halle_ID int,
    art_ID int,
    foreign key(halle_ID) references tbl_sporthalle(halle_ID),
    foreign key(art_ID) references tbl_sportArt(art_ID),
    primary key(halle_ID, art_ID));
