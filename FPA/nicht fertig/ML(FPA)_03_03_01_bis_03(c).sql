# Musterlösung zu FPA_03_03_01_bis_03 (c)


CREATE DATABASE FPA_03_03_01_bis_03_c;
USE FPA_03_03_01_bis_03_c;

CREATE TABLE Person
(
    Person_ID INT(11) AUTO_INCREMENT,
    Vorname VARCHAR(255) NOT NULL,
    Nachname VARCHAR(255) NOT NULL,
    PRIMARY KEY(Person_ID)
);

CREATE TABLE Bank
(
    Bank_ID INT(11) AUTO_INCREMENT,
    Bank_Name VARCHAR(255) NOT NULL,
    Strassenname VARCHAR(255) NOT NULL,
    Hausnummer VARCHAR(255) NOT NULL, # VARCHAR => dann ist auch Hausnummer 221 b möglich ;-)
    Ort VARCHAR(255) NOT NULL,
    PLZ VARCHAR(255) NOT NULL, # VARCHAR => dann sind auch führende Nullen möglich
    PRIMARY KEY(Bank_ID)
);

CREATE TABLE Konto
(
    Konto_ID INT(11) AUTO_INCREMENT,
    Person_ID INT(11) NOT NULL,
    Bank_ID INT(11) NOT NULL,
    Kontonummer VARCHAR(255) NOT NULL, # VARCHAR => dann sind auch führende Nullen möglich
    PRIMARY KEY(Konto_ID),
    FOREIGN KEY(Person_ID) REFERENCES Person(Person_ID),
    FOREIGN KEY(Bank_ID) REFERENCES Bank(Bank_ID)
);

CREATE TABLE Transaktion
(
    Transaktion_ID INT(11) AUTO_INCREMENT,
    Konto_ID INT(11) NOT NULL,
    Betrag FLOAT(11,2) NOT NULL,
    Datum DATE NOT NULL,
    PRIMARY KEY(Transaktion_ID),
    FOREIGN KEY(Konto_ID) REFERENCES Konto(Konto_ID)
);










