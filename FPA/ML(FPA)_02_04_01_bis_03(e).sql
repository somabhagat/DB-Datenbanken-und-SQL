# Musterlösung zu FPA_02_04_01_bis_03(e)

INSERT INTO Person(Vorname,Nachname,Geburtsjahr,Strasse,Hausnummer,PLZ,Ort)
VALUES
("Anton","Amtmann",1981,"Aue",1,52062,"Aachen"),
("Bertha","Baumann",1982,"Baumweg",2,10115,"Berlin"),
("Carla","Carlson",1983,"Cluse",3,09111,"Chemnitz");

INSERT INTO Lied(Titel,Erscheinungsjahr,Person_ID)
VALUES
("Nothing Compares 2U",1990,1),
("La Le Lu",1950,3);

INSERT INTO Person_Lied
VALUES(1,1),(2,1),(3,1),(2,2),(3,2);