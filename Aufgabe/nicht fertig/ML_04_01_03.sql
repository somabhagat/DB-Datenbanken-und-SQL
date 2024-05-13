# Musterlösung zu A_04_01_03


#a)
SELECT Student_Studienfach.Student_ID AS "Fremdschlüsselwert 1",
       Student_Studienfach.Studienfach_ID AS "Fremdschlüsselwert 2"
FROM Student_Studienfach

UNION

SELECT Student_Pruefung.Student_ID,
       Student_Pruefung.Pruefung_ID
FROM Student_Pruefung;


#b)
# Löschung der beiden Fremdschlüsselbeziehungen (Interne Namensgabe kann im Zweifel mittels SHOW CREATE TABLE nachgeschlagen werden)
ALTER TABLE Student_Studienfach DROP FOREIGN KEY Student_Studienfach_ibfk_1;
ALTER TABLE Student_Pruefung DROP FOREIGN KEY Student_Pruefung_ibfk_1;

# Löschung des Primärschlüssels
ALTER TABLE Student_Pruefung DROP PRIMARY KEY; 

# Der "NOT NULL"-Constraint der beiden Fremdschlüssel "Student_ID" (in Student_Studienfach und Student_Pruefung) wird aufgehoben
ALTER TABLE Student_Studienfach CHANGE Student_ID Student_ID INT(11);
ALTER TABLE Student_Pruefung CHANGE Student_ID Student_ID INT(11);

# Neusetzung der beiden Fremdschlüsselbziehungen mit der gewünschten Fremdschlüssel-Option
ALTER TABLE Student_Studienfach ADD FOREIGN KEY(Student_ID) REFERENCES Student(Student_ID) ON DELETE SET NULL;
ALTER TABLE Student_Pruefung ADD FOREIGN KEY(Student_ID) REFERENCES Student(Student_ID) ON DELETE SET NULL;


#c)
SELECT Student.Vorname,
       Student.Nachname,
       Pruefung.Datum_Pruefung,
       Studienfach.Bezeichnung
FROM Student LEFT JOIN Student_Pruefung ON Student.Student_ID=Student_Pruefung.Student_ID
     LEFT JOIN Pruefung ON Student_Pruefung.Pruefung_ID=Pruefung.Pruefung_ID
     LEFT JOIN Studienfach ON Pruefung.Studienfach_ID=Studienfach.Studienfach_ID
     
UNION

SELECT Student.Vorname,
       Student.Nachname,
       Pruefung.Datum_Pruefung,
       Studienfach.Bezeichnung
FROM Student RIGHT JOIN Student_Pruefung ON Student.Student_ID=Student_Pruefung.Student_ID
     RIGHT JOIN Pruefung ON Student_Pruefung.Pruefung_ID=Pruefung.Pruefung_ID
     LEFT JOIN Studienfach ON Pruefung.Studienfach_ID=Studienfach.Studienfach_ID;
	 
	 
#d)
# Löschung der Fremdschlüsselbeziehung
ALTER TABLE Student_Pruefung DROP FOREIGN KEY Student_Pruefung_ibfk_2;

# Neusetzung der beiden Fremdschlüsselbziehungen mit der gewünschten Fremdschlüssel-Option
ALTER TABLE Student_Pruefung ADD FOREIGN KEY(Pruefung_ID) REFERENCES Pruefung(Pruefung_ID) ON DELETE CASCADE;