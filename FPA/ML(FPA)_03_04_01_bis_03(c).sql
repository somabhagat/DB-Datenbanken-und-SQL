# Musterlösung zu FPA_03_04_01_bis_03 (c)


CREATE DATABASE FPA_03_04_01_bis_03_c;
USE FPA_03_04_01_bis_03_c;

CREATE TABLE Philosoph
(
    Philosoph_ID INT(11) AUTO_INCREMENT,
    Vorname VARCHAR(255),
    Nachname VARCHAR(255),
    Geburtsort VARCHAR(255),
    Geburtsjahr INT(11),
    PRIMARY KEY(Philosoph_ID)
);

CREATE TABLE Zitat
(
    Zitat_ID INT(11) AUTO_INCREMENT,
    Text VARCHAR(1000),
    PRIMARY KEY(Zitat_ID)
);

CREATE TABLE Buch
(
    Buch_ID INT(11) AUTO_INCREMENT,
    Titel VARCHAR(1000),
    Erscheinungsjahr INT(11),
    PRIMARY KEY(Buch_ID)
);