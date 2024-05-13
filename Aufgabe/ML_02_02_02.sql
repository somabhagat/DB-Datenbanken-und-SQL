#Musterlösungen zu A_02_02_02

#a)
ALTER TABLE Ausbildung ADD Ausbildungs_Dauer_in_Monaten INT(11) NOT NULL;

#b)
ALTER TABLE Ausbildung CHANGE Bezeichnung Bezeichnung VARCHAR(30) NOT NULL;

#c)
ALTER TABLE Ausbildung RENAME Qualifikation;

#d)
CREATE TABLE Marke
(
    Marke_ID INT(11) AUTO_INCREMENT,
    Markenname VARCHAR(50) NOT NULL,
    PRIMARY KEY(Marke_ID)
);

#e)
ALTER TABLE Firmenwagen ADD Marke_ID INT(11) NOT NULL;
ALTER TABLE Firmenwagen ADD FOREIGN KEY(Marke_ID) REFERENCES Marke(Marke_ID);

#f)
ALTER TABLE Firmenwagen CHANGE Kennzeichen Kfz_Zeichen VARCHAR(255) NOT NULL;

#g)
ALTER TABLE Mitarbeiter RENAME Kollege;

#h)
ALTER TABLE Kollege CHANGE Nachname Familienname VARCHAR(30) NULL;

#i)
ALTER TABLE Kollege DROP FOREIGN KEY Kollege_ibfk_2;
ALTER TABLE Kollege DROP Firmenwagen_ID;