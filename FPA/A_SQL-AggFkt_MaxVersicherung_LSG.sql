use maxversicherung_v2;

select * from schadensfall order by Schadenshoehe;

-- (1) Ermitteln Sie den Schadensfall mit der größten Schadenshöhe
-- Vergeben Sie eine aussagekräftige Spaltenüberschrift
select max(Schadenshoehe) 'Höchste Schadenssumme' from Schadensfall;

-- alternative Lsg ohne Aggregatfunktion
select Schadenshoehe from schadensfall 
order by Schadenshoehe desc
limit 1;

-- (2) Ermitteln Sie den Schadensfall mit der kleinsten Schadenshöhe
-- Vergeben Sie eine aussagekräftige Spaltenüberschrift
select min(Schadenshoehe) 'Kleinste Schadenssumme' from Schadensfall;

-- alternative Lsg ohne Aggregatfunktion
select Schadenshoehe from schadensfall 
order by Schadenshoehe asc
limit 1;

-- (3) Lassen Sie die größte und die kleinste Schadenshöhe in EINER Liste ausgeben.
-- Vergeben Sie eine aussagekräftige Spaltenüberschrift
select 
	max(Schadenshoehe) 'Höchste Schadenssumme',
	min(Schadenshoehe) 'Kleinste Schadenssumme' 
from Schadensfall;

-- (4) Lassen Sie das arithmetische Mittel der Schadenshöhen und die Summe aller Schadenshöhen
-- in EINER Liste ausgeben.
-- Vergeben Sie eine aussagekräftige Spaltenüberschrift
select 
	avg(Schadenshoehe) 'Durchschnittliche Schadenshöhe',
	sum(Schadenshoehe) 'Summe aller Schäden' 
from Schadensfall;

-- (5) Berechnen und geben Sie das arithmetische Mittel der Schadenshöhen aus, OHNE dass Sie die Funktion AVG() verwenden.

-- Vorbereitung der Lösung mit allen Ausgangswerten:
select 
	count(Schadenshoehe) 'Anzahl der Schadenshöhen',
	sum(Schadenshoehe) 'Summe aller Schäden',
	sum(Schadenshoehe) / COUNT(Schadenshoehe) 'Mittelwert der Schadenssummen',
	avg(schadenshoehe) 'zur Kontrolle'
from Schadensfall;

-- das ist das, was lt. Aufgabenstellung gefordert ist (und mehr sollte nicht getan werden)
select 
	sum(Schadenshoehe) / COUNT(Schadenshoehe) 'Mittelwert der Schadenssummen'
from Schadensfall;

-- (6) Berechnen Sie die Summe der Schadensfälle mit der ID 3 und 7

-- das ist der erste Zwischenschritt
select schadenshoehe
from Schadensfall
where ID=3 OR ID=7;

select *
from Schadensfall
where ID IN (3, 7);


-- das ist das Endergebnis --> beide Werte werden summiert
select sum(schadenshoehe)
from Schadensfall
where ID=3 OR ID=7;

-- eine weitere Lösungsmöglichkeit:
select sum(schadenshoehe) 'Summe aller Schadensfälle' from Schadensfall
where ID IN (7,3);