# Musterlösung zu FPA_03_03_01_bis_03 (d)


#(1)
ALTER TABLE Bank RENAME Bankinstitut;

#(2)
ALTER TABLE Bankinstitut CHANGE Bank_ID Bankinstitut_ID INT(11) AUTO_INCREMENT;
ALTER TABLE Konto        CHANGE Bank_ID Bankinstitut_ID INT(11) NOT NULL;