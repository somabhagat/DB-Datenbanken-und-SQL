
use edvhandel;

-- Überblick verschaffen

select * from mitarbeiter;

select 
	name,
    vorname,
    plz,
    a.*
from mitarbeiter m
	join abteilung a on m.abteilung = a.abteilungs_nr;

select
	b.bestell_nr,
    b.bestelldatum,
    p.*,
    a.artikel_nr,
    a.bezeichnung,
    a.kategorie_nr
from posten p
	join artikel a on p.artikel_nr = a.artikel_nr
    join bestellung b on b.bestell_nr = p.bestell_nr
order by b.bestell_nr;
    
    
-- Wiederholung und Vertiefung subselect    
-- Liste mit allen Produkten, die günstiger als der Preisdurchschnitt sind
select * from artikel;
select nettopreis from artikel;
select avg(nettopreis) from artikel;

select * from artikel
where nettopreis < (select avg(nettopreis) from artikel)
order by nettopreis;

-- Liste mit allen Produkten der Kategorie 'Scanner'
select * from artikel;
select * from kategorie;

-- Variante 1 mit subselect (nicht korrelierender subselect):
select kategorie_nr from kategorie where bezeichnung = 'Scanner';

select * from artikel
where kategorie_nr = (select kategorie_nr from kategorie where bezeichnung = 'Scanner');

-- Variante 2 mit JOIN:
select a.*
from artikel a
	join kategorie k on a.kategorie_nr = k.kategorie_nr
where k.bezeichnung = 'Scanner';

-- Liste mit artikel_nr, Artikel-Bezeichnung, nettopreis, Bezeichnung der Kategorie
-- Variante 1 mit JOIN:
select 
	a.artikel_nr,
	a.bezeichnung,
    a.nettopreis,
    k.bezeichnung
from artikel a
	join kategorie k on a.kategorie_nr = k.kategorie_nr;

-- Variante 2 mit subselect (ACHTUNG: korrelierender subselect):
select 
	artikel_nr,
	bezeichnung,
    nettopreis,
    (select bezeichnung from kategorie where artikel.kategorie_nr = kategorie.kategorie_nr) 'Kategorie'
from artikel;

select * from artikel;


-- Liste mit allen Posten. Zu den Posten sollen die Artikel-Bezeichnungen und -Nettopreise angezeigt werden
-- Variante 1 mit JOIN:

select * from posten;
select * from artikel;

select
	p.*,
    a.bezeichnung,
    a.nettopreis
from posten p
	join artikel a on p.artikel_nr = a.artikel_nr;


-- Variante 2 mit subselect (ACHTUNG: korrelierender subselect):

select
	*,
    (select bezeichnung from artikel a where p.artikel_nr = a.artikel_nr ) 'Bezeichnung',
    (select nettopreis from artikel a where p.artikel_nr = a.artikel_nr ) 'Preis'
from posten p;

