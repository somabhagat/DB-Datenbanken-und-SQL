# Musterlösung zu FPA_02_05_01_bis_03(e)

INSERT INTO Ort(Ort_Name)
VALUES
("Wuppertal"),
("Marconia");

INSERT INTO Person(Vorname,Nachname,Geburtstag)
VALUES
("Stefania", "Istas", "1978-05-01"),
("Andreas", "Nossap", "1966-10-21"),
("Elli", "Deise","2014-08-07");

INSERT INTO Foto(Person_ID,Ort_ID)
VALUES
(1,1),(1,1),(1,2),(2,2);