create database bank;
use bank;

create table tbl_land
	(landID int primary key,
    landName char(50)
    );
    
create table tbl_bankinstitut 
	(institutID int primary key,
    institutName char(50)
    );

create table tbl_kunden 
	(kundenID int primary key,
    kundenName char(50),
    kundenAdresse char(100)
    );
    
create table tbl_filiale 
	(filialID int primary key,
    gruendungsJahr int,
    landID int,
    institutID int,
    foreign key(landID) references tbl_land(landID),
    foreign key(institutID) references tbl_bankinstitut(institutID)
    );
    
create table tbl_konto 
	(kontoID int primary key,
    kontoStand decimal(10,2),
    kundenID int,
    filialID int,
    foreign key(kundenID) references tbl_kunden(kundenID),
    foreign key(filialID) references tbl_filiale(filialID)
    );
    
create table tbl_kredit 
	(kreditID int primary key,
    kreditBetrag decimal(10,2),
    kundenID int,
    filialID int,
	foreign key(kundenID) references tbl_kunden(kundenID),
    foreign key(filialID) references tbl_filiale(filialID) 
    );
    