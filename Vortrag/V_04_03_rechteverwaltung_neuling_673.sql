
use geld_her;

select * from kunde;
-- das funktioniert

insert into kunde(vorname, nachname, email) values
	('Petra', 'Schmidt', 'ps@yze.de');
-- wegen fehlender Rechte nicht möglich