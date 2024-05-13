#Musterlösungen zu FPA_02_02_03_bis_04(d)


#(1)
CREATE TABLE Mitarbeiter_Krankheit
(
    Mitarbeiter_ID INT(11) NOT NULL,
    Krankheit_ID INT(11) NOT NULL,
    FOREIGN KEY(Mitarbeiter_ID) REFERENCES Mitarbeiter(Mitarbeiter_ID),
    FOREIGN KEY(Krankheit_ID) REFERENCES Krankheit(Krankheit_ID)
);
######################################################################
# ERLÄUTERUNG:                                                       #
# Es handelt sich um eine m:n-Beziehung, ...                         #
# ... denn ein Mitarbeiter kann MEHRERE Krankheiten gehabt haben ... # 
# ... und eine Krankheit kann MEHRERE Mitarbeiter befallen haben.    #
# => Hilfstabelle "Mitarbeiter_Krankheit"                            #
######################################################################


#(2)
CREATE TABLE Hersteller
(
    Hersteller_ID INT(11) AUTO_INCREMENT,
    Hersteller_Name VARCHAR(255) NOT NULL,
    Strasse VARCHAR(255) NOT NULL,
    Ort VARCHAR(255) NOT NULL,
    PLZ INT(11) NOT NULL,
    PRIMARY KEY(Hersteller_ID)
);

ALTER TABLE Medikament ADD Hersteller_ID INT(11) NOT NULL;
ALTER TABLE Medikament ADD FOREIGN KEY(Hersteller_ID) REFERENCES Hersteller(Hersteller_ID);


#(3)
ALTER TABLE Mitarbeiter DROP FOREIGN KEY Mitarbeiter_ibfk_1;
ALTER TABLE Mitarbeiter DROP Filiale_ID;

CREATE TABLE Mitarbeiter_Filiale
(
    Mitarbeiter_ID INT(11) NOT NULL,
    Filiale_ID INT(11) NOT NULL,
    FOREIGN KEY(Mitarbeiter_ID) REFERENCES Mitarbeiter(Mitarbeiter_ID),
    FOREIGN KEY(Filiale_ID) REFERENCES Filiale(Filiale_ID)
);
#########################################################################
# ERLÄUTERUNG:                                                          #
# Zuerst wird der Fremdschlüssel in der Tabelle "Mitarbeiter" gelöscht. #
# Anschließend wird eine Hilfstabelle eingeführt, da die Beziehung ...  # 
# ... zwischen Mitarbeiter und Filiale nun eine m:n-Beziehung ist       #
#########################################################################