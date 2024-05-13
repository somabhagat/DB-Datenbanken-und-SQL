Musterlösungen zu A_03_04_01

#a)
SELECT Kunde.Kunde_ID, Nachname, MAX(Abrechnung_ID)
FROM Kunde LEFT JOIN Abrechnung ON kunde.Kunde_ID=abrechnung.Kunde_id
GROUP BY Kunde.Kunde_ID, Nachname;

#b)
LEFT JOIN Abrechnung_Produkt ON abrechnung.Abrechnung_ID=abrechnung_produkt.Abrechnung_ID 
LEFT JOIN Produkt ON Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id 
                     AND Euro_Preis<80 
#WHERE Euro_Preis<80 #OR Euro_Preis IS NULL
GROUP BY Kunde.Kunde_ID,Email;

/*
ERLÄUTERUNG:
1) Wenn ich die Bedingung (Euro_Preis<80) in die der ON-Klausel notiere,
   so sorge ich dafür, dass die Funktionalität von LEFT JOIN auch bei
   jenen Datensätzen greift, die durch LEFT JOIN "gerettet" werden, selbst
   wenn sie keinem Produkt zugeordnet werden können (also auch keinem Preis)
   denn ein nicht vorhandener Preis (NULL) erfüllt NICHT die Bedingung,
   "kleiner als 80" zu sein.
2) Würde man hingegen mit der WHERE.Klausel arbeiten und dort ausschließlich
   die Bedingung Euro_Preis<80 notieren, so würden alle Datensätze verloren
   gehen, die diese Bedingung nicht erfüllen (und also auch jene Datensätze),
   die wir zuvor "mühsam" mit LEFT JOIN gerettet hatten.
3) Man könnte dies (hübsche Teilnehmer.Idee, allerdings nur mit "neuer
   Syntax" lösbar) auch in der WHERE-Klausel lösen:
   Hierfür müssen jene Fälle abgefangen werden, in denen der Preis NULL
   ist. Diese Datensätze, die zuvor durch LEFT JOIN "gerettet" wurden,
   sollen ja nun nicht verloren gehen => OR Euro_Preis IS NULL
   
#c)
SELECT Hersteller.Hersteller_ID, 
       Hersteller_Name,
       COUNT(Abrechnung_Produkt.Produkt_ID)
FROM Abrechnung RIGHT JOIN abrechnung_produkt ON Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
                                                #AND Datum>="2021-11-01"
                                                #AND Datum<="2021-11-30"
RIGHT JOIN Produkt ON Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
RIGHT JOIN Hersteller ON Produkt.Hersteller_ID=Hersteller.Hersteller_ID
WHERE (Datum>="2021-11-01" AND Datum<="2021-11-30")
      OR  Datum IS NULL
GROUP BY Hersteller.Hersteller_ID,Hersteller_Name
ORDER BY  COUNT(Abrechnung_Produkt.Produkt_ID) DESC;

/*
Erläuterung:
Wir wollen nicht, dass Hersteller-Einkauf-Verknüpfungen überleben,
die NICHT von einem Einkauf im November 2021 sprechen. Daher müssen
wir diese mit WHERE herausfiltern, da die RIGHT-JOIN-Funktionalität
ansonsten auch jene Hersteller-Einkauf-Verknüpfungen erzwingt, die sich
nicht auf diesen November beziehen.

Problem: 
Dadurch verlieren wir dann aber auch jene Hersteller, die NIE etwas verkauften.
Ebenso jene, die nur außerhalb dieses Novembers etwas verkauften.              
Dies können wir dann aber durch den (OR IS NULL)-Zusatz (in der WHERE-Klause) vermeiden.
*/

#d)
SELECT Abrechnung.Abrechnung_ID,
       Datum,
       COUNT(Abrechnung_produkt.Produkt_ID)
FROM Kunde INNER JOIN abrechnung ON Kunde.Kunde_ID=Abrechnung.Kunde_id
     LEFT JOIN abrechnung_produkt ON Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
WHERE Vorname="Witali" AND Nachname="Myrnow"
GROUP BY Abrechnung.Abrechnung_ID,Datum
HAVING COUNT(Abrechnung_produkt.Produkt_ID)>=2
ORDER BY Datum;

/*
Antwort auf die Zusatzfrage:
In diesem Fall reicht die Verwendung des INNER JOIN, beim ersten JOIN: 
Alle interessierenden Datensätze sind ohnehin verknüpfbar:
(Jede Abrechnung von Witali Myrnow ist verknüpfbar, mit Witali Myrnow)

Beim zweiten JOIN muss dies nicht notwendigerweise sein
(denn es kann auch Abrechnungen geben, auf denen nichts bestellt wurde!)
Dass dies bei keiner Abrechnung von Witali Myrnow der Fall ist, ist ja
nur Zufall dieser Aufgabenstellung
=> der zweite JOIN sollte LEFT JOIN sein, um auch jene Abrechnungen zu
   "retten", die von Witali Myrnow stammen, aber keinem Einkauf
   zugeordnet werden können.
   
HINWEIS:
Machen sie sich am Beispiel von Peter Kaufnix klar:
(und verzichten Sie dabei auf die HAVING-Klausel)
Betrachten Sie hierbei die beiden Ausgabetabellen für:
1) zweiter JOIN = INNER JOIN
2) zweiter JOIN = LEFT JOIN
*/

SELECT Abrechnung.Abrechnung_ID,
       Datum,
       COUNT(Abrechnung_produkt.Produkt_ID)
FROM Kunde INNER JOIN abrechnung ON Kunde.Kunde_ID=Abrechnung.Kunde_id
     INNER JOIN abrechnung_produkt ON Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
WHERE Vorname="Peter" AND Nachname="Kaufnix"
GROUP BY Abrechnung.Abrechnung_ID,Datum
#HAVING COUNT(Abrechnung_produkt.Produkt_ID)>=2
ORDER BY Datum;
