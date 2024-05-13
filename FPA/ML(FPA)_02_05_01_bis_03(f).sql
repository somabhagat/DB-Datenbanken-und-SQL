# Musterlösung zu FPA_02_05_01_bis_03(f)


#(1)
SELECT Vorname,Nachname FROM Person
WHERE Person_ID>1 AND Geburtstag<"2016-01-01"
ORDER BY Nachname,Vorname LIMIT 10;

#(2)
SELECT DISTINCT Ort_ID FROM Foto
WHERE Person_ID=1
ORDER BY Ort_ID DESC LIMIT 1,2;

#(3)
SELECT Ort_Name FROM Ort
WHERE Ort_ID>1 AND Ort_ID<10
ORDER BY Ort_Name LIMIT 5;

#(4)
SELECT DISTINCT Person_ID FROM Foto
WHERE Ort_ID=2
ORDER BY Person_ID LIMIT 1,5;

#(5)
SELECT * FROM Ort
WHERE NOT Ort_Name="Berlin" AND NOT Ort_Name="Hamburg"
ORDER BY Ort_ID DESC;