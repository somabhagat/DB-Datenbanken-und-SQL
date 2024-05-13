
use a_03_02_01;

select
	*
from fahrzeug f
	join mitarbeiter m on f.fahrzeug_id = m.fahrzeug_id;

select
	*
from fahrzeug f
	left join mitarbeiter m on f.fahrzeug_id = m.fahrzeug_id;

select
	*
from fahrzeug f
	left join mitarbeiter m on f.fahrzeug_id = m.fahrzeug_id
    left join parkplatz p on p.parkplatz_id = f.parkplatz_id;



-- ----------------------------------------------------------------------------------------------
-- <b>Soma Bhagat</b>
SELECT 
    mitarbeiter.mitarbeiter_bezeichnung,
    fahrzeug.fahrzeug_bezeichnung,
    parkplatz.parkplatz_bezeichnung
FROM 
	mitarbeiter 
		LEFT JOIN fahrzeug ON mitarbeiter.fahrzeug_id=fahrzeug.fahrzeug_id
		LEFT JOIN parkplatz ON fahrzeug.parkplatz_id=parkplatz.parkplatz_id
UNION
SELECT 
    mitarbeiter.mitarbeiter_bezeichnung,
    fahrzeug.fahrzeug_bezeichnung,
    parkplatz.parkplatz_bezeichnung
FROM 
	mitarbeiter 
		RIGHT JOIN fahrzeug ON mitarbeiter.fahrzeug_id=fahrzeug.fahrzeug_id
		RIGHT JOIN parkplatz ON fahrzeug.parkplatz_id=parkplatz.parkplatz_id
UNION
SELECT 
    mitarbeiter.mitarbeiter_bezeichnung,
    fahrzeug.fahrzeug_bezeichnung,
    parkplatz.parkplatz_bezeichnung     
from Fahrzeug
left JOIN mitarbeiter ON mitarbeiter.fahrzeug_id = fahrzeug.fahrzeug_id
left JOIN Parkplatz ON Parkplatz.parkplatz_id = Fahrzeug.parkplatz_id;
