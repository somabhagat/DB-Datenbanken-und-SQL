# Musterlösung zu A_02_04_01
 
# a)
delete from kuchen where id>3 AND id<9;

#b)
hersteller_id=3 AND preis_euro>20

#c)
kalorien>900 AND gewicht_gramm<300

#d)
NOT gewicht_gramm=1000 AND NOT kalorien=1000
# weder noch, also im Sinne von:
# das eine NICHT UND das andere auch NICHT

#e)
NOT(hersteller_id=3 OR volumen_cm3<700)
# 1.) Es reicht bereits die Ausnahme hersteller_id=3 um NICHT zu löschen
# 2.) Es reicht bereits die Ausnahme volumen<700 um NICHT zu löschen
#    => die beiden Ausnahmen müssen NICHT beide gemeinsam gelten ...
#       ... werden also mit OR verknüpft
# 3.) Die OR-Verknüpfung wird in Klammern gesetzt und dann negiert, ...
#     ... weil diese ja über eine Ausnahme spricht, also über eine ...
#     ... Bedingung, die gerade NICHT gelten soll. 

#f)
id<12 XOR preis_euro>30

#g)
hersteller_id=1 OR kalorien=1 OR gewicht_gramm=1
# Die Aufgabenstellung listet alle Kuchen auf, die gelöscht werden sollen
# Man kann dann zwar sagen Kuchentyp 1 UND Kuchentyp 2 UND Kuchentyp 3 ...
# ... sollen gelöscht werden, aber bzgl. der Bedingungen arbeiten wir mit ...
# ... OR, da es reicht, wenn ein Kuchen zu (mindestens) einem Typ gehört
