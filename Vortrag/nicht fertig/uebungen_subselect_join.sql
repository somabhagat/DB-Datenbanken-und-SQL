
use geld_her_v_III;

-- ----------------------------------------------------------------------------
-- Vertiefung subselect
-- ----------------------------------------------------------------------------

-- Liste aller Abrechnungen mit Nachname und eMail der Kunden
select * from abrechnung;

-- Variante mit JOIN
select 
	a.* ,
    k.Nachname,
    Email
from abrechnung a
	inner join kunde k on a.Kunde_id = k.Kunde_ID;

select 
	a.* ,
    k.Nachname,
    Email
from abrechnung a, kunde k 
where a.Kunde_id = k.Kunde_ID;

-- Variante mit SUBSELECT
select
	*,
    (select Nachname from kunde k where k.Kunde_id = a.Kunde_id) 'Nachname',
    (select Email from kunde k where k.Kunde_id = a.Kunde_id) 'eMail'
from abrechnung a;

-- Welche Kunden_ID hat welche Produkte gekauft? Die Produkte mit Bezeichnung aufführen.
select * from abrechnung_produkt ap;

-- Variante mit JOIN (2 Varianten):
select distinct
	a.Kunde_id,
    p.Produkt_Name
from abrechnung_produkt ap
	inner join abrechnung a on a.Abrechnung_ID = ap.Abrechnung_ID
    inner join produkt p on p.Produkt_id = ap.Produkt_ID
order by a.Kunde_id;
-- DISTINCT ist nötig, um Mehrfachnennungen zu unterdrücken

-- im Folgenden eine weitere Variante, um die Mehrfachnennungen zu verhindern ---> GROUP BY
select
	a.Kunde_id,
    p.Produkt_Name,
    count(*) 'Anzahl der gekauften Produkte'
from abrechnung_produkt ap
	inner join abrechnung a on a.Abrechnung_ID = ap.Abrechnung_ID
    inner join produkt p on p.Produkt_id = ap.Produkt_ID
group by a.Kunde_id, p.Produkt_Name
order by a.Kunde_id;

select distinct
	a.Kunde_id,
    p.Produkt_Name
from abrechnung_produkt ap, abrechnung a, produkt p 
	where a.Abrechnung_ID = ap.Abrechnung_ID AND
    p.Produkt_id = ap.Produkt_ID
order by a.Kunde_id;
-- DISTINCT ist nötig, um Mehrfachnennungen zu unterdrücken

-- Variante mit SUBSELECT

select distinct
	*,
    (select Kunde_id from abrechnung a where a.Abrechnung_ID = ap.Abrechnung_ID) 'Kunde',
    (select Produkt_Name from produkt p where p.Produkt_id = ap.Produkt_ID) 'Produkt'
from abrechnung_produkt ap
order by Produkt asc, Kunde asc;
-- HINWEIS: Bei Sortierung nach den subselect-Spalten muss ein SpaltenAlias vergeben werden --> die Sortierung
-- muss nach diesem SpaltenAlias erfolgen

select 
	*,
    (select Kunde_id from abrechnung a where a.Abrechnung_ID = ap.Abrechnung_ID) 'kunde',
    (select Produkt_Name from produkt p where p.Produkt_id = ap.Produkt_ID) 'Produkt'
from abrechnung_produkt ap
 group by kunde, Produkt
 order by Produkt;
-- diese Anweisung wird zwar ohne Fehlermeldung ausgeführt (in MySQL bzw. MariaDB), liefert aber nicht das richtige Ergebnis (2 Datensätze fehlen)
-- Lösung siehe nachfolgend: alle anzuzeigenden Spalten müssen nach GROUP BY aufgeführt werden

select 
	Abrechnung_ID,
    Produkt_ID,
    (select Kunde_id from abrechnung a where a.Abrechnung_ID = ap.Abrechnung_ID) 'kunde',
    (select Produkt_Name from produkt p where p.Produkt_id = ap.Produkt_ID) 'Produkt'
from abrechnung_produkt ap
 group by abrechnung_id, Produkt_ID, kunde, Produkt
 order by Produkt;
-- das ist die richtige Lösung (im Vergleich zur vorangegangenen)


-- ----------------------------------------------------------------------------
-- Vertiefung der JOIN-Varianten (left bzw. right) über 2 und mehr Tabellen
-- ----------------------------------------------------------------------------

-- Anzeige aller Kunden mit ihren Abrechnungen. Es sollen auch die Kunden OHNE Abrechnung aufgeführt werden.
select
	k.Kunde_id,
    Nachname,
    a.Abrechnung_ID
from kunde k
	left join abrechnung a on k.Kunde_ID = a.Kunde_id
order by k.Kunde_ID;
-- Variante mit LEFT JOIN

select
	k.Kunde_id,
    Nachname,
    a.Abrechnung_ID
from abrechnung a
	right join kunde k on k.Kunde_ID = a.Kunde_id
order by k.Kunde_ID;
-- Variante mit RIGHT JOIN

-- Anzeige aller Kunden mit ihren Abrechnungen. Es sollen auch die Kunden OHNE Abrechnung aufgeführt werden. Lassen
-- Sie dazu die bestellten Produkt_IDs auflisten.
select
	k.Kunde_id,
    Nachname,
    a.Abrechnung_ID,
    ap.Produkt_ID
from kunde k
	left join abrechnung a on k.Kunde_ID = a.Kunde_id
    left join abrechnung_produkt ap on a.Abrechnung_ID = ap.Abrechnung_ID
order by k.Kunde_ID;
-- HINWEIS: der LEFT JOIN muss für die komplette Anweisung verwendet werden

select
	k.Kunde_id,
    Nachname,
    a.Abrechnung_ID,
    ap.Produkt_ID
from abrechnung_produkt ap 
		right join abrechnung a on a.Abrechnung_ID = ap.Abrechnung_ID
        right join kunde k on k.Kunde_ID = a.Kunde_id
order by k.Kunde_ID;
-- HINWEIS: der RIGHT JOIN muss für die komplette Anweisung verwendet werden



