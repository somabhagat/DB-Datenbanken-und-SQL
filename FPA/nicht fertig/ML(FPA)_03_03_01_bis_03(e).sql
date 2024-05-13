# Musterlösung zu FPA_03_03_01_bis_03 (e)


INSERT INTO Person(Vorname,Nachname)
VALUES
("Anna","Alster"),
("Bertha","Buche"),
("Chico","Cluse");

INSERT INTO Bankinstitut(Bank_Name,Strassenname,Hausnummer,Ort,PLZ)
VALUES
("Asche AG","Aue","1","Aachen","01234"),
("Buck GmbH","Bohle","2","Berlin","12345"),
("Chotter Hamburg","Cluse","3","Chemnitz","23456"),
("Deckel 99","Deich","4","Düsseldorf","34567");

INSERT INTO Konto(Person_ID,Bankinstitut_ID,Kontonummer)
VALUES
(1,1,0123456),
(1,2,1234567),
(2,3,2345678),
(3,2,3456789),
(3,4,4567890);

INSERT INTO Transaktion(Konto_ID,Betrag,Datum)
VALUES
(1,100,"2021-02-03"),
(3,0,"2021-02-04"),
(4,-300,"2021-02-05"),
(1,400,"2021-02-06"),
(5,-500,"2021-02-07"),
(5,-600,"2021-02-08"),
(1,700,"2021-02-09"),
(5,0,"2021-02-10"),
(3,9000,"2021-02-11"),
(4,-1000,"2021-02-12");