-- VARIANTE II

create database schule_012;
use schule_012;

create table tbl_lehrer
	(lehrer_ID int primary key,
	lehrer_name char(100));

create table tbl_klasse
	(klasse_bezeichnung char(10) primary key,
	ist_klassenlehrer_ID int unique,
    foreign key (ist_klassenlehrer_ID) references tbl_lehrer(lehrer_ID),
	ist_ITsupporter_ID int,
    foreign key (ist_ITsupporter_ID) references tbl_lehrer(lehrer_ID));
-- die Eigenschaft UNIQUE wird benötigt, um aus der allgemeinen 1:n-Beziehung eine 1:1-Beziehung zu machen

create table tbl_schueler
	(schueler_ID int primary key,
	schueler_name char(100),
    klassebezeichnung char(10),
    foreign key (klassebezeichnung) references tbl_klasse (klasse_bezeichnung),
	ist_klassensprecher bit,		-- als boolean
	ist_stvKlassensprecher bit);

create table tbl_lehrer_lehrt_in
	(lehrer_ID int,
    foreign key (lehrer_ID) references tbl_lehrer (lehrer_ID),
	klassen_bezeichnung char(10),
    foreign key (klassen_bezeichnung) references tbl_klasse (klasse_bezeichnung),
	primary key (lehrer_ID, klassen_bezeichnung));