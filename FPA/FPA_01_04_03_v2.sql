-- FPA_01_04_03_v2.docx

create database laender;
use laender;

create table meer
	(meer_id int primary key,
    name varchar(100),
    flaeche_in_qkm decimal(10,2));
    
create table land
	(land_id int primary key,
    name varchar(100),
    flaeche_in_qkm decimal(10,2));

create table meer_land
	(meer_id int,
    land_id int,
    foreign key(meer_id) references meer(meer_id),
    foreign key(land_id) references land(land_id));

create table region
	(region_id int primary key,
    land_id int,
    name varchar(100),
    foreign key(land_id) references land(land_id));

create table stadt
	(stadt_id int primary key,
    region_id int,
    name varchar(100),
    foreign key(region_id) references region(region_id));

create table land_grenzt_an_land
	(land_id1 int,
    land_id2 int,
    foreign key(land_id1) references land(land_id),
    foreign key(land_id2) references land(land_id),
    primary key(land_id1, land_id2));

