
use geld_her;

-- -----------------------------------------------------------------------------------------------------
--  Index
-- -----------------------------------------------------------------------------------------------------

-- vorhandene Indizes anzeigen:
show index from abrechnung;
show indexes from abrechnung;
show keys from abrechnung;

show index from kunde_neu;

-- -----------------------------------------------------------------------------------------------------
-- neuen Index erstellen
-- 3 Varianten ...

-- mit table create:
create table kunde_neu
	(kunde_id int auto_increment,
    vorname varchar(255) NULL,
    nachname varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    primary key(kunde_id),
    index idx_nachname (nachname));			-- einfacher Index auf eine Spalte

-- direkte Erstellung
create index idx_kunde_email on kunde_neu(email);

-- Anpassen der Tabelle
alter table kunde_neu add index idx_kunde_vorname (vorname);


-- -----------------------------------------------------------------------------------------------------
-- Index löschen

-- 2 Varianten ...
-- direkt löschen
drop index idx_nachname on kunde_neu;

-- Anpassen der Tabelle
alter table kunde_neu drop index idx_kunde_email;

