# Musterlösung zu A_02_03_04

#a)
INSERT INTO Kunde(Vorname,Nachname,Email) VALUES ("Stefania","Pace","stef@123");

#b)
DELETE FROM Kunde WHERE Nachname="Myrnow";
# Löschen verletzt die referentielle Integrität: Es gibt Abrechnungen, die sich auf Personen mit Nachname "Myrnow" beziehen.

#c)
DELETE FROM Kunde WHERE Kunde_ID=6;
# Funktioniert trotz Fremdschlüsselüberprüfung (FK-Check), denn es gibt KEINE Abrechnung, die sich auf diesen Kunden bezieht

#d)
INSERT INTO Abrechnung(Kunde_ID,Datum) VALUES (2,CURDATE());

#e)
DELETE FROM Abrechnung WHERE Datum < "2022-02-01";
# Löschen verletzt die referentielle Integrität: Es gibt Einkäufe (in der Hilfstabelle), die sich auf diese Abrechnungen beziehen

#f)
UPDATE Spedition SET Spedition_Name="Schnell und gut" WHERE Spedition_ID=2;

#g)
DELETE FROM Spedition;
# Löschen verletzt die referentielle Integrität: Es gibt Hersteller, die sich auf Speditionen beziehen.

#h)
Die Spedition "Ganzal Lein" (ID:6) kann trotz FK-Check gelöscht werden, da sich kein FK (aus Hersteller) auf sie bezieht.
DELETE FROM Spedition WHERE Spedition_ID=6;

#i)
UPDATE Hersteller SET Hersteller_Name="Abrakadabra", Spedition_ID=5 WHERE Hersteller_ID=2;

#j)
UPDATE Produkt SET Hersteller_ID=10 WHERE Produkt_ID=3;
# Der FK-Wert 10 verletzt die referentielle Integrität: Es gibt keinen Hersteller mit einer solchen ID.

#k)
TRUNCATE TABLE Abrechnung_Produkt;
# Funktioniert trotz FK-Check, denn es gibt KEINEN Datensatz aus anderen Tabellen, ...
# ... der sich mittels Fremdschlüssel auf Datensätze der Hilfstabelle beziehen.