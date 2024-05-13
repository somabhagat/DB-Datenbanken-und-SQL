# Musterlösung zu FPA_03_02_01_bis_03 (c)


CREATE DATABASE FPA_03_02_01_bis_03_c;
USE FPA_03_02_01_bis_03_c;

CREATE TABLE Frau
(
    Frau_ID INT(11) AUTO_INCREMENT,
    Frau_Vorname VARCHAR(255) NOT NULL,
    Frau_Nachname VARCHAR(255) NOT NULL,
    PRIMARY KEY(Frau_ID)
);

CREATE TABLE Mann
(
    Mann_ID INT(11) AUTO_INCREMENT,
    Mann_Vorname VARCHAR(255) NOT NULL,
    Mann_Nachname VARCHAR(255) NOT NULL,
    PRIMARY KEY(Mann_ID)
);

CREATE TABLE Ehe
(
    Ehe_ID INT(11) AUTO_INCREMENT,
    Frau_ID INT(11),
    Mann_ID INT(11),
    Beginn DATE NOT NULL,
    Ende DATE,
    PRIMARY KEY(Ehe_ID),
    FOREIGN KEY(Frau_ID) REFERENCES Frau(Frau_ID),
    FOREIGN KEY(Mann_ID) REFERENCES Mann(Mann_ID)
);