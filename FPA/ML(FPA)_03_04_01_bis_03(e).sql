# Musterlösung zu FPA_03_04_01_bis_03 (e)


INSERT INTO Philosoph(Vorname,Nachname,Geburtsort,Geburtsjahr,Todesjahr)
VALUES
("Immanuel","Kant","Königsberg",1724,1804),
("Arnold","Schwarzenegger","Thal",1947,NULL),
("Donald","Duck","Entenhausen",NULL,NULL);

INSERT INTO Buch(Philosoph_ID,Titel,Erscheinungsjahr)
VALUES
(1,"Kritik der reinen Vernunft",1781);

INSERT INTO Zitat(Philosoph_ID,Buch_ID,Text)
VALUES
(1,1,"Gedanken ohne Inhalt sind leer, Anschauungen ohne Begriffe sind blind"),
(2,NULL,"Hasta la vista baby"),
(NULL,NULL,"Ähhh ...");