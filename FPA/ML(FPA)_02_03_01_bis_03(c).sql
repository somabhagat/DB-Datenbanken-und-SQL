# Musterlösung zu FPA_02_03_01_bis_03(c)

CREATE DATABASE FPA_02_03_01_bis_03_c;
USE FPA_02_03_01_bis_03_c;

CREATE TABLE Person
(
    Person_ID INT(11) AUTO_INCREMENT,
    Vorname VARCHAR(255) NOT NULL,
    Nachname VARCHAR(255) NOT NULL,
    Geburtsdatum DATE NOT NULL,
    PRIMARY KEY(Person_ID)
);

CREATE TABLE Ehe
(
    Ehe_ID INT(11) AUTO_INCREMENT,
    Person1_ID INT(11) NOT NULL,
    Person2_ID INT(11) NOT NULL,
    Ehe_Beginn DATE NOT NULL,
    Ehe_Ende DATE NOT NULL,
    PRIMARY KEY(Ehe_ID),
    FOREIGN KEY(Person1_ID) REFERENCES Person(Person_ID),
    FOREIGN KEY(Person2_ID) REFERENCES Person(Person_ID)
);