use geld_her;

/*a)	Alle Produkte mit einer ID>1, die teurer als 20 und billiger als 50 Euro sind. Sortiert nach Hersteller-ID (aufsteigend) und Preis (absteigend). Es sollen die ersten 2 Datensätze übersprungen und nur die 3 folgenden ausgegeben werden. (*) */

select
	*
from produkt
where Produkt_id > 1 AND
		Euro_Preis > 20 AND
        Euro_Preis < 50
order by Hersteller_ID, Euro_Preis desc
limit 2,3;


/*b)	Alle Speditionsnamen, alphabetisch sortiert, sofern deren ID weder 1 noch 10 ist. Von diesen sollen die ersten beiden übersprungen und nur die 10 folgenden ausgegeben werden.*/

select
	Spedition_Name
from spedition
where Spedition_ID != 1 AND Spedition_ID != 5
order by Spedition_Name
limit 2, 10;

select
	Spedition_Name
from spedition
where Spedition_ID NOT IN (1, 5) 
order by Spedition_Name
limit 2, 10;


/*c)	Von nahezu allen Kunden soll deren ID und der Nachname ausgegeben werden. Ausnahme sind nur Kunden, deren ID>100 ist oder deren Nachname „Mustermann“ lautet. Die Ausgabe soll sortiert nach ID absteigend geschehen. Allerdings sollen nur die ersten 4 Treffer ausgegeben werden.*/

select
	Kunde_ID,
    Nachname
from kunde
where 	Kunde_ID <= 5 AND
		Nachname != 'Deise'
order by Kunde_ID desc
limit 4;

-- BEACHTE: das nachfolgende WHERE erfüllt die Aufgabe NICHT --> offenes ODER
select
	Kunde_ID,
    Nachname
from kunde
where 	Kunde_ID <= 5 OR
		Nachname != 'Deise'
order by Kunde_ID desc
limit 4;


/*d)	Es sollen alle Produkt-IDs jener Produkte ausgegeben werden, die bereits mindestens 1-mal verkauft wurden (siehe Einträge der Hilfstabelle). Es sollen aber nur Produkte berücksichtigt werden, deren ID>2 ist und die auf Abrechnungen gekauft wurden, deren ID>3 ist. Die Ausgabe soll sortiert nach Produkt-ID aufsteigend geschehen. Die Ausgabe von Dubletten soll vermieden werden.*/

select distinct
	Produkt_ID
from abrechnung_produkt
where 	Produkt_ID > 2 AND
		Abrechnung_ID > 3
order by Produkt_ID asc;


/*e)	Es sollen alle Produkte, sortiert nach Preis absteigend ausgegeben werden. Allerdings sollen die ersten 100 Treffer übersprungen und nur die 3 folgenden ausgegeben werden. (**) */

select *
from produkt
order by Euro_Preis desc
limit 100, 3;

