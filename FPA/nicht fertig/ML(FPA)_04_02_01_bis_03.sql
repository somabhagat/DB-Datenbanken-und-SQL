# Musterlösung zu FPA_04_02_01_bis_03


############################################################################################
#                                      a)                                                  #
############################################################################################
CREATE DATABASE konto_db;
USE konto_db;

CREATE TABLE Konten
(
    konto_id int(3) NOT NULL AUTO_INCREMENT,
    iban int(20) NOT NULL,
    bic int(20) NOT NULL,
    konto_bezeichnung varchar(20),
    konto_stand float(11,2) NOT NULL, 
    PRIMARY KEY(konto_id)
);
INSERT INTO Konten(iban,bic,konto_bezeichnung,konto_stand)
VALUES
(123,456,"Firmen-Konto",100350.64),
(789,101,"Privat-Konto",10250);

CREATE TABLE Produkte
(
    produkt_id int(3) NOT NULL AUTO_INCREMENT,
    produkt_bezeichnung varchar(20),
    produkt_einkaufpreis float(10,2) NOT NULL, 
    produkt_verkaufpreis float(11,2) NOT NULL,
    PRIMARY KEY(produkt_id)
);
INSERT INTO Produkte(produkt_bezeichnung,produkt_einkaufpreis,produkt_verkaufpreis)
VALUES
("Alpha",100,200),
("Beta",350.64,400),
("Gamma",200,300);

CREATE TABLE Einkaeufe
(
    einkauf_id int(6) NOT NULL AUTO_INCREMENT,
    produkt_id int(3),
    datum date,
    PRIMARY KEY(einkauf_id),
    FOREIGN KEY(produkt_id) REFERENCES produkte(produkt_id)
);
INSERT INTO Einkaeufe(produkt_id,datum)
VALUES
(1,"2011-03-12"),
(3,"2011-03-13"),
(3,"2011-03-14"),
(2,"2011-03-15");


############################################################################################
#                                      b)                                                  #
############################################################################################
ALTER TABLE produkte ADD anzahl int(5) DEFAULT 0;


############################################################################################
#                                      c)                                                  #
############################################################################################
UPDATE konten 
SET konto_stand=konto_stand-250
WHERE konto_bezeichnung="Privat-Konto";


############################################################################################
#                                      d)                                                  #
############################################################################################

INSERT INTO einkaeufe(produkt_id,datum) VALUES (2,"2001-01-01");
UPDATE produkte SET anzahl=anzahl+1 WHERE produkt_id=2;
UPDATE konten SET konto_stand=konto_stand-
                                                         (
                                                             SELECT produkt_einkaufpreis 
                                                                                    	    FROM produkte 
                                                             WHERE produkt_id=2
                                                         )
WHERE konto_bezeichnung="Firmen-Konto";



############################################################################################
#                                      e)                                                  #
############################################################################################
ALTER TABLE einkaeufe ADD konto_id int(3)DEFAULT 1;

#########################################################################################
# BEMERKUNG:                                                                            #
#           Dass das Firmenkonto den Wert 1 hat, wurde in diesem Fall nachgeschaut.     #
#########################################################################################


ALTER TABLE einkaeufe ADD FOREIGN KEY(konto_id) REFERENCES Konten(konto_id);
