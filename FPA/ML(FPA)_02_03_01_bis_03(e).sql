# Musterlösung zu FPA_02_03_01_bis_03(e)

INSERT INTO Person(Vorname,Nachname,Geburtsdatum)
VALUES
("Andrea","Alster","1991-01-01"),
("Bettina","Becker","1992-02-02"),
("Charlotte","Carlson","1993-03-03"),
("Axel","Alster","1994-04-04"),
("Bernd","Becker","1995-05-05"),
("Claus","Cäsar","1996-06-06");

INSERT INTO Ehe(Person1_ID,Person2_ID,Standesbeamter_ID,Ehe_Beginn,Ehe_Ende)
VALUES
(1,4,6,"2019-09-09","2022-02-02"),
(2,5,3,"2020-12-20",NULL);