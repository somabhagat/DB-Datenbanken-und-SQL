
use geld_her;

-- -----------------------------------------------------------------------------------------------
-- Abfragen mit gruppierten Listen
-- -----------------------------------------------------------------------------------------------

-- Ermitteln Sie die Anzahl der Abrechnungen je Kunde.

-- Vorüberlegungen:
select * from abrechnung
order by Kunde_id;

-- Lösung:
select 
	Kunde_id,
    count(*) 'Anzahl der Abrechnungen des Kunden'
from abrechnung
group by Kunde_id;

-- Ermitteln Sie die Anzahl der Abrechnungen je Kunde. In der Liste sollen auch Vornamen und
-- Nachnamen der Kunden angezeigt werden.

-- Vorüberlegungen:
select 
	* 
from abrechnung a
		join kunde k on a.Kunde_id = k.Kunde_ID
order by k.Kunde_id;

-- Lösung:
select 
	k.Kunde_ID,
    Vorname,
    Nachname,
    count(*) 'Anzahl der Abrechnungen'
from abrechnung a
		join kunde k on a.Kunde_id = k.Kunde_ID
group by k.Kunde_id, Vorname, Nachname					-- Reihenfolge der Felder ist egal
order by k.Kunde_id;
-- BEACHTE und ACHTUNG: In der Spaltenliste nach dem SELECT dürfen nur die Felder verwendet werden, die auch nach
-- dem GROUP BY - Befehl geschrieben wurden. Zusätzlich dürfen in der Spaltenliste die Aggregat-Funktionen (z.B. count())
-- verwendet werden.
-- Anders formuliert: Wenn in der Spaltenliste ein Tabellenfeld verwendet werden soll, muss dieses auch nach+
-- GROUP BY angegeben werden.

-- --------------------------------------------------------------------------
-- Einige 'böse' Beispiele wie man es nicht macht:
select 
	k.Kunde_ID,
    Vorname,
    Nachname,
    count(*) 'Anzahl der Abrechnungen'
from abrechnung a
		join kunde k on a.Kunde_id = k.Kunde_ID
group by k.Kunde_id;
-- --------------------------------------------------------------------------

-- Sortierung von gruppierten Listen
-- Beispiel 1:
select 
	k.Kunde_ID,
    Vorname,
    Nachname,
    count(*) 'Anzahl der Abrechnungen'
from abrechnung a
		join kunde k on a.Kunde_id = k.Kunde_ID
group by k.Kunde_id, Vorname, Nachname
order by k.Kunde_id;						-- Sortierung nach einem Feld

-- Beispiel 2:
select 
	k.Kunde_ID,
    Vorname,
    Nachname,
    count(*) 'Anzahl der Abrechnungen'
from abrechnung a
		join kunde k on a.Kunde_id = k.Kunde_ID
group by k.Kunde_id, Vorname, Nachname
order by count(*) desc;							-- Sortierung nach Anzahl Abrechnungen

-- Beispiel 3:
select 
	k.Kunde_ID,
    Vorname,
    Nachname,
    count(*) 'Anzahl der Abrechnungen'
from abrechnung a
		join kunde k on a.Kunde_id = k.Kunde_ID
group by k.Kunde_id, Vorname, Nachname
order by count(*) desc, Nachname asc;							-- Sortierung nach Anzahl Abrechnungen und Nachnamen

-- Beispiel 4:
select 
	k.Kunde_ID,
    Vorname,
    Nachname 'N',
    count(*) 'Anzahl'							-- die Spalte mit der Aggregat-Funktion bekommt einen Alias
from abrechnung a
		join kunde k on a.Kunde_id = k.Kunde_ID
group by k.Kunde_id, Vorname, Nachname
order by Anzahl desc, N asc;							-- Sortierung nach dem Alias aus der Spaltenliste

-- -------------------------------------------------------------------------------
-- nochmal Info zu count()
select * from kunde;
insert into kunde(Nachname, email) values ('Schmidt', 'fs@xyz.de');

select count(*) from kunde;
select count(Kunde_ID) from kunde;
select count(vorname) from kunde;
-- -------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------------------
-- Abfragen mit gruppierten Listen und Selektion mit HAVING
-- -----------------------------------------------------------------------------------------------

-- Liste mit allen Herstellern und dem Preis des jeweils teuersten Produkts
-- Vorüberlegungen:
select * from hersteller;
select * from produkt;

select
	*
from hersteller h
		join produkt p on h.Hersteller_ID = p.Hersteller_ID
order by h.Hersteller_ID;

-- Lösung:
select
	h.Hersteller_ID,
    Hersteller_Name,
    max(Euro_Preis) 'Max_Preis'
from hersteller h
		join produkt p on h.Hersteller_ID = p.Hersteller_ID
group by h.Hersteller_ID, Hersteller_Name
order by h.Hersteller_ID;

-- Liste mit allen Herstellern und dem Preis des jeweils teuersten Produkts. Es sollen nur die Hersteller angezeigt werden,
-- deren teuerstes Produkt teurer ist als 30,00 Euro
select
	h.Hersteller_ID,
    Hersteller_Name,
    max(Euro_Preis) 'Max_Preis'
from hersteller h
		join produkt p on h.Hersteller_ID = p.Hersteller_ID
group by h.Hersteller_ID, Hersteller_Name
having max(Euro_Preis) > 30									-- hier erfolgt die Selektion nach dem Ergebnis der Aggregat-Funktion
order by h.Hersteller_ID;
-- HAVING ist ein spezielles WHERE und darf nur nach GROUP BY verwendet werden
-- der logische Ausdruck nach dem HAVING darf Aggregatfunktionen enthalten
-- (der logische Ausdruck nach dem WHERE darf KEINE Aggregatfunktionen enthalten)
-- der logische Ausdruck nach dem HAVING darf auch Auswertungen auf Feldinhalte durchführen

-- Liste mit allen Herstellern und dem Preis des jeweils teuersten Produkts. Es sollen nur die Hersteller angezeigt werden,
-- deren teuerstes Produkt teurer ist als 30,00 Euro. Es sollen nur Hersteller angezeigt werden, deren Name mit C beginnt.
select
	h.Hersteller_ID,
    Hersteller_Name,
    max(Euro_Preis) 'Max_Preis'
from hersteller h
		join produkt p on h.Hersteller_ID = p.Hersteller_ID
group by h.Hersteller_ID, Hersteller_Name
having max(Euro_Preis) > 30	AND Hersteller_Name like 'C%'
order by h.Hersteller_ID;

select
	h.Hersteller_ID,
    Hersteller_Name,
    max(Euro_Preis) 'Max_Preis'
from hersteller h
		join produkt p on h.Hersteller_ID = p.Hersteller_ID
where Hersteller_Name like 'C%'
group by h.Hersteller_ID, Hersteller_Name
having max(Euro_Preis) > 30
order by h.Hersteller_ID;

-- Liste mit allen Herstellern und dem Preis des jeweils teuersten Produkts. Es sollen nur die Hersteller angezeigt werden,
-- deren Produkte im Durchschnitt weniger als 500 kosten
select
	h.Hersteller_ID,
    Hersteller_Name,
    max(Euro_Preis) 'Max_Preis'
from hersteller h
		join produkt p on h.Hersteller_ID = p.Hersteller_ID
group by h.Hersteller_ID, Hersteller_Name
having avg(Euro_Preis) < 500									-- hier erfolgt die Selektion nach dem Ergebnis der Aggregat-Funktion
order by h.Hersteller_ID;

