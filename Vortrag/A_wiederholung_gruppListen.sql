
use versicherung;

-- ----------------------------------------------------------------------------
-- Wiederholung und Vertiefung gruppierte Listen
-- ----------------------------------------------------------------------------

-- Liste mit allen Mitarbeitern mit allen Informationen
select * from mitarbeiter;

-- Liste, die anzeigt, wieviel Mitarbeiter je Abteilung vorhanden sind
select mitarbeiter.id, name, vorname, Geburtsdatum, Abteilung_ID, Bezeichnung
from mitarbeiter join abteilung on Abteilung_ID = abteilung.id
order by Abteilung_ID;

select
	Abteilung_ID,
    count(*) as 'Anzahl Mitarbeiter in Abteilung'
from mitarbeiter 
group by Abteilung_ID
order by Abteilung_ID;

-- Liste, die anzeigt, wieviel Mitarbeiter je Abteilung vorhanden sind. Zusätzlich sollen die Namen der
-- Abteilungen angezeigt werden. Die Liste soll sortiert sein nach Anzahl Mitarbeiter absteigend.

select
	Abteilung_ID 'Abtg',
    Bezeichnung,
    count(*) as 'Anzahl Mitarbeiter in Abteilung'
from mitarbeiter 
	join abteilung on Abteilung_ID = abteilung.ID
group by Abteilung_ID
order by count(*) desc, Bezeichnung asc;

-- Erstellen Sie eine Liste die anzeigt, wieviel Fahrzeuge je Fahrzeugtyp existieren. Lassen Sie die Fahrzeugtypbezeichnung
-- und den Namen des Herstellers ausgeben.

select * from fahrzeug order by Fahrzeugtyp_ID;

select
	Fahrzeugtyp_ID,
    count(*)
from fahrzeug 
group by Fahrzeugtyp_ID
order by Fahrzeugtyp_ID;

select
	Fahrzeugtyp_ID,
    Bezeichnung,
    count(*)
from fahrzeug f
	join fahrzeugtyp ft on f.Fahrzeugtyp_ID = ft.ID
group by Fahrzeugtyp_ID, Bezeichnung
order by Fahrzeugtyp_ID;

-- Variante mit JOIN
select
	Fahrzeugtyp_ID,
    Bezeichnung,
    Name, 
    count(*) 'Anzahl Fahrzeuge des Typs'
from fahrzeug f
	join fahrzeugtyp ft on f.Fahrzeugtyp_ID = ft.ID
    join fahrzeughersteller fh on fh.ID = Hersteller_ID
group by Fahrzeugtyp_ID, Bezeichnung
order by Fahrzeugtyp_ID;

-- Variante mit FROM..WHERE
select
	Fahrzeugtyp_ID,
    Bezeichnung,
    Name, 
    count(*) 'Anzahl Fahrzeuge des Typs'
from fahrzeug f, fahrzeugtyp ft, fahrzeughersteller fh
where	f.Fahrzeugtyp_ID = ft.ID AND
		fh.ID = Hersteller_ID
group by Fahrzeugtyp_ID, Bezeichnung
order by Fahrzeugtyp_ID;


-- Erstellen Sie eine Liste die anzeigt, wieviel Fahrzeuge je Fahrzeugtyp existieren. Lassen Sie die Fahrzeugtypbezeichnung ausgeben.
-- Es sollen auch die Fahrzeugtypen berücksichtigt werden, von denen es keine Fahrzeuge gibt.


select
	Fahrzeugtyp_ID,
    Bezeichnung,
    count(Fahrzeugtyp_ID)				-- count() auf spezielle Spalte wegen RIGHT JOIN
from fahrzeug f
	right join fahrzeugtyp ft on f.Fahrzeugtyp_ID = ft.ID
group by Fahrzeugtyp_ID, Bezeichnung
order by Fahrzeugtyp_ID;

-- Liste mit den Summen der Schadenshöhen je Fahrzeugtyp

select
	Fahrzeugtyp_ID,
    sum(z.Schadenshoehe) 'Summe je Typ'
from schadensfall s
	join zuordnung_sf_fz z on s.id = Schadensfall_ID
    join fahrzeug f on f.id = Fahrzeug_ID
group by Fahrzeugtyp_ID;