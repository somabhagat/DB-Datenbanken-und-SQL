# Musterlösung zu FPA_03_04_01_bis_03 (c)


#(1)
ALTER TABLE Zitat ADD Philosoph_ID INT(11);
ALTER TABLE Zitat ADD FOREIGN KEY(Philosoph_ID) REFERENCES Philosoph(Philosoph_ID);

#(2)
ALTER TABLE Zitat ADD Buch_ID INT(11);
ALTER TABLE Zitat ADD FOREIGN KEY(Buch_ID) REFERENCES Buch(Buch_ID);

#(3)
ALTER TABLE Buch ADD Philosoph_ID INT(11);
ALTER TABLE Buch ADD FOREIGN KEY(Philosoph_ID) REFERENCES Philosoph(Philosoph_ID);

#(4)
ALTER TABLE Philosoph ADD Todesjahr INT(11);