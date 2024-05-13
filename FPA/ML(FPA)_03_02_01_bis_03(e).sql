# Musterlösung zu FPA_03_02_01_bis_03 (e)


INSERT INTO Frau(Frau_Vorname,Frau_Nachname)
VALUES
("Anna","Ast"),
("Bertha","Baum"),
("Charlotte","Chic");

INSERT INTO Mann(Mann_Vorname,Mann_Nachname)
VALUES
("Anton","Alster"),
("Bernd","Buche"),
("Cäsar","Choco");

INSERT INTO Ehe(Frau_ID,Mann_ID,Beginn,Ende)
VALUES
(1,2,"2000-05-05","2016-08-08"),       # Diese Ehe wurde also geschieden
(1,1,"2017-05-05",NULL),               # Frau 1 ist also zum 2. mal verheiratet
(2,1,"2018-05-05",NULL),               # Mann 1 ist also Bigamist
(3,NULL,"2019-05-05",NULL),            # Der Mann dieser Ehe wurde aus der Datenbank gelöscht, die Ehe besteht aber noch
(NULL,3,"2005-05-05","2010-08-08"),    # Der Frau dieser Ehe wurde aus der Datenbank gelöscht, die Ehe wurde bereits geschieden
(NULL,NULL,"2003-05-05",NULL),         # Beide Personen wurden gelöscht, die Ehe besteht aber noch  
(NULL,NULL,"2003-05-05","2008-08-08"); # Beide Personen wurden gelöscht, die Ehe wurde bereits geschieden