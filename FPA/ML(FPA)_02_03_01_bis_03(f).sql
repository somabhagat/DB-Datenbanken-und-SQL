# Musterlösung zu FPA_02_03_01_bis_03(f)


#(1)
UPDATE Person SET Nachname="Alster-Schulze" WHERE Person_ID=1;
UPDATE Person SET Nachname="Alster-Schulze" WHERE Person_ID=4;


#(2)
INSERT INTO Person(Vorname,Nachname,Geburtsdatum) 
VALUES ("Egon","Ehrmann","1966-10-21");

INSERT INTO Ehe(Person1_ID,Person2_ID,Standesbeamter_ID,Ehe_Beginn,Ehe_Ende) 
VALUES (3,6,7,"2023-05-03",NULL);


#(3)
UPDATE Ehe SET Ehe_Ende="2022_11_11" WHERE Ehe_ID=2;


#(4)
ALTER TABLE Person CHANGE Geburtsdatum Geburtsdatum DATE NULL;

INSERT INTO Person(Vorname,Nachname)
VALUES
("Doris","Dahlmann"),
("Dörte","Dahlmann");
-- personID wird automatisch über AUTO_INCREMENT vergeben

INSERT INTO Ehe(Person1_ID,Person2_ID,Standesbeamter_ID,Ehe_Beginn)
VALUES (8,9,6,"2022-03-05");


#(5)
UPDATE Person SET Vorname="Klaus", Nachname="Zaesah" WHERE Person_ID=6;