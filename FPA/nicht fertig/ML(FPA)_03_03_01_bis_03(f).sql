# Musterlösung zu FPA_03_03_01_bis_03 (f)


#(1)
DELETE FROM Transaktion WHERE Betrag=0;

#(2)
SELECT COUNT(Transaktion_ID) FROM Transaktion
WHERE Datum>="2021-02-01" AND Datum<="2021-02-28";

#(3)
SELECT Person.Person_ID,Vorname,Nachname,SUM(Betrag)
FROM Person,Konto,Transaktion
WHERE Person.Person_ID=Konto.Person_ID
      AND Konto.Konto_ID=Transaktion.Konto_ID
GROUP BY Person.Person_ID,Vorname,Nachname
ORDER BY SUM(Betrag);

#(4)
SELECT Nachname,COUNT(DISTINCT Bankinstitut.Bankinstitut_ID)
FROM Person,Konto,Bankinstitut
WHERE Person.Person_ID=Konto.Person_ID
      AND Konto.Bankinstitut_ID=Bankinstitut.Bankinstitut_ID
GROUP BY Nachname # Kunde_ID wäre natürlich besser, aber das gilt auch für die Ausgabe und ist daher ein "Problem" der Aufgabenstellung
ORDER BY COUNT(DISTINCT Bankinstitut.Bankinstitut_ID) DESC;

#(5)
SELECT Konto.Konto_ID,Kontonummer,MAX(Betrag)
FROM Konto,Transaktion
WHERE Konto.Konto_ID=Transaktion.Konto_ID
GROUP BY Konto.Konto_ID,Kontonummer HAVING SUM(Betrag)>0
ORDER BY MAX(Betrag)DESC;