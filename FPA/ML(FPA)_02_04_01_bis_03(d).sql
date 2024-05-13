# Musterlösung zu FPA_02_04_01_bis_03(d)

ALTER TABLE Lied ADD Person_ID INT(11) NOT NULL;
ALTER TABLE Lied ADD FOREIGN KEY(Person_ID) REFERENCES Person(Person_ID);