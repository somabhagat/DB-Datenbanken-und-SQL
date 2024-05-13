
use geld_her;


-- a)	Es sollen alle Kunden (ID, Vorname, Nachname) ausgegeben werden, die den gleichen Nachnamen wie Kunde 3 haben. 
select nachname from kunde where Kunde_ID = 3;

select
	Kunde_ID,
    Vorname,
    Nachname
from kunde
where Nachname = (select nachname from kunde where Kunde_ID = 3);


-- b)	Identische Ausgabe wie in a), nun aber mit Ausnahme von Kunde 3.
select
	Kunde_ID,
    Vorname,
    Nachname
from kunde
where 	Nachname = (select nachname from kunde where Kunde_ID = 3) AND
		Kunde_ID != 3;


-- c)	Es sollen alle „teuersten Produkte“ (ID, Produktname und Preis) ausgegeben werden. 

select * from produkt order by Euro_Preis desc;
select max(Euro_Preis) from produkt;
select Euro_Preis from produkt order by Euro_Preis desc limit 1;

-- Variante 1:
select * from produkt
where Euro_Preis = (select max(Euro_Preis) from produkt);

-- Variante 2:
select * from produkt
where Euro_Preis = (select Euro_Preis from produkt order by Euro_Preis desc limit 1);


-- d)	Es sollen alle Kunden (Vorname, Nachname) ausgegeben werden, die bisher weniger Produkte bestellten, als alleine auf der Abrechnung 3 bestellt worden sind.

select * from abrechnung_produkt where Abrechnung_ID = 3;

select count(*) from abrechnung_produkt where Abrechnung_ID = 3;

select
	*
from kunde k
	join abrechnung a on k.Kunde_ID = a.Kunde_id
    join abrechnung_produkt ap on ap.Abrechnung_ID = a.Abrechnung_ID;

select
	k.Kunde_id,
    count(*) 'bestellte Produkte des Kunden'
from kunde k
	join abrechnung a on k.Kunde_ID = a.Kunde_id
    join abrechnung_produkt ap on ap.Abrechnung_ID = a.Abrechnung_ID
group by k.Kunde_id;

select
	k.Kunde_id,
    count(*) 'bestellte Produkte des Kunden'
from kunde k
	join abrechnung a on k.Kunde_ID = a.Kunde_id
    join abrechnung_produkt ap on ap.Abrechnung_ID = a.Abrechnung_ID
group by k.Kunde_id
having count(*) < (select count(*) from abrechnung_produkt where Abrechnung_ID = 3) ;

select
	k.Kunde_id,
    Vorname,
    Nachname
from kunde k
	join abrechnung a on k.Kunde_ID = a.Kunde_id
    join abrechnung_produkt ap on ap.Abrechnung_ID = a.Abrechnung_ID
group by k.Kunde_id, Vorname, Nachname
having count(*) < (select count(*) from abrechnung_produkt where Abrechnung_ID = 3) ;


-- e)	Es soll die Anzahl der Produkte ermittelt werden, die billiger sind als die Gesamtbestellsumme von Kunde 5.

select * from abrechnung where Kunde_id = 5;
select * from abrechnung_produkt;

select *
from abrechnung a
	join abrechnung_produkt ap on a.Abrechnung_ID = ap.Abrechnung_ID
    join produkt p on p.Produkt_id = ap.Produkt_ID
where a.Kunde_id = 5;

select sum(Euro_Preis)
from abrechnung a
	join abrechnung_produkt ap on a.Abrechnung_ID = ap.Abrechnung_ID
    join produkt p on p.Produkt_id = ap.Produkt_ID
where a.Kunde_id = 5;

select 
	*
from produkt
where Euro_Preis < (select sum(Euro_Preis)
					from abrechnung a
					join abrechnung_produkt ap on a.Abrechnung_ID = ap.Abrechnung_ID
					join produkt p on p.Produkt_id = ap.Produkt_ID
					where a.Kunde_id = 5);

select 
	count(*) 'Anzahl der billigeren Produkte'
from produkt
where Euro_Preis < (select sum(Euro_Preis)
					from abrechnung a
					join abrechnung_produkt ap on a.Abrechnung_ID = ap.Abrechnung_ID
					join produkt p on p.Produkt_id = ap.Produkt_ID
					where a.Kunde_id = 5);






