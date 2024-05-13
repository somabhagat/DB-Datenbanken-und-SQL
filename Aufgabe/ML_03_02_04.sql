# Musterlösung zu A_03_02_04


#a)
SELECT DISTINCT Vorname,Nachname,Email
FROM Kunde INNER JOIN Abrechnung ON Kunde.Kunde_ID=Abrechnung.Kunde_id AND Kunde.Kunde_ID>2
     INNER JOIN Abrechnung_Produkt ON Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID AND Datum > "2021-04-30"
     INNER JOIN Produkt ON Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_ID AND Euro_Preis>30
ORDER BY Nachname,Vorname;
##############################################################################################################################
#HINWEIS: 
# Eine Bedingung kann erst gesetzt werden, wenn der "bisherige" JOIN das durch die Bedingung angesprochene Attribut besitzt.

# Euro_Preis>30 kann daher z.B. noch nicht innerhalb der ersten ON-Klausel eingetragen werden.
# Allgemeingültige Regel: 
# Stets wäre es korrekt, wenn alle Nicht-Schlüssel-Bedingungen (hier also Kunde_ID>2 // Datum>"2021-04-30" // Euro_Preis>30)
# erst in der letzten ON-Klausel gesetzt würden:
/*

    ... INNER JOIN Produkt ON Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_ID 
                              AND Kunde_ID>2
                              AND Datum>"2021-04-30"
                              AND Euro_Preis>30
*/
##############################################################################################################################

#b)
SELECT Produkt_Name,Abrechnung_ID
FROM Abrechnung_Produkt RIGHT JOIN Produkt ON Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
WHERE Euro_preis<100;

# HINWEIS, die folgende Lösung wäre inkorrekt, da dann auch das 1000 Euro teure Produkt "TroppoCaro" ausgegeben werden würde:

SELECT Produkt_Name,Abrechnung_ID
FROM Abrechnung_Produkt RIGHT JOIN Produkt ON Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id AND Euro_preis<100;

# BEGRÜNDUNG: Die Funktionalität von RIGHT JOIN erzwingt die Ausgabe von Produkten, AUCH DANN, wenn sie die Preis-Bedingung NICHT erfüllen!


#c)
SELECT DISTINCT Hersteller_Name
FROM Abrechnung_Produkt INNER JOIN Produkt ON Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
     INNER JOIN Hersteller ON Produkt.Hersteller_ID=Hersteller.Hersteller_ID
ORDER BY Hersteller_Name DESC;


#d)
SELECT Produkt_Name,Euro_Preis,Hersteller_Name, Spedition_Name
FROM Produkt RIGHT JOIN Hersteller ON Produkt.Hersteller_ID=Hersteller.Hersteller_ID AND Euro_preis>=30 AND Euro_Preis<=200
     RIGHT JOIN Spedition ON Hersteller.Spedition_ID=Spedition.Spedition_ID
ORDER BY Spedition_Name,Produkt_Name; 
