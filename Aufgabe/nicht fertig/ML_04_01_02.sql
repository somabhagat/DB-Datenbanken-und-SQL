# Musterlösung zu A_04_01_02


#a)
#(1) Ermittlung der internen Namensgebung des Fremdschlüssels Produkt_ID (aus der Tabelle Abrechnung_Produkt)
SHOW CREATE TABLE Abrechnung_Produkt; # => Abrechnung_Produkt_ibfk_2

#(2) Löschen der alten Fremdschlüsselbeziehung
ALTER TABLE Abrechnung_Produkt DROP FOREIGN KEY Abrechnung_Produkt_ibfk_2;

#(3) Neue Fremdchlüsselbeziehung mit der gewünschten Referenz-Option
ALTER TABLE Abrechnung_Produkt ADD FOREIGN KEY(Produkt_ID) REFERENCES Produkt(Produkt_ID) ON DELETE CASCADE;


#b)
#(2) Das Folgende (genau genommen der Punkt 1b) kann nur gesetzt werden, wenn NULL in Kunde_ID (der Tabelle Abrechnung) zulässig ist! 
ALTER TABLE Abrechnung CHANGE Kunde_ID Kunde_ID INT(11); # Beachten Sie bitte: Die Default-Einstellung ist NULL!

#(1a) Löschen der alten Fremdschlüsselbeziehung
ALTER TABLE Abrechnung DROP FOREIGN KEY Abrechnung_ibfk_1;
#(1b) Neue Fremdchlüsselbeziehung mit der gewünschten Referenz-Option
ALTER TABLE Abrechnung ADD FOREIGN KEY(Kunde_ID) REFERENCES Kunde(Kunde_ID) ON DELETE SET NULL; 

#(3) Test an Hand von Kunden 2
DELETE FROM Kunde WHERE Kunde_ID=2; # Sie werden anschliessend feststellen, dass die Abrechnungen 3 und 8 nun den Wert NULL haben ...
                                    # ... denn das sind die Abrechnungen des Kunden 2, denn nun gelöscht ist. 


#c) 
####################################################################################################################
# (1)                                                                                                              #
# Der erste Lösungsversuch stellt eine Faustformel vor, die stets alle gewünschten Ergebnisse ermittelt, ...       #
# ... dabei aber NICHT IMMER die performanteste Vorgehensweise beschreibt.                                         #
# ... ZUDEM kann es zu unerwünschen "Teilergebnissen" führen (siehe unten "NACHTEIL")                              #
#                                                                                                                  #
# Ihre Grundidee besteht darin, ...                                                                                # 
# ... für alle JOINs einen LEFT oder RIGHT JOIN zu verwenden und dabei ALLE KOMBINATIONEN durchzuspielen:          #
#                                                                                                                  #
# Im folgenden Beispiel also die 2*2=4 Kombinationen:                                                              #
# (wir kürzen der Übersichtilichkeithalber die Tabellen Mitarbeiter, Fahrzeug und Parkplatz durch M, F und P ab)   #
#                                                                                                                  #   
# 1. Kombination: M LEFT JOIN  F LEFT JOIN  P                                                                      #
# 2. Kombination: M LEFT JOIN  F RIGHT JOIN P                                                                      # 
# 3. Kombination: M RIGHT JOIN F LEFT JOIN  P                                                                      #
# 4. Kombination: M RIGHT JOIN F RIGHT JOIN P                                                                      #
####################################################################################################################

SELECT Mitarbeiter_Bezeichnung,
       Fahrzeug_Bezeichnung,
       Parkplatz_Bezeichnung
FROM Mitarbeiter LEFT JOIN Fahrzeug ON Mitarbeiter.Fahrzeug_id=Fahrzeug.Fahrzeug_id
     LEFT JOIN Parkplatz ON Fahrzeug.Parkplatz_id=Parkplatz.Parkplatz_id

UNION

SELECT Mitarbeiter_Bezeichnung,
       Fahrzeug_Bezeichnung,
       Parkplatz_Bezeichnung
FROM Mitarbeiter LEFT JOIN Fahrzeug ON Mitarbeiter.Fahrzeug_id=Fahrzeug.Fahrzeug_id
     RIGHT JOIN Parkplatz ON Fahrzeug.Parkplatz_id=Parkplatz.Parkplatz_id
     
UNION

SELECT Mitarbeiter_Bezeichnung,
       Fahrzeug_Bezeichnung,
       Parkplatz_Bezeichnung
FROM Mitarbeiter RIGHT JOIN Fahrzeug ON Mitarbeiter.Fahrzeug_id=Fahrzeug.Fahrzeug_id
     LEFT JOIN Parkplatz ON Fahrzeug.Parkplatz_id=Parkplatz.Parkplatz_id

UNION

SELECT Mitarbeiter_Bezeichnung,
       Fahrzeug_Bezeichnung,
       Parkplatz_Bezeichnung
FROM Mitarbeiter RIGHT JOIN Fahrzeug ON Mitarbeiter.Fahrzeug_id=Fahrzeug.Fahrzeug_id
     RIGHT JOIN Parkplatz ON Fahrzeug.Parkplatz_id=Parkplatz.Parkplatz_id;

#######################################################################################################################################
# NACHTEIL:                                                                                                                           # 
# Bei dieser Vorgehensweise wird (zum Beipiel) NICHT NUR der Datensatz (NULL,LKW,LKW-Parkplatz) ausgegeben, ...                       #
# ... sondern auch eine unerwünschte "Teillösung":                     (NULL,NULL,LKW-Parkplatz)                                      # 
# Es werden also tatsächlich ALLE Mitarbeiter, Fahrzeuge und Parkplätze ausgegeben, diese aber zum Teil ohne vorhandene Verknüpfung!  #
#######################################################################################################################################


###############################################################################################################################
# (2)                                                                                                                         #
# Die PERFEKTE LÖSUNG ist keine Faustformel, "erzwingt" ein Nachdenken über die konkrete Aufgabe, ...                         #    
# ... VERMEIDET aber die angesprochenen NACHTEILE des 1. "Lösungsversuches"                                                   #   
#                                                                                                                             #
# Wir betrachten die folgenden Kombinationen:                                                                                 #   
# 1. Kombination: M LEFT JOIN  F LEFT JOIN  P => Hier werden alle Mitarbeiter ausgegeben (auch die nicht verknüpfbaren)       #   
# 2. Kombination: M RIGHT JOIN F RIGHT JOIN P => Hier werden alle Parkplätze ausgegeben (auch die nicht verknüpfbaren)        #   
# 3. Kombination: M RIGHT JOIN F LEFT JOIN  P => Hier werden alle Fahrzeuge ausgegeben (auch die nicht verknüpfbaren)         #
#    (der erste RIGHT JOIN erzwingt die Ausgabe von Fahrzeugen, selbst wenn sie keinem Mitarbeiter zugeordnet werden können)  #
#    (der zweite LEFT JOIN erzwingt die Ausgabe von Fahrzeugen, selbst wenn diese keinem Parkplatz zugeordnet werden können)  #
###############################################################################################################################

SELECT Mitarbeiter_Bezeichnung,
       Fahrzeug_Bezeichnung,
       Parkplatz_Bezeichnung
FROM Mitarbeiter LEFT JOIN Fahrzeug ON Mitarbeiter.Fahrzeug_id=Fahrzeug.Fahrzeug_id
     LEFT JOIN Parkplatz ON Fahrzeug.Parkplatz_id=Parkplatz.Parkplatz_id

UNION

SELECT Mitarbeiter_Bezeichnung,
       Fahrzeug_Bezeichnung,
       Parkplatz_Bezeichnung
FROM Mitarbeiter RIGHT JOIN Fahrzeug ON Mitarbeiter.Fahrzeug_id=Fahrzeug.Fahrzeug_id
     RIGHT JOIN Parkplatz ON Fahrzeug.Parkplatz_id=Parkplatz.Parkplatz_id

UNION

SELECT Mitarbeiter_Bezeichnung,
       Fahrzeug_Bezeichnung,
       Parkplatz_Bezeichnung
FROM Mitarbeiter RIGHT JOIN Fahrzeug ON Mitarbeiter.Fahrzeug_id=Fahrzeug.Fahrzeug_id
     LEFT JOIN Parkplatz ON Fahrzeug.Parkplatz_id=Parkplatz.Parkplatz_id;