create database datenbank;
use datenbank;

create table tbl_datenbank
(datenbankID int primary key,
bezeichnung char(25)
);

create table tbl_user 
(userID int primary key,
userName char(50),
userAdresse char(150)
);

create table tbl_user_in_datenbank
(datenbankID int,
userID int,
primary key (datenbankID, userID),
foreign key (datenbankID) references tbl_datenbank(datenbankID),
foreign key (userID) references tbl_user(userID)
);

create table tbl_tabellen
(tabellenID int primary key,
tabellenName char(15),
datenbankID int,
foreign key(datenbankID) references tbl_datenbank(datenbankID)
);

create table tbl_attribut 
(attributID int primary key,
attributName char(15),
attributTyp char(15),
tabellenID int,
foreign key(tabellenID) references tbl_tabellen(tabellenID)
);