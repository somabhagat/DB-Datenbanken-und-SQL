# Musterlösung zu A_03_05_03


#a)	
SELECT abrechnung_id 
FROM Abrechnungen
WHERE datum>
(
    SELECT datum
    FROM Abrechnungen
    WHERE abrechnung_id=3
);

#b)	
SELECT count(produkt_id)
FROM Produkte
WHERE €_preis>
(
    SELECT €_preis
    FROM Produkte
    WHERE produkt_id=1
);

#c)	
SELECT vorname,nachname
FROM Kunden
WHERE kunde_id>
(
    SELECT kunde_id
    FROM Kunden
    WHERE vorname="Vera" AND nachname="Deise"
); #ACHTUNG: klappt nur, falls NICHT mehrere Kunden „Vera Deise“ heißen

#d)	
SELECT vorname,nachname,SUM(€_preis) 
FROM Produkte 
NATURAL JOIN Abrechnung_Produkt
NATURAL JOIN Abrechnungen
NATURAL JOIN Kunden
GROUP BY kunde_id HAVING SUM(€_preis) >
(
   SELECT 0.2 * SUM( €_preis )
   FROM Produkte NATURAL JOIN Abrechnung_Produkt
);


#e)	
SELECT vorname,nachname, COUNT(abrechnung_id)
FROM Kunden
NATURAL JOIN Abrechnungen
GROUP BY kunde_id
HAVING COUNT(abrechnung_id) >
(
   SELECT COUNT(*)
   FROM Abrechnungen 
   WHERE kunde_id = 2
);

#f)	
SELECT hersteller_name, count( abrechnung_produkt_id )
FROM Hersteller
NATURAL JOIN Produkte
NATURAL JOIN Abrechnung_Produkt
GROUP BY hersteller_id
HAVING count( abrechnung_produkt_id ) > 
(
   ( SELECT count( * ) FROM Abrechnung_Produkt) 
   / 
   (SELECT count( * )FROM Hersteller )
);
