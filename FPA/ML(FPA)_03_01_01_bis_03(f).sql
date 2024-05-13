# Musterlösung zu FPA_03_01_01_bis_03(f)


#(1)
# Der folgende Befehl scheitert mit der Fehlermeldung: 
# Doppelter Eintrag '1-1' für Schlüssel 'PRIMARY'

INSERT INTO Person_Sprache(Person_ID,Sprache_ID,Sprachqualitaet)
VALUES (1,1,"gut");

# Die Fehlermeldung erscheint, weil der zusammengesetzte PK aus Person_ID und Sprache_ID besteht ...
# ... und bereits ein Datensatz mit den Werten (1,1,...) existiert.

# Die Fehlermeldung ist wünschenswert, weil ein erneuter Eintrag von (1,1, ...) bedeuten würde, ...
# ... dass Axel Amanns(ID=1) Italienisch(ID=1)-Kenntnisse zum zweiten mal eingetragen werden. 
# Dies aber ist dann entweder redundant (falls die Sprachqualität identisch zu der zuvor eingetragenen ist) ...
# ... oder aber sogar inkonsistent, wenn die Sprachqualität des zweiten Eintrags dem ersten Eintrag widerspricht. 


#(2)
SELECT Vorname,Nachname
FROM Person,Person_Sprache,Sprache
WHERE Bezeichnung_Sprache="Italienisch"
      AND Person.Person_ID=Person_Sprache.Person_ID
      AND Person_Sprache.Sprache_ID=Sprache.Sprache_ID
ORDER BY Nachname,Vorname;


#(3)
SELECT DISTINCT Bezeichnung_Land
FROM Person_Sprache,Sprache,Sprache_Land,Land
WHERE Sprachqualitaet="fließend"
      AND Person_Sprache.Sprache_ID=Sprache.Sprache_ID
      AND Sprache.Sprache_ID=Sprache_Land.Sprache_ID
      AND Sprache_Land.Land_ID=Land.Land_ID
ORDER BY Bezeichnung_Land DESC;


#(4)
SELECT DISTINCT Person.*
FROM Person,Person_Sprache,Sprache,Sprache_Land,Land
WHERE Bezeichnung_Land="Schweiz" OR Bezeichnung_Land="Dänemark"
      AND Person.Person_ID=Person_Sprache.Person_ID
      AND Person_Sprache.Sprache_ID=Sprache.Sprache_ID
      AND Sprache.Sprache_ID=Sprache_Land.Sprache_ID
      AND Sprache_Land.Land_ID=Land.Land_ID
ORDER BY Person.Person_ID;

# Hinweis: Die Kurzschreibweise Person.* ist günstig, wenn Sie alle Daten aus Person, ...
#          ... nicht aber alle Daten des gesamten Joins ausgeben lassen wollen (denn dann würde ja "*" reichen).


#(5)
SELECT DISTINCT Bezeichnung_Sprache
FROM Person,Person_Sprache,Sprache
WHERE (Sprachqualitaet="gut" OR Sprachqualitaet="fließend")
      AND(Ort="Berlin" OR Ort="Chemnitz")
      AND Person.Person_ID=Person_Sprache.Person_ID
      AND Person_Sprache.Sprache_ID=Sprache.Sprache_ID;
