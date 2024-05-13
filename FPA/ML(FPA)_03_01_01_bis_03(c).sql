# Musterlösung zu FPA_03_01_01_bis_03(c)


CREATE DATABASE FPA_03_01_01_bis_03_c;
USE FPA_03_01_01_bis_03_c;

CREATE TABLE Person
(
    Person_ID INT(11) AUTO_INCREMENT,
    Vorname VARCHAR(255) NOT NULL,
    Nachname VARCHAR(255) NOT NULL,
    Strassenname VARCHAR(255) NOT NULL,
    Hausnummer INT(11) NOT NULL,
    Ort VARCHAR(255) NOT NULL,
    PLZ VARCHAR(255) NOT NULL,
    PRIMARY KEY(Person_ID)
);

CREATE TABLE Sprache
(
    Sprache_ID INT(11) AUTO_INCREMENT,
    Bezeichnung_Sprache VARCHAR(255) NOT NULL,
    PRIMARY KEY(Sprache_ID)
);

CREATE TABLE Person_Sprache
(
    Person_ID INT(11) NOT NULL,
    Sprache_ID INT(11) NOT NULL,
    FOREIGN KEY(Person_ID) REFERENCES Person(Person_ID),
    FOREIGN KEY(Sprache_ID) REFERENCES Sprache(Sprache_ID)
);

CREATE TABLE Land
(
    Land_ID INT(11) AUTO_INCREMENT,
    Bezeichnung_Land VARCHAR(255) NOT NULL,
    PRIMARY KEY(Land_ID)
);

CREATE TABLE Sprache_Land
(
    Sprache_ID INT(11) NOT NULL,
    Land_ID INT(11) NOT NULL,
    FOREIGN KEY(Sprache_ID) REFERENCES Sprache(Sprache_ID),
    FOREIGN KEY(Land_ID) REFERENCES Land(Land_ID)
);