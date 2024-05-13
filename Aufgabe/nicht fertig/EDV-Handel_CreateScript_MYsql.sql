CREATE DATABASE IF NOT EXISTS edvHandel2;
USE edvHandel2; 

-- select * from mitarbeiter;

/* --- Tabs MIT Fremdschlüssel zuerst "putzen" --- */
/*
DROP TABLE IF EXISTS posten;
DROP TABLE IF EXISTS jobticket;
DROP TABLE IF EXISTS mitarbeiter;
DROP TABLE IF EXISTS bestellung;
DROP TABLE IF EXISTS artikel;
*/

/* --- Tabs ohne Fremdschlüssel --- */
/*DROP TABLE IF EXISTS abteilung;
DROP TABLE IF EXISTS mwstsatz;
DROP TABLE IF EXISTS hersteller;
DROP TABLE IF EXISTS kategorie;
DROP TABLE IF EXISTS kunde;*/


CREATE TABLE IF NOT EXISTS abteilung
(
  abteilungs_nr INTEGER PRIMARY KEY AUTO_INCREMENT,
  bezeichnung  VARCHAR(50)
);

/* kürzer geschriebene Variante  
CREATE TABLE IF NOT EXISTS abteilung
(
  abteilungs_nr  INTEGER PRIMARY KEY,
  bezeichnung  VARCHAR(50)
); /**/

/* Mit ALTER TABLE geschriebene Variante 
CREATE TABLE IF NOT EXISTS abteilung
(
  abteilungs_nr  INTEGER,
  bezeichnung  VARCHAR(50)
);

ALTER TABLE abteilung ADD CONSTRAINT tpabteilung PRIMARY KEY (abteilungs_nr); */

INSERT INTO abteilung (abteilungs_nr, bezeichnung) VALUES (1, 'Geschäftsführung');
INSERT INTO abteilung (abteilungs_nr, bezeichnung) VALUES (2, 'Support');
INSERT INTO abteilung (abteilungs_nr, bezeichnung) VALUES (3, 'Rechnungswesen');
INSERT INTO abteilung (abteilungs_nr, bezeichnung) VALUES (4, 'Einkauf');
INSERT INTO abteilung (abteilungs_nr, bezeichnung) VALUES (5, 'Vertrieb');
INSERT INTO abteilung (abteilungs_nr, bezeichnung) VALUES (6, 'Verwaltung');



CREATE TABLE IF NOT EXISTS mwstsatz
(
  mwsnr  INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  mwsprozent  DECIMAL(4, 2)
);

INSERT INTO mwstsatz (mwsnr, mwsprozent) VALUES (1, 7);
INSERT INTO mwstsatz (mwsnr, mwsprozent) VALUES (2, 19);



CREATE TABLE IF NOT EXISTS hersteller
(
  hersteller_nr  INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name  VARCHAR(50)
);

INSERT INTO hersteller (hersteller_nr, name) VALUES (1, 'Belinea');
INSERT INTO hersteller (hersteller_nr, name) VALUES (2, 'Samsung');
INSERT INTO hersteller (hersteller_nr, name) VALUES (3, 'Sony');
INSERT INTO hersteller (hersteller_nr, name) VALUES (4, 'HP');
INSERT INTO hersteller (hersteller_nr, name) VALUES (5, 'Matrox');
INSERT INTO hersteller (hersteller_nr, name) VALUES (6, 'Terratec');
INSERT INTO hersteller (hersteller_nr, name) VALUES (7, 'Canon');
INSERT INTO hersteller (hersteller_nr, name) VALUES (8, 'Epson');
INSERT INTO hersteller (hersteller_nr, name) VALUES (9, 'Fujitsu');
INSERT INTO hersteller (hersteller_nr, name) VALUES (10, 'Microsoft');
INSERT INTO hersteller (hersteller_nr, name) VALUES (11, 'Asus');
INSERT INTO hersteller (hersteller_nr, name) VALUES (12, 'Acer');
INSERT INTO hersteller (hersteller_nr, name) VALUES (13, 'Dell');





CREATE TABLE IF NOT EXISTS kategorie
(
  kategorie_nr  INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  bezeichnung  VARCHAR(50)
);

/*
CREATE TABLE IF NOT EXISTS kategorie
(
  kategorie_nr  INTEGER PRIMARY KEY AUTO_INCREMENT,
  bezeichnung  VARCHAR(50)
);

INSERT INTO kategorie (kategorie_nr, bezeichnung) VALUES (100, 'Monitore');
INSERT INTO kategorie (bezeichnung) VALUES ('Scanner'); -- bei 101 weiter zählen
*/

INSERT INTO kategorie (kategorie_nr, bezeichnung) VALUES (1, 'Monitore');
INSERT INTO kategorie (kategorie_nr, bezeichnung) VALUES (2, 'Scanner');
INSERT INTO kategorie (kategorie_nr, bezeichnung) VALUES (3, 'Grafikkarten');
INSERT INTO kategorie (kategorie_nr, bezeichnung) VALUES (4, 'Festplatten');
INSERT INTO kategorie (kategorie_nr, bezeichnung) VALUES (5, 'Soundkarten');
INSERT INTO kategorie (kategorie_nr, bezeichnung) VALUES (6, 'Keyboards');
INSERT INTO kategorie (kategorie_nr, bezeichnung) VALUES (7, 'Drucker');
INSERT INTO kategorie (kategorie_nr, bezeichnung) VALUES (8, 'Software');
INSERT INTO kategorie (kategorie_nr, bezeichnung) VALUES (9, 'Laufwerke');
INSERT INTO kategorie (kategorie_nr, bezeichnung) VALUES (10, 'Mäuse');
INSERT INTO kategorie (kategorie_nr, bezeichnung) VALUES (11, '3,5-Zoll-Disketten');



CREATE TABLE IF NOT EXISTS kunde
(
  kunden_nr  INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name  VARCHAR(50),
  vorname  VARCHAR(50),
  strasse  VARCHAR(50),
  plz  CHAR(14),
  ort  VARCHAR(50),
  tel_gesch  VARCHAR(25),
  tel_priv  VARCHAR(25),
  email  VARCHAR(50),
  zahlungsart  CHAR(1)
);

INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (1, 'Loewe', 'Arthur', 'Sebastianstraße 134', '50737', 'Köln', NULL, '19467383', NULL, 'B');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (2, 'Adler', 'Felix', 'Goethestraße 4', '30453', 'Hannover', '9856023452', '10562382', 'adler@on-line.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (3, 'Stein', 'Johannes', 'Elisabethenstr. 23', '53111', 'Bonn', '99746227', '99746228', 'johnny@hip.de', 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (4, 'Falkner', 'Michael', 'Querfeldstraße 21', '65187', 'Wiesbaden', '13726583', '48892768', 'mischa24@wysiwyg.com', 'V');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (5, 'Lederer', 'Helene', 'Rennbahnstraße 6', '50733', 'Köln', '87126534', '32675491', 'lele@lederer-world.de', 'K');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (6, 'Kogen', 'Arnold', 'Clara-Viebig-Straße 17', '53179', 'Bonn', NULL, '55819269', NULL, 'B');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (7, 'Schneider', 'Benedikt', 'Vahrendorfer Stadtweg 61', '21075', 'Hamburg', NULL, '93728815', 'benni@postfach-online.de', 'B');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (8, 'Dietrich', 'Diana', 'Kastanienallee 675', '65199', 'Wiesbaden', NULL, '56112894', 'diedietrich@on-line.de', 'V');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (9, 'Voglin', 'Jakob', 'Engeldamm 34', '12487', 'Berlin', '999657324', '12432673', 'voglin@berliner-tagblatt.de', 'K');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (10, 'Stern', 'Martin', 'Knaufstraße 453', '50858', 'Köln', '72891174', '17582964', 'martin.stern@on-line.de', 'B');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (11, 'Marsch', 'Ronald', 'Große Telegraphenstraße 95', '50769', 'Köln', '16547326', '99234713', 'ronnie@on-line.de', 'B');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (12, 'Fromkess', 'Leon', 'Schmittgasser Kirchweg 44', '53129', 'Bonn', '67346248', '19684375', 'leon.fromkess@lola.com', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (13, 'Badel', 'Sarah', 'Am Ginsterpfad 74', '51147', 'Köln', '17483763', '82675271', 's.badel@on-line.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (14, 'Schäfer', 'Willi', 'Bei der blauen Brücke 119', '22083', 'Hamburg', '02857204', '86756251', 'schaefer32@lola.com', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (15, 'Front', 'Jeremias', 'Reichskanzlerstraße 71', '22525', 'Hamburg', '5685710', '86957248', 'jerry@gartenlaubenfreunde.de', 'B');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (16, 'Wilhelms', 'Simon', 'Gustav-Freytag-Straße 22', '51069', 'Köln', '19785737', '98760438', NULL, 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (17, 'Grunpeter', 'Sascha', 'Pascalstraße 64', '52121', 'Bonn', '918574736', '11768462', 'sagrun@lola.com', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (18, 'Marx', 'Alfred', 'Gabriele-Muenter-Straße 102', '51371', 'Leverkusen', '02759285', '849647286', 'alfred_marx@on-line.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (19, 'Kops', 'Bernhard', 'Gunther-Plüschow-Straße 47', '50739', 'Köln', '10675849', '61969285', 'berniekops@lola.com', 'B');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (20, 'Elson', 'Andrea', 'Herzog-Alf-Weg 13', '20459', 'Hamburg', '28795823', '967584483', 'elson@elsons-laedchen.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (21, 'Kaplan', 'Marvin', 'Oskar-Schlemmer-Straße 72', '50933', 'Köln', NULL, '96857385', 'marvin@marc-aurel-jg-2001.de', 'K');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (22, 'Glaister', 'Gabrielle', 'Simrockallee 2', '53227', 'Bonn', '97857358', '304760583', 'gabyglaister@on-line.de', 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (23, 'Knutt', 'Robert', 'Metzgerstraße 81', '52076', 'Aachen', '29786682', '10684937', 'robert@robert-knutt.de', 'B');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (24, 'Reiner', 'Robert', 'Pattscheider Weg 7', '51147', 'Köln', '19587238', '017589375', 'meathead@lola.com', 'B');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (25, 'Grunert', 'Paul', 'Jütländer Allee 236', '22415', 'Hamburg', '19473825', '47294978', 'paul@briefmarken-hamburg.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (26, 'Free', 'Oliver', 'Pferdmengesstraße 58', '50672', 'Köln', '19473067', '94728395', 'ollifree@fc-koelle-for-ever.de', 'K');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (27, 'Frankau', 'Nicholas', 'Rennbahnstraße 83', '65207', 'Wiesbaden', '10264738', '91650376', 'nick.frank@on-line.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (28, 'Weinberger', 'Eduard', 'Modersohnstraße 112', '10965', 'Berlin', '57480399', '10275748', 'weinberger@lola.com', 'K');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (29, 'Mann', 'Miriam', 'Wielandplatz 8', '99425', 'Weimar', '19786854', '19786743', 'miriam-mann@on-line.de', 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (30, 'Waring', 'Georg', 'Merkenicher Ringstraße 313', '51103', 'Köln', '01896748', '71835738', 'waring@polstermoebel-schmidt.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (31, 'Locke', 'Albert', 'Bundesgrenzschutzplatz 32', '53177', 'Bonn', '47382765', '19684758', 'Bertie@Wooster.de', 'K');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (32, 'Mills', 'Michael', 'Im Grund 4', '51063', 'Köln', '86758685', '10894519', 'michael@mills-and-more.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (33, 'Brisebois', 'Danielle', 'Bismarckstraße 9', '53721', 'Siegburg', '91856748', '27685710', 'danielle@tricatel.fr', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (34, 'Dorning', 'Robert', 'Hunnebeckweg 21', '48147', 'Münster', '57483910', '153424352', 'dorne@hip.de', 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (35, 'Sperber', 'Milo', 'Zypressenweg 3', '22457', 'Hamburg', '67582978', '564736540', 'milo@lola.com', 'B');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (36, 'Fabrizi', 'Mario', 'Auf dem Hunnenrücken 19', '50999', 'Köln', '142398079', '09978699', 'mario.fabrizi@on-line.de', 'K');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (37, 'Anderson', 'Margarete', 'Machabäerstraße 34', '50735', 'Köln', '27685741', '09987890', 'gretel.anderson@on-line.de', 'V');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (38, 'May', 'Jakob', 'In der Dasladen 9', '51373', 'Leverkusen', '197869504', '19785673', 'mayday@pc-helfer-leverkusen.de', 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (39, 'Palk', 'Anna', 'Winston-Churchill-Straße 80', '53129', 'Bonn', '197867513', '154635241', 'anpal@on-line.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (40, 'Kaufmann', 'Andreas', 'Am Alten Brauhaus 11', '51105', 'Köln', '0796835460', '01758362', 'andy@koelner-taxis.de', 'V');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (41, 'Bussell', 'Mark', 'Hanfgartenstraße 63', '81475', 'München', '473829201', '13246359', 'bussell@bavaria-bank.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (42, 'Clement', 'Richard', 'Fröbelstraße 26', '12161', 'Berlin', NULL, '57297867', 'clem@on-line.de', 'B');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (43, 'Handl', 'Irene', 'Berberitzenweg 7', '50678', 'Köln', '84736291', '98675842', 'irenehandl@lola.com', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (44, 'Landesberg', 'Stefan', 'Kleiner Griechenmarkt 19', '51107', 'Köln', '08978569', '186759472', 'Steve@metal-rules.de', 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (45, 'Lenhart', 'Heidi', 'Mozartstraße 73', '51371', 'Leverkusen', '19705832', '879685740', 'heidi@montana-dreaming.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (46, 'Wendt', 'Georg', 'Froschkönigweg 32', '50767', 'Köln', '23142312', '06905964', 'Georg@on-line.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (47, 'Masur', 'Richard', 'Up den Wiemen 46', '22609', 'Hamburg', '29671323', '29685749', 'masur@on-line.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (48, 'Gross', 'Michael', 'Neptunstraße 33', '12621', 'Berlin', '37685940', '197867580', 'm.gross@lola.com', 'B');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (49, 'Hirsch', 'Andreas', 'Waidmarkt 16', '50735', 'Köln', '19783060', '57483657', 'andreas.hirsch@on-line.de', 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (50, 'Hecht', 'Jessica', 'Im Teich 42', '51105', 'Köln', '26453756', '98786029', 'jessie.hecht@lola.com', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (51, 'Kaminski', 'Melvin', 'Neue ABC-Straße 504', '22607', 'Hamburg', '97860169', '57192060', 'mel@bancroft-and-brooks.com', 'B');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (52, 'Schäfer', 'Natalie', 'Mittelstraße 50', '53225', 'Bonn', '58672901', '91254341', 'nati@on-line.de', 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (53, 'Persky', 'Lisa', 'Keplerstraße 48', '40489', 'Düsseldorf', '19562109', '38295647', 'lisa.persky@kunsthaus-persky.de', 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (54, 'Steuer', 'Paul', 'Langweidenstraße 67', '60386', 'Frankfurt Main', '01867493', '19887960', 'paul.steuer@on-line.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (55, 'Karn', 'Richard', 'Jan-Wellem-Straße 34', '50668', 'Köln', '97860927', '37681936', 'karn.koeln@on-line.de', 'V');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (56, 'Barron', 'Marion', 'Im Fuldchen 7', '60435', 'Frankfurt Main', '13241735', '91703275', 'barron.marion@lola.com', 'B');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (57, 'Mull', 'Martin', 'Rautendeleinweg 29', '40593', 'Düsseldorf', '10923874', '57463524', 'mamu@on-line.de', 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (58, 'Kay', 'Sylvia', 'Gutzkowstraße 58', '21079', 'Hamburg', '95847772', '17584637', 'kay@web-postfaecher.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (59, 'Singer', 'Alex', 'Neumoorstück 15', '20459', 'Hamburg', '96857682', '19685733', 'alex@lola.com', 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (60, 'Zagorsky', 'Annette', 'Isarstraße 75', '30559', 'Hannover', '286957483', '10395738', 'annette@zagorsky-verlag-und-druck.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (61, 'Hecht', 'Gina', 'Schulgasse 28', '65207', 'Wiesbaden', '195748372', '83746293', 'gina.hecht@on-line.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (62, 'Penner', 'Jonathan', 'Von-Lapp-Straße 66', '53125', 'Bonn', '17581253', '28547639', 'penner@lola.com', 'B');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (63, 'Kampmann', 'Stefan', 'Gustav-Mahler-Straße 64', '50733', 'Köln', '19463827', '12647366', 'kampmann@computer-kampmann.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (64, 'Rasche', 'David', 'Boxgraben 9', '52078', 'Aachen', '18675943', '19574838', 'dave@com-cafe.de', 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (65, 'Wolf', 'Susanne', 'Veilchenstieg 26', '22297', 'Hamburg', '96857486', '768574676', 'susi.wolf@on-line.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (66, 'Barber', 'Paul', 'Mühlenweg 19', '10405', 'Berlin', NULL, '46375483', NULL, 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (67, 'Martin', 'Melanie', 'Löwengasse 17', '51105', 'Köln', '57465748', '97867586', 'melanie.martin@on-line.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (68, 'Lukas', 'Karl', 'Max-Hartig-Weg 20', '60386', 'Frankfurt Main', '91657438', '35462817', 'k.lukas@lola.com', 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (69, 'Zucker', 'David', 'Abbestraße 38', '09114', 'Chemnitz', '97860231', '16453271', 'd.zucker@zucker-suess.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (70, 'Sim', 'Gerald', 'Lobositzstraße 63', '51103', 'Köln', '57463892', '18675290', 'gerald.s@on-line.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (71, 'Arnold', 'Thomas', 'Industriestraße 543', '21109', 'Hamburg', '18796851', '57481503', 'tom@mayim-bialik-fans.de', 'B');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (72, 'Hart', 'Melissa', 'Gurkenweg 4', '30655', 'Hannover', '94768592', '37685749', 'lisa.hart@lola.com', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (73, 'Ure', 'Gudrun', 'Lochumer Weg 23', '50668', 'Köln', NULL, '28675942', 'gudrun.ure@on-line.de', 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (74, 'Anwar', 'Mina', 'Putzdelle 86', '51379', 'Leverkusen', '19675849', '16574638', 'm.anwar@on-line.de', 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (75, 'Kerr', 'Annette', 'Brander Heide 37', '52066', 'Aachen', '19786758', '97867592', 'anette.kerr@modehaus-kerr-aachen.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (76, 'Lembeck', 'Helene', 'Fuldaer Straße 73', '60486', 'Frankfurt Main', '67581930', '19786024', 'lele39@on-line.de', 'V');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (77, 'Fleischer', 'Karl', 'Kriemhildstraße 38', '21109', 'Hamburg', '18695783', '97867261', 'fleischer@web-postfaecher.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (78, 'Kaufmann', 'Andreas', 'Fabriciusstieg 47', '20257', 'Hamburg', '96847392', '53427164', 'andreas.kaufmann@zmuda.de', 'K');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (79, 'Eles', 'Sandor', 'Diedenhofer Straße 63', '22419', 'Hamburg', '98362781', '87926715', 'sandor.eles@on-line.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (80, 'Voland', 'Herbert', 'Düsseldorfer Straße 90', '50939', 'Köln', '86932710', '83756493', 'herbert.voland@on-line.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (81, 'Stoller', 'Alfred', 'Voltastraße 53', '60388', 'Frankfurt Main', '00418673', '65884192', 'alfi.stoller@lola.com', 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (82, 'Martin', 'Georg', 'Hermesgasse 17', '51145', 'Köln', '29675813', '16475855', 'g.martin@web-postfaecher.de', 'B');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (83, 'Durdan', 'Richard', 'Görlitzer Straße 41', '60313', 'Frankfurt Main', '96815376', '27681930', 'dickdurdan@lola.com', 'K');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (84, 'Bonner', 'Frank', 'Shakespeareplatz 35', '14055', 'Berlin', '36277361', '17564832', 'frank.bonner2@on-line.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (85, 'Baden-Semper', 'Nina', 'Brookdamm 68', '20457', 'Hamburg', '27564932', '04437193', 'nina@web-postfaecher.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (86, 'Mandan', 'Robert', 'Kösener Weg 8', '40489', 'Düsseldorf', '56473329', '17564932', 'robert.mandan@on-line.de', 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (87, 'Fenacolini', 'Anna', 'Josef-Hirn-Platz 4', '50597', 'Stuttgart', '19685493', '57463829', 'anna.fenacolini@stuttgart-uni.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (88, 'Hordern', 'Michael', 'Schwengelkamp 44', '20255', 'Hamburg', '19685723', '375847650', 'michael.hordern@on-line.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (89, 'Dane', 'Alexandra', 'Langeler Kreuzweg 92', '51063', 'Köln', '195647382', '95768323', 'xandra@fc-koelle-for-ever.de', 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (90, 'Scolari', 'Peter', 'Ella-Kay-Straße 85', '13357', 'Berlin', '18574639', '26574619', 'peter.scolari@on-line.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (91, 'Herbert', 'Philipp', 'Am Pulverhof 52', '22045', 'Hamburg', '28576462', '82868584', 'philipp.herbert@lola.com', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (92, 'Kraft', 'Robert', 'Hohenzollernring 103', '14129', 'Berlin', '18463728', '07869237', 'kraft@tierhaus-kraft.de', 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (93, 'Donner', 'Robert', 'Bebelplatz 12', '51149', 'Köln', '18679684', '37586472', 'donner@donner-und-blitz-medien.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (94, 'Sadowsky', 'Adam', 'Colmarer Straße 73', '28327', 'Bremen', '96857328', '17564834', 'adam.sadowsky@on-line.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (95, 'Hartman', 'Philipp', 'Hamburger Hochstraße 19', '22767', 'Hamburg', '29371826', '85647291', 'philipp@radio-bill.de', 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (96, 'Piekarsky', 'Julia', 'Quinxer Straße 6', '52074', 'Aachen', '28574639', '17685743', 'piekarsky@web-postfaecher.de', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (97, 'Eiding', 'Paul', 'Goerdelerstraße 37', '65195', 'Wiesbaden', NULL, '27564832', NULL, 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (98, 'Ritter', 'Hannes', 'Emschertalstraße 73', '44149', 'Dortmund', '27584637', NULL, 'hannes.ritter@lola.com', 'R');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (99, 'Adrian', 'Iris', 'Vulkanstraße 46', '50677', 'Köln', '18675943', '27564839', 'iris.adrian@on-line.de', 'N');
INSERT INTO kunde (kunden_nr, name, vorname, strasse, plz, ort, tel_gesch, tel_priv, email, zahlungsart) VALUES (100, 'Slotky', 'Anna', 'Anita-Ree-Straße 61', '22087', 'Hamburg', '28574635', '29186753', 'slotky@zzzorro.de', 'K');


CREATE TABLE IF NOT EXISTS mitarbeiter
(
  mitarbeiter_nr  INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name  VARCHAR(50),
  vorname  VARCHAR(50),
  strasse  VARCHAR(50),
  plz  CHAR(14),
  ort  VARCHAR(50),
  gehalt  DECIMAL(10, 2),
  abteilung  INTEGER,
  tel  VARCHAR(25),
  mail  VARCHAR(50),
  eintrittsdatum  DATE
);

ALTER TABLE mitarbeiter ADD FOREIGN KEY (abteilung) REFERENCES abteilung (abteilungs_nr);

INSERT INTO mitarbeiter (mitarbeiter_nr, name, vorname, strasse, plz, ort, gehalt, abteilung, tel, mail, eintrittsdatum) VALUES (1, 'Ross', 'Hagen', 'Hauptstraße 67', '53123', 'Bonn', 7500, 1, '43567890', 'hagen.ross@beispielfirma.de', '1986-02-18');
INSERT INTO mitarbeiter (mitarbeiter_nr, name, vorname, strasse, plz, ort, gehalt, abteilung, tel, mail, eintrittsdatum) VALUES (2, 'Roberts', 'Patrick', 'Schillerstraße 154', '53229', 'Bonn', 7000, 1, '98761462', 'p.roberts@beispielfirma.de', '1988-10-20');
INSERT INTO mitarbeiter (mitarbeiter_nr, name, vorname, strasse, plz, ort, gehalt, abteilung, tel, mail, eintrittsdatum) VALUES (3, 'Hummer', 'Stefan', 'Sonnenhag 74', '53175', 'Bonn', 7000, 1, '98120421', 'stefanhummer@beispielfirma.de', '1992-08-01');
INSERT INTO mitarbeiter (mitarbeiter_nr, name, vorname, strasse, plz, ort, gehalt, abteilung, tel, mail, eintrittsdatum) VALUES (4, 'Gerhard', 'David', 'Nibelungenstraße 21', '52115', 'Bonn', 2500, 2, '67294738', 'dave.g@beispielfirma.de', '1987-07-13');
INSERT INTO mitarbeiter (mitarbeiter_nr, name, vorname, strasse, plz, ort, gehalt, abteilung, tel, mail, eintrittsdatum) VALUES (5, 'Weinert', 'Eduard', 'Quellenweg 57', '53177', 'Bonn', 2000, 2, '78646193', 'eduard.weinert@beispielfirma.de', '2008-01-19');
INSERT INTO mitarbeiter (mitarbeiter_nr, name, vorname, strasse, plz, ort, gehalt, abteilung, tel, mail, eintrittsdatum) VALUES (6, 'Michaels', 'Connie', 'Benedek Straße 5', '53756', 'St. Augustin', 2500, 3, '12345655', 'connie.michaels@beispielfirma.de', '1988-04-21');
INSERT INTO mitarbeiter (mitarbeiter_nr, name, vorname, strasse, plz, ort, gehalt, abteilung, tel, mail, eintrittsdatum) VALUES (7, 'Osser', 'Bernd', 'Usambaraweg 28', '50732', 'Köln', 2200, 3, '27913020', 'b.osser@beispielfirma.de', '1995-06-05');
INSERT INTO mitarbeiter (mitarbeiter_nr, name, vorname, strasse, plz, ort, gehalt, abteilung, tel, mail, eintrittsdatum) VALUES (8, 'Koppes', 'Karin', 'Kopenhagener Straße 34', '53177', 'Bonn', 2400, 4, '98766754', 'karin.koppes@beispielfirma.de', '1998-05-10');
INSERT INTO mitarbeiter (mitarbeiter_nr, name, vorname, strasse, plz, ort, gehalt, abteilung, tel, mail, eintrittsdatum) VALUES (9, 'Wilding', 'Alexander', 'Sedanstraße 172', '53229', 'Bonn', 2300, 4, '28652947', 'alex.wilding@beispielfirma.de', '2006-06-30');
INSERT INTO mitarbeiter (mitarbeiter_nr, name, vorname, strasse, plz, ort, gehalt, abteilung, tel, mail, eintrittsdatum) VALUES (10, 'Schmidt', 'Peter', 'Konrad-Adenauer-Straße 49', '50997', 'Köln', 2500, 5, '68371020', 'p.schmidt@beispielfirma.de', '2001-11-04');
INSERT INTO mitarbeiter (mitarbeiter_nr, name, vorname, strasse, plz, ort, gehalt, abteilung, tel, mail, eintrittsdatum) VALUES (11, 'Müller', 'Ole', 'Lutherstraße 4', '50823', 'Köln', 2600, 5, '682037741', 'o.mueller@beispielfirma.de', '2009-03-02');
INSERT INTO mitarbeiter (mitarbeiter_nr, name, vorname, strasse, plz, ort, gehalt, abteilung, tel, mail, eintrittsdatum) VALUES (12, 'Meier', 'Wilhelm', 'Römerstraße 53', '53229', 'Bonn', 2400, 5, '91821573', 'willi.meier@beispielfirma.de', '1994-08-02');
INSERT INTO mitarbeiter (mitarbeiter_nr, name, vorname, strasse, plz, ort, gehalt, abteilung, tel, mail, eintrittsdatum) VALUES (13, 'Schiff', 'Martin', 'Truchseßstraße 74', '53127', 'Bonn', 2500, 5, '65744583', 'martin.schiff@beispielfirma.de', '2002-09-28');
INSERT INTO mitarbeiter (mitarbeiter_nr, name, vorname, strasse, plz, ort, gehalt, abteilung, tel, mail, eintrittsdatum) VALUES (14, 'Lehne', 'Luise', 'Lyngsbergstraße 93', '53113', 'Bonn', 2000, 6, '12341756', 'luise.lehne@beispielfirma.de', '2001-07-22');
INSERT INTO mitarbeiter (mitarbeiter_nr, name, vorname, strasse, plz, ort, gehalt, abteilung, tel, mail, eintrittsdatum) VALUES (15, 'Remsen', 'Kevin', 'Nonnenstrombergstraße 22', '50672', 'Köln', 1800, 6, '94128882', 'kevin.remsen@beispielfirma.de', '2004-01-02');



CREATE TABLE IF NOT EXISTS artikel
(
  artikel_nr  INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  bezeichnung  VARCHAR(50),
  hersteller_nr  INTEGER,
  nettopreis  DECIMAL(10, 2),
  mwsnr  INTEGER DEFAULT '2',
  bestand  INTEGER,
  mindestbestand  INTEGER,
  kategorie_nr  INTEGER,
  bestellvorschlag  CHAR(1) DEFAULT '0'
);

ALTER TABLE artikel ADD FOREIGN KEY (mwsnr) REFERENCES mwstsatz (mwsnr);
ALTER TABLE artikel ADD FOREIGN KEY (hersteller_nr) REFERENCES hersteller (hersteller_nr);
ALTER TABLE artikel ADD FOREIGN KEY (kategorie_nr) REFERENCES kategorie (kategorie_nr);

INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (1, '106075', 1, 137.93, 2, 100, 10, 1, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (2, '106055', 1, 172.14, 2, 100, 10, 1, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (3, '753S', 2, 111.21, 2, 100, 10, 1, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (4, '757P', 2, 145.69, 2, 100, 10, 1, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (5, '1200NF', 2, 602.59, 2, 100, 10, 1, '0');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (6, 'CanoScan LiDE 20', 7, 47.41, 2, 100, 10, 2, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (7, 'CanoScan 5000F', 7, 132.76, 2, 100, 10, 2, '0');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (8, 'Perfection1670', 8, 81.03, 2, 100, 10, 2, '0');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (9, 'ScanJet 2400', 4, 63.79, 2, 100, 10, 2, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (10, 'ScanJet 8290', 4, 1507.76, 2, 100, 10, 2, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (11, 'Millenium G450', 5, 81.03, 2, 100, 10, 3, '0');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (12, 'Millenium G550', 5, 85.34, 2, 100, 10, 3, '0');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (13, 'Millenium G650', 5, 137.07, 2, 100, 10, 3, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (14, 'Millenium P750', 5, 197.41, 2, 5, 10, 3, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (15, 'Parhelia 512', 5, 309.48, 2, 100, 10, 3, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (16, 'SV0802N', 2, 55.17, 2, 100, 10, 4, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (17, 'SP0802N', 2, 63.79, 2, 100, 10, 4, '0');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (18, 'SV1203N', 2, 72.41, 2, 100, 10, 4, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (19, 'SP1604N', 2, 93.97, 2, 100, 10, 4, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (20, 'MHT2060AH', 9, 197.41, 2, 100, 10, 4, '0');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (21, 'Aureon 5.1 Fun', 6, 33.62, 2, 100, 10, 5, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (22, 'Aureon 5.1 Fun Games', 6, 42.24, 2, 100, 10, 5, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (23, 'Aureon 5.1 Sky', 6, 68.1, 2, 100, 10, 5, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (24, 'Aureon 5.1 USB', 6, 85.34, 2, 100, 10, 5, '0');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (25, 'Aureon 5.1 Universe', 6, 206.03, 2, 100, 10, 5, '0');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (26, 'Internet Keyboard', 10, 17.23, 2, 100, 10, 6, '0');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (27, 'Office Keyboard', 10, 25.85, 2, 100, 10, 6, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (28, 'Natural MultiMedia', 10, 23.28, 2, 100, 10, 6, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (29, 'MultiMedia Keyboard refresh', 10, 27.59, 2, 100, 10, 6, '0');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (30, 'WL Optical Desctop for Bluetooth', 10, 128.45, 2, 100, 10, 6, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (31, 'DeskJet 3520', 4, 33.62, 2, 100, 10, 7, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (32, 'OfficeJet 7140xi', 4, 539.97, 2, 100, 10, 7, '0');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (33, 'LaserJet 1150', 4, 240.51, 2, 100, 10, 7, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (34, 'i250', 7, 46.55, 2, 100, 10, 7, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (35, 'BJC-5500', 7, 645.69, 2, 100, 10, 7, '0');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (36, 'Stylus C44 Plus', 8, 46.55, 2, 100, 10, 7, '0');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (37, 'Stylus Photo R300', 8, 150, 2, 100, 10, 7, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (38, 'Basic Optical Mouse SB', 10, 12.07, 2, 100, 10, 10, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (39, 'Mouse Blue', 10, 25, 2, 100, 10, 10, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (40, 'Wireless InteliMouse Explorer BT', 10, 72.41, 2, 100, 10, 10, '0');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (41, 'Windows 2000 Professional', 10, 124.14, 2, 100, 10, 8, '0');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (42, 'Windows XP Home Edition', 10, 101.97, 2, 100, 10, 8, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (43, 'Office XP Pro', 10, 516.38, 2, 100, 10, 8, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (44, 'Visual Studio.NET 2003', 10, 1766.38, 2, 100, 10, 8, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (45, 'Works Suite 2004', 10, 93.97, 2, 100, 10, 8, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (46, 'SC-152A', 2, 13.79, 2, 100, 10, 9, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (47, 'SW252', 2, 33.62, 2, 100, 10, 9, '0');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (48, 'SM-352', 2, 59.48, 2, 100, 10, 9, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (49, 'SD-616', 2, 25, 2, 100, 10, 9, '1');
INSERT INTO artikel (artikel_nr, bezeichnung, hersteller_nr, nettopreis, mwsnr, bestand, mindestbestand, kategorie_nr, bestellvorschlag) VALUES (50, 'SC-152A schwarz', 2, 14.66, 2, 100, 10, 9, '1');


/* Table: BESTELLUNG, Owner: SYSDBA */

CREATE TABLE IF NOT EXISTS bestellung
(
  bestell_nr  INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  kunden_nr  INTEGER,
  bestelldatum  DATE,
  lieferdatum  DATE,
  rechnungsbetrag  DECIMAL(10, 2)
);

ALTER TABLE bestellung ADD FOREIGN KEY (kunden_nr) REFERENCES kunde (kunden_nr);

INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (1, 1, '2010-01-02', '2010-01-11', 359.68);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (2, 2, '2010-01-02', '2010-01-11', 107.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (3, 3, '2010-01-02', '2010-01-11', 322.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (4, 4, '2010-01-02', '2010-01-11', 109);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (5, 5, '2010-01-02', '2010-01-12', 109);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (6, 6, '2010-01-03', '2010-01-13', 31.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (7, 7, '2010-01-03', '2010-01-11', 267.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (8, 8, '2010-01-03', '2010-01-12', 98.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (9, 9, '2010-01-04', '2010-01-10', 29);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (10, 10, '2010-01-04', '2010-01-11', 388);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (11, 11, '2010-01-04', '2010-01-16', 229);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (12, 12, '2010-01-04', '2010-01-14', 54);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (13, 13, '2010-01-04', '2010-01-14', 173);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (14, 14, '2010-01-04', '2010-01-15', 164.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (15, 15, '2010-01-05', '2010-01-13', 54);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (16, 16, '2010-01-05', '2010-01-12', 156);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (17, 17, '2010-01-06', '2010-01-13', 54);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (18, 18, '2010-01-07', '2010-01-18', 54);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (19, 19, '2010-01-07', '2010-01-11', 144);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (20, 20, '2010-01-08', '2010-01-12', 74);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (21, 21, '2010-01-08', '2010-01-11', 599.05);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (22, 22, '2010-01-08', '2010-01-12', 109.01);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (23, 23, '2010-01-10', '2010-01-15', 626.37);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (24, 24, '2010-01-10', '2010-01-14', 457.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (25, 25, '2010-01-10', '2010-01-15', 27);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (26, 9, '2010-01-10', '2010-01-14', 171.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (27, 26, '2010-01-11', '2010-01-17', 54);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (28, 27, '2010-01-11', '2010-01-19', 84);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (29, 28, '2010-01-11', '2010-01-15', 797.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (30, 29, '2010-01-11', '2010-01-16', 81.01);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (31, 30, '2010-01-12', '2010-01-18', 359);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (32, 31, '2010-01-12', '2010-01-17', 84);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (33, 15, '2010-01-12', '2010-01-18', 28);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (34, 32, '2010-01-12', '2010-01-18', 169);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (35, 33, '2010-01-14', '2010-01-19', 239);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (36, 4, '2010-01-15', '2010-01-19', 736.36);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (37, 34, '2010-01-15', '2010-01-20', 109.01);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (38, 35, '2010-01-15', '2010-01-19', 118.29);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (39, 36, '2010-01-16', '2010-01-19', 148.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (40, 37, '2010-01-16', '2010-01-20', 74);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (41, 38, '2010-01-16', '2010-01-21', 188);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (42, 39, '2010-01-17', '2010-01-21', 59.97);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (43, 40, '2010-01-17', '2010-01-22', 84);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (44, 41, '2010-01-17', '2010-01-22', 98.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (45, 42, '2010-01-17', '2010-01-21', 154);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (46, 23, '2010-01-18', '2010-01-23', 14);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (47, 43, '2010-01-18', '2010-01-24', 39);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (48, 44, '2010-01-19', '2010-01-24', 0);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (49, 45, '2010-01-19', '2010-01-22', 626.37);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (50, 46, '2010-01-19', '2010-01-24', 127.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (51, 47, '2010-01-20', '2010-01-23', 198);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (52, 7, '2010-01-20', '2010-01-24', 81.01);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (53, 48, '2010-01-21', '2010-01-25', 54);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (54, 49, '2010-01-21', '2010-01-26', 144);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (55, 50, '2010-01-22', '2010-01-26', 457.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (56, 51, '2010-01-22', '2010-01-25', 32);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (57, 42, '2010-01-23', '2010-01-30', 160);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (58, 52, '2010-01-23', '2010-01-27', 84);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (59, 53, '2010-01-23', '2010-01-28', 1252.73);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (60, 54, '2010-01-23', '2010-01-27', 98.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (61, 55, '2010-01-23', '2010-01-28', 258.01);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (62, 56, '2010-01-23', '2010-01-28', 201.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (63, 57, '2010-01-24', '2010-01-27', 169);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (64, 58, '2010-01-24', '2010-01-28', 397.28);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (65, 2, '2010-01-24', '2010-01-27', 3798);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (66, 59, '2010-01-24', '2010-01-28', 131.98);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (67, 60, '2010-01-24', '2010-01-27', 308.98);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (68, 29, '2010-01-24', '2010-01-29', 159);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (69, 61, '2010-01-24', '2010-01-28', 462);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (70, 62, '2010-01-24', '2010-01-30', 150);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (71, 36, '2010-01-25', '2010-01-28', 82);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (72, 63, '2010-01-25', '2010-01-30', 4235.97);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (73, 64, '2010-01-25', '2010-01-30', 768);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (74, 17, '2010-01-25', '2010-01-29', 2442.26);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (75, 43, '2010-01-25', '2010-01-30', 1506.26);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (76, 65, '2010-01-26', '2010-01-30', 1429.38);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (77, 66, '2010-01-26', '2010-01-31', 1699.98);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (78, 67, '2010-01-26', '2010-01-29', 839.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (79, 68, '2010-01-26', '2010-01-31', 198);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (80, 58, '2010-01-26', '2010-02-01', 152.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (81, 69, '2010-01-26', '2010-01-30', 1034.98);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (82, 70, '2010-01-26', '2010-01-31', 1052.36);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (83, 5, '2010-01-26', '2010-01-31', 103);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (84, 72, '2010-01-26', '2010-02-01', 79);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (85, 73, '2010-01-27', '2010-01-30', 2049);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (86, 28, '2010-01-27', '2010-02-01', 2230.01);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (87, 74, '2010-01-27', '2010-02-01', 699);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (88, 75, '2010-01-27', '2010-02-02', 39);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (89, 63, '2010-01-27', '2010-02-01', 174);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (90, 76, '2010-01-27', '2010-02-01', 359);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (91, 77, '2010-01-27', '2010-02-02', 324.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (92, 47, '2010-01-28', '2010-02-01', 278.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (93, 78, '2010-01-28', '2010-02-02', 457.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (94, 79, '2010-01-28', '2010-02-01', 32);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (95, 55, '2010-01-28', '2010-02-03', 118.29);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (96, 80, '2010-01-28', '2010-02-01', 1908);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (97, 81, '2010-01-28', '2010-02-03', 79);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (98, 83, '2010-01-28', '2010-02-05', 169);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (99, 73, '2010-01-28', '2010-02-04', 1198);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (100, 84, '2010-01-28', '2010-02-03', 749);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (101, 85, '2010-01-28', '2010-02-05', 507.69);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (102, 39, '2010-01-28', '2010-02-04', 118.29);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (103, 86, '2010-01-29', '2010-02-05', 278.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (104, 23, '2010-01-29', '2010-02-04', 127.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (105, 87, '2010-01-29', '2010-02-06', 79);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (106, 88, '2010-01-29', '2010-02-04', 84);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (107, 62, '2010-01-29', '2010-02-04', 159.96);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (108, 89, '2010-01-29', '2010-02-04', 747.36);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (109, 90, '2010-01-31', '2010-02-11', 531.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (110, 91, '2010-02-01', '2010-02-11', 109.01);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (111, 92, '2010-02-01', '2010-02-09', 83.98);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (112, 88, '2010-02-01', '2010-02-07', 293.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (113, 35, '2010-02-01', '2010-02-09', 552.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (114, 8, '2010-02-01', '2010-02-08', 193.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (115, 82, '2010-02-01', '2010-02-05', 187.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (116, 93, '2010-02-02', '2010-02-11', 98.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (117, 72, '2010-02-02', '2010-02-10', 31);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (118, 61, '2010-02-02', '2010-02-06', 616.01);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (119, 4, '2010-02-02', '2010-02-09', 277.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (120, 94, '2010-02-02', '2010-02-08', 477.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (121, 95, '2010-02-03', '2010-02-10', 39);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (122, 48, '2010-02-03', '2010-02-11', 699);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (123, 29, '2010-02-03', '2010-02-10', 3131.83);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (124, 96, '2010-02-03', '2010-02-09', 532.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (125, 82, '2010-02-03', '2010-02-11', 84);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (126, 63, '2010-02-03', '2010-02-10', 29);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (127, 72, '2010-02-03', '2010-02-11', 109.01);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (128, 39, '2010-02-03', '2010-02-11', 137);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (129, 51, '2010-02-04', '2010-02-11', 118.29);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (130, 13, '2010-02-04', '2010-02-11', 318);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (131, 47, '2010-02-04', '2010-02-11', 14);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (132, 97, '2010-02-04', '2010-02-10', 74);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (133, 64, '2010-02-04', '2010-02-11', 78);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (134, 9, '2010-02-04', '2010-02-10', 278.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (135, 98, '2010-02-04', '2010-02-11', 1898);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (136, 99, '2010-02-04', '2010-02-12', 16);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (137, 14, '2010-02-05', '2010-02-10', 1452.01);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (138, 71, '2010-02-05', '2010-02-11', 98.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (139, 44, '2010-02-05', '2010-02-12', 174);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (140, 57, '2010-02-05', '2010-02-09', 84);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (141, 6, '2010-02-05', '2010-02-10', 497);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (142, 12, '2010-02-05', '2010-02-11', 69);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (143, 100, '2010-02-06', '2010-02-11', 169);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (144, 17, '2010-02-06', '2010-02-11', 278.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (145, 73, '2010-02-06', '2010-02-12', 728.84);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (146, 38, '2010-02-06', '2010-02-11', 129);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (147, 25, '2010-02-06', '2010-02-12', 54);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (148, 83, '2010-02-07', '2010-02-13', 19.99);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (149, 69, '2010-02-07', '2010-02-12', 183);
INSERT INTO bestellung (bestell_nr, kunden_nr, bestelldatum, lieferdatum, rechnungsbetrag) VALUES (150, 46, '2010-02-07', '2010-02-13', 320);




CREATE TABLE IF NOT EXISTS jobticket
(
  jid  INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  jmitarbeiter_nr  INTEGER,
  jgueltig_bis  DATE
);

ALTER TABLE jobticket ADD FOREIGN KEY (jmitarbeiter_nr) REFERENCES mitarbeiter (mitarbeiter_nr);

INSERT INTO jobticket (jid, jmitarbeiter_nr, jgueltig_bis) VALUES (1, 1, '2012-01-01');
INSERT INTO jobticket (jid, jmitarbeiter_nr, jgueltig_bis) VALUES (2, 3, '2012-01-01');





CREATE TABLE IF NOT EXISTS posten
(
  bestell_nr  INTEGER NOT NULL,
  artikel_nr  INTEGER,

  bestellmenge  INTEGER,
  liefermenge  INTEGER
);

ALTER TABLE posten ADD FOREIGN KEY (bestell_nr) REFERENCES bestellung (bestell_nr);
ALTER TABLE posten ADD FOREIGN KEY (artikel_nr) REFERENCES artikel (artikel_nr);

INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (1, 1, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (1, 2, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (2, 34, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (3, 20, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (3, 11, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (4, 45, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (5, 19, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (6, 46, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (7, 8, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (7, 37, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (8, 12, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (9, 39, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (10, 30, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (10, 25, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (11, 20, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (12, 36, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (13, 41, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (13, 49, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (14, 6, 3, 3);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (15, 36, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (16, 21, 4, 4);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (17, 34, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (18, 34, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (19, 41, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (20, 17, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (21, 2, 3, 3);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (22, 19, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (23, 32, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (24, 14, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (25, 28, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (26, 8, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (26, 21, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (27, 36, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (28, 40, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (29, 4, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (29, 27, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (29, 43, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (30, 28, 3, 3);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (31, 15, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (32, 18, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (33, 38, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (34, 4, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (35, 25, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (36, 6, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (36, 32, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (37, 19, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (38, 42, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (39, 26, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (39, 3, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (40, 17, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (41, 23, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (41, 45, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (42, 27, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (43, 18, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (44, 24, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (45, 7, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (46, 38, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (47, 21, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (49, 32, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (50, 16, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (51, 47, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (51, 13, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (52, 28, 3, 3);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (53, 34, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (54, 41, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (55, 14, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (56, 29, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (57, 1, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (58, 18, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (59, 32, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (60, 24, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (61, 30, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (61, 45, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (62, 11, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (62, 38, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (63, 4, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (64, 33, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (64, 42, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (65, 10, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (65, 44, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (66, 26, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (66, 36, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (66, 49, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (67, 27, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (67, 33, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (68, 13, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (69, 7, 3, 3);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (70, 18, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (70, 22, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (70, 50, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (71, 6, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (71, 28, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (72, 1, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (72, 6, 4, 4);
-- INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (72, 10, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (72, 12, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (72, 10, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (73, 4, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (73, 43, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (74, 3, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (74, 4, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (74, 7, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (74, 9, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (74, 11, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (74, 14, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (74, 17, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (74, 20, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (74, 22, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (74, 26, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (74, 29, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (74, 34, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (74, 37, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (74, 38, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (74, 41, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (74, 42, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (74, 43, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (74, 48, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (74, 50, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (75, 5, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (75, 8, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (75, 13, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (75, 23, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (75, 26, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (75, 33, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (75, 39, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (75, 42, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (75, 49, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (76, 32, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (76, 12, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (76, 24, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (76, 3, 3, 3);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (76, 45, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (77, 46, 10, 10);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (77, 47, 10, 10);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (77, 48, 10, 10);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (77, 49, 10, 10);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (77, 50, 10, 10);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (78, 9, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (78, 16, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (78, 22, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (78, 36, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (78, 43, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (79, 34, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (79, 41, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (80, 12, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (80, 36, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (81, 4, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (81, 7, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (81, 11, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (81, 18, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (81, 24, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (81, 28, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (81, 33, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (81, 39, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (81, 40, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (81, 46, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (82, 9, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (82, 32, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (82, 29, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (82, 1, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (83, 17, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (83, 39, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (84, 23, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (85, 44, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (86, 7, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (86, 28, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (86, 44, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (87, 5, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (88, 21, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (89, 37, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (90, 15, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (91, 22, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (91, 48, 4, 4);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (92, 33, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (93, 14, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (94, 29, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (95, 42, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (96, 10, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (96, 13, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (97, 23, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (98, 4, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (99, 43, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (100, 35, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (101, 2, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (101, 7, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (102, 42, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (103, 33, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (104, 16, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (105, 23, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (106, 18, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (107, 46, 10, 10);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (108, 11, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (108, 28, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (108, 32, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (109, 17, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (109, 20, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (110, 19, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (111, 27, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (111, 34, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (112, 22, 6, 6);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (113, 15, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (113, 8, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (114, 26, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (114, 37, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (115, 11, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (116, 24, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (117, 38, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (117, 50, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (118, 7, 4, 4);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (119, 26, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (119, 3, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (120, 25, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (121, 47, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (122, 5, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (123, 32, 5, 5);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (124, 25, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (124, 6, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (125, 40, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (126, 39, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (127, 19, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (128, 28, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (128, 6, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (129, 42, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (130, 13, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (131, 38, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (132, 17, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (133, 21, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (134, 33, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (135, 10, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (135, 30, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (136, 46, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (137, 5, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (137, 34, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (138, 24, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (139, 37, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (140, 18, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (141, 33, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (141, 19, 2, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (142, 48, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (143, 4, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (144, 33, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (145, 17, 4, 4);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (145, 31, 2, 2);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (145, 42, 3, 3);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (146, 3, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (147, 34, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (148, 26, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (149, 7, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (149, 49, 1, 1);
INSERT INTO posten (bestell_nr, artikel_nr, bestellmenge, liefermenge) VALUES (150, 1, 2, 2);

-- ALTER TABLE posten ADD PRIMARY KEY (bestell_nr , artikel_nr) ;
