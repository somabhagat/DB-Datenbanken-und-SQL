
use geld_her;

-- ---------------------------------------------------------------------
-- Verwendung des Ausdrucks WHERE
-- ---------------------------------------------------------------------

select * from abrechnung;

-- Liste aller Abrechnungen des Kunden mit der ID 3
select * from abrechnung where kunde_id = 3;

-- Liste aller Abrechnungen des Kunden mit der ID 3. Liste soll nach Datum absteigend sortiert sein.
select * from abrechnung where kunde_id = 3 order by Datum desc;

-- Liste mit allen Abrechnung ab 01.11.2021. Liste nach kunde_id aufsteigend sortieren.
select * from abrechnung where datum >= '2021-11-01' order by Kunde_id asc;


-- Verwendung der Platzhalter % und _ für die Abfragen mit WHERE
-- % steht für eine beliebige Anzahl beliebiger Zeichen ---> 'beliebig' bedeutet 0 bis unendlich
-- _ steht für genau ein beliebiges Zeichen
-- HINWEIS: diese Platzhalter sind Teil sogenannter regulärer Ausdrücke
-- wenn Platzhalter verwendet werden, dann MUSS mit dem Operator LIKE gearbeitet werden

select * from kunde;
-- Liste mit allen Kunden mit Nachname Myrnow
select * from kunde where Nachname = 'Myrnow';

-- Liste mit allen Kunden, deren Vorname mit dem Buchstaben e beginnen.
select * from kunde where Vorname LIKE 'e%';

-- Liste mit allen Kunden, die an der 4. Stelle im Nachnamen ein n haben
select * from kunde where Nachname LIKE '___n%';

-- Liste mit allen Kunden, die an der 4. Stelle im Nachnamen ein n haben und im Vornamen an der 2. Stelle ein v haben
select * from kunde 
where Nachname LIKE '___n%' AND vorname like '_v%';
-- komplexer logischer Ausdruck --> 2 bzw. mehrere Ausdrücke werden mit logischem Operator verknüpft

-- Liste mit allen Kunden, die im Vorname die Buchstabefolge 'it' haben.
select * from kunde where Vorname like '%it%';

select * from abrechnung;
-- Liste mit allen Abrechnungen aus dem Monat Oktober
select * from abrechnung where datum like '%-10-%';
-- like-Operator angewendet auf Datums-Feld

select * from produkt;
-- Liste mit allen Produkten, deren Preise vor dem Komma eine 5 haben
select * from produkt where Euro_Preis like '%5.%';

-- ----------------------------------------------------------------------------------
-- Verwendung von logischen Operatoren und zusammengesetzten logischen Ausdrücken
-- ----------------------------------------------------------------------------------

select * from produkt;
-- Liste aller Produkte vom Hersteller mit der id 2, die mehr als 20 Euro kosten
select * from produkt where Hersteller_ID = 2 and euro_preis > 20;

select * from abrechnung_produkt;
-- Liste mit allen Datensätzen der Abrechnung mit der ID 1 und dem Produkt mit der ID 4
select * from abrechnung_produkt where abrechnung_id = 1 and Produkt_ID = 4;

select * from abrechnung order by Kunde_id;
-- Liste mit allen Abrechnung, die für den Kunden ID 1 existieren bzw. im November erstellt wurden. Liste sortiert nach kunde_id
select * from abrechnung where Kunde_id = 1 OR datum like '%_11_%' order by Kunde_id;

-- Liste mit allen Abrechnung, die für den Kunden ID 1 existieren bzw. im November erstellt wurden. Liste sortiert nach kunde_id
-- Die Spalten sollen in folgender Reihenfolge angezeigt werden: kunde_id, datum, abrechnung_id
select 
	Kunde_id,
    Datum,
    Abrechnung_ID
from abrechnung where Kunde_id = 1 OR datum like '%_11_%' order by Kunde_id;

-- Liste mit allen Abrechnungen vom kunden ID 3, die nicht am 16.10.2021 erstellt wurden
select * from abrechnung where Kunde_id = 3 AND NOT (datum = '2021-10-16');
-- Negierung mit NOT; den Ausdruck danach in Klammern setzen (für die bessere Übersichtlichkeit)

-- weitere Variante:
select * from abrechnung where Kunde_id = 3 AND datum != '2021-10-16';
-- Verwendung Ungleichheitsoperator !=

select * from kunde;
-- Liste mit allen Kunden, die nicht Rita heißen
select * from kunde where not Vorname = 'Rita';

-- Liste mit allen Kunden, die nicht Rita, Eva bzw. Peter heißen
select * from kunde where not Vorname = 'Rita' and not vorname = 'Eva' and not vorname = 'Peter';
select * from kunde where not ( Vorname = 'Rita' OR  vorname = 'Eva' OR vorname = 'Peter');

-- ----------------------------------------------------------------------------------
-- Abfragen mit Listen bzw. Listenoperator formulieren
-- ----------------------------------------------------------------------------------
-- Liste mit allen Kunden, die Rita, Peter bzw. Eva heißen
select * from kunde where Vorname IN ('Rita', 'Peter', 'Eva');
-- die Listenelemente werden alle mit einem logischen OR verknüpft

-- der o.g. Befehl ist äquvalent mit:
select * from kunde where Vorname = 'Rita' OR  vorname = 'Eva' OR vorname = 'Peter';

-- Liste mit allen Kunden, die NICHT Rita, Peter bzw. Eva heißen
select * from kunde where Vorname NOT IN ('Rita', 'Peter', 'Eva');

select * from abrechnung_produkt;
-- Liste mit allen Abrechnungen, die die Produkte mit der ID 4 bzw. 1 enthalten
select * from abrechnung_produkt where Produkt_ID IN (1, 4);

-- Liste mit allen Abrechnungen, die die Produkte mit der ID 4 bzw. 1 NICHT enthalten
select * from abrechnung_produkt where Produkt_ID NOT IN (1, 4);


-- ----------------------------------------------------------------------------------
-- Abfragen mit Prüfung von Datenfeldern auf NULL bzw. NOT NULL
-- ----------------------------------------------------------------------------------

-- notwendiger Zwischenschritt für die weiteren Erläuterungen
-- 
select * from kunde;
insert into kunde(nachname, email) values ('Huber', 'fh@xyz.de');

-- Liste mit allen Kunden, für die kein Vorname erfasst wurde
select * from kunde where Vorname IS NULL;

-- Liste mit allen Kunden, für die der Vorname erfasst wurde
select * from kunde where Vorname IS NOT NULL;
-- BEACHTE: bei dieser Prüfung MUSS der Operator IS verwendet werden

-- ----------------------------------------------------------------------------------
-- Abfragen mit Bereichen formulieren
-- ----------------------------------------------------------------------------------

select * from produkt order by Euro_Preis;

-- Liste mit allen Produkten mit einem Preis von 20 bis 50 Euro
select * from produkt 
where Euro_Preis BETWEEN 20 and 50
order by Euro_Preis;

-- Liste mit allen Produkten mit einem Preis von 22.75 bis 45.05 Euro
select * from produkt 
where Euro_Preis BETWEEN 22.75 and 45.05
order by Euro_Preis;
-- BETWEEN bezieht die untere Grenze und die obere Grenze in das Ergebnis mit ein
-- BETWEEN kann auf numerische und Datumswerte verwendet werden (theoretisch auch auf Zeichenketten)

-- ----------------------------------------------------------------------------------
-- Abfragen mit der Verwendung von mathematischen Operatoren
-- ----------------------------------------------------------------------------------

-- Verwendung der Grundrechenarten
select * from produkt;

select
	*,
    Euro_Preis + 10,
    Euro_Preis - 2.75,
    Euro_Preis * 1.19,
    Euro_Preis / 3
from produkt;

select
	*,											-- alle Spalten der Tabelle anzeigen
    Euro_Preis + 10 AS 'Preis + 10',			-- Spalte mit Alias mit vollständiger Syntax
    Euro_Preis - 2.75 'reduzierter Preis',		-- verschiedene Schreibweisen für Spalten-Aliasse
    Euro_Preis * 1.19 Produkt,
    Euro_Preis / 3 ein_Drittel_des_Preises
from produkt;
-- die Spalten mit den Berechnungen verwenden jeweils einen Alias

-- ----------------------------------------------------------------------------------
-- Abfragen mit der Verwendung von Aggregat-Funktionen
-- ----------------------------------------------------------------------------------
select * from kunde;
-- zeigt den INHALT der Tabelle an

-- Gib die Anzahl der gespeicherten Kunden aus
select count(*) as 'Anzahl der Kunden'
from kunde;
-- die Funktion count(*) verwendet ALLE Felder, um die Anzahl der Datensätze zu bestimmen

select count(Vorname) as 'Anzahl der Kunden'
from kunde;
-- BEACHTE: die Funktion count() berücksichtigt nur die Spalten, die nicht NULL sind, in denen also konkret Werte drin stehen

-- Gib die Anzahl der Produkte aus
select count(*) as 'Anzahl Produkte'
from produkt;

-- Wie groß ist der größte Euro_Preis in der Tabelle?
select max(euro_preis) 'Größter Preis'
from produkt;

-- Wie groß ist der größte Euro_Preis in der Tabelle und wie groß ist der kleinste Preis?
select 
	max(euro_preis) 'Größter Preis',
    min(Euro_Preis) 'Kleinster Preis'
from produkt;

-- Ermittle die Summe aller euro_preise und deren arithmetischen Mittelwert (den Durchschnitt)
select
	sum(Euro_Preis) 'Summe aller Preise',
    avg(Euro_Preis) 'Mittelwert aller Preise'
from produkt;

-- Fassen Sie alle vorangegangenen Auswertungen über die Tabelle produkt in EINER Anweisung zusammen.
select 
	count(*) as 'Anzahl Produkte',
    max(euro_preis) 'Größter Preis',
    min(Euro_Preis) 'Kleinster Preis',
	sum(Euro_Preis) 'Summe aller Preise',
    avg(Euro_Preis) 'Mittelwert aller Preise'
from produkt;

-- ---------------------------------------------------------------------------------------
-- BEACHTE:
-- In einer SELECT-Abfrage dürfen nicht gleichzeitig Spaltenwerte und Ergebnisse von Aggregatfunktionen abgefragt werden.
-- MySQL/ MariaDB führen zwar solche Abfrage aus. Das Ergebnis solcher Abfragen ist aber 'grober Unfug' (und nicht nur 'schlechter Stil') und wird in der IHK-Prüfung als Fehler bewertet.

select vorname, count(*) from kunde;
select *, max(euro_preis) from produkt;

-- ---------------------------------------------------------------------------------------
-- einige praktische Beispiele zu WHERE, Berechnungen, Aggregatfunktionen bzw. mit DISTINCT

select * from produkt;

-- gesucht: Mittelwert der Preise der Produkte vom Hersteller mit der ID 1
select avg(euro_preis) from produkt where Hersteller_ID = 1;

-- ges.: Produkt_ID und ProduktName der Produkte, die teurer als 20 und günstiger als 40 Euro sind; Geben Sie den Spalten
-- sinnvolle Überschriften
select
	Produkt_id ProduktIdentifikationsNummer,
    Produkt_Name Produktname
from produkt
where Euro_Preis > 20 and Euro_Preis < 40;

-- alle Produkte mit einer ID ab 4 sollen einen neuen euro_preis von 500.99 bekommen
update produkt set euro_preis = 500.99 where produkt_id >= 4;

select * from abrechnung_produkt order by Produkt_ID;
-- alle Abrechnungen, in denen die Produkt_ID 4 vorkommt, sollen gelöscht werden
delete from abrechnung_produkt where Produkt_ID = 4;

select * from kunde;
-- Gesucht ist die Anzahl der Kunden, für die kein Vorname erfasst wurde
select count(*) - count(vorname) 'Anzahl Kunden ohne Vorname'
from kunde;

-- ges.: Preisdifferenz zwischen kleinstem und größtem euro_preis
select max(euro_preis) - min(euro_preis) 'Preisdifferenz'
from produkt;

select * from abrechnung_produkt;
-- ges.: welche unterschiedlichen Produkt_ID sind in der Tabelle vorhanden
select distinct Produkt_ID from abrechnung_produkt;

-- ges.: wieviel unterschiedliche Produkt_ID sind in der Tabelle vorhanden
select count(distinct Produkt_ID) from abrechnung_produkt;
