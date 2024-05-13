#Musterlösung zu A_02_01_01

CREATE DATABASE Geld_her;
USE Geld_her;


CREATE TABLE Kunde 
(
  Kunde_ID INT(11) AUTO_INCREMENT,
  Vorname VARCHAR(255),
  Nachname VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  PRIMARY KEY (Kunde_ID)
);


CREATE TABLE Abrechnung 
(
  Abrechnung_ID INT(11) AUTO_INCREMENT,
  Kunde_ID INT(11) NOT NULL,
  Datum DATE NOT NULL,
  PRIMARY KEY (Abrechnung_ID),
  FOREIGN KEY(Kunde_ID) REFERENCES Kunde(Kunde_ID)
);


CREATE TABLE Spedition 
(
  Spedition_ID INT(11) AUTO_INCREMENT,
  Spedition_Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Spedition_ID)
);


CREATE TABLE Hersteller
(
  Hersteller_ID INT(11) AUTO_INCREMENT,
  Spedition_ID INT(11) NOT NULL,
  Hersteller_Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Hersteller_ID),
  FOREIGN KEY(Spedition_ID) REFERENCES Spedition(Spedition_ID)
);


CREATE TABLE Produkt 
(
  Produkt_ID INT(11) AUTO_INCREMENT,
  Hersteller_ID INT(11) NOT NULL,
  Produkt_Name VARCHAR(255) NOT NULL,
  Euro_Preis FLOAT(11,2) NOT NULL,
  PRIMARY KEY (Produkt_ID),
  FOREIGN KEY(Hersteller_ID) REFERENCES Hersteller(Hersteller_ID)
);


CREATE TABLE Abrechnung_Produkt
(
  Abrechnung_ID INT(11) NOT NULL,
  Produkt_ID INT(11) NOT NULL,
  FOREIGN KEY (Abrechnung_ID) REFERENCES Abrechnung(Abrechnung_ID),
  FOREIGN KEY (Produkt_ID) REFERENCES Produkt(Produkt_ID)
);


