
use geld_her;

-- Anzeigen aller auf dem Server vorhandenen Datenbanken = Schemas
show databases;

-- Anzeige aller vorhandenen User mit ihren Rechten
select * from mysql.user;
select host, user, password from mysql.user;

-- Anlegen neuer user
create user 'neuling_673'@'localhost' identified by 'pw_neuling_673';
create user 'neuling_673'@'127.0.0.1' identified by 'pw_neuling_673';
-- dieser user hat erstmal keinerlei Rechte

-- Löschen eines users
drop user 'neuling_673'@'127.0.0.1';

-- Anzeige aller vorhandenen User mit ihren Rechten
select * from mysql.user;
select host, user, password from mysql.user;
select host, user, password, insert_priv, select_priv from mysql.user;

-- Rechte an neuen user vergeben
grant select on *.* to 'neuling_673'@'127.0.0.1';
grant select on *.* to 'neuling_673'@'localhost';


-- Anlegen eines weiteren users mit eingeschränkten Rechten auf ausgewählte Datenbank bzw. Tabelle
create user 'kunde_673'@'localhost' identified by 'pw_kunde';
create user 'kunde_673'@'127.0.0.1' identified by 'pw_kunde';

grant select on geld_her.produkt to 'kunde_673'@'localhost';


-- Rechte der aktuellen Anmeldung anzeigen lassen
show grants;

-- dem user neuling_673 alle Rechte entziehen
revoke all privileges on *.* from 'neuling_673'@'localhost';
-- hier wird Syntaxfehler angezeigt  ---> funktioniert aber trotzdem

