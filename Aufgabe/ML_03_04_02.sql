# Musterlösung zu A_03_04_02


#(1)
SELECT Kunde.Kunde_ID,Vorname,Nachname
FROM Kunde 
LEFT JOIN Abrechnung ON Kunde.Kunde_ID=Abrechnung.Kunde_id
LEFT JOIN Abrechnung_Produkt ON Abrechnung.Abrechnung_ID=Abrechnung_produkt.Abrechnung_ID
GROUP BY Kunde.Kunde_ID,Vorname,Nachname 
HAVING COUNT(Abrechnung_Produkt.Abrechnung_ID)=0;

#(2)
SELECT Hersteller.Hersteller_ID,Hersteller_Name,ifNULL(AVG(Euro_Preis),0) AS Durchschnittspreis # (an Stelle von 0 auch jeder andere Wert kleiner 4 möglich)
FROM Produkt RIGHT JOIN Hersteller ON Produkt.Hersteller_ID=Hersteller.Hersteller_ID
GROUP BY Hersteller.Hersteller_ID,Hersteller_Name 
ORDER BY AVG(Euro_Preis) DESC;

#(3)
SELECT spedition.Spedition_ID, spedition.Spedition_Name, 
IFNULL(SUM(produkt.Euro_Preis),0) AS Gesamtwert
FROM abrechnung_produkt 
LEFT JOIN produkt ON abrechnung_produkt.Produkt_ID = produkt.Produkt_ID
LEFT JOIN Hersteller ON Produkt.Hersteller_ID=Hersteller.Hersteller_ID
RIGHT JOIN Spedition ON Hersteller.Spedition_ID=Spedition.Spedition_ID
GROUP BY spedition.Spedition_ID
ORDER BY Gesamtwert DESC


#(4)
SELECT Produkt.Produkt_ID,Produkt.Produkt_Name,COUNT(Abrechnung_Produkt.Produkt_ID)
FROM Kunde RIGHT JOIN Abrechnung ON Kunde.Kunde_ID=Abrechnung.Kunde_id 
     RIGHT JOIN Abrechnung_Produkt ON Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
     RIGHT JOIN Produkt ON Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id AND Vorname="Vera" AND Nachname="Deise"
GROUP BY Produkt.Produkt_ID,Produkt.Produkt_Name
ORDER BY COUNT(Abrechnung_Produkt.Produkt_ID) DESC;

/*

Die Bedingung "B": (Vorname="Vera" AND Nachname="Deise") muss im letzten ON erfolgen, 
da hier mit RIGHT JOIN jene Tabelle gejoined wird, deren Ausgabe erzwungen werden soll, ...
... nämlich die Tabelle Produkt (es sollen ja alle Produkte ausgegeben werden, also auch jene, die nie von Vera Deise gekauft wurden).

FALSCH HINGEGEN:
a) B im ersten ON => Es würden fälschlich Abrechnungen berücksichtigt, selbst wenn diese nicht von Vera Deise stammen [also schlicht alle Abrechnungen]
b) B im zweiten ON => Es würden fälschlich Einkäufe berücksichtigt, selbst wenn diese nicht von Vera Deise vorgenommen wurden [also alle Einkäufe, daher selbes Resultat wie in a)]

Ebenso klappt nicht, die Bedingung in der folgenden WHERE Klausel auszulagern:
	WHERE Vorname="Vera" AND Nachname="Deise" OR Abrechnung_Produkt.Produkt_ID IS NULL
weil hierbei all jene Produkte verloren gehen, die zwar mindestens einmal verkauft wurden, dies aber nie an Vera Deise 

*/

#(5)
SELECT Abrechnung.Abrechnung_ID,Datum,ifNULL(SUM(Euro_Preis),0)
FROM Abrechnung LEFT JOIN Abrechnung_Produkt ON Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
     LEFT JOIN Produkt ON Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id 
GROUP BY Abrechnung.Abrechnung_ID,Datum HAVING ifNULL(SUM(Euro_Preis),0)<=100 # ifNULL notwendig, da die Bedingung NULL<=100 als NICHT ERFÜLLT gilt!
ORDER BY ifNULL(SUM(Euro_Preis),0);