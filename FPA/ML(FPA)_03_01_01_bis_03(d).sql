# Musterlösung zu FPA_03_01_01_bis_03(d)


ALTER TABLE Person_Sprache ADD Sprachqualitaet VARCHAR(255) NOT NULL;
ALTER TABLE Person_Sprache ADD PRIMARY KEY(Person_ID,Sprache_ID);
# Zusammengesetzter PK aus Attribut1 und Attribut2 => PRIMARY KEY(Attribut1,Attribut2)  