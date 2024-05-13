use maxversicherung_v2;

-- (1) Geben Sie eine Liste mit allen Schadenshöhen aus. Zusätzlich zur Spalte Schadenshöhe soll die Summe aus Schadenshöhe
-- und einem Zuschlag von 4,95 ausgegeben werden. Geben Sie aussagekräftige Spaltenüberschriften an.
select 
	Schadenshoehe 'Schadenshöhe',
	Schadenshoehe + 4.95 'Schadenshöhe incl. Zuschlag'
from Schadensfall;

-- (2) Geben Sie eine Liste mit allen Schadenshöhen aus. Zusätzlich zur Spalte Schadenshöhe soll die Schadenshöhe abzüglich
-- einer Ermäßigung von 110 ausgegeben werden. Geben Sie aussagekräftige Spaltenüberschriften an.
select 
	Schadenshoehe 'Schadenshöhe',
	Schadenshoehe - 110 'Schadenshöhe abzgl. Ermäßigung'
from Schadensfall;

-- (3) Geben Sie eine Liste mit allen Schadenshöhen aus. Zusätzlich zur Spalte Schadenshöhe soll eine Spalte ausgegeben werden,
-- die 7,5% der Schadenshöhe anzeigt. Geben Sie aussagekräftige Spaltenüberschriften an.
select 
	Schadenshoehe 'Schadenshöhe',
	Schadenshoehe * 0.075 '7,5% der Schadenshöhe' -- auch möglich: Schadenshoehe * 7.5/100
from Schadensfall;

select 
	Schadenshoehe 'Schadenshöhe',
	Schadenshoehe * 7.5/100 '7,5% der Schadenshöhe'
from Schadensfall;

-- (4) Geben Sie eine Liste mit allen Schadenshöhen aus. Zusätzlich zur Spalte Schadenshöhe soll eine Spalte ausgegeben werden,
-- die die Hälfte der Schadenshöhe anzeigt. Geben Sie aussagekräftige Spaltenüberschriften an.
-- Errechnen Sie die Hälfte mit Hilfe der Division.
select 
	Schadenshoehe 'Schadenshöhe',
	Schadenshoehe / 2 'Hälfte der Schadenshöhe'
from Schadensfall;

-- (5) Geben Sie eine Liste mit allen Schadenshöhen aus. Fassen Sie die vorangegangenen 4 Berechnungen zusammen und geben Sie sie
-- in 4 zusätzlichen Spalten in dieser Liste an.
select 
	Schadenshoehe 'Schadenshöhe',
	Schadenshoehe + 4.95 'Schadenshöhe incl. Zuschlag',
	Schadenshoehe - 110 'Schadenshöhe abzgl. Ermäßigung',
	Schadenshoehe * 0.075 '7,5% der Schadenshöhe',
	Schadenshoehe / 2 'Hälfte der Schadenshöhe'
from Schadensfall;

select
	'Schadenshöhe incl. Zuschlag' AS 'Berechnung',	-- das AS ist für den Alias notwendig
	Schadenshoehe 'Schadenshöhe',
	Schadenshoehe + 4.95 'berechneter Wert'
from Schadensfall
union all
select 
	'Schadenshöhe abzgl. Ermäßigung' AS 'Berechnung',
	Schadenshoehe 'Schadenshöhe',
	Schadenshoehe - 110 'berechneter Wert'
from Schadensfall
union all
select 
	'7,5% der Schadenshöhe' AS 'Berechnung',
	Schadenshoehe 'Schadenshöhe',
	Schadenshoehe * 7.5/100 'berechneter Wert'
from Schadensfall
union all
select 
	'Hälfte der Schadenshöhe' AS 'Berechnung',
	Schadenshoehe 'Schadenshöhe',
	Schadenshoehe / 2  'berechneter Wert'
from Schadensfall;


-- (6) Geben Sie 5% der Schadenshöhe des Schadensfalls mit der ID 3 aus
select Schadenshoehe * 5/100
from Schadensfall
where ID = 3;

-- (7) Berechnen Sie 5% der Schadenshöhe des Schadensfalls mit der ID 3
-- Lassen Sie folgende Werte ausgeben:
--		ID des Schadensfalls
--		Schadenshöhe
--		5% der Schadenshöhe
--		die Summe der beiden vorhergehenden Werte
-- Geben Sie den Spalten aussagekräftige Überschriften
select 
	ID 'Schadens-ID',
	Schadenshoehe 'Schadenshöhe',
	Schadenshoehe * 5/100 '5% der Schadenshöhe',
	Schadenshoehe + Schadenshoehe * 5/100 'Summe'
from Schadensfall
where ID=3;
