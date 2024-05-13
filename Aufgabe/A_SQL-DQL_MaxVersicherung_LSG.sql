use maxversicherung_v2;

-- (1) Liste mit allen Informationen aller Mitarbeiter

select * from mitarbeiter;

/*(2) Liste mit 
		Personalnummer, Vorname, Name, Raum-Nr., Telefon
		aller Mitarbeiter
HINWEIS: Die Felder sollen in der geforderten Reihenfolge angezeigt werden.
*/

select 
	Personalnummer,
	Vorname,
	Name,
	Raum,
	Telefon
from mitarbeiter;
-- das ist eine PROJEKTION

-- (3) Liste mit allen Informationen aller Mitarbeiter, die in der Abteilung mit der 
-- Nummer 8 arbeiten

select * from mitarbeiter where Abteilung_ID = 8;
-- das ist eine SELEKTION

-- (4) Liste mit allen Informationen aller Mitarbeiter, die den Vornamen Michael haben.

select * from mitarbeiter where Vorname = 'Michael';
select * from mitarbeiter where Vorname = 'michael';
-- der Vergleichsstring ist nicht case sensitiv
-- schließende Leerzeichen im Suchstring werden ignoriert z.B. 'Michael  ' findet trotzdem die 
-- beiden Mitarbeiter

/*(5) Liste mit 
	Personalnummer als "P.-Nummer", Vorname, Name als "Familienname", 
	Raum-Nr. als "Raum-Nr.", Telefon als "Telefon dienstlich"
	aller Mitarbeiter
HINWEIS: 
	a) Die Felder sollen in der geforderten Reihenfolge angezeigt werden.
	b) Die Felder sollen die geforderten Überschriften in der Liste haben.
*/

select 
	Personalnummer AS "P.-Nummer",		-- das ist ein Alias
	Vorname,
	Name Familienname,
	Raum 'Raum-Nr.',
	Telefon 'Telefon dienstlich'
from mitarbeiter;
-- Schreibweise der Aliasse sind oft sehr herstellerabhängig


/*(6) Liste mit 
	Personalnummer als "P.-Nummer", Vorname, Name als "Familienname", 
	Raum-Nr. als "Raum-Nr.", Telefon als "Telefon dienstlich"
	aller Mitarbeiter, die Michael heißen und in Abteilung 4 arbeiten
HINWEIS: 
	a) Die Felder sollen in der geforderten Reihenfolge angezeigt werden.
	b) Die Felder sollen die geforderten Überschriften in der Liste haben.
*/
select 
	Personalnummer AS "P.-Nummer",		-- das ist ein Alias
	Vorname V_Name,
	Name "Familienname",
	Raum 'Raum-Nr.',
	Telefon 'Telefon dienstlich'
from mitarbeiter
where Vorname = 'Michael' AND Abteilung_ID = 4;