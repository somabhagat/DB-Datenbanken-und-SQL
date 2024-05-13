# Musterlösung zu A_03_04_03


#a)
SELECT Student.Student_ID,Vorname,Nachname, COUNT(Studienfach_ID)
FROM Student LEFT JOIN Student_Studienfach ON Student.Student_ID=Student_Studienfach.Student_ID
GROUP BY Student.Student_ID,Vorname,Nachname
ORDER BY COUNT(Studienfach_ID) DESC;

#b)
SELECT Pruefung.Pruefung_ID, Datum_Pruefung, COUNT(Student_ID)
FROM Student_Pruefung RIGHT JOIN Pruefung ON Student_Pruefung.Pruefung_ID=Pruefung.Pruefung_ID
GROUP BY Pruefung.Pruefung_ID, Datum_Pruefung
ORDER BY Datum_Pruefung;

#c)
SELECT Studienfach.Studienfach_ID,Bezeichnung,COUNT(Pruefung_ID)
FROM Studienfach LEFT JOIN Pruefung ON Studienfach.Studienfach_ID=Pruefung.Studienfach_ID
GROUP BY Studienfach.Studienfach_ID,Bezeichnung
ORDER BY COUNT(Pruefung_ID);

#d)
SELECT Student.Student_ID,Vorname,Nachname,COUNT(Pruefung_ID)
FROM Student LEFT JOIN Student_Pruefung ON student.Student_ID=student_pruefung.Student_ID AND Note<=3
GROUP BY Student.Student_ID,Vorname,Nachname HAVING AVG(ifNULL(Note,1))<4
ORDER BY Nachname;