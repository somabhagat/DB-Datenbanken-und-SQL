use geld_her_v6;

-- a)	Ausgabe der kleinsten und größten Speditions-ID, sowie der Anzahl der 
-- Speditionen (bzw. die Anzahl der Speditions-IDs, die nach Definition ja alle ungleich NULL sind).  

select * from spedition;

select
	min(Spedition_ID),
    max(Spedition_ID),
    count(*)
from spedition;

-- b)	Durchschnittlicher Preis aller bisher verkauften Produkte. Ausgabe 
-- unter der Überschrift „Durchschnittspreis“.

select * 
from abrechnung_produkt a
	join produkt p on a.Produkt_ID = p.Produkt_ID;
    
select
	avg(Euro_Preis)
from abrechnung_produkt a
	join produkt p on a.Produkt_ID = p.Produkt_ID;

-- c)	Pro Abrechnung: Kalenderdatum und Gesamtbestellsumme. Sortiert nach Gesamtbestellsumme abfallend.

select * from abrechnung a;
select * from abrechnung_produkt ap;
select * from produkt p;

select * 
from abrechnung a 
	join abrechnung_produkt ap on a.Abrechnung_ID = ap.Abrechnung_ID
	join produkt p on ap.Produkt_ID = p.Produkt_ID;

select
	a.Abrechnung_ID,
    datum,
    sum(Euro_Preis)
from abrechnung a 
		join abrechnung_produkt ap on a.Abrechnung_ID = ap.Abrechnung_ID
        join produkt p on ap.Produkt_ID = p.Produkt_ID
group by a.Abrechnung_ID, datum
order by sum(Euro_Preis) desc;

-- d)	Pro Kunde: Kunden-ID, Nachname und Anzahl der von ihm bestellten Produkte. 
-- Ausgabe nach 1.) Anzahl abfallend und 2.) Nachname aufsteigend sortiert.

select * from kunde k;
select * from abrechnung_produkt ap;

select
	a.Kunde_ID,
    nachname,
    count(ap.Produkt_ID) 'Anzahl Produkte'
from abrechnung a
	join abrechnung_produkt ap on a.Abrechnung_ID = ap.Abrechnung_ID
    join kunde k on k.Kunde_ID = a.Kunde_ID
group by Kunde_ID, nachname
order by count(ap.Produkt_ID) desc, Nachname asc;


-- e)	Pro Hersteller: Herstellername und Anzahl der Produkte im Sortiment von „Geld_her“. 
-- Ausgabe sortiert nach Anzahl abfallend. Es sollen aber nur Hersteller berücksichtigt werden, 
-- die mindestens 1 Produkt im Sortiment haben.

select * from produkt p;
select * from hersteller h;

select
	h.Hersteller_ID,
    Hersteller_Name,
    count(p.Produkt_ID) 'Anzahl Produkte'
from produkt p
	join hersteller h on p.Hersteller_ID = h.Hersteller_ID
group by h.Hersteller_ID, Hersteller_Name
order by count(p.Produkt_ID) desc;

-- f)	Pro Produkt: Produktname und Anzahl der bestellten Exemplare. Ausgabe sortiert 
-- nach Anzahl abfallend, begrenzt auf 3. (Es sollen aber nur Produkte berücksichtigt werden, die 
-- mindestens 1-mal bestellt wurden.)

select * from produkt p;
select * from abrechnung_produkt ap;

select 
	*
from produkt p
	join abrechnung_produkt ap on p.Produkt_ID = ap.Produkt_ID;

select 
	p.Produkt_ID,
    Produkt_Name,
    count(*) 'Anzahl Produkte'
from produkt p
	join abrechnung_produkt ap on p.Produkt_ID = ap.Produkt_ID
group by p.Produkt_ID, Produkt_Name
order by count(*) desc
limit 3;