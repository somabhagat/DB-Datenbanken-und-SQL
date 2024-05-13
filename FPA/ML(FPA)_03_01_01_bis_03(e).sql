# Musterlösung zu FPA_03_01_01_bis_03(e)


INSERT INTO Person(Vorname,Nachname,Strassenname,Hausnummer,Ort,PLZ)
VALUES 
("Axel","Amann","Allee",1,"Aachen","1234"),
("Bibi","Bfrau","Baumweg",2,"Berlin","2345"),
("Charlotte","Cfrau","Cluse",3,"Chemnitz","3456"),
("Dirk","Dmann","Damm",4,"Düsseldorf","4567"),
("Emma","Efrau","Ecke",5,"Essen","5678");

INSERT INTO Sprache(Bezeichnung_Sprache)
VALUES ("Italienisch"),("Deutsch"),("Dänisch");

INSERT INTO Land(Bezeichnung_Land)
VALUES ("Italien"),("Schweiz"),("Deutschland"),("Dänemark");

INSERT INTO Person_Sprache(Person_ID,Sprache_ID,Sprachqualitaet)
VALUES 
(1,1,"fließend"),
(1,2,"gebrochen"),
(2,2,"gut"),
(3,2,"fließend"),
(3,3,"fließend"),
(4,3,"fließend"),
(5,2,"fließend");

INSERT INTO Sprache_Land(Sprache_ID,Land_ID)
VALUES 
(1,1),(1,2),(2,2),(2,3),(3,4);