#Musterlösung zu A_02_04_02


#a)	
ps>100 AND baujahr<1990;

#b)	
besitzer_id<12 AND preis>= 8000; #oder:  besitzer_id<12 AND NOT(preis<8000);

#c)	
preis>10000 OR hersteller_id=5;

#d)	baujahr<1970 XOR preis=12000;

#e)	preis<baujahr AND NOT(hersteller_id=7);

#f)	NOT besitzer_id>10 AND NOT hersteller_id>10;
#oder:  besitzer_id<=10 AND hersteller_id<=10;
#oder:  NOT(besitzer_id>10 OR hersteller_id>10);

#g)	preis<ps AND id>baujahr;

#h)	ps>17 OR preis>17 OR id>17;

#i)	ps>17 AND preis>17 AND id>17;

#j)	ps>17 XOR preis>17 XOR id>17; #(Dies ist keine Lösung für Aufgabe (j))
#(XOR-Ketten sind genau dann wahr, wenn die Anzahl der wahren Aussagen UNGERADE ist. 
#Beispiel: A XOR B XOR C XOR D ist wahr, wenn 1 oder wenn 3 Aussagen wahr sind)
#ACHTUNG: Klammern sind hier überflüssig (XOR ist „assoziativ“)

#Lösung (klappt NUR ohne XOR):
(ps>17 AND NOT preis>17 AND NOT id>17) 
OR 
(NOT ps>17 AND preis>17 AND NOT id>17)
OR
(NOT ps>17 AND NOT preis>17 AND id>17);
