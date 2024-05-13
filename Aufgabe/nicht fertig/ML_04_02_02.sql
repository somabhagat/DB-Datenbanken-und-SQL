# Musterlösung zu A_04_02_02


#a)
SELECT CONCAT(Euro_Preis," €") AS "Produkt-Preis" 
FROM Produkt
ORDER BY Euro_Preis;

#b)
SELECT CONCAT("Frau ",Vorname," ",Nachname)
FROM Kunde
WHERE RIGHT(Vorname,1)="a";

#c(1)
SELECT DISTINCT Produkt_Name
FROM Produkt NATURAL JOIN Abrechnung_Produkt;

#c(2)
SELECT Hersteller_Name,COUNT(Abrechnung_ID)    
FROM Abrechnung_Produkt NATURAL RIGHT JOIN Produkt
     NATURAL RIGHT JOIN Hersteller
GROUP BY Hersteller_Name;        
# HINWEIS: COUNT(Produkt_ID) würde bei der Ladenhut AG fälschlich den Wert 1 zurückgeben, da Ladenhut zwar (wie Hatnix 1992) ...
#          ... kein Produkt verkaufte, aber zumindest 1 Produkt im Sortiment von Geld_her hat (und dessen ID würde gezählt)

#d(1)

	INSERT INTO Spedition(Spedition_Name) VALUES ("Obelix GmbH & Co. KG");
    
    INSERT INTO Hersteller(Spedition_ID,Hersteller_Name) 
    VALUES ((SELECT Spedition_ID FROM Spedition WHERE Spedition_Name="Obelix GmbH & Co. KG"),"Asterix AG");
    
    INSERT INTO Produkt(Hersteller_ID,Produkt_Name,Euro_Preis) VALUES
    ((SELECT Hersteller_ID FROM Hersteller WHERE Hersteller_Name="Asterix AG"),"Astra I",200),
    ((SELECT Hersteller_ID FROM Hersteller WHERE Hersteller_Name="Asterix AG"),"Astra II",350);

# HINWEIS: Die Verwendung des Subselects hat den Vorteil, dass man "nicht zu Fuß" ermitteln muss, ...
#          ... welche IDs durch AUTO_INCREMENT vergeben wurden.
#          Problematisch wäre dies allerdings, falls es mehrere namensgleiche Hersteller gäbe. 
#          In diesem Fall müssten die entsprechenden IDs händisch vergeben werden.

#d(2)

	UPDATE Produkt SET Euro_Preis=Euro_Preis*1.1;
    UPDATE Produkt SET Euro_Preis=100 WHERE Euro_Preis>100;

