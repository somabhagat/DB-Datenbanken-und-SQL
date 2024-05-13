# Musterlösung zu A_03_02_03


#a)
SELECT DISTINCT Produkt_Name,Vorname,Nachname
FROM Kunde LEFT JOIN Abrechnung ON Kunde.Kunde_ID=Abrechnung.Kunde_id
     LEFT JOIN Abrechnung_Produkt ON Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID 
     LEFT JOIN Produkt ON Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id;
	 
#b)
SELECT DISTINCT Produkt_Name,Vorname,Nachname
FROM Kunde RIGHT JOIN Abrechnung ON Kunde.Kunde_ID=Abrechnung.Kunde_id
     RIGHT JOIN Abrechnung_Produkt ON Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID 
     RIGHT JOIN Produkt ON Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id;
	 
#c)
SELECT DISTINCT Datum,Spedition_Name
FROM Abrechnung RIGHT JOIN Abrechnung_Produkt ON Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
     RIGHT JOIN Produkt ON Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
     RIGHT JOIN Hersteller ON Produkt.Hersteller_ID=Hersteller.Hersteller_ID
     RIGHT JOIN Spedition ON Hersteller.Spedition_ID=Spedition.Spedition_ID;
	 
#d)
#######################
#(1) MIT WHERE-Klausel#
#######################
SELECT Produkt_Name,Hersteller_Name
FROM Produkt RIGHT JOIN Hersteller ON Produkt.Hersteller_ID=Hersteller.Hersteller_ID 
WHERE Euro_Preis>=50;

# Hier werden KEINE Hersteller ausgegeben, die KEIN Produkt im Sortiment von "Geld_her" haben, ...
# ... da "NULL" NICHT die Bedingung erfüllt "größer oder gleich 50 sein".

# Ebenfalls werden KEINE Hersteller ausgegeben, die nur Produkte unter 50 Euro anbieten, ...
# ... da diese durch die WHERE-Klausel herausgefiltert werden.

########################
#(2) OHNE WHERE-Klausel#
########################
SELECT Produkt_Name,Hersteller_Name
FROM Produkt RIGHT JOIN Hersteller ON Produkt.Hersteller_ID=Hersteller.Hersteller_ID AND Euro_Preis>=50;

# Hier werden ALLE Hersteller ausgegeben, also auch jene, die kein Produkt im Sortiment haben, oder deren Produkte unter 50 Euro liegen, ...
# ... da die Bedingung "Euro_Preis>=50" in der ON-Klausel eingetragen wurde und so die Funktionalität von RIGHT JOIN nutzen kann. 