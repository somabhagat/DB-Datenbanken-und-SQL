create database A_01_05_02;
use A_01_05_02;
create table Ausbildung
(
Ausbildung_ID int (11) auto_increment,
Bezeichnung varchar(256) not null,
primary key (Ausbildung_ID)
);

create table Firmenwagen (
Firmenwagen_ID int(11) auto_increment,
Kennzeichen varchar (255) not null,
Kilometerstand_bei_übergabe int(11),
primary key (Firmenwagen_ID)
);

create table Mitarbeiter (
Mitarbeiter_ID int(11) auto_increment,
Ausbildung_ID int (11) not null,
Firmenwagen_ID int(11) not null,
Vorname varchar(255) not null,
Nachname varchar(255)not null,
Vorwahl varchar(255)not null,
Rufnummer varchar(255)not null,
Mitarbeiter_seit date not null,
Gehalt float (7,2) not null, 
primary key (Mitarbeiter_ID),
foreign key (Ausbildung_ID) references Ausbildung(Ausbildung_ID),
foreign key (Firmenwagen_ID) references Firmenwagen(Firmenwagen_ID)
);