
use geld_her;

-- Liste mit Namen der Produkte, die billiger als Durchschnitt sind

-- Wie wird der Durchschnitt ausgerechnet?
select avg(euro_preis) from produkt;

-- Liste der Produkte, die billiger als 202.245 sind
select produkt_name
from produkt
where Euro_Preis < 202.245;
-- diese Anweisung liefert nur die Datensätze, die dem gerade aktuellen Datenstand entsprechen

-- Liste mit Namen der Produkte, die billiger als Durchschnitt sind ---> immer aktuelle Werte liefert folgender Befehl
select produkt_name
from produkt
where Euro_Preis < (select avg(euro_preis) from produkt);



-- Gesucht werden alle Kalenderdaten, an denen mindestens 1 Produkt bestellt wurde, das auch schon auf der Abrechnung 1 bestellt (bzw. gekauft) worden ist. Ausgabe chronologisch sortiert nach Kalenderdatum.
-- Welche Produkt_IDs sind auf der Abrechnung 1? Mehrfachnennungen von Produkt_IDs müssen unterdrückt werden.
select * from abrechnung_produkt
where Abrechnung_ID = 1;

select distinct Produkt_ID from abrechnung_produkt
where Abrechnung_ID = 1;

-- Welche Abrechnungen mit welchem Datum existieren?
select * from abrechnung;

-- Lösung:
select
	distinct Datum
from abrechnung
		join abrechnung_produkt on abrechnung.Abrechnung_ID = abrechnung_produkt.Abrechnung_ID
where Produkt_ID IN (select distinct Produkt_ID from abrechnung_produkt where Abrechnung_ID = 1)
order by datum;
