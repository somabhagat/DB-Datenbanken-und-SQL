
use geld_her;

-- ---------------------------------------------------------------------------------------
-- Abfragen über mehr als 1 Tabelle
-- ---------------------------------------------------------------------------------------

-- ges.: alle Informationen zu den Kunden
select * from kunde;

-- ges.: alle Informationen zu den Abrechnungen
select * from abrechnung;

-- Liste mit allen Abrechnungen. Zusätzlich zur Kunden_ID sollen Vorname, Nachname und eMail der Kunden angezeigt werden.
select
	*
from abrechnung INNER JOIN kunde ON abrechnung.Kunde_id = kunde.Kunde_id;

select
	Abrechnung_ID,
    Datum,
    abrechnung.Kunde_id 'kunde_id aus abrechnung',
    kunde.Kunde_ID 'kunde_id aus kunde',
    Vorname,
    Nachname,
    Email
from abrechnung INNER JOIN kunde ON abrechnung.Kunde_id = kunde.Kunde_id;

-- Liste mit allen Abrechnungen: Lassen Sie folgende Felder anzeigen: abrechnung_id, datum, nachname, email
select
	Abrechnung_ID,
    Datum,
    Nachname,
    Email
from abrechnung INNER JOIN kunde ON abrechnung.Kunde_id = kunde.Kunde_id;

-- Liste mit allen Abrechnungsnummern. Zusätzlich sollen die dazugehörigen Kundendaten komplett angezeigt werden.
select
	Abrechnung_ID,
    kunde.*					-- alle Spalten aus der Tabelle kunde
from abrechnung INNER JOIN kunde ON abrechnung.Kunde_id = kunde.Kunde_id;

-- BEACHTE für den Tabellenverbund:
-- der Verbund wird hergestellt über INNER JOIN Alternativ kann verkürzt geschrieben werden JOIN
-- die Bedingung für die Verbindung der Tabellen wird nach dem ON als logischer Ausdruck formuliert ; wir verwenden dort jeweils die Felder, über die die Fremdschlüsselbeziehung zwischen den beiden Tabellen besteht
-- haben 2 Felder aus den beiden Tabellen den selben Namen, muss Eindeutigkeit hergestellt werden mit <tabellenname>.<spalte>

-- Liste mit allen Produkten. Zu den Produkten sollen die Herstellernamen aufgeführt werden.
-- Vorüberlegungen:
select * from produkt;

select * 
from produkt
		inner join hersteller on produkt.Hersteller_ID = hersteller.Hersteller_ID;

-- Lösung:
select 
	produkt.*,
    Hersteller_Name
from produkt
		inner join hersteller on produkt.Hersteller_ID = hersteller.Hersteller_ID;

-- Liste mit allen Datensätzen aus abrechnung_produkt. Zusätzlich sollen die Produktnamen angezeigt werden.
-- Sortierung nach abrechnung_id.
select
	abrechnung_produkt.*,
    Produkt_Name
from abrechnung_produkt
	join produkt on abrechnung_produkt.Produkt_ID = produkt.Produkt_id
order by Abrechnung_ID;

-- Liste mit allen Datensätzen aus abrechnung_produkt. Zusätzlich sollen die Produktnamen angezeigt werden.
-- Sortierung nach abrechnung_id.
-- Lassen Sie anzeigen, wann das Produkt verkauft wurde.
select
	abrechnung_produkt.*,
    Produkt_Name,
    Datum
from abrechnung_produkt
	join produkt on abrechnung_produkt.Produkt_ID = produkt.Produkt_id
    join abrechnung on abrechnung.Abrechnung_ID = abrechnung_produkt.Abrechnung_ID
order by Abrechnung_ID;

-- -------------------------------------------------------------------------------------
-- Verwendung von Tabellen-Aliassen für Abfragen

-- Liste mit allen Abrechnungen: Lassen Sie folgende Felder anzeigen: abrechnung_id, datum, nachname, email
select
	Abrechnung_ID AS 'ID',
    Datum,
    Nachname,
    Email
from abrechnung AS a					-- vollständige Syntax für Tabellen-Alias
	JOIN kunde AS k ON a.Kunde_id = k.Kunde_ID;
-- der Tabellen-Alias gilt NUR für diese eine Abfrage

select
	Abrechnung_ID AS 'ID',
    Datum,
    Nachname,
    Email
from abrechnung a						-- verkürzte Syntax
	JOIN kunde k ON a.Kunde_id = k.Kunde_ID;

-- Liste mit allen Datensätzen aus abrechnung_produkt. Zusätzlich sollen die Produktnamen angezeigt werden.
-- Sortierung nach abrechnung_id.
-- Lassen Sie anzeigen, wann das Produkt verkauft wurde.
-- Verwenden Sie Tabellen-Aliasse
select
	ap.*,
    Produkt_Name,
    Datum
from abrechnung_produkt ap
	join produkt p on ap.Produkt_ID = p.Produkt_id
    join abrechnung a on a.Abrechnung_ID = ap.Abrechnung_ID
order by Abrechnung_ID;
-- ACHTUNG: Wenn ein Tabellen-Alias vergeben wurde, dann ist in dieser Abfrage der normale/ originale Tabellenname NICHT
-- mehr verfügbar

-- -------------------------------------------------------------------------------------------
-- Abfragen über mehr als 1 Tabelle mit FROM...WHERE

-- Liste mit allen Abrechnungen. Zusätzlich zur Kunden_ID sollen Vorname, Nachname und eMail der Kunden angezeigt werden.
select
	Abrechnung_ID,
    Datum,
    abrechnung.Kunde_id 'kunde_id aus abrechnung',
    kunde.Kunde_ID 'kunde_id aus kunde',
    Vorname,
    Nachname,
    Email
from abrechnung, kunde 							-- Tabellen kommagetrennt aufzählen
where abrechnung.Kunde_id = kunde.Kunde_id;		-- Verknüpfungsbedingung festlegen

-- Liste mit allen Datensätzen aus abrechnung_produkt. Zusätzlich sollen die Produktnamen angezeigt werden.
-- Sortierung nach abrechnung_id.
-- Lassen Sie anzeigen, wann das Produkt verkauft wurde.
-- Verwenden Sie Tabellen-Aliasse
select
	ap.*,
    Produkt_Name,
    Datum
from abrechnung_produkt ap, produkt p, abrechnung a			-- Tabellen kommagetrennt aufzählen
where ap.Produkt_ID = p.Produkt_id AND						-- alle Verknüpfungsbedingungen festlegen und mit AND verbinden
     a.Abrechnung_ID = ap.Abrechnung_ID
order by Abrechnung_ID;

