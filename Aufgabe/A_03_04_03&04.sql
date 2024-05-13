CREATE DATABASE A_03_04_03_plus_04;
USE A_03_04_03_plus_04;

CREATE TABLE Student
(
    Student_ID INT(11) AUTO_INCREMENT,
    Vorname VARCHAR(255) NOT NULL,
    Nachname VARCHAR(255) NOT NULL,
    Datum_Immatrikulation DATE NOT NULL,
    Datum_Exmatrikulation DATE, # nicht definiert, falls Studium noch nicht beendet/abgebrochen
    PRIMARY KEY(Student_ID)
);

INSERT INTO Student(Vorname,Nachname,Datum_Immatrikulation,Datum_Exmatrikulation)
VALUES
("Axel","Ast","2001-01-01","2005-01-01"),
("Bibi","Baum","2002-02-02","2006-02-02"),
("Charlie","Cweig","2003-03-03",NULL),
("Detlef","Distel","2004-04-04",NULL),
("Emma","Esche","2005-05-05",NULL),
("Freya","Fichte","2006-06-06",NULL);

CREATE TABLE Studienfach
(
    Studienfach_ID INT(11) AUTO_INCREMENT,
    Bezeichnung VARCHAR(255) NOT NULL,
    Dauer_Stunden INT(11) NOT NULL, # Anzahl der Stunden, die man absolvieren muss, bis man sich zur Prüfung anmelden kann
    PRIMARY KEY(Studienfach_ID)
);

INSERT INTO Studienfach(Bezeichnung,Dauer_Stunden)
VALUES
("Anatomie",100),
("Biologie",200),
("Chemie",300);

CREATE TABLE Pruefung
(
    Pruefung_ID INT(11) AUTO_INCREMENT,
    Studienfach_ID INT(11) NOT NULL,
    Datum_Pruefung DATE NOT NULL,
    PRIMARY KEY(Pruefung_ID),
	FOREIGN KEY(Studienfach_ID) REFERENCES Studienfach(Studienfach_ID)
);

INSERT INTO Pruefung(Studienfach_ID,Datum_Pruefung)
VALUES
(1,"2003-06-11"),
(2,"2003-07-11"),
(3,"2003-08-11"),
(1,"2006-08-11"),
(2,"2006-08-12"),
(3,"2006-08-13"),
(1,"2006-08-14"),
(2,"2006-08-15"),
(3,"2006-08-16");

CREATE TABLE Student_Studienfach
(
    Student_ID INT(11) NOT NULL,
    Studienfach_ID INT(11) NOT NULL,
    FOREIGN KEY(Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY(Studienfach_ID) REFERENCES Studienfach(Studienfach_ID)
);

INSERT INTO Student_Studienfach
VALUES
(1,1),
(1,2),
(1,3),
(2,1),
(2,2),
(2,3),
(3,1),
(3,2),
(4,1),
(4,2),
(5,1),
(6,1);

CREATE TABLE Student_Pruefung # jeder Datensatz steht für eine Prüfung, zu der sich ein Student angemeldet hat
(
    Student_ID INT(11) NOT NULL,
    Pruefung_ID INT(11) NOT NULL,
    Note INT(11), # nicht definiert, falls Prüfung noch nicht angetreten oder noch nicht korrigiert
    PRIMARY KEY(Student_ID,Pruefung_ID),
    FOREIGN KEY(Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY(Pruefung_ID) REFERENCES Pruefung(Pruefung_ID)
);

INSERT INTO Student_Pruefung
VALUES
(1,1,1),
(1,2,2),
(1,3,3),
(2,1,1),
(2,2,2),
(2,3,3),
(3,3,3),
(4,4,4),
(4,2,NULL),
(5,3,NULL);