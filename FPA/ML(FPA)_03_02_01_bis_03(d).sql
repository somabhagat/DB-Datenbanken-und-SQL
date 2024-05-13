# Musterlösung zu FPA_03_02_01_bis_03 (d)


#(2)
ALTER TABLE Frau ADD Frau_Geburtsdatum DATE NOT NULL;
ALTER TABLE Frau ADD Frau_Geburtsort VARCHAR(255) NOT NULL;

ALTER TABLE Mann ADD Mann_Geburtsdatum DATE NOT NULL;
ALTER TABLE Mann ADD Mann_Geburtsort VARCHAR(255) NOT NULL;

#(1)
ALTER TABLE Frau DROP Frau_Geburtsdatum;
ALTER TABLE Frau DROP Frau_Geburtsort;

ALTER TABLE Mann DROP Mann_Geburtsdatum;
ALTER TABLE Mann DROP Mann_Geburtsort;