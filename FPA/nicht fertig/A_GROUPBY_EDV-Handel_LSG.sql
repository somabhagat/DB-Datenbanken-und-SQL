use edvhandel;

select * from ARTIKEL;
select * from KATEGORIE;
select * from BESTELLUNG;
select * from posten;

-- (1) Erstellen Sie eine Liste aller in der Tabelle 'Artikel' vorkommenden Kategorie-Nummern. Jede vorkommende
-- Kategorie-Nr. soll nur einmal angezeigt werden.
-- FORDERUNG: Erstellen Sie diese Liste, indem Sie ein SELECT auf die Tabelle 'Artikel' zusammen mit 
-- einem GROUP BY auf die richtige Spalte ausführen.

-- Vorbereitung
select * from ARTIKEL order by KATEGORIE_NR;

-- Lösung
select	KATEGORIE_NR
	from ARTIKEL
	group by KATEGORIE_NR;

-- das wäre eine alternative Lösung, die aber bei den weiteren Schritten nicht mehr funktioniert
select distinct Kategorie_Nr FROM Artikel;

-- (2) Entwickeln Sie die Liste aus (1) so weiter, dass angezeigt wird, wieviel Artikel je Kategorie
-- in der Tabelle gespeichert sind.
-- Geben Sie den Spalten aussagekräftige Überschriften.

select * from ARTIKEL order by KATEGORIE_NR;

select	KATEGORIE_NR 'Das sind alle Kat.Nr., nach denen gruppiert wurde',
		COUNT(KATEGORIE_NR) 'Das ist jeweils die Anzahl der Nr. in jeder Kategorie'
	from ARTIKEL
	group by KATEGORIE_NR;

select	KATEGORIE_NR 'Das sind alle Kat.Nr., nach denen gruppiert wurde',
		COUNT(KATEGORIE_NR) 'Das ist jeweils die Anzahl der Nr. in jeder Kategorie'
	from ARTIKEL
	group by KATEGORIE_NR
	order by KATEGORIE_NR DESC;
	-- Sortierung nach Kategorie-Nr. absteigend

select	KATEGORIE_NR 'Das sind alle Kat.Nr., nach denen gruppiert wurde',
		COUNT(KATEGORIE_NR) 'Das ist jeweils die Anzahl der Nr. in jeder Kategorie'
	from ARTIKEL
	group by KATEGORIE_NR
	order by COUNT(kategorie_NR) desc;
	-- Sortierung nach Anzahl in jeder Kategorie absteigend, order by immer in die letzte Zeile

-- (3) Entwickeln Sie die Liste aus (2) so weiter, dass die Namen der Kategorien angezeigt werden.
-- Geben Sie den Spalten aussagekräftige Überschriften.

select * from ARTIKEL a join KATEGORIE k on a.KATEGORIE_NR = k.KATEGORIE_NR;

select	a.KATEGORIE_NR, k.BEZEICHNUNG, 
		COUNT(*) 'Anzahl Artikel in dieser Kategorie'
	from ARTIKEL a join KATEGORIE k on a.KATEGORIE_NR = k.KATEGORIE_NR
	group by a.KATEGORIE_NR, k.BEZEICHNUNG;
-- group by kann auch auf gejointe Tabellen angewendet werden --> der JOIN sorgt für eine virtuelle/temporäre
-- Ergebnistabelle, auf die die Gruppierung angewendet wird


-- (4) Erstellen Sie eine Liste die anzeigt, welche Kunden-Nr. mit wieviel Bestellungen in 
-- der Tabelle 'Bestellung' erfasst ist.
-- Geben Sie den Spalten aussagekräftige Überschriften.

select * from BESTELLUNG order by KUNDEN_NR;

select	KUNDEN_NR,
		COUNT(*) 'Anzahl der Bestellungen für diesen Kunden in dieser Tabelle'
	from BESTELLUNG
	group by KUNDEN_NR;


-- (5) Entwickeln Sie die Liste aus (4) so weiter, dass zu jeder Kunden-Nr. der Name und der Ort des Kunden
-- angezeigt wird. Die Liste soll nach Anzahl der Bestellungen absteigend und nach Kundennamen aufsteigend
-- sortiert sein.
-- Geben Sie den Spalten aussagekräftige Überschriften.

select * from KUNDE order by ort;

select	b.KUNDEN_NR,	
		k.NAME, 
		k.ORT,
		COUNT(*) 'Anzahl der Bestellungen für diesen Kunden in dieser Tabelle'
	from BESTELLUNG b JOIN KUNDE k ON b.KUNDEN_NR = k.KUNDEN_NR
	group by b.KUNDEN_NR, k.name, k.ORT
	order by count(*) desc, k.NAME asc;

select	b.KUNDEN_NR,	
		NAME, 
		ORT,
		COUNT(*) 'Anzahl der Bestellungen für diesen Kunden in dieser Tabelle'
	from BESTELLUNG b JOIN KUNDE k ON b.KUNDEN_NR = k.KUNDEN_NR
	group by b.KUNDEN_NR, name, ORT
	order by count(*) desc, NAME asc;
-- diese Version ist die optimale Version ---> nur das Feld KUNDEN_NR muss über den TabellenNamen bzw. TabellenAlias 
-- eindeutig gemacht werden (alle anderen Spaltennamen sind eindeutig)
-- BEACHTE: lt. Aufgabenstellung Sortierung über 2 verschiedene Sortierschlüssel


select	b.KUNDEN_NR,	
		NAME, 
		ORT,
		COUNT(*) 'Anzahl der Bestellungen für diesen Kunden in dieser Tabelle'
	from BESTELLUNG b JOIN KUNDE k ON b.KUNDEN_NR = k.KUNDEN_NR
	group by b.KUNDEN_NR, name, ORT
	order by count(*) desc, ort asc;
    
select	b.KUNDEN_NR,	
		NAME, 
		ORT,
		COUNT(*) 'Anzahl der Bestellungen für diesen Kunden in dieser Tabelle'
	from BESTELLUNG b JOIN KUNDE k ON b.KUNDEN_NR = k.KUNDEN_NR
	group by b.KUNDEN_NR, name, ORT
	order by count(*) desc, ort asc, name asc;
    
