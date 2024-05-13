
use geld_her;

-- a)	Es sollen (fast) alle Produkte (ID, Produktname und Preis) ausgegeben werden. Ausnahme soll jedoch das Produkt mit der größten ID sein. Ausgabe numerisch sortiert nach Produkt-ID. 

select max(Produkt_id) from produkt;

select *
from produkt
where Produkt_id != (select max(Produkt_id) from produkt)
order by Produkt_id;



-- b)	Es sollen alle Kunden (ID, Vorname, Nachname) ausgegeben werden, die nach der letzten Abrechnung von Kunden 4 noch die Seite von „Geld_her“ besucht (*) haben.

select * from abrechnung
where Kunde_id = 4;

select max(datum) from abrechnung
where Kunde_id = 4;

select 
	k.Kunde_id,
    Vorname,
    Nachname
from abrechnung a
	join kunde k on a.Kunde_id = k.Kunde_id
where Datum > (select max(datum) from abrechnung where Kunde_id = 4)
order by Datum;


-- c)	Es sollen alle Kunden (Vorname, Nachname) ausgegeben werden, die vor dem November 2021 mindestens eines jener Produkte gekauft haben, die dann auch während des Novembers gekauft worden sind.

select * from abrechnung where month(datum) = 11 AND year(datum) = 2021;
select * from abrechnung where datum like '2021-11-%';

select * 
from abrechnung a
	join abrechnung_produkt ap on a.Abrechnung_ID = ap.Abrechnung_ID
    join produkt p on p.Produkt_ID = ap.Produkt_ID
where month(datum) = 11 AND year(datum) = 2021;

select distinct Produkt_ID
from abrechnung a
	join abrechnung_produkt ap on a.Abrechnung_ID = ap.Abrechnung_ID
where month(datum) = 11 AND year(datum) = 2021;
-- das ist der subselect, den wir dann anschließend benötigen

select
	*
from kunde k
	join abrechnung a on k.Kunde_ID = a.Kunde_id
    join abrechnung_produkt ap on ap.Abrechnung_ID = a.Abrechnung_ID
where datum < '2021-11-01';

select distinct
	Vorname,
    Nachname
from kunde k
	join abrechnung a on k.Kunde_ID = a.Kunde_id
    join abrechnung_produkt ap on ap.Abrechnung_ID = a.Abrechnung_ID
where	datum < '2021-11-01' AND
		Produkt_ID IN (	select distinct Produkt_ID
						from abrechnung a
							join abrechnung_produkt ap on a.Abrechnung_ID = ap.Abrechnung_ID
						where month(datum) = 11 AND year(datum) = 2021) ;


-- d)	Es sollen alle Produkte (ID und Name) jener Hersteller ausgegeben werden, von denen mindestens ein Produkt stammt, das auf der Abrechnung 1 bestellt wurde.

-- select * from abrechnung where Abrechnung_ID = 1;
select * from abrechnung_produkt where Abrechnung_ID = 1;
select distinct Produkt_ID from abrechnung_produkt where Abrechnung_ID = 1;

select distinct Hersteller_ID
from abrechnung_produkt ap
	join produkt p on ap.Produkt_ID = p.Produkt_id
where Abrechnung_ID = 1;

select
	Produkt_id,
    Produkt_Name
from produkt
where Hersteller_ID IN (	select distinct Hersteller_ID
							from abrechnung_produkt ap
							join produkt p on ap.Produkt_ID = p.Produkt_id
							where Abrechnung_ID = 1);


-- e)	Es sollen alle Abrechnungen (ID, Datum, Anzahl der bestellten Produkte) ausgegeben werden, bei denen mehr Produkte bestellt wurden, als Contrabit bei „Geld_her“ Produkte im Sortiment hat.


-- f)	Es sollen all jene Speditionen (ID, Name und Anzahl der transportierten Produkte) ausgegeben werden, die jeweils mehr Produkte transportierten als Kunde 3 bisher bestellte. Ausgabe alphabetisch nach Speditionsname sortiert.



