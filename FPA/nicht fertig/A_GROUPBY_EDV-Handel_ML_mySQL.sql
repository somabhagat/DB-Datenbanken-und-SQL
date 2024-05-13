use edvhandel;

/*(1) Erstellen Sie eine Liste mit der Anzahl der Bestellung je Bestelldatum.
Geben Sie den Spalten aussagekräftige Überschriften.*/

select * from bestellung order by bestelldatum;

select 	bestelldatum, 
		count(*) 'Anzahl der Bestellung je Datum'
from bestellung
group by bestelldatum;


/*(2) Erstellen Sie eine Liste mit der Anzahl der Bestellung je Bestelldatum und nur mit Tagen mit mehr als 3 Bestellungen.
Geben Sie den Spalten aussagekräftige Überschriften.
*/

select 	bestelldatum, 
		count(*) 'Anzahl der Bestellung je Datum'
from bestellung
group by bestelldatum
having count(*)>3;


/*(3) Ergänzen Sie die Liste aus (2) um die Summe der Rechnungsbeträge aller Bestellungen an dem jeweiligen Tag.
Geben Sie den Spalten aussagekräftige Überschriften.*/
select * from bestellung order by bestelldatum;

select 	bestelldatum, 
		count(*) 'Anzahl der Bestellung je Datum',
        sum(rechnungsbetrag) 'Summe der Bestellung je Datum'
from bestellung
group by bestelldatum
having count(*)>3;


/*(4) Ändern Sie die Liste aus (3) so, dass nur die Datensätze angezeigt werden, bei denen die Summe der Rechnungsbeträge größer oder gleich 2000 sind.
Geben Sie den Spalten aussagekräftige Überschriften.*/

select 	bestelldatum, 
		count(*) 'Anzahl der Bestellung je Datum',
        sum(rechnungsbetrag) 'Summe der Bestellung je Datum'
from bestellung
group by bestelldatum
having count(*)>3 AND sum(rechnungsbetrag)>=2000
order by sum(rechnungsbetrag);						-- optionale Sortierung


/*(5) Erstellen Sie eine Liste, die die Hersteller-Nr., den Hersteller-Namen und die Anzahl der Artikel anzeigt, die vom jeweiligen Hersteller in dieser Datenbank gespeichert sind.
Geben Sie den Spalten aussagekräftige Überschriften.*/
select * from artikel order by hersteller_nr;

select * from artikel join hersteller on artikel.hersteller_nr=hersteller.hersteller_nr;

select	hersteller.hersteller_nr,
		hersteller.name,
		count(*) 'Anzahl Artikel je Hersteller'
from artikel join hersteller on artikel.hersteller_nr=hersteller.hersteller_nr
group by hersteller_nr
order by hersteller_nr;			-- optionale Sortierung


-- ---------------------------------------------------------
-- ????

select	kategorie_nr,
		hersteller.hersteller_nr,
		hersteller.name,
		count(*) 'Anzahl Artikel je Kategorie'
from artikel join hersteller on artikel.hersteller_nr=hersteller.hersteller_nr
group by kategorie_nr, hersteller.hersteller_nr, hersteller.name;

-- Reihenfolge
-- from where groupBy having spalten order limit
