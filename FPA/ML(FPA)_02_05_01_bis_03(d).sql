# Musterlösung zu FPA_02_05_01_bis_03(c)


#(1)
ALTER TABLE Person ADD Geburtstag DATE NOT NULL;

#(2)
ALTER TABLE Person DROP FOREIGN KEY Person_ibfk_1;
ALTER TABLE Person DROP Ort_ID;