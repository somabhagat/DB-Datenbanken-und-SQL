#Musterlösung zu A_02_04_03

#a)	
Breite<15 OR Laenge<15;

#b)	
Ort=“Hamburg“ OR Ort=“Kassel“ OR Ort=“Bielefeld“;

#c)	
Besitzer=“Mustermann“ AND Ort=“Bochum“;

#d)	
(ID=3 OR ID=7 OR ID=9) AND Preis>1000000;

#e)	
NOT Breite >200 AND  NOT Laenge>200 alternativ: Breite <=200 AND Laenge<=200;

#f)	
Ort=“Essen“ AND NOT ID<100;

#g)	
Besitzer=“Müller“ AND NOT(Preis>1000 AND Preis<2000);
#alternativ: Besitzer=“Müller“ AND (NOT Preis>1000 OR NOT Preis<2000);
#alternativ: Besitzer=“Müller“ AND (Preis<=1000 OR Preis>=2000); 

#h)	NOT(Ort=“Bochum“ OR Ort=“Berlin“ OR Preis<= 5000);
#   Im Sinne von: ”Fast Alle” (außer den Ausnahmen: Bochum, Berlin oder Preis<=5000)
#alternativ: NOT Ort=”Bochum” AND NOT(Ort=“Berlin“ OR Preis<= 5000); 
#            Im Sinne von: NICHT Bochum UND NICHT(Ausnahme)

#i)	
(ID > Breite AND Preis > 100 AND Preis > Laenge) 
AND 
NOT(Besitzer=“Mustermann“ OR Ort=“Kiel“)
