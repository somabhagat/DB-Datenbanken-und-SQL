# Musterlösung zu FPA_02_04_01_bis_03(f)

#(1)
DELETE FROM Person WHERE Nachname="Baumann" AND NOT Geburtsjahr>1970;

#(2)
DELETE FROM Person WHERE NOT Ort="Aachen" AND NOT Geburtsjahr>1981;

#(3)
DELETE FROM Lied WHERE Erscheinungsjahr=2000 AND Person_ID<10;

#(4)
DELETE FROM Person_Lied WHERE Person_ID<10 AND Lied_ID<10;

#(5)
# Die Aufgaben 1 bis 3 können ausgeführt werden, da sich in allen Fällen KEIN Datensatz findet, der die Bedingung erfüllt, ...
# ... daher kommt es zu keiner Fehlermeldung seitens der Fremdschlüsselüberprüfung.
# Die Aufgabe 4 kann ausgeführt werden, da es keinen Datensatz im Schema gibt, der sich (per Fremdschlüssel) auf die Hilfstabelle bezieht ...

#(6)
# Chemnitz hat (neben anderen) die PLZ 09111. Die führende 0 wird beim Typ INT nicht ausgegeben. Beim Typ INT ist dem nicht so.
