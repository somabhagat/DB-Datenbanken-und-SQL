use sakila;

-- (1) Erstellen Sie eine Liste aller in der Tabelle 'film_category' vorkommenden Kategorie-Nummern. Jede vorkommende
-- Kategorie-Nr. soll nur einmal angezeigt werden.
-- FORDERUNG: Erstellen Sie diese Liste, indem Sie ein SELECT auf die Tabelle 'film_category' zusammen mit 
-- einem GROUP BY auf die richtige Spalte ausführen.

-- Vorbereitung
select * from film_category order by category_id;

-- Lösung
select	category_id
from film_category
group by category_id;

-- das wäre eine alternative Lösung, die aber bei den weiteren Schritten nicht mehr funktioniert
select distinct category_id FROM film_category;

-- (2) Entwickeln Sie die Liste aus (1) so weiter, dass angezeigt wird, wieviel Filme je Kategorie
-- in der Tabelle gespeichert sind.
-- Geben Sie den Spalten aussagekräftige Überschriften.

select * from film_category order by category_id;

select	category_id 'Das sind alle Kat.Nr., nach denen gruppiert wurde',
		COUNT(*) 'Das ist jeweils die Anzahl der Nr. in jeder Kategorie'
from film_category
group by category_id;

-- optionale Lösungen mit zusätzlicher Sortierung
select	category_id 'Das sind alle Kat.Nr., nach denen gruppiert wurde',
		COUNT(*) 'Das ist jeweils die Anzahl der Nr. in jeder Kategorie'
from film_category
group by category_id
order by category_id DESC;
-- Sortierung nach Kategorie-Nr. absteigend

select	category_id 'Das sind alle Kat.Nr., nach denen gruppiert wurde',
		COUNT(*) 'Das ist jeweils die Anzahl der Nr. in jeder Kategorie'
from film_category
group by category_id
order by COUNT(*) desc;
-- Sortierung nach Anzahl in jeder Kategorie absteigend, order by immer in die letzte Zeile

-- (3) Entwickeln Sie die Liste aus (2) so weiter, dass die Namen der Kategorien angezeigt werden.
-- Geben Sie den Spalten aussagekräftige Überschriften.

-- Vorbereitung:
select	*
from film_category
		join category on film_category.category_id = category.category_id;

select	category_id 'Das sind alle Kat.Nr., nach denen gruppiert wurde',
		COUNT(*) 'Das ist jeweils die Anzahl der Nr. in jeder Kategorie'
from film_category
		join category on film_category.category_id = category.category_id
group by category_id;

-- Lösung:
select	category.category_id 'Das sind alle Kat.Nr., nach denen gruppiert wurde',
		name 'Name der Kategorie',
		COUNT(*) 'Das ist jeweils die Anzahl der Nr. in jeder Kategorie'
from film_category
		join category on film_category.category_id = category.category_id
group by category.category_id, name;

select	category.category_id 'Das sind alle Kat.Nr., nach denen gruppiert wurde',
		name 'Name der Kategorie',
		COUNT(*) 'Das ist jeweils die Anzahl der Nr. in jeder Kategorie'
from film_category, category 
where film_category.category_id = category.category_id
group by category.category_id, name;

-- group by kann auch auf gejointe Tabellen angewendet werden --> der JOIN sorgt für eine virtuelle/temporäre
-- Ergebnistabelle, auf die die Gruppierung angewendet wird


-- (4) Erstellen Sie eine Liste die anzeigt, welche Kunden-Nr. mit wieviel Leihen in 
-- der Tabelle 'rental' erfasst ist.
-- Geben Sie den Spalten aussagekräftige Überschriften.

select * from rental order by customer_id;

select	customer_id,
		COUNT(*) 'Anzahl der Leihen für diesen Kunden in dieser Tabelle'
from rental
group by customer_id;


-- (5) Entwickeln Sie die Liste aus (4) so weiter, dass zu jeder Kunden-Nr. Vor- und Zunamen des Kunden
-- angezeigt wird. Die Liste soll nach Anzahl der Leihen absteigend und nach Kundennamen aufsteigend
-- sortiert sein.
-- Geben Sie den Spalten aussagekräftige Überschriften.

select	customer_id,
		COUNT(*) 'Anzahl der Leihen für diesen Kunden in dieser Tabelle'
from rental
group by customer_id;

select	rental.customer_id,
		first_name,
        last_name,
		COUNT(*) 'Anzahl der Leihen für diesen Kunden in dieser Tabelle'
from rental
		join customer on rental.customer_id = customer.customer_id
group by rental.customer_id, first_name, last_name;

-- optionale zusätzliche Variante der Lösung mit Sortierung
-- 1. Sortierschlüssel: Anzahl der Verleih-Vorgänge absteigend vom größten zum kleinsten Wert
-- 2. Sortierschlüssel: last_name aufsteigend von A bis Z
select	rental.customer_id,
		first_name,
        last_name,
		COUNT(*) 'Anzahl der Leihen für diesen Kunden in dieser Tabelle'
from rental
		join customer on rental.customer_id = customer.customer_id
group by rental.customer_id, first_name, last_name
order by count(*) desc, last_name asc;
