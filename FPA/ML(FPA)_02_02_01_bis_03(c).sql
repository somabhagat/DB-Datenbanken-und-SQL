#Musterlösung zu FPA_02_02_03_bis_04(c)

CREATE DATABASE FPA_02_02_01_bis_03_c;
USE FPA_02_02_01_bis_03_c;

CREATE TABLE Filiale
(
    Filiale_ID INT(11) AUTO_INCREMENT,
    Strasse VARCHAR(255) NOT NULL,
    Ort VARCHAR(255) NOT NULL,
    PLZ INT(11) NOT NULL,
    PRIMARY KEY(Filiale_ID)
);

CREATE TABLE Mitarbeiter
(
    Mitarbeiter_ID INT(11) AUTO_INCREMENT,
    Filiale_ID INT(11) NOT NULL,
    Vorname VARCHAR(255) NOT NULL,
    Nachname VARCHAR(255) NOT NULL,
    PRIMARY KEY(Mitarbeiter_ID),
    FOREIGN KEY(Filiale_ID) REFERENCES Filiale(Filiale_ID)
);

CREATE TABLE Medikament
(
    Medikament_ID INT(11) AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    PRIMARY KEY(Medikament_ID)
);

CREATE TABLE Filiale_Medikament
(
    Filiale_ID INT(11) NOT NULL,
    Medikament_ID INT(11) NOT NULL,
    FOREIGN KEY(Filiale_ID) REFERENCES Filiale(Filiale_ID),
    FOREIGN KEY(Medikament_ID) REFERENCES Medikament(Medikament_ID)
);

CREATE TABLE Krankheit
(
    Krankheit_ID INT(11) AUTO_INCREMENT,
    Bezeichnung_deutsch VARCHAR(255) NOT NULL,
    Bezeichnung_lateinisch VARCHAR(255) NOT NULL,
    PRIMARY KEY(Krankheit_ID)
);

CREATE TABLE Krankheit_Medikament
(
    Krankheit_ID INT(11) NOT NULL,
    Medikament_ID INT(11) NOT NULL,
    FOREIGN KEY(Krankheit_ID) REFERENCES Krankheit(Krankheit_ID),
    FOREIGN KEY(Medikament_ID) REFERENCES Medikament(Medikament_ID)
);