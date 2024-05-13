# Musterlösung zu A_02_03_01


#a)
INSERT INTO Kunde(Email,Nachname,Vorname) VALUES ("a@b","Mustermann","Martha"); 

#b)
INSERT INTO Abrechnung VALUES (1,2,"2022-02-02");
# Fehlermeldung: Fremdschlüsselbeziehung ist nicht korrekt
# Begründung:    In der Tabelle Kunde existiert noch keine Entität mit der ID 2, also kann auch keine Abrechnung akzeptiert werden, ...
#                ... die sich auf einen Kunden mit der ID=2 bezieht (da dies die "Referentielle Integrität" der Datenbank verletzen würde) 

#c)     
INSERT INTO Abrechnung VALUES (1,2,"2022-02-02");

#d)     
INSERT INTO Abrechnung VALUES (1,1,"2022-02-02");

#e(1)
# Da es noch keine eingetragenen Produkte gibt, kann auf diese nicht verwiesen werden
# Weil zudem bei beiden Fremdschlüsseln der Hilfstabelle der Constraint NOT NULL gesetzt wurde, ... 
# ... kann ich die Produkt_ID auch nicht weglassen (bzw. auf NULL setzen)

#e(2)
INSERT INTO Spedition VALUES (1,"Stolper AG");
# Bemerkung: Da ich alle Attribute fülle, und dies in jener Reihenfolge, mit der ich diese bei CREATE TABLE Spedition eingeführt hatte, ...
#            ... kann ich auf die explizite Mitteilung der zu füllenden Attribute verzichten, also auf die Klammer hinter dem Tabellenname

#f)
INSERT INTO Hersteller(Hersteller_ID,Spedition_ID,Hersteller_Name) VALUES (1,1,"Wucher AG");
# Bemerkung: AUCH wenn ich alle Attribute füllen möchte, und dies in jener Reihenfolge, mit der ich diese bei CREATE TABLE Hersteller eingeführt hatte, ...
#            ... darf ich dennoch die explizite Mitteilung der zu füllenden Attribute vornehmen, also die Klammer hinter dem Tabellennamen notieren, ...
#            ... um z.B. den Code für andere Leser besser verständlich zu machen 

#g)
INSERT INTO Produkt VALUES (1,1,"Murks I",50);

#h)
INSERT INTO Produkt VALUES (2,1,"Murks II",50);

#i)
DELETE FROM Produkt WHERE Produkt_ID=1;

#j)
UPDATE Produkt SET Produkt_Name="Bombig", Euro_Preis=100 WHERE Produkt_ID=2;

#k)
INSERT INTO Abrechnung_Produkt(Abrechnung_ID,Produkt_ID) VALUES (1,2);
