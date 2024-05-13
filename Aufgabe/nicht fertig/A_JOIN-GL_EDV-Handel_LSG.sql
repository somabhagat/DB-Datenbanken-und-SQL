use edvhandel;

-- (1) Erstellen Sie eine Liste mit allen Feldern der Tabellen "Mitarbeiter" und "Abteilung". Stellen Sie dabei einen JOIN über
-- die Felder ABTEILUNG und ABTEILUNGSNR her. 
select * from MITARBEITER;
select * from ABTEILUNG;

select 
	*
from 
	MITARBEITER JOIN ABTEILUNG ON MITARBEITER.ABTEILUNG = ABTEILUNG.ABTEILUNGS_NR;
    
select 
	*
from 
	MITARBEITER INNER JOIN ABTEILUNG ON ABTEILUNG = ABTEILUNGS_NR;
-- das ist die bessere Lösung, da minimal

-- alternativ ist auch das gültig
select 
	*
from 
	MITARBEITER, ABTEILUNG where ABTEILUNG = ABTEILUNGS_NR;

-- (2) Erstellen Sie eine Mitarbeiter-Liste mit Mitarbeiter-Nr., Vorname, Name, Abteilung (aus Tabelle "Mitarbeiter") und
-- den Feldern "Abteilungsnr" und "Bezeichnung" aus der Tabelle "Abteilung"
-- Die Felder sollen genau die angegebene Reihenfolge haben.
select 
	Mitarbeiter.MITARBEITER_NR,
	Mitarbeiter.VORNAME,
	Mitarbeiter.Name,
	Mitarbeiter.ABTEILUNG,
	ABTEILUNG.ABTEILUNGS_NR,
	ABTEILUNG.BEZEICHNUNG
from 
	MITARBEITER 
		JOIN ABTEILUNG ON MITARBEITER.ABTEILUNG = ABTEILUNG.ABTEILUNGS_NR;

select 
	MITARBEITER_NR,
	VORNAME,
	Name,
	ABTEILUNG,
	ABTEILUNGS_NR,
	BEZEICHNUNG
from 
	MITARBEITER 
		JOIN ABTEILUNG ON ABTEILUNG = ABTEILUNGS_NR;

select 
	MITARBEITER_NR,
	VORNAME,
	Name,
	ABTEILUNG,
	ABTEILUNGS_NR,
	BEZEICHNUNG
from 
	MITARBEITER, ABTEILUNG 
where ABTEILUNG = ABTEILUNGS_NR;

-- (3) Erstellen Sie eine Mitarbeiter-Liste mit Mitarbeiter-Nr., Vorname, Name und
-- dem Feld "Bezeichnung" aus der Tabelle "Abteilung"
-- Die Felder sollen genau die angegebene Reihenfolge haben.
select 
	Mitarbeiter.MITARBEITER_NR,
	Mitarbeiter.VORNAME,
	Mitarbeiter.Name,
	-- Mitarbeiter.ABTEILUNG,
	-- ABTEILUNG.ABTEILUNGSNR,
	ABTEILUNG.BEZEICHNUNG
from 
	MITARBEITER 
		JOIN ABTEILUNG ON MITARBEITER.ABTEILUNG = ABTEILUNG.ABTEILUNGS_NR;

select 
	MITARBEITER_NR,
	VORNAME,
	Name,
	BEZEICHNUNG
from 
	MITARBEITER 
		JOIN ABTEILUNG ON ABTEILUNG = ABTEILUNGS_NR;

-- (4) Erstellen Sie eine Mitarbeiter-Liste der Abteilung "Rechnungswesen" mit Mitarbeiter-Nr., Vorname, Name und
-- dem Feld "Bezeichnung" aus der Tabelle "Abteilung"
-- Die Felder sollen genau die angegebene Reihenfolge haben.
select 
	MITARBEITER_NR,
	VORNAME,
	Name,
	BEZEICHNUNG
from 
	MITARBEITER 
		JOIN ABTEILUNG ON ABTEILUNG = ABTEILUNGS_NR
where
	BEZEICHNUNG = 'Rechnungswesen';

select * from abteilung;

select 
	MITARBEITER_NR,
	VORNAME,
	Name,
	BEZEICHNUNG
from 
	MITARBEITER 
		JOIN ABTEILUNG ON ABTEILUNG = ABTEILUNGS_NR
where
	ABTEILUNGS_NR = 3;

select 
	MITARBEITER_NR,
	VORNAME,
	Name,
	BEZEICHNUNG
from 
	MITARBEITER, ABTEILUNG
where
	ABTEILUNGS_NR = 3 AND					-- für die Selektion der Abteilung Rechnungswesen
    ABTEILUNG = ABTEILUNGS_NR;				-- für die Verbindung der beiden Tabellen