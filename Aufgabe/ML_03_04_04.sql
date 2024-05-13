# Musterlösung zu A_03_04_04


#a)
SELECT COUNT(Note)
FROM Student,Student_Pruefung
WHERE Student.Student_ID=Student_Pruefung.Student_ID
      AND Vorname="Axel" AND Nachname="Ast"
	  AND Note<3;

#b)
SELECT Student.Student_ID,Nachname,ifNULL(SUM(Dauer_Stunden),0)
FROM Student LEFT JOIN Student_Pruefung ON Student.Student_ID=Student_Pruefung.Student_ID
     LEFT JOIN Pruefung ON Student_Pruefung.Pruefung_ID=Pruefung.Pruefung_ID
     LEFT JOIN Student_Studienfach ON Student.Student_ID=Student_Studienfach.Student_ID
     LEFT JOIN Studienfach ON Student_Studienfach.Studienfach_ID=Studienfach.Studienfach_ID AND Pruefung.Studienfach_ID=Studienfach.Studienfach_ID
GROUP BY Student.Student_ID,Nachname
ORDER BY ifNULL(SUM(Dauer_Stunden),0) DESC;

#c)
SELECT Student.Student_ID,
       Vorname,
       Nachname,
       Datum_Immatrikulation,
       Datum_Exmatrikulation,
       Pruefung.Pruefung_ID,
       Datum_Pruefung
FROM Student,Student_Pruefung,Pruefung
WHERE Student.Student_ID=Student_Pruefung.Student_ID
	  AND Student_Pruefung.Pruefung_ID=Pruefung.Pruefung_ID 	
      AND (Datum_Pruefung<Datum_Immatrikulation OR Datum_Pruefung>Datum_Exmatrikulation);
	  
#d)
SELECT 10-COUNT(*) AS "Anzahl der unzulässigen Prüfungen"
FROM Student,Student_Pruefung,Pruefung,Student_Studienfach,Studienfach
WHERE Student.Student_ID=Student_Pruefung.Student_ID
      AND Student_Pruefung.Pruefung_ID=Pruefung.Pruefung_ID
      AND Pruefung.Studienfach_ID=Studienfach.Studienfach_ID
      AND Student.Student_ID=Student_Studienfach.Student_ID
      AND Student_Studienfach.Studienfach_ID=Studienfach.Studienfach_ID;