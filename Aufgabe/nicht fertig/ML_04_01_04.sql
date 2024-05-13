# Musterlösung zu A_04_01_04

#a)
ALTER TABLE Mieter DROP FOREIGN KEY Mieter_ibfk_1;
ALTER TABLE Geschaefte DROP FOREIGN KEY Geschaefte_ibfk_1;

ALTER TABLE Mieter ADD FOREIGN KEY(Haus_ID) REFERENCES Haeuser(Haus_ID) ON DELETE SET NULL;
ALTER TABLE Geschaefte ADD FOREIGN KEY(Haus_ID) REFERENCES Haeuser(Haus_ID) ON DELETE CASCADE;


#b)
DELETE FROM Haeuser WHERE Haus_ID=1;
INSERT INTO Geschaefte VALUES (3,NULL,"Supermarkt");


#c)
SELECT Haeuser.Haus_id, Standort,Nachname,Branche
FROM Mieter LEFT JOIN Haeuser ON Mieter.Haus_id=Haeuser.Haus_id
     LEFT JOIN Geschaefte ON Haeuser.Haus_id=Geschaefte.Haus_id
     
UNION

SELECT Haeuser.Haus_id, Standort,Nachname,Branche
FROM Mieter RIGHT JOIN Haeuser ON Mieter.Haus_id=Haeuser.Haus_id
     RIGHT JOIN Geschaefte ON Haeuser.Haus_id=Geschaefte.Haus_id;