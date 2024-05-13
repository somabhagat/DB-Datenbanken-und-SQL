
use geld_her;

-- ---------------------------------------------------------------------------
-- Wiederholung + Vertiefung INNER JOIN
-- ---------------------------------------------------------------------------

-- Erstellen Sie eine Liste mit allen Namen der Kunden und dem Datum, wann sie in der
-- Tabelle Abrechnung erfasst wurden.
-- Vorüberlegung:
select * from kunde;
select * from abrechnung;

select *
from kunde k
	join abrechnung a on k.Kunde_ID = a.Kunde_id
order by k.Kunde_ID;
-- Tabellen-Aliasse gelten immer nur für die Anweisung, wo sie vergeben wurden

select *
from kunde
	join abrechnung on kunde.Kunde_ID = abrechnung.Kunde_id
order by kunde.Kunde_ID;

-- Lösung:
-- VARIANTE mit JOIN
select
	Vorname,
    Nachname,
    Datum
from kunde k
	join abrechnung a on k.Kunde_ID = a.Kunde_id
order by k.Kunde_ID;

-- VARIANTE mit WHERE
select
	Vorname,
    Nachname,
    Datum
from kunde k, abrechnung a 
where k.Kunde_ID = a.Kunde_id
order by k.Kunde_ID;


-- Erstellen Sie eine Liste die anzeigt, welches Produkt auf welcher Abrechnung vorhanden ist. Es sollen folgende Felder angezeigt werden:
-- Abrechung_ID, Produkt_Name, Hersteller_ID, Euro_Preis
select
	Abrechnung_ID,
    Produkt_Name,
    Hersteller_ID,
    Euro_Preis
from abrechnung_produkt ap
		join produkt p on ap.Produkt_ID = p.Produkt_id
order by ap.Abrechnung_ID;
-- einige Datensätze werden mehrfach angezeigt, da die Produkte mehrfach verkauft wurden

-- VARIANTE mit JOIN
select distinct
	Abrechnung_ID,
    Produkt_Name,
    Hersteller_ID,
    Euro_Preis
from abrechnung_produkt ap
		join produkt p on ap.Produkt_ID = p.Produkt_id
order by ap.Abrechnung_ID;
-- mehrfache Datensätze werden mit DISTINCT unterdrückt

-- VARIANTE mit WHERE
select distinct
	Abrechnung_ID,
    Produkt_Name,
    Hersteller_ID,
    Euro_Preis
from abrechnung_produkt ap, produkt p 
where ap.Produkt_ID = p.Produkt_id
order by ap.Abrechnung_ID;


-- Erstellen Sie eine Liste die anzeigt, welches Produkt durch welche Spedition ausgeliefert wird.
-- VARIANTE mit JOIN
select
	s.Spedition_Name,
    p.Produkt_id,
    p.Produkt_Name
from spedition s
		join hersteller h on s.Spedition_ID = h.Spedition_ID
        join produkt p on p.Hersteller_ID = h.Hersteller_ID;

-- VARIANTE mit WHERE
select
	s.Spedition_Name,
    p.Produkt_id,
    p.Produkt_Name
from spedition s, hersteller h, produkt p
where 	s.Spedition_ID = h.Spedition_ID AND
        p.Hersteller_ID = h.Hersteller_ID;

-- ---------------------------------------------------------------------------
-- Weitere Arten des JOINs: LEFT JOIN, RIGHT JOIN
-- ---------------------------------------------------------------------------
-- Werden 2 Tabellen mit einem LEFT bzw. RIGHT JOIN verbunden, dann werden folgende Datensätze angezeigt:
--		die Datensätze, bei denen es eine Übereinstimmung entsprechend dem ON tabelle1.pk_feld = tabelle2.fk_feld gibt und zusätzlich
--		die restlichen Datensätze der Tabelle, die links vom LEFT JOIN steht bzw. die rechts vom RIGHT JOIN steht


-- Erstellen Sie eine Liste die anzeigt, welche Abrechnung zu welchem Kunden gehört. Es sollen auch die Kunden angezeigt werden,
-- für die in der Tabelle Abrechnung KEIN Datensatz existiert.

select
	*
from kunde k
		LEFT JOIN abrechnung a on k.Kunde_ID = a.Kunde_id;
-- es werden auch die Kunden angezeigt, deren Kunde_ID nicht in der Tabelle abrechnung vorhanden sind

-- Liste mit allen Abrechnungen und den dazugehörigen Kunden. Es sollen auch die Abrechnungen ohne Kunde_ID angezeigt werden.
select
	*
from abrechnung a
		LEFT JOIN kunde k on k.Kunde_ID = a.Kunde_id;
-- BEACHTE: Es gibt keine Abrechnung ohne Kunde_ID


-- Liste mit allen Herstellern und deren Speditionen. Es sollen auch die Speditionen angezeigt werden, denen kein Hersteller zugeordnet ist.
select *
from hersteller h
		RIGHT JOIN spedition s on h.Spedition_ID = s.Spedition_ID;

-- Liste mit den Produkten, die nie auf einer Abrechnung verwendet wurden
-- Vorüberlegung:
select *
from abrechnung_produkt ap
		join produkt p on ap.Produkt_ID = p.Produkt_id;
-- es werden alle zwischen den Tabellen verbunden Datensätze angezeigt JOIN = INNER JOIN

select *
from abrechnung_produkt ap
		RIGHT join produkt p on ap.Produkt_ID = p.Produkt_id;
-- es werden zuätzlich auch alle anderen Datensätze aus der Tabelle Produkt angezeigt RIGHT JOIN

-- Lösung:
select *
from abrechnung_produkt ap
		RIGHT join produkt p on ap.Produkt_ID = p.Produkt_id
where Abrechnung_ID IS null;
-- es werden nur die Produkte angezeigt, für die es keine Abrechnung_ID gibt

-- Auf welche Abrechnung_IDs wurde nie ein Produkt gekauft?
select *
from abrechnung a 
	left join abrechnung_produkt ap on a.Abrechnung_ID = ap.Abrechnung_ID
where ap.Abrechnung_ID IS NULL;

-- ACHTUNG: Wechsel der Datenbank
use versicherung;

-- Liste der Mitarbeiter, die nicht an der Betreuung der Versicherungsverträge beteiligt sind.
select
	m.ID,
    Name,
    Vorname -- ,
    -- v.*
from mitarbeiter m
	left join versicherungsvertrag v on m.ID = v.Mitarbeiter_ID
where v.ID IS NULL;

-- Welchem Mitarbeiter ist kein Dienstwagen zugeordnet?
select
	m.id,
    Vorname,
    Name,
    d.*
from mitarbeiter m
	left join dienstwagen d on m.ID = d.Mitarbeiter_ID
where d.id is null;

-- Welchem Dienstwagen ist kein Mitarbeiter zugeordnet?
select
	m.id,
    Vorname,
    Name,
    d.*
from mitarbeiter m
	right join dienstwagen d on m.ID = d.Mitarbeiter_ID
where m.id is null;


-- ---------------------------------------------------------------------------
-- Weitere Arten des JOINs: FULL OUTER JOIN
-- ---------------------------------------------------------------------------
-- Werden 2 Tabellen mit einem FULL OUTER JOIN verbunden, dann werden folgende Datensätze angezeigt:
--		die Datensätze, bei denen es eine Übereinstimmung entsprechend dem ON tabelle1.pk_feld = tabelle2.fk_feld gibt und zusätzlich
--		die restlichen Datensätze der Tabelle, die links vom FULL OUTER JOIN steht und zusätzlich
--		die restlichen Datensätze der Tabelle, die rechts vom FULL OUTER JOIN steht 
-- FULL OUTER JOIN ist also die 'Vereinigung' von LEFT JOIN und RIGHT JOIN

-- damit würde ein FULL OUTER JOIN so aussehen:
/*
select
	m.id,
    Vorname,
    Name,
    d.* 
from mitarbeiter m
	full outer join dienstwagen d on m.ID = d.Mitarbeiter_ID; */
-- diese Syntax funktioniert in MySQL bzw. MariaDB nicht (nur in vielen anderen DB-Systemen) ---> der FULL OUTER JOIN muss daher
-- in diesem System mit LEFT und RIGHT nachgebaut werden (work around)

-- Liste mit allen Mitarbeiter ohne Dienstwagen und allen Dienstwagen ohne Mitarbeiter
select
	m.id,
    Vorname,
    Name,
    d.* 
from mitarbeiter m
	left join dienstwagen d on m.ID = d.Mitarbeiter_ID
UNION 										-- mit ALL werden alle auch mehrfachen Datensätze angezeigt
select
	m.id,
    Vorname,
    Name,
    d.*
from mitarbeiter m
	right join dienstwagen d on m.ID = d.Mitarbeiter_ID;
    
select
	m.id,
    Vorname,
    Name,
    d.* 
from mitarbeiter m
	left join dienstwagen d on m.ID = d.Mitarbeiter_ID
where d.id is null
UNION
select
	m.id,
    Vorname,
    Name,
    d.*
from mitarbeiter m
	right join dienstwagen d on m.ID = d.Mitarbeiter_ID
where m.id is null;

-- ---------------------------------------------------------------------------
-- HINWEIS:
-- der LEFT JOIN heißt mit vollständiger Syntax LEFT OUTER JOIN
-- der RIGHT JOIN heißt mit vollständiger Syntax RIGHT OUTER JOIN

-- ---------------------------------------------------------------------------
-- Weitere Arten des JOINs: NATURAL JOIN
-- ---------------------------------------------------------------------------
use geld_her;

-- Bei einem NATURAL JOIN werden zwei Tabellen über die Spalten miteinander verbunden, die den gleichen Namen haben.
-- BEACHTE:
--		Viele DB-Systeme kennen den NATURAL JOIN nicht.
--		Voraussetzung ist, dass die Spalten, über die die Tabellen verbunden werden sollen, den gleichen Namen haben.
--		Spalten, die den gleichen Namen haben, müssen auch die gleiche Bedeutung haben.

-- Liste mit allen Kundendaten und den dazugehörigen Abrechnungen
select *
from kunde natural join abrechnung;

